/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema2;
import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;

/**
 *
 * @author Martín
 */
public class ej05 {
    
    public static void main(String[] args){
        int dimf=20, cant=0;
        String corte="zzz";
        Partido [] V = new Partido[dimf];
        
        String visitante = Lector.leerString();
        while (!visitante.equals(corte) && cant<dimf){
            
            String local = GeneradorAleatorio.generarString(3);
            int gloc = GeneradorAleatorio.generarInt(10);
            int gvis = GeneradorAleatorio.generarInt(10);
            V[cant]= new Partido(local,visitante,gloc,gvis);
            cant++;
            visitante = Lector.leerString();
        }
        
        for (int i=0;i<cant;i++) System.out.println(V[i].toString());
        
        String equipo = "i";

        int cantG=0;
        for (int i=0;i<cant; i++){
            if (V[i].getGanador().equals(equipo)) cantG++;
        }

        System.out.println("Cantidad de partidos ganados por "+equipo+": "+cantG);
        
        int cantGLoc = 0;
        for (int i=0;i<cant; i++){
            if (V[i].getVisitante().equals(equipo)) cantGLoc+=V[i].getGolesVisitante();
        }
        System.out.println("Cantidad de goles como visitante por "+equipo+": "+cantGLoc);
    }
    
}
