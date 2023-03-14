/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package finalseptiembre2022;

/**
 *
 * @author Martín
 */
public class FinalSeptiembre2022 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Bien b1 = new Bien("b1",5,1000);
        Bien b2 = new Bien("b2",5,100);
        Bien b3 = new Bien("b3",5,100);
        
        Bienes sb1 = new Bienes(5,"i1","p1","f1");
        sb1.agregaBien(b1);
        sb1.agregaBien(b3);
        sb1.agregaBien(b2);
        
        Estadia se1 = new Estadia("l1",100,5,30,"i1","p1","f1");
        
        System.out.println(sb1.toString());
        System.out.println(se1.toString());
    }
    
}
