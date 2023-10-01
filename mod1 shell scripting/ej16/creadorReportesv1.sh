#!/bin/bash

if [ $# -ne 1 ]
then
	echo "Se debe pasar como parametro la extension de archivos a analizar"
	exit 1
fi

arreglo_usuarios=($(ls /home))
cant_usuarios=${#arreglo_usuarios[*]}
extension=$1

for ((i=0; i<${cant_usuarios} ; i++ ))
do
	nombre_actual=${arreglo[$i]}
	echo "${nombre_actual} $( find /home/${nombre_actual} -name "*.${extension}" )"
done

exit 0
