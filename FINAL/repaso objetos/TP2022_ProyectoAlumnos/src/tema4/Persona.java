/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

import tema2.*;


public class Persona {
    private String nombre;
    private int dni;
    private int edad; 

    public Persona(String nombre, int dni, int edad) {
        this.nombre = nombre;
        this.dni = dni;
        this.edad = edad;
    }
    
    public String getNombre() {
        return nombre;
    }

    public int getDni() {
        return dni;
    }

    public int getEdad() {
        return edad;
    }

    public String toString(){
        String aux; 
        aux = "Mi nombre es " + getNombre() + ", mi DNI es " + getDni() + " y tengo " + getEdad() + " años.";
        return aux;
    }
    
    
    
    
}
