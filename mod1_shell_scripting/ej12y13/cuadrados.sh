#!/bin/bash

for ((i=1; i<=100; i++))
do
	echo "$i $i²=$(expr $i \* $i)"
done

exit 0
