/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package ej02;

/**
 *
 * @author Martín
 */
public class Ej02 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Estacionamiento e = new Estacionamiento("E","1y1");
        Auto a1 = new Auto("D1","A1");
        Auto a2 = new Auto("D1","A2");
        Auto a3 = new Auto("D1","A3");
        Auto a4 = new Auto("D1","A4");
        Auto a5 = new Auto("D1","A5");
        
        e.ingresaAuto(1, 1, a1);
        e.ingresaAuto(2, 2, a2);
        e.ingresaAuto(3, 3, a3);
        e.ingresaAuto(4, 4, a4);
        e.ingresaAuto(5, 5, a5);
        
        System.out.println(e.toString());
        System.out.println(e.cantidadPorPlaza(5));
        
        String patente = "A5";
        System.out.println(e.buscaAuto(patente));
    }
    
}
