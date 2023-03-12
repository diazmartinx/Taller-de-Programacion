/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ej03;

/**
 *
 * @author Martín
 */
public class Recital {
    private String nombreBanda;
    private int dimF,dimL=0;
    private String[] temas;

    public Recital(String nombreBanda, int dimF) {
        this.nombreBanda = nombreBanda;
        this.dimF = dimF;
        this.temas = new String[dimF];
    }
    
    public void agregarTema(String nombre){
        this.temas[dimL] = nombre;
        dimL++;
    }
    
    public void actuar()
    
    
}
