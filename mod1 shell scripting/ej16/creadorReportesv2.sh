#!/bin/bash

if [ $# -ne 1 ]
then
	echo "Se debe pasar como parametro la extension de archivos a analizar"
	exit 1
fi

arreglo=($(ls /home))
cant_usuarios=${#arreglo_usuarios[*]}
extension=$1

for ((i=i; i<=${cant_usuarios} ;i++))
do
	nombre_actual=${arreglo[${i}]}
	echo $nombre_actual
	echo "${nombre_actual}" >> /home/${nombre_actual}/reporte.txt
	find /home/${nombre_actual} -name "*.${extension}" | wc -l >> /home/${nombre_actual}/reporte.txt
done

exit 0
