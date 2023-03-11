/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package parcial;

/**
 *
 * @author Martín
 */
public class Parcial {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Funcion f1 = new Funcion("asd","asd",1600,3,3);
        f1.ocupaButaca(0, 0);
        f1.ocupaButaca(0, 1);
        f1.ocupaButaca(0, 2);
        System.out.println(f1.toString());
        f1.desocupaFila(0);
        System.out.println(f1.toString());
        System.out.println(f1.obtieneColumna(0));
    }
    
}
