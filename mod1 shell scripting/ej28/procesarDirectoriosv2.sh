#!/bin/bash

if [ $# -ne 1 ]
then
	echo se debe pasar como parametro el nombre del directorio a analizar
	exit 1
fi

if [ ! -d $1 ]
then
	echo "el directorio no existe"
	exit 4
else
	for i in $(ls $1)
	do
		if [ -f "$1/$i" ]
		then
			if [ -r "$1/$i" ]
			then
				echo $1/$i con permiso de lectura
				contadorRead=$(expr $contadorRead + 1)
			fi
			
			if [ -w "$1/$i" ]
			then
				echo $1/$i con permiso de escritura
				contadorWrite=$(expr $contadorWrite + 1)
			fi
		fi
	done
fi

echo "la cantidad de archivos con permisos de lectura es de $contadorRead"
echo "la cantidad de archivos con permisos delescritura es de $contadorWrite"

exit 0
