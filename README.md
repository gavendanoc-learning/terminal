## Formas de organizar los archivos del computador

Contine : archivos y directorios y forman el arbol de directorios.

listar todos los archivos 
```$ ls -a```

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

Esto no cambia el archivo, volviendo a hacer un cat dump.txt no se vera nada nuevo, lo que hace es que crea un nuevo flujo e imprime en STDOUT. https://likegeeks.com/es/sed-de-linux/#Entendiendo-el-Comando-Sed-de-Linux 

- awk : Sirve tambien super bien para el tratamiento de texto, pero para achivos estructurados, como comas, tabs o puntos.

';' -> delimitador de columnas
'{print $1}' -> es un comando, imprime la primera columna

$ awk -F ';' '{ print $1 }' nuevasPelis.csv


la verdad aqui se utiliza mucho lo qye son expresiones regulares. Que curioso :)

## Comprender los mecanismos de comunicacion entre los procesos

Los canales por donde entran y salen los datos a un proceso se le conoce como flujos. Estos son tres canales standard in , standard out, standard error. 

Si nosotros no hacemos nada, estos flujos estan concetador a los perifericos. Por ejemplo standard in al teclado y y standard out/error a la pantalla.


Si queremos cambiar este comportamiento normal tenemos que hacer un proceso llamado recireccion. 
Por ejemplo, que el canal de entrada no lea del teclado sino que de un archivo de texto.
Asi no tenemos que escribir todo el tiempo lo mismo!

¿Como se hace esta maravilla? Con un <, vamos a intentarlo. 
Esto se puede hacer con un comando de mysql para crear automaticamente las tablas
$ mysql -h localhost -u root -p1234 < dump.sql

O con un programa de python.
$ python3 flows/sayHi.py < flows/input.txt

Esto se llama *redireccionar a la entrada*, para redireccionar a la salida se hace con elsimbolo >:

Escribe el directorio en un archivo directorio.txt
$ ls > directorio.txt

Escribe la salida del programa sayHi.py en output.txt
$ python3 flows/sayHi.py > flows/output.py

Si vuelves a repetir el comando se va a sobreescribir el archivo. Usar >> para concatenar al final.
$ ls -l > directorios.txt

### Pipes

Si ya tenemos que el contenido de un archivo 'a.txt' sea la entrada de 'b.txt' y que ese sea la entrada de c.txt y asi hasta z.txt pued vamos a necesitar lo que se llaman pipes. 

El simbolo es | 
Utilidades : 
more -> permite paginar el archivo
$ ls -l | more 

wc -> word count
$ cat flows/input.txt | wc
$ cat flows/input.txt | wc -l

## background and foreground process
 
Cada vez que se ejecuta un comando se abre un nuevo proceso. 
Podemos dejarlo en primer plano, si el proceso es muy largo va a bloquear mi terminal, solo podré ver. 

Para dejarlo en segundo plano se utiliza el & al final
$ python3 back-front-graund/long.py &

ambien podemos mandar un proceso al background con Ctrl + z
Y lo podemos mandar al foreground usando $fg en consola

Ver los procesos del sistema
$ ps ax

Mostrar solo las lineas que tengan inint
$ ps ax | grep init

Utilidad interactiva para ver los procesos
$ top

Matar un proceso que no se comporte bien
$ python3 back-front-graund/infinity.py &

1. Mirar todos los procesos con $ ps ax
2. Mirar el numero PID
3. Matarlo con $ kill -9 NUMERO_PID






