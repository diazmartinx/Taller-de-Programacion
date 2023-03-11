/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package ej01;

/**
 *
 * @author Martín
 */
public class Ej01 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Subsidio s1 = new Subsidio(500);
        Subsidio s2 = new Subsidio(9500);
        Subsidio s3 = new Subsidio(500);
        Subsidio s4 = new Subsidio(9500);
        Subsidio s5 = new Subsidio(500);
        Subsidio s6 = new Subsidio(9500);
        
        Investigador i1 = new Investigador("Nombre_1",1,"Especialidad_1");
        i1.agregarSubsidio(s1);
        i1.agregarSubsidio(s2);
        
        Investigador i2 = new Investigador("Nombre_2",2,"Especialidad_2");
        i2.agregarSubsidio(s3);
        i2.agregarSubsidio(s4);
        
        Investigador i3 = new Investigador("Nombre_3",3,"Especialidad_3");
        i3.agregarSubsidio(s5);
        i3.agregarSubsidio(s6);
        
        Proyecto p1 = new Proyecto("P1",123,"Director");
        p1.agregaInvestigador(i1);
        p1.agregaInvestigador(i2);
        p1.agregaInvestigador(i3);
           
        p1.otorgarTodos("Nombre_2");
        
        System.out.println(p1.toString());
    }
   
}
