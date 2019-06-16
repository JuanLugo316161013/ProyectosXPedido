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
					ellipse((j*recV) + (recV/2), (i*recV) + (recV/2), recV*3/4, recV*3/4);
				} else if (this.tablero[i][j] == 2) {
					fill(126);
					noStroke();
					ellipse((j*recV) + (recV/2), (i*recV) + (recV/2), recV*1/4,
					recV*1/4);
				} else if (this.tablero[i][j] == 0) {
					fill(114, 255, 224);
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
				} else if(this.tablero[i][j] == 2) {
					this.tablero[i][j] = 0;
				}
			}
		}
	}

	// Dada una fila y una columna, tira esa ficha.
	void tira(int fila, int columna) {
		if (hayJugadaAbajo(fila,columna)) {
			cambiaFichasAbajo(fila,columna);
			println("hayJugadaAbajo");
		}
		if (hayJugadaArriba(fila,columna)) {
			cambiaFichasArriba(fila,columna);
			println("hayJugadaArriba");
		}
		if (hayJugadaDerecha(fila,columna)) {
			cambiaFichasDerecha(fila,columna);
			println("hayJugadaDerecha");
		}
		if (hayJugadaIzquierda(fila,columna)){
			cambiaFichasIzquierda(fila,columna);
			println("hayJugadaIzquierda");
		}
		if (hayDiagonalSuperiorDer(fila,columna)){
			cambiaFichasDiagonalSupDer(fila,columna);
			println("hayDiagonalSuperiorDer");
		}
		if (hayDiagonalSuperiorIzq(fila,columna)){
			cambiaFichasDiagonalSupIzq(fila,columna);
			println("hayDiagonalSuperiorDer");
		}
		if (hayDiagonalInferiorDer(fila,columna)){
			cambiaFichasDiagonalInfDer(fila,columna);
			println("hayDiagonalInferiorDer");
		}
		if (hayDiagonalInferiorIzq(fila,columna)){
			cambiaFichasDiagonalInfIzq(fila,columna);
			println("hayDiagonalInferiorIzq");
		}
	}

	void cambiaFichasAbajo(int fila,int columna){
		// Les toca
		int ficha;
		if (turno)
			ficha = 1;
		else
			ficha = -1;
		//if (hayJugadaAbajo(fila,columna))
			for (int i = fila; i >= 0; i--)
				if (tablero[i][columna] == ficha)
					return;
				else
					tablero[i][columna] = ficha;
	}

	void cambiaFichasArriba(int fila,int columna){
		// Les toca
		int ficha;
		if (turno)
			ficha = 1;
		else
			ficha = -1;
		//if (hayJugadaArriba(fila,columna))
			for (int i = fila; i < dimension; i++)
				if (tablero[i][columna] == ficha)
					return;
				else
					tablero[i][columna] = ficha;
	}

	void cambiaFichasDerecha(int fila,int columna){
		// Les toca
		int ficha;
		if (turno)
			ficha = 1;
		else
			ficha = -1;
		//if (hayJugadaDerecha(fila,columna))
			for (int i = columna; i >= 0; i--)
				if (tablero[fila][i] == ficha)
					return;
				else
					tablero[fila][i] = ficha;
	}

	void cambiaFichasIzquierda(int fila,int columna){
		// Les toca
		int ficha;
		if (turno)
			ficha = 1;
		else
			ficha = -1;
		//if (hayJugadaIzquierda(fila,columna))
			for (int i = columna; i < dimension; i++)
				if (tablero[fila][i] == ficha)
					return;
				else
					tablero[fila][i] = ficha;
	}

	void cambiaFichasDiagonalSupDer(int fila,int columna){
		// Les toca		
		int ficha;
		if (turno)
			ficha = 1;
		else
			ficha = -1;
		//if (hayDiagonalSuperiorDer(fila,columna)) {
			for (int i = columna; i >= 0; i--) {
				if (tablero[fila][i] == ficha) {
					return;
				} else {
					tablero[fila][i] = ficha;
				}
				fila++;
			}
		//}
	}

	void cambiaFichasDiagonalSupIzq(int fila,int columna){
		// Les toca
		int ficha;
		if (turno)
			ficha = 1;
		else
			ficha = -1;
		//if (hayDiagonalSuperiorIzq(fila,columna)) {
			for (int i = columna; i < dimension; i++) {
				if (tablero[fila][i] == ficha) {
					return;
				} else {
					tablero[fila][i] = ficha;
				}
				fila++;
			}
		//}
	}

	void cambiaFichasDiagonalInfDer(int fila,int columna){
		// Les toca
		int ficha;
		if (turno)
			ficha = 1;
		else
			ficha = -1;
		//if (hayDiagonalInferiorDer(fila,columna)) {
			for (int i = columna; i >= 0; i--) {
				if (tablero[fila][i] == ficha) {
					return;
				} else {
					tablero[fila][i] = ficha;
				}
				fila--;
			}
		//}
	}

	void cambiaFichasDiagonalInfIzq(int fila,int columna){
		// Les toca
		int ficha;
		if (turno)
			ficha = 1;
		else
			ficha = -1;
		//if (hayDiagonalInferiorIzq(fila,columna)) {
			for (int i = columna; i < dimension; i++) {
				if (tablero[fila][i] == ficha) {
					return;
				} else {
					tablero[fila][i] = ficha;
				}
				fila--;
			}
		//}
	}
	// Dada una fila y una columna, determina si ahÃ- es un tiro vÃ¡lido
	// para el turno que va a tirar.
	boolean esTiradaValida(int fila, int columna) {
		int ficha;
		if (turno)
			ficha = 1;
		else
			ficha = -1;
		if (tablero[fila][columna] == ficha)
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
		return false;
	}
	boolean hayDiagonalInferiorIzq (int fila, int columna) {
		// Les toca
		int ficha, contraria, fichas = 0;
		if (turno)
			ficha = 1;
		else
			ficha = -1;
		contraria = ficha*-1;
		fila--;
		boolean tope = false;
		for (int i = columna + 1; i < dimension && fila >= 0 && !tope; i++, fila--) {
			if (fila == 0)
				return false;
			if (tablero[fila][i] == contraria)
				fichas++;
			if (tablero[fila][i] == ficha)
				tope = true;
			if (tablero[fila][i] == 0 || tablero[fila][i] == 2)
				return false;
		}

		if (fichas > 0 && tope)
			return true;
		return false;
	}
	
	boolean hayDiagonalSuperiorDer (int fila, int columna) {
		// Les toca
		int ficha, contraria, fichas = 0;
		if (turno)
			ficha = 1;
		else
			ficha = -1;
		contraria = ficha*-1;
		fila++;
		boolean tope = false;
		for (int i = columna - 1; i >= 0 && fila < dimension && !tope; i--, fila++) {
			if (fila == 0)
				return false;
			if (tablero[fila][i] == contraria)
				fichas++;
			if (tablero[fila][i] == ficha)
				tope = true;
			if (tablero[fila][i] == 0 || tablero[fila][i] == 2)
				return false;
		}
		if (fichas > 0 && tope)
			return true;
		return false;
	}

	boolean hayDiagonalSuperiorIzq (int fila, int columna) {
		// Les toca
		int ficha, contraria, fichas = 0;
		if (turno)
			ficha = 1;
		else
			ficha = -1;
		contraria = ficha*-1;
		fila++;
		boolean tope = false;
		for (int i = columna + 1; i < dimension && fila < dimension && !tope; i++, fila++) {
			if (fila == 0)
				return false;
			if (tablero[fila][i] == contraria)
				fichas++;
			if (tablero[fila][i] == ficha)
				tope = true;
			if (tablero[fila][i] == 0 || tablero[fila][i] == 2)
				return false;
		}
		if (fichas > 0 && tope)
			return true;
		return false;
	}

	boolean hayDiagonalInferiorDer (int fila, int columna) {
		// Les toca
		int ficha, contraria, fichas = 0;
		if (turno)
			ficha = 1;
		else
			ficha = -1;
		contraria = ficha*-1;
		fila--;
		boolean tope = false;
		for (int i = columna - 1; i >= 0 && fila >= 0 && !tope; i--) {
			if (fila == 0)
				return false;
			if (tablero[fila][i] == contraria)
				fichas++;
			if (tablero[fila][i] == ficha)
				tope = true;
			if (tablero[fila][i] == 0 || tablero[fila][i] == 2)
				return false;
			fila--;
		}
		if (fichas > 0 && tope)
			return true;
		return false;
	}

	boolean hayJugadaDerecha (int fila, int columna) {
		// Les toca
		if (columna == 0) {
			return false;
		} else {
			int ficha, contraria, fichas = 0;
			if (turno)
				ficha = 1;
			else
				ficha = -1;
			contraria = ficha*-1;
			boolean tope = false;
			for (int i = columna - 1; i >= 0 && !tope; i--){
				if (tablero[fila][i] == contraria)
					fichas++;
				if (tablero[fila][i] == ficha)
					tope = true;
				if (tablero[fila][i] == 0 || tablero[fila][i] == 2)
					return false;
			}
			if (fichas > 0 && tope)
				return true;
			return false;
		}
	}
	boolean hayJugadaAbajo (int fila, int columna) {
		// Les toca
		if (fila == 0) {
			return false;
		} else {
			int ficha, contraria, fichas = 0;
			if (turno)
				ficha = 1;
			else
				ficha = -1;
			contraria = ficha*-1;
			boolean tope = false;
			for (int i = fila -1; i >= 0 && !tope; i--){
				if (tablero[i][columna] == contraria)
					fichas++;
				if (tablero[i][columna] == ficha)
					tope = true;
				if (tablero[i][columna] == 0 || tablero[i][columna] == 2)
					return false;
			}

			if (fichas > 0 && tope)
				return true;
			return false;
		}
	}
	boolean hayJugadaArriba(int fila, int columna) {
		// Les toca
		if (fila == dimension-1) {
			return false;
		} else {
			int ficha, contraria, fichas = 0;
			if (turno)
				ficha = 1;
			else
				ficha = -1;
			contraria = ficha*-1;
			boolean tope = false;
			for (int i = fila + 1; i < dimension && !tope; i++){
				if (tablero[i][columna] == contraria)
					fichas++;
				if (tablero[i][columna] == ficha)
					tope = true;
				if (tablero[i][columna] == 0 || tablero[i][columna] == 2)
					return false;
			}

			if (fichas > 0 && tope)
				return true;
			return false;
		}
	}

	boolean hayJugadaIzquierda(int fila, int columna) {
		// Les toca
		if (columna == dimension-1) {
			return false;
		} else {
			int ficha, contraria, fichas = 0;
			if (turno)
				ficha = 1;
			else
				ficha = -1;
			contraria = ficha*-1;
			boolean tope = false;
			for (int i = columna + 1; i < dimension && !tope; i++){
				if (tablero[fila][i] == contraria)
					fichas++;
				if (tablero[fila][i] == ficha)
					tope = true;
				if (tablero[fila][i] == 0 || tablero[fila][i] == 2)
					return false;
			}
			if (fichas > 0 && tope)
				return true;
			return false;
		}
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
println("fila: "+ i + " columna: "+ j);
if(tablero.esTiradaValida(i,j)){
  tablero.tira(i,j);
// Cambiamos de turno.
tablero.turno = !tablero.turno;
tablero.buscaTiradas();
}
tablero.cuenta_fichas();
}
