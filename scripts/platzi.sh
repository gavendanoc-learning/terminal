#!/bin/bash
# The first line tells what is the program that should run the script. So bash

NEW_DIR=platzi 	# set NEW_DIR as platzi
dot="$(cd "$(dirname "$0")"; pwd)" # get the working inderectory of the file

echo "creando nueva carpeta en  $dot/$NEW_DIR"

# if folder doesn't exist, create it
if [ ! -d "$dot/$NEW_DIR" ]; then
	mkdir $dot/$NEW_DIR
fi

# copy test.md to that directory
cp test.md $dot/$NEW_DIR/	

echo "`date`: Todo listo jefe!"
