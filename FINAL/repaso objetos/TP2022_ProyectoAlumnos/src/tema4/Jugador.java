/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema4;

/**
 *
 * @author Martín
 */
public class Jugador extends Empleado {
    private int pj;
    private int goles;

    public Jugador(String nombre, double sueldo, int antiguedad, int pj, int goles){
        super(nombre,sueldo,antiguedad);
        setPJ(pj);
        setGoles(goles);
    }
    
    public int getGoles(){
        return goles;
    }
    public int getPartidos(){
        return pj;
    }
    public void setGoles(int goles){
        this.goles=goles;
    }
    public void setPJ(int pj){
        this.pj=pj;
    }
    
    public double calcularEfectividad(){
        return getGoles()/getPartidos();
    }
    public double calcularSueldoACobrar(){
        double sueldoFinal = super.getSueldo() + super.getSueldo()*0.1*super.getAntiguedad();
        if (calcularEfectividad()>0.5) sueldoFinal+=super.getSueldo();
        return sueldoFinal;
    }
}
