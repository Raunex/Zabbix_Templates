#!/bin/bash
#
# Identifica os datastores com utilizacao de espaco acima dos thresholds. Testado com ESX 5.1 e 5.5
#
# por Renan Melhado <renan.melhado@ntux.com.br>
#
# Modo de uso:
# ./check_datastore-esx5 <critical> <warning> <IP do ESX>
#
# Exemplo:
# ./check_datastore-esx5 90 85 130.130.0.149


THRESHOLDCRITICAL=$1
THRESHOLDWARNING=$2
FSLIST=/tmp/df-$3.txt
ssh root@$3 df -h > $FSLIST
IFS=$'\n'
TMPFILE=/tmp/tmp-$3.txt
TMPFILE2=/tmp/tmp2-$3.txt

> $TMPFILE

for i in $(grep volume $FSLIST | grep -v '^/' | sed 's/\/vmfs\/volumes\///g' | grep VMFS); do echo $i | awk '{print $5, $NF}' >> $TMPFILE; done

sort -r -k 2 -n $TMPFILE > $TMPFILE2

RESULTCRITICAL=$(awk -v t=$THRESHOLDCRITICAL '$1 > t { print }' $TMPFILE2 | sort -n | wc -l)
RESULTWARNING=$(awk -v t=$THRESHOLDWARNING '$1 > t { print }' $TMPFILE2 | sort -n | wc -l)

if [[ -z "${THRESHOLDCRITICAL}" ]]; then
  echo "UNKNOWN - Threshold CRIT nao definido"
  exit 3
fi

if [[ -z "${THRESHOLDWARNING}" ]]; then
  echo "UNKNOWN - Threshold WARN nao definido"
  exit 3
fi

if [[ $THRESHOLDCRITICAL -lt $THRESHOLDWARNING ]] ; then
  echo "UNKNOWN - Threshold CRIT esta menor que o WARN"
  exit 3
fi

if [[ $RESULTCRITICAL -gt 0 ]]; then
  echo CRITICAL - $(awk -v t=$THRESHOLDCRITICAL '$1 > t { print }' $TMPFILE2) | sort -n | xargs
  exit 0
fi

if [[ $RESULTWARNING -gt 0 ]]; then
  echo WARNING - $(awk -v t=$THRESHOLDWARNING '$1 > t { print }' $TMPFILE2) | sort -n | xargs
  exit 0
else
  echo "OK - Nenhum datastore atingindo threshold CRIT ("$THRESHOLDCRITICAL"%) ou WARN ("$THRESHOLDWARNING"%)"
  exit 0
fi

