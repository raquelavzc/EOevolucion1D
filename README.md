# EOevolucion1D
En este repositorio se encuentran el código de evolución de la Ecuación de Onda 1D 

Con el objetivo de familiarizar al lector con los conceptos fundamentales de
evolución hiperbólica, resulta útil estudiar inicialmente un problema más sencillo como 
la ecuación de onda unidimensional, ya que comparte las principales características hiperbólicas 
de un sistema físico de interé en Relatividad Numérica. Este problema modelo lo utilizaremos como 
ejemplo para validar el esquema de diferencias finitas, analizar la estabilidad numérica, introducir
el esquema leapfrog, implementar condiciones de frontera y comprender mejor la
propagación temporal de perturbaciones sobre una malla computacional. Posterior-
mente, estas mismas ideas se pueden extender al sistema de ecuaciones de Einstein en
coordenadas esféricas, donde las variables dinámicas evolucionan explícitamente en
el tiempo mediante esquemas de diferencias finitas centradas y medias.

# Ejemplo de una corrida
Al interactuar con el programa, el lector podrá observar diferencias importantes
relacionadas con la interacción de la perturbación con las fronteras numéricas al
cambiar los parámetros y la propagación hiperbólica. Para este análisis, se eligió
una familia específica de parámetros que ilustran el funcionamiento del código tanto
física como numéricamente, sin embargo, el lector puede jugar con ellos para obtener
otros resultados.

Para el perfil inicial gaussiano asignamos los siguientes valores:

<img width="150" height="180" alt="image" src="https://github.com/user-attachments/assets/86bd238e-2436-484b-9636-9558cb55c4b0" />

y obtendremos una onda centrada en r = 5 que se divide en dos picos. Ambas ondas
viajan hacia los extremos de la frontera donde la solución se vuelve negativa.

<img width="800" height="600" alt="ecuacion_de_onda" src="https://github.com/user-attachments/assets/e52aa646-567b-4c1d-b2f8-85e87b27c765" />

Con el fin de demostrar que la solución es tan sensible a los cambios de parámetros,
volvemos a correr nuestro código con los mismos valores, pero esta vez solo cambiamos
la posición inicial del perfil gaussiano a r=0.1.

<img width="800" height="600" alt="ecuacion_de_onda" src="https://github.com/user-attachments/assets/03bcbe5f-3fcb-4014-a254-d2a30e1daee0" />

El perfil inicial también se descompone en dos partes, una que intentaría viajar hacia
la derecha y otra hacia la izquierda, sin embargo, como el pulso está muy cerca de la frontera
izquierda, la parte que va hacia la izquierda choca casi inmediatamente
con la frontera y se refleja. Por eso aparece una parte negativa cerca de r = 0 y las
oscilaciones son el efecto numérico de la reflexión temprana en la frontera. La onda
sigue viajando hacia la derecha y al chocar, aparece inversión de signo nuevamente


# Ejecución del código


Para ejecutar el código basta con descargar los ejecutables y guardarlos en una misma carpeta. 
Es importante mencionar que el usuario debe ejecutar primero el archivo .f90 para obtener los snapshots
y después correr el archivo .py para ver la evolución correspondiente en una animación.

1.- Abre la carpeta con la intrucción cd

cd "C:\Users\raqli\OneDrive\Documentos\Proyecto terminal\código\proyecto_fortran"

2.- Ejecuta EOevolucion1D.f90

gfortran .\ecuacion_de_onda\EOevolucion1D.f90 -o .\ecuacion_de_onda\EOevolucion1D.exe

3.- Ejecuta Animación

python .\ecuacion_de_onda.py







