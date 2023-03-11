/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema4;

/**
 *
 * @author Martín
 */
public class Triangulo extends Figura {
    private double l1;
    private double l2;
    private double l3;

    public Triangulo(double l1, double l2, double l3, String colorRelleno, String colorLinea) {
        super(colorRelleno, colorLinea);
        this.l1 = l1;
        this.l2 = l2;
        this.l3 = l3;
    }

    public double getL1() {
        return l1;
    }

    public void setL1(double l1) {
        this.l1 = l1;
    }

    public double getL2() {
        return l2;
    }

    public void setL2(double l2) {
        this.l2 = l2;
    }

    public double getL3() {
        return l3;
    }

    public void setL3(double l3) {
        this.l3 = l3;
    }

    @Override
    public double calcularPerimetro(){
        return getL1()+getL2()+getL3();
    }
    @Override
    public double calcularArea(){
        double sp = calcularPerimetro()/2;
        return Math.sqrt(sp*(sp-getL1())*(sp-getL2())*(sp-getL3()));
    }
    
    @Override
    public String toString(){
        return  super.toString()+
                " L1: "+getL1()+
                " L2: "+getL2()+
                " L3: "+getL3();
    }
}
