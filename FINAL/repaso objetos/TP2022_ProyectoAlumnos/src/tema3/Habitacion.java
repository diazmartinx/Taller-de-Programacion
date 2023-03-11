/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema3;
import PaqueteLectura.GeneradorAleatorio;

/**
 *
 * @author Martín
 */
public class Habitacion {
    private int numero;
    private double noche;
    private boolean ocupada;
    private Persona cliente;
    
    public Habitacion(int unNumero){
        numero=unNumero;
        noche=GeneradorAleatorio.generarDouble(6000)+2000;
        ocupada=false;
        cliente=null;
    }
    
    public void setCliente(Persona unCliente){
        ocupada=true;
        cliente=unCliente;
    }
    
    public void setPrecio(double monto){
        noche+=monto;
    }
    
    public String toString(){
        String aux = "Habitación "+numero+": "+noche+", "+ocupada;
        if (ocupada) aux+=", cliente: "+cliente.toString2();
        return aux;
    }
}
