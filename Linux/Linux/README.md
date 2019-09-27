#### Template Linux

Depências: **Template Ping** e **Template Zabbix Agent**

Versão do Zabbix: **3.4.x**

**Itens do template:**

- Available memory
- Buffers memory
- Cached memory
- Checksum of /etc/passwd
- Context switches per second
- CPU steal time
- CPU idle time
- CPU user time
- CPU system time
- CPU softirq time
- CPU nice time
- CPU iowait time
- CPU interrupt time
- Dados de CPU
- Free memory
- Free swap space
- Free swap space in %
- Horário local
- Horário local
- Host boot time
- Host name
- Interrupts per second
- Maximum number of opened files
- Maximum number of processes
- Number of logged in users
- Number of processes
- Number of running processes
- Porta NRPE
- Processor load (1 min average per core)
- Processor load (5 min average per core)
- Processor load (15 min average per core)
- Swap in
- System information
- System uptime
- Total memory
- Total swap space
- Used memory
- Used memory
- Used swap space

**Triggers do template:**

- /etc/passwd has been changed on {HOST.NAME}
- Configured max number of opened files is too low on {HOST.NAME}
- Configured max number of processes is too low on {HOST.NAME}
- CPU: Load average em {ITEM.LASTVALUE1}
- Disk I/O is overloaded on {HOST.NAME}
- Horário: diferença acima de 3 minutos ({ITEM.LASTVALUE1})
- Horário: Máquina não entrou no horário de verão
- Horário: Máquina não saiu do horário de verão
- Host information was changed on {HOST.NAME}
- Hostname was changed on {HOST.NAME}
- Memória disponível {HOST.NAME}
- Mínimo de swap-in > 500 nos últimos 30m. Último: {ITEM.LASTVALUE1}
- Too many processes on {HOST.NAME}
- Too many processes running on {HOST.NAME}
- Utilização de memória swap {HOST.NAME}
- {HOST.NAME} has just been restarted

**Gráficos do template:**

- CPU: Load
- CPU: Util
- PING: ICMP: Latência e perda de pacotes PING
- MEM: Cache e buffer
- MEM: Swap
- MEM: Util
- MEM: Utilização

**Regras de descoberta:**

**Network interface discovery:**

Protótipos de itens:

- Erros de entrada na {#IFNAME}
- Erros de saída na {#IFNAME}
- Tráfego de entrada na {#IFNAME}
- Tráfego de saída na {#IFNAME}

**Mounted filesystem discovery**

Protótipos de itens:

- Espaço livre em {#FSNAME}
- Espaço livre em {#FSNAME} (porcentagem)
- Espaço total em {#FSNAME}
- Espaço utilizado em {#FSNAME}
- Espaço utilizado em {#FSNAME} (projeção para próximas 48h)
- inodes livres em {#FSNAME} (porcentagem)
- Previsão de tempo restante para encher {#FSNAME}

Protótipos de triggers:

- Disco: volume {#FSNAME} com {ITEM.LASTVALUE1} de inodes livres
- Disco: volume {#FSNAME} com {ITEM.LASTVALUE1} de inodes livres
- Disco: volume {#FSNAME} com {ITEM.LASTVALUE2} ({ITEM.LASTVALUE1}) de espaço livre
- Disco: volume {#FSNAME} com {ITEM.LASTVALUE2} ({ITEM.LASTVALUE1}) de espaço livre
- Disco: volume {#FSNAME} sem espaço livre
- Disco: volume {#FSNAME} sem inodes livres
- Filesystem {#FSNAME} encherá em menos de 24h ({ITEM.LASTVALUE1})
