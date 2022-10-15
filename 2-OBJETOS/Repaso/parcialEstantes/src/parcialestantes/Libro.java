/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcialestantes;

/**
 *
 * @author Martín
 */
public class Libro {
    private String titulo;
    private String autor;
    private double peso;

    public Libro(String titulo, String autor, double peso) {
        this.titulo = titulo;
        this.autor = autor;
        this.peso = peso;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }

    public void setPeso(double peso) {
        this.peso = peso;
    }
    
    public String getTitulo() {
        return titulo;
    }

    public String getAutor() {
        return autor;
    }

    public double getPeso() {
        return peso;
    }

    @Override
    public String toString() {
        return "\nLibro{" + "titulo=" + titulo + ", autor=" + autor + ", peso=" + peso + '}';
    }
    
    
    
}
