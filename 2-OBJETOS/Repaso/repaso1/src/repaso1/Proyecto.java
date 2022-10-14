/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package repaso1;

/**
 *
 * @author Martín
 */
public class Proyecto {
    private String nombre;
    private int codigo;
    private String director;
    private Investigador[] investigadores;
    private int dimf;
    private int cant;
    
    public Proyecto(String nombre, int codigo, String director){
        this.nombre=nombre;
        this.director=director;
        this.codigo=codigo;
        dimf=50;
        cant=0;
        investigadores=new Investigador[dimf];
    }
    
    public void agregarInvestigador(Investigador I){
        if (!estaLleno()){
            investigadores[cant]=I;
            cant++;
        } else {
            System.out.println("El proyecto esta llenow|");
        }
    }
    
    public boolean estaLleno(){
        if (cant==dimf) return true;
        return false;
    }
    
    double dineroTotalOtorgado(){
        //Itera cada investigador, para cada investigador itera cada subsidio
        //si fue otorgado lo suma.
        double total=0;
        for (int i=0;i<cant;i++){
            Investigador inv = investigadores[i];
            for (int j=0;j<inv.getCant();j++){
                //Veo si el subsidio fue otorgado
                if (inv.getSubsidios()[j].isOtorgado()) {
                    //Si fue otorgado=true -> lo sumo
                    total+=inv.getSubsidios()[j].getMonto();
                }
            }
        }
        return total;
    }
    
    void otorgarTodos(String nombre){
        for (int i=0;i<cant;i++){
            if (investigadores[i].getNombre().equals(nombre)){
                investigadores[i].otorgarTodos();
            }
        }
    }

    @Override
    public String toString() {
        String aux;
        aux = "Proyecto{" + "nombre=" + nombre + 
                ", codigo=" + codigo + ", director=" + director + 
                " Total otorgado= " + dineroTotalOtorgado() +
                "\ninvestigadores=";
        
        for (int i=0;i<cant;i++){
            aux+=investigadores[i].toString();
        }
        
        return aux;
    }
    
    
    
}
