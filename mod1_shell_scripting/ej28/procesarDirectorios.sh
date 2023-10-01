#!/bin/bash

tienePermisos(){
	contador=0

	if [ -f $1 ] && [ -r $1 ] && [ -w $1 ]
	then
		contador=$(expr $contador + 1)
	fi

	return $contador
}

if [ $# -ne 1 ]
then
	echo se debe pasar como parametro el nombre del directorio a analizar
	exit 1
fi
#rutas=$(sudo find /home -type d -name $1) #puede haber mas de un directorio con el mismo nombre
#puedo asumir que tengo el path absoluto

if [ -d "$1" ]
then
	echo el directorio no existe
	exit 4
else
	for i in $(ls $1)
	do
		tienePermisos $1/$i
	done

	echo $?
fi

exit 0
