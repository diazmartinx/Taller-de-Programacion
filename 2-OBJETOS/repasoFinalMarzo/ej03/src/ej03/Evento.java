/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ej03;

/**
 *
 * @author Martín
 */
public class Evento extends Recital {
    private String motivo;
    private String nombreContratante;
    private String dia;

    public Evento(String motivo, String nombreContratante, String dia, String nombreBanda, int cantTemas) {
        super(nombreBanda, cantTemas);
        this.motivo = motivo;
        this.nombreContratante = nombreContratante;
        this.dia = dia;
    }

    
    
}
