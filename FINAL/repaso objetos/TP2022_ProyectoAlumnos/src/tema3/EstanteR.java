/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema3;

/**
 *
 * @author Martín
 */
public class EstanteR {
    private int dimF = 20;
    private Libro[] estante = new Libro[dimF];
    private int cant = 0;

    public EstanteR() {
    }

    public int getCant() {
        return cant;
    }
    
    public boolean estanteLleno(){
        return cant==20;
    }
    
    public boolean agregaLibro(Libro libro){
        if (this.estanteLleno()) return false;
        estante[cant] = libro;
        this.cant++;
        return true;
    }
    
    public Libro buscaLibro(String nombre){
        int i = 0;
        while (i<cant && !estante[i].getTitulo().equals(nombre)){
            i++;
        }
        return estante[i];
    }
}
