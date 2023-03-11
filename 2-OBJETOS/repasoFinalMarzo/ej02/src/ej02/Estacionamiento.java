/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ej02;

/**
 *
 * @author Martín
 */
public class Estacionamiento {
    private String nombre, direccion;
    private int cierre, apertura, pisos, plazas;
    private Auto[][] autos;

    public Estacionamiento(String nombre, String direccion) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.apertura = 8000;
        this.cierre = 2100;
        this.pisos = 5;
        this.plazas = 10;
        this.autos = new Auto[pisos][plazas];
    }

    public Estacionamiento(String nombre, String direccion, int cierre, int apertura, int pisos, int plazas) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.cierre = cierre;
        this.apertura = apertura;
        this.pisos = pisos;
        this.plazas = plazas;
    }

    public String getNombre() {
        return nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public int getCierre() {
        return cierre;
    }

    public int getApertura() {
        return apertura;
    }

    public int getPisos() {
        return pisos;
    }

    public int getPlazas() {
        return plazas;
    }


    public void ingresaAuto(int piso, int plaza, Auto auto){
        this.autos[piso-1][plaza-1] = auto;
    }
    
    public String buscaAuto(String patente){
        int piso = 0, plaza = 0;
        while (piso<pisos){
            if (autos[piso][plaza]!=null && autos[piso][plaza].getPatente().equals(patente)) break;
            plaza++;
            if (plaza==plazas){
                piso++;
                plaza = 0;
            }
        }
        if (pisos<=piso)
            return "Auto Inexistente";
        return "Piso: " + (piso+1) + " Plaza: " + (plaza+1);
    }
    
    public int cantidadPorPlaza(int plaza) {
        int total = 0;
        for (int i=0; i<pisos; i++)
            if (autos[i][plaza-1]!=null) total++;
        return total;
    }

    @Override
    public String toString() {
        String aux = "";
        for (int i=0;i<getPisos();i++)
            for (int j=0;j<getPlazas();j++){
                aux += "Piso "+(i+1)+" Plaza: "+(j+1)+" ";
                if (this.autos[i][j]!=null)
                    aux += this.autos[i][j].toString();
                else
                    aux += "libre";
                aux += ".\n";
            }
        return aux;
    }
    
    
    
}
