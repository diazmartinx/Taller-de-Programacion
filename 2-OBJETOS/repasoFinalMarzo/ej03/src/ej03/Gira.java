/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ej03;

/**
 *
 * @author Martín
 */
public class Gira extends Recital {
    private String nombre;
    private Fecha[] fechas;
    private int actual;

    public Gira(String nombre, String nombreBanda, int cantTemas, int cantFechas) {
        super(nombreBanda, cantTemas);
        this.nombre = nombre;
        this.fechas = new Fecha[cantFechas];
    }
    
    
}
