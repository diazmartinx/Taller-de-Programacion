/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;


public abstract class Figura {
    private String colorRelleno;
    private String colorLinea;

    public Figura(String colorRelleno, String colorLinea) {
        this.colorRelleno = colorRelleno;
        this.colorLinea = colorLinea;
    }

    public String getColorRelleno() {
        return colorRelleno;
    }

    public void setColorRelleno(String colorRelleno) {
        this.colorRelleno = colorRelleno;
    }

    public String getColorLinea() {
        return colorLinea;
    }

    public void setColorLinea(String colorLinea) {
        this.colorLinea = colorLinea;
    }
    
    public abstract double calcularArea();
    public abstract double calcularPerimetro();
     
    public void despintar() {
        setColorLinea("negra");
        setColorRelleno("blanco");
    }
    
    @Override
    public String toString(){
        String aux = "Area: " + this.calcularArea() +
                     " Perimetro: " + this.calcularPerimetro() +
                     " CR: "  + getColorRelleno() + 
                     " CL: " + getColorLinea();             
             return aux;
       }
}
