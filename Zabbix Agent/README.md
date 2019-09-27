#### Template Zabbix Agent

Versão do Zabbix: **3.4.x**

**Itens do template:**

- Agent ping
- Host name of zabbix_agentd running
- Version of zabbix_agent(d) running

**Triggers do template:**

- Agente do Zabbix sem comunicação por mais de 15 minutos
- 	Host name of zabbix_agentd was changed on {HOST.NAME}
- 	Version of zabbix_agent(d) was changed on {HOST.NAME}
