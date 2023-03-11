/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema4;

/**
 *
 * @author Martín
 */
public class Circulo extends Figura {
    private double radio;
    private final double pi = Math.PI;

    public Circulo(double radio, String colorRelleno, String colorLinea) {
        super(colorRelleno, colorLinea);
        this.radio = radio;
    }

    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }
    
    @Override
    public double calcularPerimetro(){
        return 2*getRadio()*pi;
    }
    @Override
    public double calcularArea(){
        return getRadio()*getRadio()*pi;
    }
    
    @Override
    public String toString(){
        return super.toString()+" Radio: "+getRadio();
    }
}
