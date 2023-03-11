/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema4;

/**
 *
 * @author Martín
 */
public class ej01 {
    public static void main(String[] args){
        Triangulo t1 = new Triangulo(3,3,3,"asd","dsa");
        System.out.println(t1.toString());
        t1.despintar();
        System.out.println(t1.toString());
        
        Circulo c1 = new Circulo(3,"asd","dsa");
        System.out.println(c1.toString());
        c1.despintar();
        System.out.println(c1.toString());
        
    }
}
