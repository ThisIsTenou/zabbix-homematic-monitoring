Currently supported devices:
------
* Homematic IP Water sensor (HmIP-SWD)
* Homematic IP Smoke detector (HmIP-SWSD)
* Homematic IP Motion detector indoor (HmIP-SMI)
* Homematic IP Presence detector (HmIP-SPI)
* Homematic IP Temperature and humidity sensor w/ display (HmIP-STHD)

Devices that are work in progress:
------

* Homematic IP Motion detector outdoor (HmIP-SMO / HmIP-SMO-A-2)
* Homematic IP Temperature and humidity sensor w/o display (HmIP-STH)
* Homematic IP Magnet sensor (HmIP-SWDM)
* Homematic IP Door lock drive (HmIP-DLD)
* Homematic IP CCU3 (HmIP-CCU3)
* Homematic IP Access point (HmIP-HAP)
* Homematic IP Thermostat (HmIP-WTH-2)


Requirements
------
* Bash 4.x or higher
* Zabbix server 6.2 or higher
* Availability of `printf` & `readarray`-commands
* [XML-API](https://www.homematic-inside.de/software/xml-api) AddOn  installed on the CCU3

Installation
------
1. Install [python3](https://www.python.org/) on your zabbix server. This can be accomplished by running `dnf install python3`, `apt install python3`, `yum install python3` or other commands, depending on your packet manager.
2. Install the python module "[xmltodict](https://pypi.org/project/xmltodict/)". This can be accomplished by running `sudo python3 -m pip install xmltodict`.
3. Install [jq](https://stedolan.github.io/jq/) on your zabbix server. This can be accomplished by running `dnf install jq`, `apt install jq`, `yum install jq` or other commands, depending on your packet manager.
4. Move the three scripts from the "[externalscripts](https://github.com/ThisIsTenou/zabbix-homematic-monitoring/tree/main/externalscripts)"-directory of this repository into the externalscripts-directory of your zabbix server. See [Zabbix External Checks](https://www.zabbix.com/documentation/current/manual/config/items/itemtypes/external) and [Zabbix server configuration](https://www.zabbix.com/documentation/current/manual/appendix/config/zabbix_server) for further details.
5. Make all three scripts executable (`sudo chmod +x ccu3-gatherer.sh curlccu3.sh xml-to-json.py`) and owned by zabbix (`sudo chown zabbix:zabbix ccu3-gatherer.sh curlccu3.sh xml-to-json.py`).
6. Import the Zabbix template into your Zabbix server, under Configuration -> Templates -> Import.
7. All done! You can now assign the template to a CCU3-Host, set the "{$CCU3_ADDRESS}"-Macro, and let it do it's thing.

Note:
------
The necessity for curlccu3.sh, in comparison to using HTTP Agent for everything, is due to the CCU3 encoding everything in windows-1252, whilst Zabbix only supports UTF-8.
Using the HTTP Agent checks against, at least, HmIP-Thermostats (STH/STHD/WTH-2) leads to an "Server returned invalid UTF-8 sequence" error in Zabbix.
Since it's neither simple to change the encoding on the CCU3 to UTF-8 nor add support in Zabbix for windows-1252, this workaround will persist.

xml-to-json.py
------
xml-to-json.py has been developed by [Tyler Adams](https://github.com/tyleradams) and is developed and maintained in [this project](https://github.com/tyleradams/json-toolkit).
It is being used in accordance to it's copyright and licensing terms.
