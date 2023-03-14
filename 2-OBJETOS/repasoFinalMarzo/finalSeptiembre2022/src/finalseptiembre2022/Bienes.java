/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package finalseptiembre2022;

/**
 *
 * @author Martín
 */
public class Bienes extends Subsidio {
    private Bien[] bienes;
    private int dimf;
    private int diml;

    public Bienes(int dimf, String nombreInvestigador, String nombrePlan, String fecha) {
        super(nombreInvestigador, nombrePlan, fecha);
        this.bienes = new Bien[dimf];
        this.dimf = dimf;
        this.diml = 0;
    }
    
    public void agregaBien(Bien bien){
        this.bienes[diml]=bien;
        diml++;
    }

    @Override
    public double costoTotal() {
        double total=0;
        for (int i=0; i<diml; i++){
            total += bienes[i].getCantidad()*bienes[i].getCostoUnidad();
        }
        return total;
    }

    @Override
    public String toString() {
        String aux = "";
        for (int i=0; i<diml; i++){
            aux += bienes[i].toString() + '\n';
        }
        return  super.toString() + "\nDescripcion de la bienes solicitados: \n" + aux; 
    }
    
    
    
    
}
