#!/bin/bash

if [ $# -ne 0 ]
then
	echo "no se le deben pasar parametros a este script" >&2
	exit 1
fi
dirActual=`pwd`

for i in $(ls) 
do
	nuevo_nombre=$( echo $i | cut -d "c" -f1) 
	mv $dirActual/$i $dirActual/$nuevo_nombre
done

exit 0
