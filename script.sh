#!/bin/bash

HOMEDIR=$(echo $HOME)
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd ${DIR}

temp="/tmp/temp.txt"
dunst &

while true; do
    
    /usr/bin/rm -f ${DIR}/output.txt
    /usr/bin/rm -f ${DIR}/saida.txt
    /usr/bin/rm -f ${DIR}/script.txt

    /usr/bin/free -h > ${HOMEDIR}/.local/share/sysram/output.txt 2>&1
    /usr/bin/gcc -o ${HOMEDIR}/.local/bin/dec ${HOMEDIR}/.local/share/sysram/decodificador/decodificador.c 
    ${HOMEDIR}/.local/bin/dec > ${HOMEDIR}/.local/share/sysram/saida.txt 2>&1
    meta=$(sed -n '1p' ${HOMEDIR}/.local/share/sysram/meta.txt)
    multiplicador=$(sed -n '1p' ${HOMEDIR}/.local/share/sysram/multiplicador.txt)

    linha=$(sed -n '2p' ${HOMEDIR}/.local/share/sysram/saida.txt)
    total=$(sed -n '8p' ${HOMEDIR}/.local/share/sysram/saida.txt)

    numero=$(echo "$linha" | sed 's/Gi//' | tr ',' '.')
    numeroTotal=$(echo "$total" | sed 's/Gi//' | tr ',' '.')

    if awk "BEGIN {exit !((${meta} > ${numeroTotal} || ${meta} <= 0) || (${multiplicador} <= 1))}"; then
        notify-send "Valor inválido!" "Veja os intervalos válidos no README."
        echo "Multiplicador inválido!"
        sleep 5
        exit 1
    fi

    if [ -f "$temp" ]; then
        prox_aviso=$(sed -n '1p' "$temp")
    else
        prox_aviso=$meta
    fi


    if awk "BEGIN {exit !($numero >= ${prox_aviso})}"; then
        notify-send "Memória atingida!" "Uso atual: ${numero}Gi"

        prox_aviso=$(echo "scale=2; $prox_aviso * ${multiplicador}" | bc)
        echo "$prox_aviso" > "$temp"
    fi

    sleep 5
done
