/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package repaso;

/**
 *
 * @author Martín
 */
public class Entrenador extends Empleado {
    private int campeonatos;

    public Entrenador(int campeonatos, String nombre, double sueldo, int antiguedad) {
        super(nombre, sueldo, antiguedad);
        this.campeonatos = campeonatos;
    }

    @Override
    public double calcularEfectividad() {
        return campeonatos/getAntiguedad();
    }
    
    @Override
    public double calcularSueldoACobrar() {
        double total = getSueldoBasico();
        if (1<=campeonatos && campeonatos<=4)  total+=5000;
        else if (5<=campeonatos && campeonatos<=10)  total+=10000;
        else if (10<campeonatos)  total+=50000;
        return total;
    }
}
