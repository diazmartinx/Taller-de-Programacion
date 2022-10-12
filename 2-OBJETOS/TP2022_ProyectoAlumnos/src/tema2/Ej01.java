/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema2;
import PaqueteLectura.Lector;

/**
 *
 * @author Martín
 */
public class Ej01 {
    
    public static void main(String[] args) {
        String nombre = Lector.leerString();
        int dni = Lector.leerInt();
        int edad = Lector.leerInt();
        Persona persona = new Persona(nombre,dni,edad);
        System.out.println(persona.toString());
    }
    
}
