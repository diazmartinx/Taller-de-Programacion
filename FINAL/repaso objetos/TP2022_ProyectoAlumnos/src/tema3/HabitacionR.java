/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema3;

/**
 *
 * @author Martín
 */
public class HabitacionR {
    private double costo;
    private boolean disponible;
    private Persona cliente;

    public HabitacionR(double costo, boolean disponible) {
        this.costo = costo;
        this.disponible = disponible;
    }
    
    public void ocupar(Persona cliente){
        this.disponible = false;
        this.cliente = cliente;
    }
    
    public void aumentar(double monto){
        this.costo += monto;
    }

    @Override
    public String toString() {
        if (this.disponible) return "HabitacionR{" + "costo=" + costo + ", disponible=" + disponible + '}';
        return "HabitacionR{" + "costo=" + costo + ", disponible=" + disponible + ", cliente=" + cliente.toString() + '}';
    }
      
}
