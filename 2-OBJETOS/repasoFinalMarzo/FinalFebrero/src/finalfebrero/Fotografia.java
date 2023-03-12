/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package finalfebrero;

/**
 *
 * @author Martín
 */
public class Fotografia {
    private int id;
    private String titulo;
    private Alumno alumno;
    private int puntaje = 0;

    public Fotografia(int id, String titulo, Alumno alumno) {
        this.id = id;
        this.titulo = titulo;
        this.alumno = alumno;
    }

    public void setPuntaje(int puntaje) {
        this.puntaje = puntaje;
    }

    public Alumno getAlumno() {
        return alumno;
    }

    @Override
    public String toString() {
        return "Fotografia{" + "id=" + id + ", titulo=" + titulo + ", alumno=" + alumno.toString() + ", puntaje=" + puntaje + '}';
    }
    
    
}
