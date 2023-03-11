/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema4.ej2R;

/**
 *
 * @author Martín
 */
public abstract class Empleado {
    private String nombre;
    private double sueldo;
    private int antiguedad;

    public Empleado(String nombre, double sueldo, int antiguedad) {
        this.nombre = nombre;
        this.sueldo = sueldo;
        this.antiguedad = antiguedad;
    }

    public int getAntiguedad() {
        return antiguedad;
    }

    public double getSueldo() {
        return sueldo;
    }

    public String getNombre() {
        return nombre;
    }
     
    public double sueldoBase(){
        return getSueldo()+getSueldo()*(0.1*getAntiguedad());
    }
    
    public abstract double calcularEfectividad();
    public abstract double calcularSueldoACobrar();

    @Override
    public String toString() {
        return "Empleado{" + "nombre=" + nombre + 
                " Efectividad: " + this.calcularEfectividad() +
                " Sueldo: " + this.calcularSueldoACobrar() +
                '}';
    }
    
    
}
