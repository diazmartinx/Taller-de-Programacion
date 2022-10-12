/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema3;

/**
 *
 * @author Martín
 */
public class ej04 {
    
    public static void main(String[] args){
        int n=20;
        Habitacion [] habitaciones = new Habitacion [n];
        
        //Inicializa habitaciones
        for (int i=0;i<n;i++) habitaciones[i] = new Habitacion(i);
        //Crea instancias de personas
        Persona cliente1 = new Persona("yo");
        Persona cliente2 = new Persona("vos");
        
        //Ingresa un cliente en una habitacion vacia
        int numHabitacion = 2;
        habitaciones[numHabitacion].setCliente(cliente2);
        for (int i=0;i<n;i++) System.out.println(habitaciones[i].toString());
        
        //Aumenta en un monto recibido
        double monto=1333;
        for (int i=0;i<n;i++) habitaciones[i].setPrecio(monto);
        for (int i=0;i<n;i++) System.out.println(habitaciones[i].toString());
    }
    
}
