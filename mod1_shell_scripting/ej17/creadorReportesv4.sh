#!/bin/bash

#si el exit status del proceso es:
# 1- no se especifica la extension a analizar
#
# (es de buena practica documentar esto)

if [ $# -ne 1 ]
then
	echo "Se debe pasar como parametro la extension de archivos a analizar" # buena practica tirar el mensaje a la salida de error: echo "error" >&2

	exit 1
fi

arreglo=($(getent passwd | cut -d: -f1))
cant_usuarios=${#arreglo_usuarios[*]}
extension=$1

echo "USUARIO	ARCHIVOS.${extension}" > ./reporte.txt

for nombre_actual in ${arreglo[*]}
do
	echo "${nombre_actual}	$( find /home -user ${nombre_actual} -name "*.${extension}" | wc -l ) ">> ./reporte.txt 
done

exit 0

#en getent passwd, el 6to campo tiene la ruta donde el usuario guarda sus datos. (esa carpeta tal vez ahora se borro)
#si fentro del for hago:
#
#if [ -d /home/$nombre_actual ] 
#
#ahí solo busco si existe el archivo, sin (esa carpeta tal vez ahora se borro) no
