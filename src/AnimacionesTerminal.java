/**
 * Clase que contiene metodos estaticos que simulan animaciones en la terminal.
 * @author Laura Berenice León Alvarado
 * @version 5a edicion
 */ 
public class AnimacionesTerminal
{
	/**
	 * Metodo que retrasa la impresion en la terminal, en el tiempo establecido.
	 * @param tiempoDeRetardo tiempo en milisegundos que se tardara en imprimir lo siguiente en la terminal.
	 */
	public static void retrasarImpresion(int tiempoDeRetardo)
	{
		try {
			Thread.sleep(tiempoDeRetardo);
		} catch (InterruptedException ex) {}
	}

	/**
	 * Meotod que limpia la pantalla de la terminal.
	 */
	public static void limpiarPantalla()
	{
		System.out.print("\033[H\033[2J");
		System.out.flush();
	}

	/**
	 * Metodo que simula una animacion para cuando se procesa alguna informacion.
	 */
	public static void procesando()
	{
		System.out.print("Procesando");
		try {
			Thread.sleep(750);
		} catch (InterruptedException ex) {}
		System.out.print(".");
		try { 	
			Thread.sleep(750);
		} catch (InterruptedException ex) {}
		System.out.print(".");
		try {
			Thread.sleep(750);
		} catch (InterruptedException ex) {}
		limpiarPantalla();
	}
}