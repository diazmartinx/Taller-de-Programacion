/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package tema2;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
/**
 *
 * @author luisi
 */
public class ej04R {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        GeneradorAleatorio.iniciar();
        int maxDias = 5;
        int  maxTurnos = 8;
        Persona[][] personas = new Persona[maxDias][maxTurnos];
        
        int dia = 0;
        int turno = 0;
        int[] posCorte = {-1,-1};  
        
        while (dia<maxDias && turno<maxTurnos) {
            String nombre = GeneradorAleatorio.generarString(3);
            
            //Fuerzo condicion ZZZ
            //if (dia==2 && turno==3) nombre = "ZZZ";
            if (nombre.equals("ZZZ")) {
                posCorte[0] = dia;
                posCorte[1] = turno;
                break;
            }
            
            int dni = GeneradorAleatorio.generarInt(8);
            int edad = GeneradorAleatorio.generarInt(100);
            
            personas[dia][turno] = new Persona(nombre,dni,edad);
            
            turno++;
            if (turno==8) {
                turno = 0;
                dia++;
            }
        }
        
        dia = 0; turno=0;
        while ((dia<maxDias && turno <maxTurnos) || (dia!=posCorte[0] && turno!=posCorte[1])) {
            
            System.out.println("Dia: "+(dia+1)+" Turno: "+(turno+1)+" Persona: "+personas[dia][turno].toString());
            
            turno++;
            if (turno == 8) {
                turno = 0;
                dia++;
            }
        }
        
    }
    
}
