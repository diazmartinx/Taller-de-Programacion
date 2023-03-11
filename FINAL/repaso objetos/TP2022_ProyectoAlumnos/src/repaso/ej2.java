/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package repaso;

/**
 *
 * @author Martín
 */
public class ej2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Jugador jugador = new Jugador(3,1,"martin",1000.10,0);
        System.out.println(jugador.toString());
        
        Entrenador e1 = new Entrenador(1,"entrenador",50.50,3);
        System.out.println(e1.toString());
    }
    
}
