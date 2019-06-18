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
/* Las cuatro n en el centro */
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
fill(162, 114, 80);
rect(10, 532, 250, 600);
textSize(40);
fill(255);
text("Blancas:"+ this.blancas, 10, 532, 250, 600);
fill(162, 114, 80);
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
// Dada una fila y una columna, tira esa ficha.
void tira(int fila, int columna) { 
if (hayJugadaAbajo(fila,columna))	
	cambiaFichasAbajo(fila,columna);
if (hayJugadaArriba(fila,columna))	
	cambiaFichasArriba(fila,columna);
if (hayJugadaDerecha(fila,columna))	
	cambiaFichasDerecha(fila,columna);
if (hayJugadaIzquierda(fila,columna))	
	cambiaFichasIzquierda(fila,columna);
if (hayDiagonalSuperiorDer(fila,columna))	
	cambiaFichasDiagonalSupDer(fila,columna);
if (hayDiagonalSuperiorIzq(fila,columna))	
	cambiaFichasDiagonalSupIzq(fila,columna);
if (hayDiagonalInferiorDer(fila,columna))	
	cambiaFichasDiagonalInfDer(fila,columna);
if (hayDiagonalInferiorIzq(fila,columna))	
	cambiaFichasDiagonalInfIzq(fila,columna);
if (turno == true)
	tablero[fila][columna] = 1;
else 
	tablero[fila][columna] = -1;
}
void cambiaFichasAbajo(int fila,int columna){
// Les toca
	int f;
	if (turno == true)
		f = 1;
	else 
		f = -1;
	for (int i = fila - 1; i >= 0; i--)
		if (tablero[i][columna] == f)
			return;
		else
			tablero[i][columna] = f;
}
void cambiaFichasArriba(int fila,int columna){
// Les toca
	int f;
	if (turno == true)
		f = 1;
	else 
		f = -1;
	for (int i = fila + 1; i < dimension; i++)
		if (tablero[i][columna] == f)
			return;
		else
			tablero[i][columna] = f;
}
void cambiaFichasDerecha(int fila,int columna){
// Les toca
	int f;
	if (turno == true)
		f = 1;
	else
		f = -1;
	for (int i = columna - 1; i >= 0; i--)
		if (tablero[fila][i] == f)
			return;
		else
			tablero[fila][i] = f;
}
void cambiaFichasIzquierda(int fila,int columna){
// Les toca
	int f;
	if (turno == true)
		f = 1;
	else
		f = -1;
	for (int i = columna + 1; i < dimension; i++)
		if (tablero[fila][i] == f)
			return;
		else
			tablero[fila][i] = f;
}
void cambiaFichasDiagonalSupDer(int fila,int columna){
// Les toca
	int f;
	if (turno == true)
		f = 1;
	else
		f = -1;
	fila++;
	for (int i = columna - 1; i >= 0 && fila < dimension; i--) {
		if (tablero[fila][i] == f)
			return;
		else
			tablero[fila][i] = f;
		fila++;
	}
}
void cambiaFichasDiagonalSupIzq(int fila,int columna){
// Les toca
	int f;
	if (turno == true)
		f = 1;
	else
		f = -1;
	fila++;
	for (int i = columna + 1; i < dimension && fila < dimension; i++) {
		if (tablero[fila][i] == f)
			return;
		else
			tablero[fila][i] = f;
		fila++;
	}
}
void cambiaFichasDiagonalInfDer(int fila,int columna){
// Les toca
	int f;
	if (turno == true)
		f = 1;
	else
		f = -1;
	fila--;
	for (int i = columna - 1; i >= 0 && fila >= 0; i--) {
		if (tablero[fila][i] == f)
			return;
		else
			tablero[fila][i] = f;
		fila--;
	}

}
void cambiaFichasDiagonalInfIzq(int fila,int columna){
// Les toca
	int f;
	if (turno == true)
		f = 1;
	else
		f = -1;
	fila--;
	for (int i = columna + 1; i < dimension && fila >= 0; i++) {
		if (tablero[fila][i] == f)
			return;
		else
			tablero[fila][i] = f;
		fila--;
	}
}
// Dada una fila y una columna, determina si ahÃ- es un tiro vÃ¡lido
//para el turno que va a tirar.
boolean esTiradaValida(int fila, int columna) {
if (fila >= dimension || columna >= dimension)
	return false;
if (tablero[fila][columna] == 1 || tablero[fila][columna] == -1)
	return false;
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
int n = 0;
for (int i = 0; i < dimension; i++)
	for (int j = 0; j < dimension; j++)
		if (esTiradaValida(i,j))
			n++;
turno = !turno;
for (int i = 0; i < dimension; i++)
	for (int j = 0; j < dimension; j++)
		if (esTiradaValida(i,j))
			n++;
turno = !turno;
return n == 0;
}
/*Regresa el número de jugadas segun el turno*/
int nJugadas() {
	int nj = 0;
	for (int i = 0; i < dimension; i++)
	for (int j = 0; j < dimension; j++)
		if (tablero[i][j] == 2)
			nj++;
	return nj;
}

void sinMovimientos() {
	int c;
	if (turno == true)
		c = 255;
	else
		c = 20;
	fill(162, 114, 80);
	rect(0,200,512,100);
	fill(c);
	textSize(50);
	text("Sin movimientos",10, 210, 502, 240);
	stroke(20);
}

void ganador() {
	int c;
	fill(162, 114, 80);
	rect(0,200,512,100);
	if (negras == blancas) {
		fill(255,255,0);
		textSize(50);
		text("EMPATE",158, 218, 502, 240);
		stroke(20);
		return;
	}
	if (blancas > negras)
		c = 255;
	else
		c = 20;
	fill(c);
	textSize(50);
	text("GANADOR!!",120, 218, 502, 240);
	stroke(20);
}
boolean hayDiagonalInferiorIzq (int fila, int columna) {
// Les toca
	int f, contra, n = 0;
	boolean fcontra = false;
	if (turno == true)
		f = 1;
	else
		f = -1;
	contra = f*-1;
	fila--;
	for (int i = columna + 1; i < dimension && fila >= 0 && fcontra == false; i++) {
		if (fila == 0) {
			return false;
		} else if (tablero[fila][i] == contra) {
			n++;
		} else if (tablero[fila][i] == f) {
			fcontra = true;
		}else if (tablero[fila][i] != 1 && tablero[fila][i] != -1) {
			return false;
		}
		fila--;
	}
		if (n > 0 && fcontra == true)
		return true;
	return false;
}
boolean hayDiagonalSuperiorDer (int fila, int columna) {
// Les toca
	int f, contra, n = 0;
	boolean fcontra = false;
	if (turno == true)
		f = 1;
	else
		f = -1;
	contra = f*-1;
	fila++;
	for (int i = columna - 1; i >= 0 && fila < dimension && fcontra == false; i--) {
		if (fila == 0) {
			return false;
		} else if (tablero[fila][i] == contra) {
			n++;
		} else if (tablero[fila][i] == f) {
			fcontra = true;
		}else if (tablero[fila][i] != 1 && tablero[fila][i] != -1) {
			return false;
		}
		fila++;
	}
	if (n > 0 && fcontra == true)
		return true;
	return false;
}
boolean hayDiagonalSuperiorIzq (int fila, int columna) {
// Les toca
	int f, contra, n = 0;
	boolean fcontra = false;
	if (turno == true)
		f = 1;
	else
		f = -1;
	contra = f*-1;
	fila++;
	for (int i = columna + 1; i < dimension && fila < dimension && fcontra == false; i++) {
		if (fila == 0) {
			return false;
		} else if (tablero[fila][i] == contra) {
			n++;
		} else if (tablero[fila][i] == f) {
			fcontra = true;
		}else if (tablero[fila][i] != 1 && tablero[fila][i] != -1) {
			return false;
		}
		fila++;
	}
	if (n > 0 && fcontra == true)
		return true;
	return false;
}
boolean hayDiagonalInferiorDer (int fila, int columna) {
// Les toca
	int f, contra, n = 0;
	boolean fcontra = false;
	if (turno == true)
		f = 1;
	else
		f = -1;
	contra = f*-1;
	fila--;
	for (int i = columna - 1; i >= 0 && fila >= 0 && fcontra == false; i--) {
		if (fila == 0) {
			return false;
		} else if (tablero[fila][i] == contra) {
			n++;
		} else if (tablero[fila][i] == f) {
			fcontra = true;
		}else if (tablero[fila][i] != 1 && tablero[fila][i] != -1) {
			return false;
		}
		fila--;
	}
		if (n > 0 && fcontra == true)
			return true;
	return false;
}
boolean hayJugadaDerecha (int fila, int columna) {
// Les toca
	int f, contra, n = 0;
	if (turno == true)
		f = 1;
	else
		f = -1;
	contra = f*-1;
	boolean fcontra = false;
	for (int i = columna - 1; i >= 0 && fcontra == false; i--){
		if (tablero[fila][i] == contra)
			n++;
		if (tablero[fila][i] == f)
			fcontra = true;
		if (tablero[fila][i] == 0 || tablero[fila][i] == 2)
			return false;
	}
	if (n > 0 && fcontra == true)
		return true;
	return false;
}
boolean hayJugadaAbajo (int fila, int columna) {
// Les toca
	int f, contra, n = 0;
	if (turno == true)
		f = 1;
	else
		f = -1;
	contra = f*-1;
	boolean fcontra = false;
	for (int i = fila -1; i >= 0 && fcontra == false; i--){
		if (tablero[i][columna] == contra) {
			n++;
		} else if (tablero[i][columna] == f) {
			fcontra = true;
		}else if (tablero[i][columna] != 1 && tablero[fila][i] != -1) {
			return false;
		}
	}
	if (n > 0 && fcontra == true)
		return true;
	return false;
}
boolean hayJugadaArriba(int fila, int columna) {
// Les toca
	int f, contra, n = 0;
	if (turno == true)
		f = 1;
	else
		f = -1;
	contra = f*-1;
	boolean fcontra = false;
	for (int i = fila + 1; i < dimension && fcontra == false; i++){
		if (tablero[i][columna] == contra) {
			n++;
		} else if (tablero[i][columna] == f) {
			fcontra = true;
		}else if (tablero[i][columna] != 1 && tablero[fila][i] != -1) {
			return false;
		}
	}
	if (n > 0 && fcontra == true)
		return true;
	return false;
}

boolean hayJugadaIzquierda(int fila, int columna) {
// Les toca
	int f, contra, n = 0;
	if (turno)
		f = 1;
	else
		f = -1;
	contra = f*-1;
	boolean fcontra = false;
	for (int i = columna + 1; i < dimension && fcontra == false; i++){
		if (tablero[fila][i] == contra)
			n++;
		if (tablero[fila][i] == f)
			fcontra = true;
		if (tablero[fila][i] == 0 || tablero[fila][i] == 2)
			return false;
	}
	if (n > 0 && fcontra == true)
		return true;
	return false;
}
} /* Fin Clase Tablero */
Tablero tablero = new Tablero(8);
void setup() {
/* Configuraciones iniciales */
background(162, 114, 80);
size(512, 600);
}
void draw() {
/* Dibuja el tablero */
background(162, 114, 80);
tablero.display();
stroke(20);
if (tablero.estaTerminado() == true) {
	tablero.ganador();
} else if (tablero.nJugadas() == 0) {
	long tiempoInicial =  millis();
	tablero.sinMovimientos();
	if (mousePressed)
		tablero.turno = !tablero.turno;
	tablero.buscaTiradas();
	tablero.cuenta_fichas();
}
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
tablero.cuenta_fichas();
}
}