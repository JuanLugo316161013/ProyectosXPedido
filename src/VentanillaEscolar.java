import java.util.Scanner;
/**
 * Clase que simula menú para elegir el servicio deseado de Seccion Escolar.
 * @author Laura Berenice León Alvarado
 * @version 4ra edición.
 */
public class VentanillaEscolar {
	/** Sistema de la ventanilla escolar. */
	private SeccionEscolar seccionEscolar;

	/**
	 * Constructor vacío.
	 */ 
	public VentanillaEscolar() {
		seccionEscolar = new SeccionEscolar();
		AnimacionesTerminal.limpiarPantalla();
		Scanner entrada = new Scanner(System.in);
		System.out.println("USO DE SERVICIOS ESCOLARES");
		System.out.println("* Se ingresa un numero del 1 a l 5 para selecionar la opcion que guste");
		System.out.println("* Cada vez que la pantalla de quede parada y aparezca lo siguiente ': ' el programa espera que pulses enter para continuar");
		System.out.println("* Para salir ingresa la opcion 5 en el menu de servicios");
		System.out.print(": ");
		entrada.nextLine();
	}

	/**
	 * Metodo que muestra los servicios que brindan las ventanillas escolares, y da la opcion de 
	 * escoger un servicio o salir del programa.
	 */
	public void mostrarServicios() {
		String opcion;
		boolean termino;
		Scanner entrada;
		AnimacionesTerminal.limpiarPantalla();	
		do {
			termino = false;
			System.out.println("* * * * * * * * * * * * * * * * * * * *");
			System.out.println("*         Ventanillas Escolar         *");
			System.out.println("* * * * * * * * * * * * * * * * * * * *\n");
			System.out.println("Servicios: ");
			System.out.println("1) Dar de alta alumnos");
			System.out.println("2) Asignar las calificaciones de un alumno");
			System.out.println("3) Obtener información de un alumno");
			System.out.println("4) Listar todos los alumnos con al menos N dieces");
			System.out.println("5) Salir");
			System.out.print("> ");
			entrada = new Scanner(System.in);
			opcion = entrada.nextLine().trim();
			if (opcion.isEmpty())
				opcion = "6";
			System.out.print("\n\n");
			AnimacionesTerminal.procesando();
			switch (opcion.charAt(0)) {
				case 49: //Opcion 1.
					registarAlumno();
				break;

				case 50: //Opcion 2.
					asignarCalificaciones();
				break;

				case 51: //Opcion 3.
					obtenerInformacionAlumno();
				break;

				case 52: //Opcion 4.
					listarAlumnos();
				break;

				case 53: //Opcion 5.
					termino = true;
				break;

				default: //Opcion incorrecta.
					System.out.println("Opcion incorrecta");
				break;
			}
			if (!termino) {
				System.out.print(": ");
				entrada.nextLine();
				AnimacionesTerminal.limpiarPantalla();
			}
		} while(!termino);
		entrada.close();
	}

	/**
	 * Metodo que da alta a un alumno, en la seccion escolar.
	 */
	public void registarAlumno() {
		int alumnos = seccionEscolar.nAlumnos;
		String nombre, direccion, telefono, materias;
  		int noMaterias;
		if (alumnos >= seccionEscolar.poblacionEst.length) {
			SeccionEscolar seccionAuxiliar = new SeccionEscolar(alumnos*2);
			for (int i = 0; i < alumnos; i++)
				seccionAuxiliar.insertar(seccionEscolar.poblacionEst[i]);
			seccionEscolar = seccionAuxiliar;
		}
		Scanner entrada = new Scanner(System.in);
		do {
			System.out.print("Ingrese su nombre: ");
			nombre = entrada.nextLine().trim();
		} while (nombre.isEmpty());

		do {
			System.out.print("Ingrese su direccion: ");
			direccion = entrada.nextLine().trim();
		} while (direccion.isEmpty());

		do {
			System.out.print("Ingrese su telefono(por lo menos 8 digitos): ");
			telefono = entrada.nextLine().trim();
		} while (telefono.isEmpty() || !esTelefono(telefono));

		do {
			System.out.print("Ingrese el numero de materias al que esta inscrito (el numero debe ser mayor 0): ");
			materias = entrada.nextLine().trim();
		} while (materias.isEmpty() || !esNatural(materias));

		System.out.println("\n\n");
		AnimacionesTerminal.procesando();
		noMaterias = Integer.parseInt(materias);
		seccionEscolar.insertar(new Alumno(nombre,direccion,telefono,noMaterias));
		System.out.println("Alumno registrado Exitosamente!");
	}

	private void asignarCalificaciones() {
		String nombre;
		if (seccionEscolar.nAlumnos < 1) {
			System.out.println("No hay alumnos registrados.");
			return ;
		}
		Scanner entrada = new Scanner(System.in);
		do {
			System.out.print("Ingrese el nombre del alumno: ");
			nombre = entrada.nextLine().trim();
		} while (nombre.isEmpty());
		System.out.println("\n\n");
		AnimacionesTerminal.procesando();
		Alumno alumno = new Alumno(nombre,"Aquí","1234",1);
		int i = seccionEscolar.buscar(alumno);
		if (i == -1) {
			System.out.println("No se encontro el alumno " + alumno.obtenerNombre() + ".");
			return;
		}
		seccionEscolar.poblacionEst[i].asignarCalificaciones();
		System.out.println("\n\n");
		AnimacionesTerminal.procesando();
		System.out.println("Calificaciones Asignadas Exitosamente!");
	}

	/**
	 * Metodo que verifica que la entrada sea un numero valido.
	 * @param telefono entrada.
	 * @return true si es un numero de telefono valido
	 *         false en otro caso.
	 */
	private boolean esTelefono(String telefono) {
		int digitos = telefono.length();
		if (digitos < 8)
			return false;
		for (int i = 0; i < digitos; i++)
			if (telefono.charAt(i) < 48 || telefono.charAt(i) > 57)
				return false;
		return true;
	}

	/**
	 * Metodo que que verifica que la entrda dada es un nuero natural mayor a cero.
	 * @param entrada entrada a verificar
	 * @return true si es un numero natural mayor a cero,
	 *         false en otro caso.
	 */
	private boolean esNatural(String entrada) {
		for (int i = 0; i < entrada.length(); i++) 
			if (entrada.charAt(i) < 48 || entrada.charAt(i) > 57)
				return false;
		return Integer.parseInt(entrada) > 0 ? true : false;
	}

	/**
	 * Metodo que muestra la informacion de un alumno.
	 */
	public void obtenerInformacionAlumno() {
		String nombre, comparacion = "";
		Alumno alumno;
		int i, promedio, noMaterias, alumnoComparar;
		if (seccionEscolar.nAlumnos < 1) {
			System.out.println("No hay alumnos registrados.");
			return ;
		}
		Scanner entrada = new Scanner(System.in);
		do {
			System.out.print("Ingrese el nombre del alumno: ");
			nombre = entrada.nextLine().trim();
		} while (nombre.isEmpty());
		alumno = new Alumno(nombre,"Aquí","1234",1);
		i = seccionEscolar.buscar(alumno);
		System.out.println("\n\n");
		AnimacionesTerminal.procesando();
		if (i == -1) {
			System.out.println("No se encontro el alumno " + alumno.obtenerNombre() + ".");
			return;
		}
		alumno = seccionEscolar.poblacionEst[i];
		promedio = 0;
		noMaterias = alumno.obtenerNumCalificaciones();

		for (int j = 0; j < seccionEscolar.nAlumnos; j++) {
			if (seccionEscolar.poblacionEst[j].obtenerNumCalificaciones() == noMaterias) {
				alumnoComparar = alumno.compararPromedio(seccionEscolar.poblacionEst[j].obtenerCalificaciones());
				if (alumnoComparar > 0)
					promedio++;
				if (alumnoComparar < 0)
					promedio--;
			}
		}
		if (promedio > 0)
			comparacion = "El alumno esta por encima del promedio";

		if (promedio == 0)
			comparacion = "El alumno esta en el promedio";

		if (promedio < 0)
			comparacion = "El alumno esta por debajo del promedio";

		System.out.print("Nombre:\t" + alumno.obtenerNombre() + "\n" +
			               "Direccion:\t" + alumno.obtenerDireccion() + "\n" +
			               "Telefono:\t" + alumno.obtenerTelefono() + "\n" +
			               "Calificaciones:\t");
		int[] calificaciones = alumno.obtenerCalificaciones();
		for (int j = 0; j < noMaterias; j++) 
			 if (j == noMaterias-1)
			 	System.out.println(calificaciones[j]);
			 else
			 	System.out.print(calificaciones[j] + ", ");

		System.out.println("Promedio:\t" + alumno.promedio()+ "\n" +
							comparacion);
	}

	/**
	 * Metodo que lista todos los alumnos con al menos N dieces
     * Se pide un entero N y se imprime el nombre de todos los alumnos que al menos han tenido N dieces.
	 */
	public void listarAlumnos() {
		String numero;
		Alumno alumno;
		int n,n10, alumnos = 0;
		int[] calificaciones;
		if (seccionEscolar.nAlumnos < 1) {
			System.out.println("No hay alumnos registrados.");
			return ;
		}
		Scanner entrada = new Scanner(System.in);
		do {
			System.out.print("Ingresa un numero N mayor a cero: ");
			numero = entrada.nextLine().trim();
		} while (numero.isEmpty() || !esNatural(numero));

		System.out.println("\n\n");
		AnimacionesTerminal.procesando();
		n = Integer.parseInt(numero);
		for (int i = 0; i < seccionEscolar.nAlumnos; i++) {
			alumno = seccionEscolar.poblacionEst[i];
			calificaciones = alumno.todosLosDieces();
			n10 = 0; 
			for (int k = 0; k < calificaciones.length; k++)
				if (calificaciones[k] > 0)
					n10++;
			if (n10 >= n) {
				System.out.println(alumno);
				alumnos++;
			}
		}
		System.out.println("Hay " + alumnos + " alumnos con " + n + " dieces.");
	}
}