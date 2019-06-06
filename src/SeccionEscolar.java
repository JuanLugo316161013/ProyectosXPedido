/**
 * Clase que programa el manejo de la información de alumnos en una escuela.
 * Objetivo: ilustrar el uso de arreglos de objetos
 * @author Amparo López Gaona
 * @version 3a edicion
 */
class SeccionEscolar {
  Alumno [] poblacionEst ;
  int nAlumnos;
  /** 
   * Constructor por omisión con espacio para cien alumnos y el
   * número de alumnos en el arreglo es cero. 
   */
  public SeccionEscolar () {
      this(100);
  }
  /** 
   * Constructor. Declara espacio para la cantidad de alumnos especificada, si
   * es negativa se crea un arreglo de 100 localidades. En ambos casos, el
   * número de alumnos almacenados en el arreglo es cero.
   * @param tam - cantidad de alumnos que se pueden almacenar.
   */
  public SeccionEscolar (int tam) {
    poblacionEst = (tam > 0) ? new Alumno[tam]: new Alumno[100];
    nAlumnos = 0;
  }
  
  /**
   * Método para dar de alta un alumno en la sección escolar
   * @param alum - Alumno que se dará de alta
   */
  public void insertar(Alumno alum) {
   if (nAlumnos >= poblacionEst.length) {
     System.out.println("Cupo lleno. No es posible dar de alta a "+alum.obtenerNombre());
   } else if (buscar(alum) == -1) {
     poblacionEst[nAlumnos++] = alum;
   } else {
     System.out.println("El alumno "+alum.obtenerNombre()+" ya está dado de alta");
   }
  }

  /**
   * Método para buscar un alumno.
   * @param alum -- Alumno que se buscará en el arreglo.
   * @return int -- posicion donde está el alumno o -1 si no está.
   */ 
   public int buscar(Alumno alum) {
     return buscar (alum.obtenerNombre());
   }
   
  /*
   * Método privado para buscar un alumno
   */
   private int buscar(String alumn)  {
     boolean encontro = false;
     int i;
   
     for (i=0; i < nAlumnos && !encontro; i++) {
       if (poblacionEst[i].obtenerNombre().equalsIgnoreCase(alumn))  {
         encontro = true;
       }
     }
     return (encontro) ? i - 1 : -1;
   }

  /**
   * Método para consultar la informacion de un alumno particular. Si el
   * alumno no está registrado se avisa de ello.
   * @param alum - Alumno del que se desea información
   */
  public void consultar(Alumno alum) {
      int pos = buscar(alum);
    if (pos != -1) {
      System.out.println(poblacionEst[pos]);
    } else {
      System.out.println("El alumno "+ alum +" no está registrado");
    }
  }
}