/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema3;

/**
 *
 * @author Martín
 */
public class Circulo {
    private double pi=Math.PI;
    private double radio;
    private String colorRelleno;
    private String colorLinea;
    
    public Circulo(double unRadio, String unColorRelleno, String unColorLinea){
        radio=unRadio;
        colorRelleno=unColorRelleno;
        colorLinea=unColorLinea;
    }
    
    public double calcularPerimetro(){
        return 2*radio*pi;
    }
    public double calcularArea(){
        return radio*radio*pi;
    }
    
    @Override
    public String toString(){
        return "Radio: "+radio+" Relleno: "+colorRelleno+" Linea: "+colorLinea+
                "  Perimetro: "+this.calcularPerimetro()+"  Area: "+this.calcularArea();
    }
    
}
