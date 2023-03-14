/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package finalseptiembre2022;

/**
 *
 * @author Martín
 */
public class Bien {
    private String descripcion;
    private int cantidad;
    private double costoUnidad;

    public Bien(String descripcion, int cantidad, double costoUnidad) {
        this.descripcion = descripcion;
        this.cantidad = cantidad;
        this.costoUnidad = costoUnidad;
    }

    public int getCantidad() {
        return cantidad;
    }

    public double getCostoUnidad() {
        return costoUnidad;
    }

    @Override
    public String toString() {
        return "Bien{" + "descripcion=" + descripcion + '}';
    }
    
    
    
    
}
