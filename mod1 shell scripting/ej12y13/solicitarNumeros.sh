#!/bin/bash

echo "Ingrese el 1er numero: "
read numero1

echo "Ingrese el 2do numero: "
read numero2

echo "$numero1 + $numero2 = $(expr $numero1 + $numero2)"

echo "$numero1 - $numero2 = $(expr $numero1 - $numero2)"

echo "$numero1 * $numero2 = $(expr $numero1 \* $numero2)"

if [ $numero1 -gt $numero2 ]
then
echo "$numero1 > $numero2"
else
echo "$numero1 >= $numero2"
fi



