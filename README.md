## Formas de organizar los archivos del computador

Contine : archivos y directorios y forman el arbol de directorios.

listar todos los archivos
```$ ls -a```

listar en lista
```$ ls -l```

listar en forma de lista pero con unidades de Kb o Mb
```$ ls -lh```

juntar todo
```$ ls -alh```

imprimir el dictorio local
```$ pwd```

cambiar directorio
```$ cd address```

crear un directorio
```$ mkdir name```

copiar test.py a directorio test
```$ cp test.py test/```

borrar test.py
```$ rm test.py```

borrar directorio 
```$ rmdir test.py```

mover archivo test.py hacia test/
```$ mv test.py test.py test/```

## Tipos de archivos

- Archivos binarios : si los abro no voy a entender nada de nada. Estos son imagenes, .docx

- Archivos de texto : Si lo abro voy a entender el texto

Los archivos de texto los puedo editar con vim o nano

Ejecutar vim

```$ vim archivo.txt```

El modo edicion se inicia con la letra i, lo que escriba va a aparecer en pantalla.
Para guardar debo de salir del modo edicion
1. Oprimo la letra esc
2. Presiono los dos puntos (:) para activar el modo de comandos
3. Presiono la w para escribir

Por ultimo para salirme necesito
1. entrar al modo de comandos (:)
2. poner la letra q

Para salirse sin guardar cambios
```:q!```

Grabar y salir a la vez de vim
```:x```


## Utilidades batch

A estas herramientas se les pasa toda la informacion para que ellos puedan retornar un resultado

mostrar todo el contenido del archivo
```$ cat tables.txt```

mostrar solo las promeras lineas del archivo 
```$ head -n 5 tables.txt```
```$ head tables.txt```

mostrar solo las ultimas lineas del archivo
```$ tail -n 5 tables.txt```
```$ tail tables.txt```

Procesamiento de texto complejo

#### grep : permite trabajar con expresiones regulares en archivos

Buscar la palabra "trabajar" en el archivo README.md
```$ grep trabajar README.txt```

Buscar la palabra "trabajar" y coincidir mayusculas y minusculas
```$ grep -i trabajar README.txt```


#### sed (Stream editor) : Trabaja con flujos. Un caso muy comun es reemplzar una expresion por otra. 


s -> substitucion
Hanks/Selleck -> cambiar Hanks por Sellect
g -> global, aplicar a todas las coincidencias

```$ sed 's/Hanks/Selleck/g' dump.txt```

Esto no cambia el archivo, volviendo a hacer un cat dump.txt no se vera nada nuevo, lo que hace es que crea un nuevo flujo e imprime en STDOUT. https://likegeeks.com/es/sed-de-linux/#Entendiendo-el-Comando-Sed-de-Linux 

#### awk : Sirve tambien super bien para el tratamiento de texto, pero para achivos estructurados, como comas, tabs o puntos.    

';' -> delimitador de columnas      
'{print $1}' -> es un comando, imprime la primera columna    

```$ awk -F ';' '{ print $1 }' nuevasPelis.csv```


la verdad aqui se utiliza mucho lo qye son expresiones regulares. Que curioso :)

## Comprender los mecanismos de comunicacion entre los procesos

Los canales por donde entran y salen los datos a un proceso se le conoce como flujos. Estos son tres canales standard in , standard out, standard error. 

Si nosotros no hacemos nada, estos flujos estan concetador a los perifericos. Por ejemplo standard in al teclado y y standard out/error a la pantalla.


Si queremos cambiar este comportamiento normal tenemos que hacer un proceso llamado recireccion. 
Por ejemplo, que el canal de entrada no lea del teclado sino que de un archivo de texto.
Asi no tenemos que escribir todo el tiempo lo mismo!

¿Como se hace esta maravilla? Con un <, vamos a intentarlo. 
Esto se puede hacer con un comando de mysql para crear automaticamente las tablas
```$ mysql -h localhost -u root -p1234 < dump.sql```

O con un programa de python.
```$ python3 flows/sayHi.py < flows/input.txt```

Esto se llama *redireccionar a la entrada*, para redireccionar a la salida se hace con elsimbolo >:

Escribe el directorio en un archivo directorio.txt
```$ ls > directorio.txt```

Escribe la salida del programa sayHi.py en output.txt
```$ python3 flows/sayHi.py > flows/output.py```

Si vuelves a repetir el comando se va a sobreescribir el archivo. Usar >> para concatenar al final.
```$ ls -l > directorios.txt```

### Pipes

Si ya tenemos que el contenido de un archivo 'a.txt' sea la entrada de 'b.txt' y que ese sea la entrada de c.txt y asi hasta z.txt pued vamos a necesitar lo que se llaman pipes. 

El simbolo es | 
Utilidades : 
more -> permite paginar el archivo
```$ ls -l | more ```

wc -> word count
```$ cat flows/input.txt | wc```
```$ cat flows/input.txt | wc -l```

## background and foreground process
 
Cada vez que se ejecuta un comando se abre un nuevo proceso. 
Podemos dejarlo en primer plano, si el proceso es muy largo va a bloquear mi terminal, solo podré ver. 

Para dejarlo en segundo plano se utiliza el & al final
$ python3 back-front-graund/long.py &

ambien podemos mandar un proceso al background con Ctrl + z
Y lo podemos mandar al foreground usando $fg en consola

Ver los procesos del sistema
```$ ps ax```

Mostrar solo las lineas que tengan inint
```$ ps ax | grep init```

Utilidad interactiva para ver los procesos
```$ top```

Matar un proceso que no se comporte bien
```$ python3 back-front-graund/infinity.py &```

1. Mirar todos los procesos con $ ps ax
2. Mirar el numero PID
3. Matarlo con $ kill -9 NUMERO_PID

## Permisos sobre los archivos

Desde sus inicioos unix fue diseñado como un sistema multiusuario. Por lo tanto la seguridad es intrinseca en el sistema operativo.

Todos los archivos nuix tienen
- Dueño
- Grupo que puede acceder
- Otros

Permisos
- Lectura
- Escritura
- Ejecucion (Depende si es ejecutable o no)

Por lo tanto hay 9 tipos de combinaciones

|       | Lectura | Escritura | Ejecucion |
|-------|---------|-----------|-----------|
| Dueño |         |           |           |
| Grupo |         |           |           |
| Otros |         |           |           |

Como vemos los permisos de un archivo?
```$ ls -l ```

drwxrwxrwx 1 gabo gabo 4096 Aug 18 07:32 back-front-graund
drwxrwxrwx 1 gabo gabo 4096 Aug 18 07:03 flows
drwxrwxrwx 1 gabo gabo 4096 Aug 17 22:32 learning
-rwxrwxrwx 1 gabo gabo 2555 Aug 17 23:14 test.md


Entonces ... A descomponer

1. La primea letra es el tipo, `d` es un directorio, `-` es archivo y `l` es un link o acceso directo
2. Siguen los permisos `r` es read, `w` es write, `x` es ejecutar y `-` significa que no se tienen permisos
3. Fijese que se reptite tres veces, las tres primeras son para Dueño, luego grupo y por ultimo otros
4. En caso de directorios la `x` significa que puedo entrar.

Alterar permisos

- Cambiar permisos `chmod`
- Cambiar el dueño `chown`
- Cambiar el grupo de acceso `chgrp`

Vamos a probar con chmod. Esto es para cambiar los permisos de _others_(`o`) para que  _no puedan_ (`-`) ejecutar (`x`) El archivo test.md  

$ chmod o-x test.md

Asi de facil. Luego se lo volvemos a añadir  

$ chmod o+x test.md

Existe otra forma y es verlo como binarios.

| Lectura | Escritura | Ejecucion | Valor |
|---------|-----------|-----------|-------|
| 1       | 0         | 0         | 4     |
| 1       | 1         | 0         | 6     |
| 1       | 1         | 1         | 7     |

De esta forma podemos dar permisos a los 3 tipos de usuarios  

```$ chmod 744 test.md```

Aqui le damos todos los permisos al dueño, y solo lectura al grupo y otros.


## Menjo de Paqutes
- apt : ubuntu
- zypper : zuse distro
- rpm : universal, pero rustico

```
$ sudo apt-get update
$ sudo apt-get install lynx
```

Esta es la forma de descargar paquetes binarios, osea ejecutables. Pero cada lenguaje tiene su propio orquestador de paquetes

 - pip : python
 - composer :php
 - npm : js

Existen otros mas genericos

- conda
- homebrew

## Compresion de archivos

#### Using zip to compress
- Copias de seguridad
- Envios por internet

Compress test.md and delete it `$ gzip test.md`
Decompress test.md.gz and delete it `$ gzip -d test.md.gz`

#### Using the tar command to group

Group files toguether  

 - `cf` -> create file
 - `backup/*` group all files in this directory

`$ tar cf backup.tar backup/*`

See whats inside the grouped files   

`$ tar tf backup.tar`

Vamos a expandirlo con

- `xf` : extract file    

`$ tar xf backup.tar`

Aqui solo agrupamos archivos, no se comprimieron. Pero podemos hacer ambas cosas

- `czf` : create zip file

`$ tar czf backup.tgz backup/*`

Y si queremos extraer todo se utiliza
 - `xzf` : Extract zip file

`$ tar xzf backup.tgz`

## Find new files
`locate` utiliza una base de datos para buscar

- `$ locate README.md`

Si no se encuentra entonces toca correr el comando `$ sudo updatedb` primero.

- `$ whereis echo` encuentra el lugar del comando echo

- `$ find . -user gabo` encuentra todos los archivos del usuario gabo :)
- `$ find . -type f -mtime +7` buscar archivos `-type f`  modificados hace mas de 7 dias `-mtime +7`
- `$ find . -type f -mtime +7 -exec cp {} ./backup/ \;` lo mismo que antes pero se ejecuta `-exec cp` una operacion con los archivos buscados. En este caso se copia todos los archivos `cp {}` al backup `./backup/` y se finaliza el comando `\;`

## Interaccion via HTTP

- `curl` Se usa para hacer pedidos crudos, se muestra literalmente la respuesta http
- `wget` descarga archivos desde servidores http. Se utiliza mucho para hacer descargas de manera programatica!

Se puede utilizar `curl -v https://platzi.com | more` para mostrar todas las peticiones que se hacen con el servidor. Fijese que se utiliza un pipe con el comando more para mostrar el mensaje por pedazos. 
`curl -v https://platzi.com > /dev/null` Otra cosa que se hace mucho es cuando se quiere ver unicamente los encabezados http. 
Entonces se redirecciona la salida a un archivo que no existe, un  tipo de "agujero negro" en linux. Esto redirecciona toda la informacion que no queremos ver. 


















