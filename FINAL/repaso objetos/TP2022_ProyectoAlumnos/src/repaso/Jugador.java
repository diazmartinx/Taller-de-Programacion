/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package repaso;

/**
 *
 * @author Martín
 */
public class Jugador extends Empleado {
    private int partidos;
    private int goles;

    public Jugador(int partidos, int goles, String nombre, double sueldo, int antiguedad) {
        super(nombre, sueldo, antiguedad);
        this.partidos = partidos;
        this.goles = goles;
    }

    @Override
    public double calcularEfectividad() {
        return goles/partidos;
    }

    @Override
    public double calcularSueldoACobrar() {
        if (calcularEfectividad()>0.5) return getSueldoBasico()*2;
        else return getSueldoBasico();   
    }
    
    
}
