#!/bin/bash

if [ $# -ne 1 ]
then
	echo se debe pasar el directorio para guardar el archivo
fi

while true
do
	if [ -f /var/log/any-service/error.log ]
	then
		cantidad=$(cat /var/log/aby-service/error.log | grep "FATAL ERROR" | wc -l)
		# no hacer poque puede ser peligroso# tar -czvf paquete.tar.gz $(ls /var/log/usr-service) #falto preguntar primero si cantidad -ge 1
		mv paquete.tar.gz $1/paquete.tar.gz #podria poner el $1/paquete.tar.gz en la linea anterior luedo del -cvzf
		echo la cantidad de lineas con el mensaje de FATAL ERROR es de $cantidad
		exit 0
	else
		sleep 180
	fi
done

