#!/bin/bash

if [ $# -ne 0 ]
then
	echo "No se deben pasar parametros"
	exit 1
fi

arreglo1=( 1 2 3 4 5 )
arreglo2=( 1 1 1 1 1 )
indice=0

for elemento  in ${arreglo1[*]}
do
	echo "la suma en la posicion $indice es de $(expr $elemento + ${arreglo2[${indice}]})"
	indice=$(expr $indice + 1)
done

exit 0
