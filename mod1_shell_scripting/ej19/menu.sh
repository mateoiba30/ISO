#!/bin/bash

if [ $# -ne 0 ]
then
	echo "No se deben pasar parámetros al programa al llamar a la bash"
	exit 1
fi

echo "MENU DE COMANDOS"
counter=0

arreglo=( $(find /home/kali/Documents/practica3 -name "*.sh") )
#echo ${arreglo[*]}

for nombre in ${arreglo[*]}
do
	echo "$counter $(basename $nombre)"
	counter=$(expr $counter + 1)
done

echo "Ingrese la opcion a ejecutar: "
read opcion
ruta=${arreglo[${opcion}]}
echo "Resumen para saber que parametros enviar:"
echo $(sed -n '1,5p' $ruta)
echo "Ingrese los parametros:"
read texto_parametros

bash $ruta ${texto_parametros}

exit 0
