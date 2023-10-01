#!/bin/bash

if [ $# -ne 1 ]
then
	echo "Se debe pasar como parametro el nombre de un usuario a analizar"
	exit 1
fi

usuarios_logueados=( $(who | cut -d ' ' -f1) ) #tmb podria usar grep que simpemente busca el string solicitado
usuario=$1
terminar=0
counter=0

while [ $terminar -ne 1 ]
do
	for usuario_i in $usuarios_logueados ;
	do
		if [ $usuario_i = $usuario ]
		then
			terminar=1
		fi
	done

	if [ $terminar -ne 1 ]
	then
		clear
		counter=$(expr $counter + 1)
		echo "termino la verificacion numero $counter "
		sleep 10
	fi

done
echo "Usuario "$usuario" logueado al sistema"
exit 0
