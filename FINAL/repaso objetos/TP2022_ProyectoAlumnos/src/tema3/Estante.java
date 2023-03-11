/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema3;

/**
 *
 * @author Martín
 */
public class Estante {
    private int dimf=0;
    private int cant=0;
    private Libro [] libros;
    
    public Estante(int maxLibros){
        dimf = maxLibros;
        libros = new Libro[dimf];
    } 
    public int getCant(){
        return cant;
    }
    public boolean estaLleno(){
        if (cant==dimf){
            return true;
        } else {
            return false;
        }
    }
    public void setLibro(Libro l){
        if (!this.estaLleno()){
            libros[cant]=l;
            cant++;
        }
    }
    public Libro getLibroX(String titulo){
        for (int i=0;i<cant;i++){
            if(libros[i].getTitulo().equals(titulo)){
                return libros[i];// retorna f -> corta el ciclo
            }
        }
        return null;
    }
}
