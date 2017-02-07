# ExamenXquery
Examen con preguntas aleatorias

El programa consiste en presentar 10 preguntas aleatorias, dos de cada tipo de formulario, de diferentes XML. Tras finalizar, se debe corregir automáticamente y decirnos la nota.

Para iniciar el programa, ejecutamos el archivo index.html, el cual contiene una tabla con un id preguntas, dentro de un formulario. El HTML, llama a un archivo javascript con el que leemos un archivo xql llamado lectura.xql.
lectura.xql lee las preguntas de los diferentes XML por tipos (select, radio, checkbox...), las guarda en una variable y las pasa a script.js.

El javascript carga las preguntas dándoles formato en una variable string llamada html, con el fin de presentarlos dentro de la tabla de index.html tras la siguiente linea de código *document.getElementById("preguntas").innerHTML = html;*, haciendo referencia al id preguntas.

En este momento tenemos todas las preguntas en pantalla. Tras realizar el examen, se envía el formulario a un archivo correction.xql, el cual recibe los parámetros y gracias a la id compara la respuesta correcta con la del usuario, montando un XML al igual que los de las preguntas originales, añadiendo los nodos de *respuesta* y *puntos*.

Finalmente correction.xml recibe una maquetación gracias a xsl presentandola de forma agradable y calculando los puntos totales del examen
.
