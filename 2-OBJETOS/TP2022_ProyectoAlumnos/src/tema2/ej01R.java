/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package tema2;
import PaqueteLectura.Lector;
/**
 *
 * @author luisi
 */
public class ej01R {

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        // TODO code application logic here
        String nombre = Lector.leerString();
        int DNI = Lector.leerInt();
        int edad = Lector.leerInt();
        Persona persona = new Persona(nombre, DNI, edad);
        System.out.println(persona.toString());
    }
}
