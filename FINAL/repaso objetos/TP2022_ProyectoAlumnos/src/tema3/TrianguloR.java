/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema3;

/**
 *
 * @author Martín
 */
public class TrianguloR {
    private double l1;
    private double l2;
    private double l3;
    private String colorRelleno;
    private String colorLinea;

    public TrianguloR(double l1, double l2, double l3, String colorRelleno, String colorLinea) {
        this.l1 = l1;
        this.l2 = l2;
        this.l3 = l3;
        this.colorRelleno = colorRelleno;
        this.colorLinea = colorLinea;
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
    
    public double calcularPerimetro(){
        return this.l1+this.l2+this.l3;
    }
    
    public double calcularArea(){
        double s = (l1+l2+l3)/2;
        return Math.sqrt(s*(s-l1)*(s-l2)*(s-l3));
    }
    
}
