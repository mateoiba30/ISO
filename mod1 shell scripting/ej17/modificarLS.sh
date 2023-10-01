#!/bin/bash

if [ $# -ne 0 ]
then
	echo "No se deben pasar parametros"
	exit 1
fi

archivos=$(find . -maxdepth 1 -type f)
#en lugar de maxdepth podria hacer un ls del directorio y listo

echo "$archivos" | tr -d 'a' | tr -d 'A' | tr '[:lower:][:upper:]' '[:upper:][:lower:]'

exit 0

