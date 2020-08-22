#!/bin/bash
# The first line tells what is the program that should run the script. So bash

NEW_DIR=platzi 	# set NEW_DIR as platzi
dot="$(cd "$(dirname "$0")"; pwd)"

echo "creando nueva carpeta en  $dot/$NEW_DIR"

if [ ! -d "$dot/$NEW_DIR" ]; then
	mkdir $dot/$NEW_DIR
fi

cp test.md $dot/$NEW_DIR/	
echo "`date`: Todo listo jefe!"
# if [ ! -d"/$CURRENT_DIR/$NEW_DIR" ]; then
#	mkdir /$CURRENT_DIR/$NEW_DIR
# fi

# cp main.py /$CURRENT_DIR/$NEW_DIR/
# echo"`date`: Todo listo man!"
