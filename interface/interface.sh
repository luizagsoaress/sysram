#!/bin/bash

HOMEDIR=$(echo $HOME)

meta=$(zenity --entry --title="sysram" --text="Meta inicial de RAM (GB):")
echo ${meta} > ${HOMEDIR}/.local/share/sysram/meta.txt

multiplicador=$(zenity --entry --title="sysram" --text="Multiplicador:")
echo ${multiplicador} > ${HOMEDIR}/.local/share/sysram/multiplicador.txt