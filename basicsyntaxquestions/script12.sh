#!/bin/bash

read -p "Enter a number:" num

if [ "$num" -eq 0 ] 
then 
	echo "Existing: You entered zero."
	exit 
fi
