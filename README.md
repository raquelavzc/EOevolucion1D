# EOevolucion1D
En este repositorio se encuentran el código de evolución de la Ecuación de Onda 1D 

Con el objetivo de familiarizar al lector con los conceptos fundamentales de
evolución hiperbólica e introducirlo al problema completo Einstein-Klein-Gordon,
resulta útil estudiar inicialmente un problema más sencillo como la ecuación de
onda unidimensional, ya que comparte las principales características hiperbólicas del
sistema físico de interés. Este problema modelo lo utilizaremos como ejemplo para
validar el esquema de diferencias finitas, analizar la estabilidad numérica, introducir
el esquema leapfrog, implementar condiciones de frontera y comprender mejor la
propagación temporal de perturbaciones sobre una malla computacional. Posterior-
mente, estas mismas ideas las extenderemos al sistema Einstein-Klein-Gordon en
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


<img width="150" height="150" alt="image" src="https://github.com/user-attachments/assets/86bd238e-2436-484b-9636-9558cb55c4b0" />


