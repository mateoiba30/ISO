#!/bin/bash

if [ $# -ne 2 ] 
then
	echo "se deben enviar 2 parametros"
	exit 1
fi

echo "$1 + $2 = $(expr $1 + $2)"

echo "$1 - $2 = $(expr $1 - $2)"

echo "$1 * $2 = $(expr $1 \* $2)"

if [ $1 -gt $2 ]
then
	echo "$1 > $2"
else
	echo "$2 >= $1"
fi

exit 0
