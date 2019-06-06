import java.util.Scanner;
/**
 * Clase que simula el sistema de servicios escolares.
 */ 
public class ServiciosEscoles {
	/* Sistema de servicios escolares. */	
	public SeccionEscolar sistema;

	/** 
	 * Constructor vacío.
	 */ 
	public ServiciosEscoles() {
		sistema = new SeccionEscolar();
	}

	/**
	 * Metodo que agrega un alumno al sistema.
	 */
	public void opcion1() {
		String nom, dir, tel;
		int n;
		if (sistema.nAlumnos >= sistema.poblacionEst) {
			System.out.println("El sistema esta lleno");
			return;
		}
		Scanner sc = new Scanner(System.in);
		System.out.println("Nombre: ")
		nom = sc.nextLine();
		System.out.println("Telefono: ");
		tel = sc.nextLine();
		System.out.println("Direccion: ")
		dir = sc.nextLine();
		System.out.println("No.Materias: ");
		n = sc.nextInt();
		sistema.insertar(new Alummo(nom,dir,tel,n));
	}

	/**
	 * Metodo que asigna las calificaciones a un alumno.
	 */
	public void opcion2() {
		String nom;
		int i;
		System.out.println("Nombre del alumno: ");
		Scanner sc = new Scanner(System.in);
		nom = sc.nextLine();
		Alumno alum = new Alumno(nom,"UNAM","+52",5);
		i = sistema.buscar(alum);
		if (i == -1) {
			System.out.println("No se encontro el alumno.");
			return;
		} 
		alum = sistema.poblacionEst[i];
		alum.asignarCalificaciones();
	}

	/**
	 * Metodo ara obtener la información de un alumno.
	 */
	public void opcion3() {
		String nom;
		int i;
		System.out.println("Nombre del alumno: ");
		Scanner sc = new Scanner(System.in);
		nom = sc.nextLine();
		Alumno alum = new Alumno(nom,"UNAM","+52",5);
		i = sistema.buscar(alum);
		if (i == -1) {
			System.out.println("No se encontro el alumno.");
			return;
		} 
		alum = sistema.poblacionEst[i];
		System.out.println("Nombre: " + alum.obtenerNombre() + "\n" +
			               "Direccion: " + alum.obtenerDireccion() + "\n" +
			               "Telefono: " + alum.obtenerTelefono() + "\n" +
			               "Promedio: " + alum);
	}
}