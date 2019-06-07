import java.util.Scanner;
/**
 * Clase que modela una ventanilla en servicios escolares.
 * @author Jesica Chavero Sandoval
 * @version 2da edicion.
 */
public class Proyecto2 {
	public static void main(String[] args) {
		ServiciosEscoles servicios = new ServiciosEscoles();
		boolean fin = false;
		Scanner sc;
		System.out.print("\033[H\033[2J");
		System.out.flush();
		do {
			servicios.mostrarOpciones();
			sc = new Scanner(System.in);
			switch (sc.next().charAt(0)) {
				case 'a':
				case 'A': 
					servicios.opcion1();
				break;

				case 'b':
				case 'B':
					servicios.opcion2();
				break;

				case 'c':
				case 'C':
					servicios.opcion3();
				break;

				case 'd':
				case 'D':
					servicios.opcion4();
				break;

				case 'e':
				case 'E':
					fin = true;
				break;

				default:
					System.out.println("Entrada Invalida.\nCompruebe la opción seleccionada.");
				break;
			}
		} while (!fin);
	}
}