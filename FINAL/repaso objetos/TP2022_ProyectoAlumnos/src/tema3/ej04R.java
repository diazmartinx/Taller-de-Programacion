/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package tema3;
import PaqueteLectura.GeneradorAleatorio;
/**
 *
 * @author Martín
 */
public class ej04R {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        int dimF = 20;
        HabitacionR[] habitaciones = new HabitacionR[dimF];
        for (int i=0; i<dimF; i++){
            habitaciones[i] = new HabitacionR(GeneradorAleatorio.generarDouble(6000)+2000,true);
        }
        Persona c1 = new Persona("marti");
        
        // Ingreso cliente en habitacion
        habitaciones[0].ocupar(c1);
        habitaciones[5].ocupar(c1);
        
        // Aumentar precio de todas las habitaciones
        for (int i=0; i<dimF; i++){
            habitaciones[i].aumentar(10000);
            System.out.println(habitaciones[i].toString());
        }
    }
    
}
