#!/bin/bash

if [ $# -ne 1 ]
then
	echo "Se debe pasar 1 parametro del nombre de archivo!"
	exit 1
fi

if [ -e "$1" ]
then
	if [ -d "$1" ]
	then 
		echo "Es un directorio, y existe"
	else
		echo "Es un archivo, y existe"
	fi
else
	mkdir ./$1
	echo "Se creo un nuevo directorio con el nombre pedido"
fi 

exit 0

