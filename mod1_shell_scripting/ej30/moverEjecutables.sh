#!/bin/bash

if [ $# -ne 0 ]
then
	echo no es necesario enviar parametros para este script
	exit 1
fi

arreglo=()
arreglo2=($(find ./ -type f -name "*.sh"))

for i in ${arreglo2[*]}
do
	if [ -x $i ]
	then
		arreglo+=($i)
	fi
done


echo ${arreglo[*]}

if [ ! -d $HOME/bin ]
then
	mkdir $HOME/bin
fi

contador=0

for i in ${arreglo[*]}
do
	sudo mv $i $HOME/bin/$(basename $i)
	echo se movio el archivo $i
	contador=$(expr $contador + 1)
done

echo la cantidad de archivos movidos fue de $contador

exit 0

