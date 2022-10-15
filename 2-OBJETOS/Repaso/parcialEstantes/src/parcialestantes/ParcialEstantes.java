/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package parcialestantes;

/**
 *
 * @author Martín
 */
public class ParcialEstantes {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Estanteria es1 = new Estanteria(5);
        Libro l1 = new Libro("a","a",10);
        Libro l2 = new Libro("b","a",1000);
        Libro l3 = new Libro("c","a",100);
        Libro[] libros = {l1,l2,l3};
        for (int i=0;i<5;i++){
            for (int j=0;j<3;j++){
                es1.almacenarLibro(libros[j], i, j);
                es1.toString();
            }
        }
        
        
    }
    
}
