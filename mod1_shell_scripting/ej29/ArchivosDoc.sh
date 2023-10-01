#!/bin/bash
#asumo que los nombres que me pasan ya son la ruta absoluta, sinó debería comparar con basename y al borrar la posicion del vector me debería guardar su valor para luego eliminarla del FS
verArchivo(){
	encontro=0
	for i in $1
	do
		if [ $i = $2 ]
		then
			echo el archivo se encuentra en el arreglo
			encontro=1
			break
		fi
	done

	if [ $encontro -eq 0 ]
	then
		echo el archivo NO se encuentra en el arreglo
	fi
}

borrarArchivoVector(){
	valor=10
	pos=0
	for i in $1 
	do
		if [ $i = $2 ]
		then
			unset arreglo[$pos]
			valor=0
			break
		fi
		pos=$(expr $pos + 1)
	done

	if [ $valor -eq 10 ]
	then
		echo Archivo no encontrado
		return $valor
	fi
}

borrarArchivo(){
	borrarArchivoVector "$1" "$2"
	
	if [ $? -eq 10 ]
	then
		return
	fi

	echo quiere eliminar el archivo logicamente?

	select option in si no
	do
		case $option in
			"si")
				rm $2
				return 1
			;;

			"no")
				return 0
			;;

			*)
				echo opcion invalida
			;;
		esac
	done
}





if [ $# -ne 0 ]
then
	echo no se le deben pasar parametros al script
	exit 1
fi

cantidadArchivos=$(find /home -type f -name "*.doc" | wc -l)
arreglo=$(find /home -type f -name "*.doc") #arreglo tiene un solo string como elemento, todo en una misma linea

select option in verArchivo cantidadArchivos borrarArchivo salir
do
	case $option in
	
		"verArchivo")
			echo ingrese nombre de archivo a buscar
			read nombre
			verArchivo "${arreglo[*]}" "$nombre"
		;;

		"cantidadArchivos")
			echo $cantidadArchivos
		;;

		"borrarArchivo")
			echo ingrese un nombre de archivo a eliminar
			read nombre
			borrarArchivo "${arreglo[*]}" " $nombre"
			cantidadArchivos=$(expr $cantidadArchivos - $?)
		;;

		"salir")
			exit 0
		;;

		*)
			echo opcion invalida
		;;
	
	esac
done

