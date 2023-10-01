#!/bin/bash

if [ $# -eq 0 ]
then
	echo "Se debe pasar como parametro al menos 1 ruta a un archivo o directorio"
	exit 1
fi

inexistentes=0
indice=1

for ((i=1; i<=$#; i+=2)) #quedaba mas sencillo si usaba el otro tipo de for, donde cada elemento del arreglo seria $i
do

	if [ -d ${!i} ] 
	then
		echo "el parametro $i es un directorio"
	else
		if [ -e ${!i} ]
		then
			echo "el parametro ${i} es un archivo"
		else
			inexistentes=$(expr ${inexistentes} + 1)
		fi
	fi
done

echo "La cantidad de archivos inexistentes es de ${inexistentes}"

exit 0


