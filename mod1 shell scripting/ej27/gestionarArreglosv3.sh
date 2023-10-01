#!/bin/bash

inicializar(){
	array=()
	echo Arreglo inicializado con el nombre 'array'
}

longitud(){
	echo la longitud es de ${#array[*]}
}

imprimir(){
	echo array= "${array[*]}"
}

agregar(){
	array+=($1)
}

eliminar(){
	if [ $1 -gt ${#array[*]} ]
	then
		echo te pasaste de la cantidad de elementos
	else
		unset array[$1]
	fi
}

salir(){
	exit 1
}

inicializarConValores(){
	array=()
	for (( i=1; i<=$1; i++ ))
	do
		array[$i]=$2
	done
}

elegirBasicos(){
		select option in inicializar longitud imprimir salir
		do 
			$option
		done
}

case $# in #podria dar todas las opciones de una en un select, y luego con un case adentro verificar en cada opcion que se tengan los parametros necesarios y pasarle los parametros a la funcion de se necesario
	0)
		elegirBasicos
	;;
	
	1)
		select option in agregar eliminar elegirBasicos salir
		do
			$option $1
		done

		elegirBasicos
	;;

	2) 
		inicializarConValores $1 $2
		echo arreglo inicializado con los valores pedidos
		elegirBasicos
	;;

	*)
		echo opcion invalida
	;;
esac

exit 0
