/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;


public abstract class Figura {
    private String colorRelleno;
    private String colorLinea;
   
    public Figura(String unCR, String unCL){
        setColorRelleno(unCR);
        setColorLinea(unCL);
    }
    
    public String getColorRelleno(){
        return colorRelleno;       
    }
    public void setColorRelleno(String color){
        this.colorRelleno = color;       
    }
    public String getColorLinea(){
        return colorLinea;       
    }
    public void setColorLinea(String color){
        this.colorLinea = color;       
    }
    
    public abstract double calcularArea();
    public abstract double calcularPerimetro();
     
    public void despintar(){
        setColorRelleno("blanco");
        setColorLinea("negro");
    }
    
    public String toString(){
        String aux = "Area: " + this.calcularArea() +
                     " Perimetro: " + this.calcularPerimetro() +
                     " CR: "  + getColorRelleno() + 
                     " CL: " + getColorLinea();             
             return aux;
       }
}
