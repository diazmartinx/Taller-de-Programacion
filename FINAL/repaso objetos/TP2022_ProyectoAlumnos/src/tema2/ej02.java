/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema2;

import PaqueteLectura.GeneradorAleatorio;

/**
 *
 * @author Martín
 */
public class ej02 {
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int dimf = 15;
        Persona V [] = new Persona [dimf];
        int edad = GeneradorAleatorio.generarInt(150);
        int n = 0; int cant=0;
        Persona min = new Persona(null,9999,-1);
        while (edad!=0 && n<dimf){
            String nombre = GeneradorAleatorio.generarString(6);
            int dni = GeneradorAleatorio.generarInt(999);
            V[n]=new Persona(nombre,dni,edad);
            if (edad>65) cant++;
            if (dni<min.getDNI()) min=V[n];
            n++;
            edad = GeneradorAleatorio.generarInt(150);
        }
        
        System.out.println("Personas mayores a 65: "+cant);
        System.out.println(min.toString());
    }
}
