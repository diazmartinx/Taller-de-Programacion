/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package repaso1;

/**
 *
 * @author Martín
 */
public class Repaso1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Proyecto p1 = new Proyecto("p1",123,"d1");
        
        Investigador i1 = new Investigador("i1",1,"e1");
        Investigador i2 = new Investigador("i2",2,"e2");
        Investigador i3 = new Investigador("i3",3,"e3");
        
        Subsidio s1 = new Subsidio(10,"asd");
        Subsidio s2 = new Subsidio(100,"asdasdasdasd");
        
        p1.agregarInvestigador(i1);
        p1.agregarInvestigador(i2);
        p1.agregarInvestigador(i3);
        
        i1.agregarSubsidio(s1);
        i1.agregarSubsidio(s2);
        i2.agregarSubsidio(s1);
        i2.agregarSubsidio(s2);
        i3.agregarSubsidio(s1);
        i3.agregarSubsidio(s2);
        
        i1.otorgarTodos();
        
        System.out.println(p1.toString());
    }
    
}
