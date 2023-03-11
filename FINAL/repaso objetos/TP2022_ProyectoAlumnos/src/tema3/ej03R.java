/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package tema3;
import PaqueteLectura.GeneradorAleatorio;
/**
 *
 * @author Martín
 */
public class ej03R {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        EstanteR estante = new EstanteR();
        Autor a1 = new Autor("yo");
        Autor a2 = new Autor("tu");
        for (int i=0; i<18;i++){
            Libro libro = new Libro(GeneradorAleatorio.generarString(5),a1);
            estante.agregaLibro(libro);
        }
        Libro libro = new Libro("mujercitas", a2);
        estante.agregaLibro(libro);
        
        Libro busqueda = estante.buscaLibro("mujercitas");
        
        if (busqueda != null) System.out.println(busqueda.getPrimerAutor().toString());
            
    }
    
}
