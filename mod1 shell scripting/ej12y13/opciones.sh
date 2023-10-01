#!/bin/baash

echo "seleccione 1 para Listar, 2 para DondeEstoy y 3 para QuienEsta"
read opcion

case $opcion in
	"1")
		ls
		;;
	"2")
		pwd
		;;
	"3")
		who
		;;
	*)
		echo "opcion no valida"
		;;
esac

exit 0
