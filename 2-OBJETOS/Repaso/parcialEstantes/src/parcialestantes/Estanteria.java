/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcialestantes;

/**
 *
 * @author Martín
 */
public class Estanteria {
    private int n;
    private Estante[] estantes;

    public Estanteria(int n) {
        this.n = n;
        instanciaEstantes(3);
    }
    
    private void instanciaEstantes(int cantLibros){
        for (int i=0;i<n;i++) estantes[i]=new Estante(cantLibros);
    }
    
    public void almacenarLibro(Libro libro, int est, int lugar){
        estantes[est].setLibro(libro,lugar);
    }
    
    public Libro sacarLibro(String titulo){
        //recorro estantes
        for(int i=0;i<n;i++){
            if (estantes[i].buscaLibro(titulo)!=null){
                return estantes[i].buscaLibro(titulo);
            }
        }
        return null;
    }
    
    public Libro masPesado(){
        Libro masP=null;
        double maxp=-1;
        for (int i=0;i<n;i++){
            if (estantes[i].masPesado()!=null && estantes[i].masPesado().getPeso()>maxp){
                masP=estantes[i].masPesado();
                maxp=masP.getPeso();
            }
        }
        return masP;
    }
    
}
