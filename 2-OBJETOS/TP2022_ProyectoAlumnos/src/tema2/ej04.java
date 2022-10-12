/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema2;
import PaqueteLectura.GeneradorAleatorio;

/**
 *
 * @author Martín
 */
public class ej04 {
    
    public static void main(String[] args){
        int dias=5,per=8;
        //declaro matriz
        Persona [][] M = new Persona[dias][per];
        
        for (int i=0; i<dias; i++){
            for (int j=0; j<per;j++){
                M[i][j]=new Persona(
                        GeneradorAleatorio.generarString(3),
                        GeneradorAleatorio.generarInt(15),
                        GeneradorAleatorio.generarInt(15));   
            }
        }
        
        for (int i=0; i<dias; i++){
            for (int j=0; j<per;j++){
                System.out.println("Dia: "+i+" Turno: "+j+" | "+M[i][j].toString());             
            }
            System.out.println();
        }
    }
    
}
