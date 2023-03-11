/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ej01;

/**
 *
 * @author Martín
 */
public class Investigador {
    private String nombre;
    private int categoria;
    private String especialidad;
    private final int dimF = 5;
    private int dimL = 0;
    private Subsidio[] subsidios = new Subsidio[5];

    public Investigador(String nombre, int categoria, String especialidad) {
        this.nombre = nombre;
        this.categoria = categoria;
        this.especialidad = especialidad;
    }

    public String getNombre() {
        return nombre;
    }
     
    public void agregarSubsidio(Subsidio subsidio) {
        if (dimL<dimF) {
            this.subsidios[dimL] = subsidio;
            this.dimL++;
        }
    }

    public double montoTotalOtorgado() {
        double total = 0;
        for (int i=0;i<dimL;i++)
            if (this.subsidios[i].isOtorgado()) 
                total += this.subsidios[i].getMonto();
        return total;
    }
    
    public void otorgaSubsidios() {
        for (int i=0;i<this.dimL;i++)
            this.subsidios[i].setOtorgado(true);
    }

    @Override
    public String toString() {
        return "Investigador{" + "nombre=" + this.nombre + 
                ", categoria=" + this.categoria + 
                ", especialidad=" + this.especialidad + 
                ", montoTotal: "  + this.montoTotalOtorgado() +
                '}';
    }
    
    
      
}
