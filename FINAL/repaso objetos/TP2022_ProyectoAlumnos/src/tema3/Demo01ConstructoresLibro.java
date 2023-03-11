/*
Demo que crea objetos Libro invocando a los constructores definidos. 
 */
package tema3;

/**
 *
 * @author vsanz
 */
public class Demo01ConstructoresLibro {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Autor a1 = new Autor("martin","asd","asd");
        Libro l1 = new Libro("asd",a1,"ed",2015,"asd",100);
        System.out.println(l1.getPrimerAutor().toString());
    }
    
}
