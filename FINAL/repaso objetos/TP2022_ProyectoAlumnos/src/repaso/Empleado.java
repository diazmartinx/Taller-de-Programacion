/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package repaso;

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
   
    public abstract double calcularEfectividad();
    public abstract double calcularSueldoACobrar();

    public double getSueldo() {
        return sueldo;
    }

    public int getAntiguedad() {
        return antiguedad;
    }
    
    public double getSueldoBasico(){
        return sueldo + antiguedad*(0.1*antiguedad);
    }
    
    @Override
    public String toString() {
        return "Empleado{" +
                "nombre=" + nombre +
                ", sueldo=" + calcularSueldoACobrar() +
                ", efectividad=" + calcularEfectividad() +
                "}";
    }
}
