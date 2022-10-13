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

    
    public Triangulo(double unl1, double unl2, double unl3, String unColorRelleno, String unColorLinea){
        super(unColorRelleno,unColorLinea);
        setLado1(unl1);
        setLado2(unl2);
        setLado3(unl3);
    }
    
    // LADOS
    public double getLado1(){
        return l1;
    }
    public double getLado2(){
        return l2;
    }
    public double getLado3(){
        return l3;
    }
    public void setLado1(double l){
        l1 = l;
    }
    public void setLado2(double l){
        l2 = l;
    }
    public void setLado3(double l){
        l3 = l;
    }
    // FIN LADOS
    
    
    public double calcularPerimetro(){
        return getLado1()+getLado2()+getLado3();
    }
    public double calcularArea(){
        double sp = calcularPerimetro()/2;
        return Math.sqrt(sp*(sp-getLado1())*(sp-getLado2())*(sp-getLado3()));
    }
    
    @Override
    public String toString(){
        return  super.toString()+
                " L1: "+getLado1()+
                " L2: "+getLado2()+
                " L3: "+getLado3();
    }
}
