/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema3;
import PaqueteLectura.Lector;
/**
 *
 * @author Martín
 */
public class ej01 {
    
    public static void main(String[] args){
        System.out.println("Ingrese l1: ");double l1=Lector.leerDouble();
        System.out.println("Ingrese l2: ");double l2=Lector.leerDouble();
        System.out.println("Ingrese l3: ");double l3=Lector.leerDouble();
        System.out.println("Ingrese Color Relleno: ");String colorRelleno = Lector.leerString();
        System.out.println("Ingrese Color Linea: ");String colorLinea = Lector.leerString();
        
        Triangulo tri = new Triangulo(l1,l2,l3,colorRelleno,colorLinea);
        System.out.println(tri.toString());
    }
    
}
