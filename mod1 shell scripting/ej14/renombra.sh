#!/bin/bash
#voy a despreciar la extension del archivo

#baja puntos el olvidarse esta validacion
if [ $# -ne 3 ]
then
	echo "Se debe aclarar el pwd, operador (-a o -b) y luego la cadena!"
	exit 1
fi

if [ -e $1 ]
then
	directorio=$1
	operador=$2
	CADENA=$3

	case $operador in 
		-a) 
			nuevo_dir="$directorio$CADENA" 
			mv $directorio $nuevo_dir #esto cambia la ruta de un archivo o de una sola carpeta, para cambiar todas las rutas dentro de una carpeta hacer: for i in `ls $directorio`;do ;  mv $directorio/$i $directorio/$CADENA; done

			;; 
		-b)
			nuevo_dir=$( echo $directorio | rev | cut -d'/' --complement -f1 | rev)
			nuevo_dir="$nuevo_dir/$CADENA$(basename $directorio)"
			mv $directorio $nuevo_dir
			#esto solo cambia el nombre de un archivo o de un directorio, no el nombre de todos los archivos y directorios dentro de un directorio, para esto hacer: for i in `ls $directorio` ; do mv $direcotrio/$i $directorio/$CADENA$i; done
			;;
		*) 
			echo "Operador incorrecto" 
			;; 
	esac

else
	echo "El archivo no existe"
fi

exit 0
