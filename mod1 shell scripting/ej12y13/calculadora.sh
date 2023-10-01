#!/bin/bash

if [ $# -ne 3 ]
then
	echo "es necesario enviar numero1, operador y numero2 para el correcto funcionamiento!"
	exit 1
fi

if [ "$2" = "\*" ] 
then
	resultado=$(expr $1 \* $2)
else
	resultado=$(expr $1 $2 $3)
fi

echo "resultado= $resultado"

exit 0
