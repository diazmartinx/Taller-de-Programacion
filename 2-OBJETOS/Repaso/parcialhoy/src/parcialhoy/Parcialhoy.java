/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package parcialhoy;

/**
 *
 * @author Martín
 */
public class Parcialhoy {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Funcion f1 = new Funcion("spiderman",3,3,5,5);
        
        System.out.println(f1.ocupaButaca(2, 0));
        System.out.println(f1.ocupaButaca(2, 1));
        System.out.println(f1.ocupaButaca(3, 0));
        System.out.println(f1.ocupaButaca(1, 3));
        System.out.println(f1.ocupaButaca(0, 0));
        
        f1.desocupaFila(2);
        System.out.println(f1.getFila(3));
        System.out.println(f1.toString());
    }
    
}
