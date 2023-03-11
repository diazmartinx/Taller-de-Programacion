/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema4;

/**
 *
 * @author Martín
 */
public abstract class Empleado {
    private String nombre;
    private double sueldo;
    private int antiguedad;
    
    public Empleado(String nombre, double sueldo, int antiguedad){
        this.nombre=nombre;
        this.sueldo=sueldo;
        this.antiguedad=antiguedad;
    }
    
    public double getSueldo(){
        return sueldo;
    }
    public int getAntiguedad(){
        return antiguedad;
    }
    public String getNombre(){
        return nombre;
    }
    
    public abstract double calcularEfectividad();
    public abstract double calcularSueldoACobrar();
    
    public String toString(){
        return "Nombre: "+getNombre()+
                " Sueldo a cobrar: "+calcularSueldoACobrar()+
                " Efectividad: "+calcularEfectividad();
    }
}
