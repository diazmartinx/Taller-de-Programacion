/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema4;

/**
 *
 * @author Martín
 */
public class Entrenador extends Empleado{
    private int cantGanados;
    
    public Entrenador(String nombre, double sueldo, int antiguedad, int cantGanados){
        super(nombre,sueldo,antiguedad);
        this.cantGanados=cantGanados;
    }
    
    public int getCant(){
        return cantGanados;
    }
    
    public double calcularEfectividad(){
        return this.getCant()/super.getAntiguedad();
    }
    public double calcularSueldoACobrar(){
        double sueldoFinal = super.getSueldo();
        
        if (1<=this.getCant() && this.getCant()<=4){
            sueldoFinal+=5_000;
        } else if(5<=this.getCant() && this.getCant()<=10){
            sueldoFinal+=30_000;
        } else if(this.getCant()>10) sueldoFinal+=50_000;
        
        return sueldoFinal;
    }
}
