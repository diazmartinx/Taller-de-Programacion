/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package finalfebrero;
import PaqueteLectura.GeneradorAleatorio;
/**
 *
 * @author Martín
 */
public class Categoria {
    private int id;
    private String nombre;
    private int dimF, dimL=0;
    private Fotografia[] fotos;

    public Categoria(int id, String nombre, int dimF) {
        this.id = id;
        this.nombre = nombre;
        this.dimF = dimF;
        this.fotos = new Fotografia[dimF];
    }

    public int getDimL() {
        return dimL;
    }

    public int getId() {
        return id;
    }

    public Fotografia[] getFotos() {
        return fotos;
    }
    
    
    
    public void agregaFoto(Fotografia foto){
        this.fotos[dimL] = foto;
        this.dimL++;
    }
    
    public void asignaPuntaje(){
        GeneradorAleatorio.iniciar();
        for (int i=0;i<dimL;i++)
            this.fotos[i].setPuntaje(GeneradorAleatorio.generarInt(100)+1);
    }

    @Override
    public String toString() {
        String aux = "";
        for (int i=0;i<this.dimL;i++)
            aux += fotos[i].toString() + "\n";
        
        return "Categoria{ id=" + id + ", nombre=" + nombre + ", Inscriptas=" + dimL + "} \n" + aux;
    }
    
    
}
