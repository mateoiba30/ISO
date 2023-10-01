#!/bin/bash
arreglo=(1 2 3 4 5 6)
unset arreglo[2]
echo diml= ${#arreglo[*]}
arreglo=(${arreglo[*]})
for ((i=0; i<${#arreglo[*]}; i++))
do
	echo ${arreglo[$i]}
done

exit 0
