/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema3;

/**
 *
 * @author Martín
 */
public class Triangulo {
    private double l1;
    private double l2;
    private double l3;
    private String colorRelleno;
    private String colorLinea;
    
    public Triangulo(double unl1, double unl2, double unl3, String unColorRelleno, String unColorLinea){
        l1 = unl1;
        l2 = unl2;
        l3 = unl3;
        colorRelleno = unColorRelleno;
        colorLinea = unColorLinea;
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
    
    // COLORES
    public String getColorRelleno(){
        return colorRelleno;
    }
    public String getColorLinea(){
        return colorLinea;
    }
    public void setColorRelleno(String color){
        colorRelleno = color;
    }
    public void setColorLinea(String color){
        colorLinea = color;
    }
    // FIN COLORES
    public double calcularPerimetro(){
        return l1+l2+l3;
    }
    public double calcularArea(){
        double sp = this.calcularPerimetro()/2;
        return Math.sqrt(sp*(sp-l1)*(sp-l2)*(sp-l3));
    }
    
    @Override
    public String toString(){
        return "Perimetro: "+this.calcularPerimetro()+" | Area: "+this.calcularArea();
    }
}
