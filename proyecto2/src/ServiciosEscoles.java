import java.util.Scanner;
/**
 * Clase que simula el sistema de servicios escolares.
 * @author Jesica Chavero Sandoval
 * @version 3ra edicion.
 */ 
public class ServiciosEscoles {
	/* Sistema de servicios escolares. */	
	private SeccionEscolar sistema;

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
		System.out.print("\033[H\033[2J");
		System.out.flush();
		String nom, dir, tel;
		int n;
		if (sistema.nAlumnos >= sistema.poblacionEst.length) {
			System.out.println("El sistema esta lleno");
			return;
		}
		Scanner sc = new Scanner(System.in);
		System.out.println("Nombre: ");
		nom = sc.nextLine();
		System.out.println("Telefono: ");
		tel = sc.nextLine();
		System.out.println("Direccion: ");
		dir = sc.nextLine();
		System.out.println("No.Materias: ");
		n = sc.nextInt();
		sistema.insertar(new Alumno(nom,dir,tel,n));
		System.out.print("\n\n\n");
	}

	/**
	 * Metodo que asigna las calificaciones a un alumno.
	 */
	public void opcion2() {
		System.out.print("\033[H\033[2J");
		System.out.flush();
		if (sistema.nAlumnos == 0) {
			System.out.println("No hay alumnos en el sistema.");
			return;
		}
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
		System.out.print("\n\n\n");
	}

	/**
	 * Metodo para obtener la información de un alumno.
	 */
	public void opcion3() {
		System.out.print("\033[H\033[2J");
		System.out.flush();
		if (sistema.nAlumnos == 0) {
			System.out.println("No hay alumnos en el sistema.");
			return;
		}
		String nom;
		int i, mat;
		double promedio = 0;
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
			               "Promedio: " + alum.promedio());
		
		i = 0;
		mat = alum.obtenerNumCalificaciones();
		for (int j = 0; j < sistema.nAlumnos; j++) {
			if (sistema.poblacionEst[j].obtenerNumCalificaciones() == mat) {
				promedio += sistema.poblacionEst[j].promedio();
				i++;
			}
		}

		if (i == 0) {
			System.out.println("alumno promedio");
		} else {
			promedio = promedio/i;
			if (alum.promedio() == promedio)
				System.out.println("alumno promedio");

			if (alum.promedio() > promedio)
				System.out.println("alumno encima del promedio");

			if (alum.promedio() < promedio)
				System.out.println("alumno debajo del promedio");
		}
		System.out.print("\n\n\n");
	}

	/**
	 * Metodo que lista todos los alumnos con al menos N dieces en el sistema.
	 */
	public void opcion4() {
		System.out.print("\033[H\033[2J");
		System.out.flush();
		if (sistema.nAlumnos == 0) {
			System.out.println("No hay alumnos en el sistema.");
			return;
		}
		int i;
		System.out.println("Numero de dieces N: ");
		Scanner sc = new Scanner(System.in);
		i = sc.nextInt();
		for (int k = 0; k < sistema.nAlumnos; k++)
			if (sistema.poblacionEst[k].noDieces() >= i)
				System.out.println(sistema.poblacionEst[k].toString());
		System.out.print("\n\n\n");
	}

	public void mostrarOpciones() {
		System.out.println("** SERVICIOS ESCOLARES **\n");
		System.out.println("[A] Dar de alta alumnos");
		System.out.println("[B] Asignar las calificaciones de un alumno");
		System.out.println("[C] Obtener información de un alumno");
		System.out.println("[D] Listar todos los alumnos con al menos N dieces");
		System.out.println("[E] Terminar");
		System.out.print("opcion: ");
	}
}