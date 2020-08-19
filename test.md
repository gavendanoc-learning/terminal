## Formas de organizar los archivos del computador

Contine : archivos y directorios y forman el arbol de directorios.

listar todos los archivos 
$ ls -a

listar en lista
$ ls -l

listar en forma de lista pero con unidades de Kb o Mb
$ ls -lh

juntar todo
$ ls -alh

imprimir el dictorio local
$ pwd

cambiar directorio
$ cd address

crear un directorio
$ mkdir name

copiar test.py a directorio test
$ cp test.py test/

borrar test.py
rm test.py

borrar directorio 
rmdir test.py

mover archivo test.py hacia test/
mv test.py test.py test/

## Tipos de archivos

- Archivos binarios : si los abro no voy a entender nada de nada. Estos son imagenes, .docx

- Archivos de texto : Si lo abro voy a entender el texto

Los archivos de texto los puedo editar con vim o nano

Ejecutar vim

$ vim archivo.txt

El modo edicion se inicia con la letra i, lo que escriba va a aparecer en pantalla.
Para guardar debo de salir del modo edicion
1. Oprimo la letra esc
2. Presiono los dos puntos (:) para activar el modo de comandos
3. Presiono la w para escribir

Por ultimo para salirme necesito
1. entrar al modo de comandos (:)
2. poner la letra q

Para salirse sin guardar cambios
:q!

Grabar y salir a la vez de vim
:x


## Utilidades batch

A estas herramientas se les pasa toda la informacion para que ellos puedan retornar un resultado

mostrar todo el contenido del archivo
$ cat tables.txt

mostrar solo las promeras lineas del archivo 
$ head -n 5 tables.txt
$ head tables.txt

mostrar solo las ultimas lineas del archivo
$ tail -n 5 tables.txt
$ tail tables.txt

Procesamiento de texto complejo

- grep : permite trabajar con expresiones regulares en archivos

Buscar la palabra "trabajar" en el archivo README.md
$ grep trabajar README.txt

Buscar la palabra "trabajar" y coincidir mayusculas y minusculas
$ grep -i trabajar README.txt


- sed (Stream editor) : Trabaja con flujos. Un caso muy comun es reemplzar una expresion por otra. 


s -> substitucion
Hanks/Selleck -> cambiar Hanks por Sellect
g -> global, aplicar a todas las coincidencias

$ sed 's/Hanks/Selleck/g' dump.txt

Esto no cambia el archivo, volviendo a hacer un cat dump.txt no se vera nada nuevo, lo que hace es que crea un nuevo flujo. 

- awk : Sirve tambien super bien para el tratamiento de texto, pero para achivos estructurados, como comas, tabs o puntos.

';' -> delimitador de columnas
'{print $1}' -> es un comando, imprime la primera columna

$ awk -F ';' '{ print $1 }' nuevasPelis.csv


la verdad aqui se utiliza mucho lo qye son expresiones regulares. Que curioso :)



