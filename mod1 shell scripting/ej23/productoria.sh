#!/bin/bash

if [ $# -ne 1 ]
then
	echo "Se debe pasar por parametro un arreglo de numeros"
	exit 1
fi

arreglo=($1)
resultado=1

for elemento in $1
do
	resultado=$(expr $resultado \* $elemento)
done

echo "El resultaedo es de $resultado"
exit 0
