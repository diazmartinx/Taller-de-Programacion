/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema4.ej2R;

/**
 *
 * @author Martín
 */
public class Entrenador extends Empleado {
    private int cantCampeonatos;

    public Entrenador(int cantCampeonatos, String nombre, double sueldo, int antiguedad) {
        super(nombre, sueldo, antiguedad);
        this.cantCampeonatos = cantCampeonatos;
    }

    public int getCantCampeonatos() {
        return cantCampeonatos;
    }

    public void setCantCampeonatos(int cantCampeonatos) {
        this.cantCampeonatos = cantCampeonatos;
    }
     
    @Override
    public double calcularEfectividad() {
        return getCantCampeonatos()/super.getAntiguedad();
    }

    @Override
    public double calcularSueldoACobrar() {
        double base = super.sueldoBase();
        if (getCantCampeonatos()>=1 && getCantCampeonatos()<=4) base += 5000;
                else if (getCantCampeonatos()>=5 && getCantCampeonatos()<=10) base += 30000;
                else if (getCantCampeonatos()>10) base += 50000;
        return base;
    }
    
    
}
