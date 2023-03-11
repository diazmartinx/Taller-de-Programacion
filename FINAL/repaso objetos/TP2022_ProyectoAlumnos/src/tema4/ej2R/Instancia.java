/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package tema4.ej2R;

/**
 *
 * @author Martín
 */
public class Instancia {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Jugador j = new Jugador(10,10,"cr7",100,20);
        Entrenador e = new Entrenador(5,"pep",200,15);
        
        System.out.println(j.toString());
        System.out.println(e.toString());
    }
    
}
