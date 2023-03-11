/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package tema2;

import PaqueteLectura.GeneradorAleatorio;
/**
 *
 * @author Martín
 */
public class ej02_f {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        GeneradorAleatorio.iniciar();
        int dimf = 15;
        Persona V [] = new Persona [dimf];
        int edad = GeneradorAleatorio.generarInt(150);
        int n=0; int mayores65=0;
        int menorDNI = n; // indice de la persona con menor dni
        while (edad!=0 && n<dimf) {
            String nombre = GeneradorAleatorio.generarString(5);
            int dni = GeneradorAleatorio.generarInt(99999999);
            V[n] = new Persona(nombre,dni,edad);
            
            if (edad>65) mayores65++;
            if ( V[n].getDNI() < V[menorDNI].getDNI() ) menorDNI=n;
            
            edad = GeneradorAleatorio.generarInt(150);
            n++;
        } 
        
        System.out.println("Cantidad de personas mayores de 65 años: " + mayores65);
        System.out.println("Persona con menor DNI: " + V[menorDNI].toString());
    }
    
}
