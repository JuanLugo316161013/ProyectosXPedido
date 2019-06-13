Reversi
========
### Origen e historia
A sabiendas de que se trata de un juego ya de relativa antigüedad, el Reversi es un juego de tablero cuyo origen no está todavía claro.

Las primeras referencias que se tienen de juegos similares se remontan a finales del siglo XIX, y se trataba de juegos a los que se aplicaba nombres diferentes del actual y en los que cambiaba la forma o tamaño del tablero.

En 1870 aparece un juego similar que se juega sobre un tablero en forma de cruz. Posteriormente aparece ya un juego que se juega en tablero cuadrado de 8x8.

### Descripción

El Reversi enfrenta a dos jugadores que desarrollan el juego sobre un damero (es indiferente que las casillas sean de dos colores siempre que se trate de un tablero cuadrado de 64, distribuidas en ocho filas y ocho columnas). Se utilizan además 64 fichas iguales de dos colores: el anverso de un color y el reverso de otro diferente.

### Objetivo del juego

El objetivo del juego para cada jugador es acabar la partida con un número de fichas de su color sobre el tablero superior al de su oponente.

### Desarrollo del juego
-------------------------
### Inicio del juego

* `Los jugadores han de decidir antes que nada el color con el que va a competir cada uno de ellos.`

* `Seguidamente se situarán cuatro fichas (dos de cada color) en las cuatro casillas centrales del tablero, de forma que cada pareja de fichas iguales forme una diagonal entre sí.`

* `Realiza el primer movimiento el jugador que juegue con negras, alternando el turno entre uno y otro para los movimientos sucesivos.`

### Movimientos

Los movimientos consisten en incorporar fichas al tablero a razón de una por turno, nunca en desplazar fichas de las que ya estuvieran sobre el tablero.

Las incorporaciones deberán hacerse en orden a las siguientes normas:

* `Sólo podrá incorporarse una ficha flanquendo a una o varias fichas contrarias.`
* `Por flanquear se entiende el hecho de colocar la nueva ficha en un extremo de una hilera de fichas del color del contrario (una o más fichas) en cuyo extremo opuesto hay una ficha del color de la que se incorpora, sin que existan casillas libres entre ninguna de ellas. Esta hilera puede ser indistintamente vertical, horizontal o diagonal. De este modo, las fichas del contrincante quedan encerradas entre una que ya estaba en el tablero y la nueva ficha.`
* `Cada vez que un jugador incorpora una ficha, y por lo tanto encierra a otras del contrario, debe dar la vuelta a las fichas encerradas convirtiéndolas así en propias.`
* `Si en una sola incorporación se provocase esta situación de flanqueo en más de una línea, se voltearán todas las fichas contrarias que estuvieran implicadas en cada un de los flanqueos.`
* `Si no fuera posible para un jugador encerrar a ninguna ficha, deberá pasar en su turno, volviendo el mismo a su oponente.`

### Final

La partida finaliza cuando todas las casillas del tablero son ocupadas o ninguno de los 2 jugadores tiene posibilidad de incorpar una nueva ficha.

En cualquier caso vence el jugador que tiene más fichas sobre el tablero.

Puede darse el caso de empate si el número de fichas de cada color al acabar la partida es el mismo.