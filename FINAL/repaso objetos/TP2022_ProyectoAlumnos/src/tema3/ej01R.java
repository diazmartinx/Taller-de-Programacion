/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package tema3;

/**
 *
 * @author Martín
 */
public class ej01R {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        TrianguloR triangulo = new TrianguloR(5.5,5,5,"a","b");
        System.out.println("P: "+triangulo.calcularPerimetro()+" A: "+triangulo.calcularArea());
        
    }
    
}
