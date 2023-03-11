/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema4.ej2R;

/**
 *
 * @author Martín
 */
public class Jugador extends Empleado {
    private int cantPartidos;
    private int cantGoles;

    public Jugador(int cantPartidos, int cantGoles, String nombre, double sueldo, int antiguedad) {
        super(nombre, sueldo, antiguedad);
        this.cantPartidos = cantPartidos;
        this.cantGoles = cantGoles;
    }

    public int getCantPartidos() {
        return cantPartidos;
    }

    public void setCantPartidos(int cantPartidos) {
        this.cantPartidos = cantPartidos;
    }

    public int getCantGoles() {
        return cantGoles;
    }

    public void setCantGoles(int cantGoles) {
        this.cantGoles = cantGoles;
    }
    
    @Override
    public double calcularEfectividad() {
        return getCantGoles()/getCantPartidos();
    }

    @Override
    public double calcularSueldoACobrar() {
        double base = super.sueldoBase();
        if (calcularEfectividad() > 0.5) return base + super.getSueldo();
        return base;
    }
     
}
