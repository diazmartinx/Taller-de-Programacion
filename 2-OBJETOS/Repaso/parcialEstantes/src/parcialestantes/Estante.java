/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcialestantes;

/**
 *
 * @author Martín
 */
public class Estante {
    private int m;
    private Libro[] libros;

    public Estante(int m) {
        this.m = m;
    }

    public int getM() {
        return m;
    }

    public Libro[] getLibros() {
        return libros;
    }
    
    public void setLibro(Libro libro, int lugar){
        libros[lugar]=libro;
    }
    
    public Libro buscaLibro(String titulo){
        Libro libro;
        for (int i=0;i<m;i++){
            if (libros[i]!=null && libros[i].getTitulo().equals(titulo)){
                libro=libros[i];
                libros[i]=null;
                return libro;
            }
        }
        return null;
    }
    
    public Libro masPesado(){
        // retorna el libro mas pesado de cada estante o null
        double maxp=-1;
        Libro masP=null;
        for(int i=0; i<m;i++){
            if (libros[i]!=null && libros[i].getPeso()>maxp){
                masP=libros[i];
                maxp=masP.getPeso();
            }
        }
        return masP;
    }
    
}
