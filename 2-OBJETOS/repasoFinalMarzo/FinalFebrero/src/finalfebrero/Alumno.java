/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package finalfebrero;

/**
 *
 * @author Martín
 */
public class Alumno {
    private String nombre;
    private int dni;

    public Alumno(String nombre, int dni) {
        this.nombre = nombre;
        this.dni = dni;
    }   

    @Override
    public String toString() {
        return "Alumno{" + "nombre=" + nombre + ", dni=" + dni + '}';
    }
   
}
