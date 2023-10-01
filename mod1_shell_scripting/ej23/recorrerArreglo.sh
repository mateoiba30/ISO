#!/bin/bash

if [ $# -ne 1 ]
then
	echo "Se debe pasar un arreglo de numeros como parametro"
	exit 1
fi

for elemento in $1
do
	if [ $(expr $elemento % 2) -eq 0 ]
	then
		echo $elemento
	else
		contador=$(expr $contador + 1)
	fi
done

echo "La cantidad de elementos impares es de $contador"
exit 0

	
