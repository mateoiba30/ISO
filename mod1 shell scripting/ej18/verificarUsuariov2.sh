#!/bin/bash

if [ $# -ne 1 ]
then
	echo "La cantidad de parametros es incorrecta"
	exit 1
fi

while true
do
	logueado=$(who | grep -w $1 | wc -l )
	
	if [ $logueado != 0 ]
	then
		echo "Usuario $1 logueado"
		exit 0
	else
		sleep 10
	fi
done

