#### Template ESX5 Datastores

Depências: **check_datastore-esx5.sh**
C
opiar o scrip para o diretorio: **/usr/lib/zabbix/externalscripts/**

Conceder permissão de execução do script: **chmod +x check_datastore-esx5.sh**

Tipo: **External check**

Versão do Zabbix: **3.4.x**

**Itens do template:**

- Utilizacao Datastores

**Triggers do template:**

- Datastore: item não retornando dados
- {ITEM.LASTVALUE1}
