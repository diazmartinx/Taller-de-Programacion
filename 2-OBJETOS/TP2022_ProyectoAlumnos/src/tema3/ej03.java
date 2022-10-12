/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema3;

/**
 *
 * @author Martín
 */
public class ej03 {
    
    public static void main(String[] args){
        Autor autor1 = new Autor("yo");
        Autor autor2 = new Autor("vos");
        Libro libro1 = new Libro ("Mujercitas","asd",autor1,"asd");
        Libro libro2 = new Libro ("asdasdasd","asd",autor2,"asd");
        
        Estante estante = new Estante(3);
        estante.setLibro(libro2);
        estante.setLibro(libro1);
        
        String busca = "Mujercitas";
        Libro buscado = new Libro();
        buscado = estante.getLibroX(busca);
        if(buscado!=null){
            System.out.println(buscado.getPrimerAutor());
        } else {
            System.out.println("El libro no esta en el estante");
        }
    }
    
}
