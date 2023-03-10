/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package tema2;
import PaqueteLectura.*;
/**
 *
 * @author luisi
 */
public class ej02R {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        PaqueteLectura.GeneradorAleatorio.iniciar();
        Persona[] personas = new Persona[15];
        int cant = 0;
        int mayores65=0;
        Persona menorDni = new Persona("null",999999999,-1);
        
        System.out.println("Ingrese edad:");
        int edad = PaqueteLectura.Lector.leerInt();
        
        while (cant<15 && edad>0) {      
            String nombre = PaqueteLectura.GeneradorAleatorio.generarString(5);
            int dni = PaqueteLectura.GeneradorAleatorio.generarInt(8);
            personas[cant] = new Persona(nombre,dni,edad);
            
            if (edad>65) mayores65++;
            if (dni<menorDni.getDNI()) menorDni = personas[cant];
            
            cant++;
            System.out.println("Ingrese edad:");
            edad = PaqueteLectura.Lector.leerInt();
    }
        
        System.out.println(mayores65);
        System.out.println(menorDni.toString());
    }
    
}
