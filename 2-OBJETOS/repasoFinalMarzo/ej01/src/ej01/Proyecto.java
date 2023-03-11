/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ej01;

/**
 *
 * @author Martín
 */
public class Proyecto {
    private String nombre;
    private int codigo;
    private String nombreDirector;
    private final int dimF = 50;
    private int dimL = 0;
    private Investigador[] investigadores = new Investigador[dimF];

    public Proyecto(String nombre, int codigo, String nombreDirector) {
        this.nombre = nombre;
        this.codigo = codigo;
        this.nombreDirector = nombreDirector;
    }
    
    public void agregaInvestigador(Investigador investigador) {
        if ( dimL < dimF ) {         
            investigadores[dimL] = investigador;
            dimL++;
        }
    }
    
    public double dineroTotalOtorgado(){
        double total = 0;
        for (int i=0;i<dimL;i++) 
            total += investigadores[i].montoTotalOtorgado();
        return total;
    }
    
    public void otorgarTodos(String nombre){
        int i=0;
        while (i<dimL && !investigadores[i].getNombre().equals(nombre))
            i++;
        if (i<dimL) investigadores[i].otorgaSubsidios();
    }

    @Override
    public String toString() {
        String aux ="";
        for (int i=0;i<dimL;i++){
            aux += investigadores[i].toString() + "\n";
        }
        return "Proyecto{" + "nombre=" + nombre + 
                ", codigo=" + codigo + 
                ", nombreDirector=" + nombreDirector +
                ", montoTotal: " + this.dineroTotalOtorgado() +
                ",\n" + aux + '}';
    }
    
    
}
