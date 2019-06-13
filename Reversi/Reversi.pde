import java.util.Scanner;
import java.lang.Math;
/* Clase que emula un tablero para el juego de Othello */
class Tablero { 
 int[][] tablero;
 int dimension;
 boolean turno;
 int negras;
 int blancas;
 /* Constructor */
 Tablero(int N) {
 this.tablero = new int[N][N];
 this.dimension = N;
 /* Las negras son false */
 this.turno = false;
 this.negras = 2;
 this.blancas = 2;
 /* Las cuatro fichas en el centro */
 tablero[(this.dimension/2)-1][(this.dimension/2)-1] = 1;
 tablero[(this.dimension/2)-1][this.dimension/2] = -1;
 tablero[this.dimension/2][(this.dimension/2)-1] = -1;
 tablero[this.dimension/2][this.dimension/2] = 1;

 buscaTiradas();
 }

 void display() {
 int recH = 512/this.dimension;
 int recV = width/this.dimension;
 for (int i = 0; i < this.dimension+1; i++) {
 line(recH*i, 0, recH*i, 512);
 line(0, recV*i, width, recV*i);
 }
 for (int i = 0; i < this.dimension; i++) {
 for (int j = 0; j < this.dimension; j++) {
 if (this.tablero[i][j] == 1) {
 fill(255);
 noStroke();
 ellipse((j*recV) + (recV/2), (i*recV) + (recV/2), recV*3/4,
recV*3/4);
 } else if (this.tablero[i][j] == -1) {
 fill(0);
 noStroke();
 ellipse((j*recV) + (recV/2), (i*recV) + (recV/2), recV*3/4,
recV*3/4);
 } else if (this.tablero[i][j] == 2) {
 fill(126);
 noStroke();
 ellipse((j*recV) + (recV/2), (i*recV) + (recV/2), recV*1/4,
recV*1/4);
 }
 }
 }
 fill(114, 255, 224);
 rect(10, 532, 250, 600);
 textSize(40);
 fill(255);
 text("Blancas:"+ this.blancas, 10, 532, 250, 600);
 fill(114, 255, 224);
 rect(286, 532, 512, 600);
 textSize(40);
 fill(10);
 text("Negras:"+ this.negras, 286, 532, 512, 600);
 }
 // Regresa el turno actual
 boolean getTurno() {
 return this.turno;
 }
 // Actualiza el turno.
 void setTurno(boolean turno) {
 this.turno = turno;
 }
 // Cuenta las fichas negras y blancas sobre el tablero.
 void cuenta_fichas() {
 int negras = 0;
 int blancas = 0;
 for (int i = 0; i < this.dimension; i++) {
 for (int j = 0; j < this.dimension; j++) {
 if (this.tablero[i][j] == 1) {
 blancas++;
 } else if (this.tablero[i][j] == -1) {
 negras++;
 }
 }
 }
 this.negras = negras;
 this.blancas = blancas;
 }
 // Actualiza valores, pone un 2 si es una tirada posible
 void buscaTiradas() {
 for (int i = 0; i < this.dimension; i++) {
 for (int j = 0; j < this.dimension; j++) {
 if (this.tablero[i][j] == 1 || this.tablero[i][j] == -1)
continue;
 if (esTiradaValida(i, j)) {
 // Actualizamos el valor para que aparezaca el circulito gris.
 this.tablero[i][j] = 2;
 } else if(this.tablero[i][j] == 2){
 this.tablero[i][j] = 0;
 }
 }
 }
 }

 // Dada una fila y una columna, tira esa ficha.
 void tira(int fila, int columna) {
 cambiaFichasAbajo(fila,columna);
 cambiaFichasArriba(fila,columna);
 cambiaFichasDerecha(fila,columna);
 cambiaFichasIzquierda(fila,columna);
 cambiaFichasDiagonalSupDer(fila,columna);
 cambiaFichasDiagonalSupIzq(fila,columna);
 cambiaFichasDiagonalInfDer(fila,columna);
 cambiaFichasDiagonalInfIzq(fila,columna);
 }

 void cambiaFichasAbajo(int fila,int columna){
 // Les toca
 }

 void cambiaFichasArriba(int fila,int columna){
 // Les toca
 }

 void cambiaFichasDerecha(int fila,int columna){
 // Les toca
 }

 void cambiaFichasIzquierda(int fila,int columna){
 // Les toca
 }

 void cambiaFichasDiagonalSupDer(int fila,int columna){
 // Les toca
 }

 void cambiaFichasDiagonalSupIzq(int fila,int columna){
 // Les toca
 }

 void cambiaFichasDiagonalInfDer(int fila,int columna){
 // Les toca
 }

 void cambiaFichasDiagonalInfIzq(int fila,int columna){
 // Les toca
 }
 // Dada una fila y una columna, determina si ahÃ- es un tiro vÃ¡lido
 //para el turno que va a tirar.
 boolean esTiradaValida(int fila, int columna) {
 boolean existeTirada = false;
 existeTirada = existeTirada || hayDiagonalInferiorIzq(fila,columna);
 existeTirada = existeTirada || hayDiagonalInferiorDer(fila,columna);
 existeTirada = existeTirada || hayDiagonalSuperiorIzq(fila,columna);
 existeTirada = existeTirada || hayDiagonalSuperiorDer(fila,columna);
 existeTirada = existeTirada || hayJugadaIzquierda(fila,columna);
 existeTirada = existeTirada || hayJugadaDerecha(fila,columna);
 existeTirada = existeTirada || hayJugadaArriba(fila,columna);
 existeTirada = existeTirada || hayJugadaAbajo(fila,columna);

 return existeTirada;
 }
 /*Regresa true si el juego aun no termina. False en otro caso*/
 boolean estaTerminado() {
 // Les toca
 return false;
 }
 boolean hayDiagonalInferiorIzq (int fila, int columna) {
 // Les toca
 return false;
 }
 boolean hayDiagonalSuperiorDer (int fila, int columna) {
 // Les toca
 return false;
 }

 boolean hayDiagonalSuperiorIzq (int fila, int columna) {
 // Les toca
 return false;
 }
 boolean hayDiagonalInferiorDer (int fila, int columna) {
 // Les toca
 return false;
 }
 boolean hayJugadaDerecha (int fila, int columna) {
 // Les toca
 return false;
 }
 boolean hayJugadaAbajo (int fila, int columna) {
 // Les toca
 return false;
 }
 boolean hayJugadaArriba(int fila, int columna) {
 // Les toca
 return false;
 }
 boolean hayJugadaIzquierda(int fila, int columna) {
 // Les toca
 return false;
 }
} /* Fin Clase Tablero */
Tablero tablero = new Tablero(8);
void setup() {
 /* Configuraciones iniciales */
 background(114, 255, 224);
 size(512, 600);
}
void draw() {
 /* Dibuja el tablero */
 tablero.display();
}
void mouseClicked() {
 // Falso: negro True: Verdadero
 int i = mouseY/(512/tablero.dimension);
 int j = mouseX/(width/tablero.dimension);
 if(tablero.esTiradaValida(i,j)){
 tablero.tira(i,j);
 // Cambiamos de turno.
 tablero.turno = !tablero.turno;
 tablero.buscaTiradas();
 }
}