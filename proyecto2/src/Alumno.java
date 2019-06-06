import java.util.Scanner;

/**
 * Clase para almacenar y trabajar con la información de alumnos 
 * Objetivo: ilustrar el uso de arreglos
 * @author  Amparo López Gaona
 * @version 3a edición
 */

public class Alumno {
  private final String nombre;
  private String direccion;
  private String telefono;
  private final String numRegistro;
  private static int folio = 2019;
  private int [] calificaciones;


  /**
   * Constructor que recibe los datos personales del alumno.
   * @param n - Cadena que representa el nombre del alumno
   * @param d - Cadena que representa la dirección del alumno
   * @param t - Cadena que representa el teléfono del alumno
   * @param nCalif - entero que especifica la cantidad de calificaciones del alumno
   */
  public Alumno (String n, String d, String t, int nCalif) {
    nombre = n.trim();
    direccion = d.trim();
    telefono = t.trim();
    numRegistro = "UNAM-"+ folio++;
    calificaciones = new int[(nCalif > 0)? nCalif : 15];
  }    

  /** 
   * Método para obtener el nombre del alumno.
   * @return String - nombre del alumno.
   */
  public String obtenerNombre() {
    return nombre;
  }


 /**
   * Método para obtener la dirección del alumno.
   * @return String -- dirección del alumno.
   */
  public String obtenerDireccion() {
    return direccion;
  }

/**
   * Método para obtener el telefono del alumno.
   * @return String -- telefono del alumno.
   */
  public String obtenerTelefono() {
    return telefono;
  }

   /**
   * Método para obtener la cantidad de calificaciones del alumno.
   * @return int -- cantidad de calificaciones del alumno.
   */
  public int obtenerNumCalificaciones() {
    return calificaciones.length;
  }

/**
  * Metodo para obtener todas las calificaciones del alumno
  * @return int [] -- arreglo con las calificaciones del alumno
  */
  public int[] obtenerCalificaciones(){
    return calificaciones;
  }

 /**
  * Método para registrar una calificación siempre y cuando sea mayor que cero
  * @param curso -- curso al que se asigna una calificación
  * @param cal -- calificación que se asigna
  *
  */
  public void asignarCalificacion(int curso, int cal) {
    if(curso >= 0 && curso < calificaciones.length){
      if(cal >= 0 && cal <= 10){
        calificaciones[curso] = cal;
      } else {
        new Error("Calificacion incorrecta");
      }
    }else{
      new Error("Numero de Curso incorrecto");
    }  
  }

  /**
   * Método para asigna calificaciones al alumno
   */
  public void asignarCalificaciones() {
    Scanner in = new Scanner(System.in);
    int cal;
    
    for(int i = 0; i<calificaciones.length; i++){
      do{ //valida la calificación
        System.out.println("Dar la calificacion para el curso " + (i+1) + " ");
        cal = in.nextInt();
      }while (cal < 0  || cal > 10);
      asignarCalificacion(i, cal);
    } // Fin del for
  }   // Fin del método

  /**
   * Método para asignar calificaciones al alumno a partir de un arreglo
   * @param int [] -- arreglo original a ser copiado
   */
  public void asignarCalificaciones(int [] c) {
    calificaciones = c;
  }

   /**
   * Método para calcula el promedio de las calificaciones del alumno.
   * @return double - promedio de calificaciones
   */
  public double promedio() {
    double suma = 0;
    for (int i = 0; i< calificaciones.length; i++){ 
      suma += calificaciones[i];
    }
    return suma/calificaciones.length;
  }

  /**
   * Método para calcula la calificación más alta del alumno.
   * @return int - la calificación mayor
   */
  public int mayorCalificacion () {
    int mayor = calificaciones[0];

    for (int i = 1; i < calificaciones.length; i++) {
      if (calificaciones[i] > mayor) {
        mayor = calificaciones[i];
      }
    }
    return mayor;
  }

  /**
   * Método para obtener el primer curso con calificación dada.
   * @param cal  - calificación buscada
   * @return int - curso con calificación igual a la solicitada y -1 en
   *               caso que no haya curso con la calificación dada.
   */
  public int buscarCurso (int cal) {
    int i = 0;
    while ((i < calificaciones.length) && (calificaciones[i] != cal)) {
      i++;
    }
    return (i == calificaciones.length) ? -1 : i+1;
  }

/**
   * Método para obtener todos los cursos en los cuales la calificación es de 10
   * @return int[] - arreglo con los cursos con calificacion igual a 10
   */
  public int[] todosLosDieces () {
    int j = 0;
    int [] dieces = new int[calificaciones.length + 1];

    for (int i = 0; i < calificaciones.length; i++) {
      if (calificaciones[i] == 10) {
        dieces[++j] = i+1;
      }
    }
    
   dieces[0] = j;   //Para indicar el numero de elementos ocupados
   return dieces;
  }
  
  /**
   * Método para comparar las calificaciones del alumno con las calif, promedio
   * @param promedio  - arreglo con los promedios que se compara el alumno
   * @return int - un número positivo si el alumno esta por arriba del promedio
   * del grupo; uno negativo si esta por debajo y 0 si esta en el promedio del grupo
   */
  public int compararPromedio (int [] promedio) {
    int contador = 0;

    if (promedio.length != calificaciones.length)
      new Error("No es posible trabajar con arreglos de distinto tamaño");
    for (int i=0; i < calificaciones.length; i++) {
      if (calificaciones[i] < promedio[i]) {
        contador --;
      } else if (calificaciones[i] > promedio[i]) {
        contador ++;
      }
    }
    return contador;
  }

  /**
   * Metodo para obtener la representacion en cadena de un alumno
   * @return String -- cadena con los datos del alumno
   */
  public String toString() {
    return nombre +"\t\t"+ numRegistro;
  }

  /**
   * Metodo que regresa el número de dieces que tiene el alumno 
   * @return número de dieces que tiene el alumno.
   */ 
  public int noDieces() {
    int n = 0;
    for (int i = 0; i < calificaciones.length; i++)
      if (calificaciones[i] == 10)
        n++;

    return n;
  }
}