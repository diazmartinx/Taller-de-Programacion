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
    private double pi = Math.PI;
    
    public Circulo(double unRadio, String unColorRelleno, String unColorLinea){
        super(unColorRelleno,unColorLinea);
        setRadio(unRadio);
    }
    
    public void setRadio(double r){
        radio=r;
    }
    public double getRadio(){
        return radio;
    }
    
    public double calcularPerimetro(){
        return 2*getRadio()*pi;
    }
    public double calcularArea(){
        return getRadio()*getRadio()*pi;
    }
    
    @Override
    public String toString(){
        return super.toString()+" Radio: "+getRadio();
    }
}
