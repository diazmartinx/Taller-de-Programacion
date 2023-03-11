/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package tema2;
import PaqueteLectura.GeneradorAleatorio;
/**
 *
 * @author Martín
 */
public class ej04_f {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        int dias = 5;
        int turnos = 8;
        Persona [][] Turnos = new Persona[dias][turnos];
        
        for (int i=0; i<dias;i++) {
            for (int j=0; j<turnos; j++) {
                String nombre = GeneradorAleatorio.generarString(3);
                if (nombre == "ZZZ") break;
                
                Turnos[i][j] = new Persona(nombre, 
                        GeneradorAleatorio.generarInt(99999),
                        GeneradorAleatorio.generarInt(100)
                );
                
            }
        }
        for (int i=0; i<dias;i++) {
            for (int j=0; j<turnos; j++) {
                System.out.println("DIA: " + (i+1) + " TURNO:" + (j+1) + " " + Turnos[i][j].toString());
                
            }
        }
    }
    
}
