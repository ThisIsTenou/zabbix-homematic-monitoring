Requirements
------
* Bash 4.x or higher
* Zabbix server 5.4 or higher
* Availability of `printf` & `readarray`-commands

Installation
------
1. Install [python3](https://www.python.org/) on your zabbix server. This can be accomplished by running `dnf install python3`, `apt install python3`, `yum install python3` or other commands, depending on your packet manager.
2. Install the python module "[xmltodict](https://pypi.org/project/xmltodict/)". This can be accomplished by running `sudo python3 -m pip install xmltodict`.
3. Install [jq](https://stedolan.github.io/jq/) on your zabbix server. This can be accomplished by running `dnf install jq`, `apt install jq`, `yum install jq` or other commands, depending on your packet manager.
4. Move the two scripts from the "[externalscripts](https://github.com/ThisIsTenou/zabbix-homematic-monitoring/tree/main/externalscripts)"-directory of this repository into the externalscripts-directory of your zabbix server. See [Zabbix External Checks](https://www.zabbix.com/documentation/current/manual/config/items/itemtypes/external) and [Zabbix server configuration](https://www.zabbix.com/documentation/current/manual/appendix/config/zabbix_server) for further details.
5. Make both scripts executable (`sudo chmod +x ccu3-gatherer.sh xml-to-json.py`) and owned by zabbix (`sudo chown zabbix:zabbix ccu3-gatherer.sh xml-to-json.py`).
6. Import the Zabbix template into your Zabbix server, under Configuration -> Templates -> Import.
7. All done! You can now assign the template to a CCU3-Host and let it do it's thing.

xml-to-json.py
------
xml-to-json.py has been developed by [Tyler Adams](https://github.com/tyleradams) and is developed and maintained in [this project](https://github.com/tyleradams/json-toolkit).
It is being used in accordance to it's copyright and licensing terms.
