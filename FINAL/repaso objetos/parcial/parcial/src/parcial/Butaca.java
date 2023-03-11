/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcial;

/**
 *
 * @author Martín
 */
public class Butaca {
    private String descriptor;
    private double precio;
    private boolean estado = false;

    public Butaca(int n, int m) {
        this.descriptor = "["+n+","+m+"]";
        this.precio = 800+100*n;
    }

    public double ocupa(){
        estado=true;
        return precio;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

    @Override
    public String toString() {
        return "Butaca{" + "descriptor=" + descriptor + ", precio=" + precio + ", estado=" + estado + '}';
    }
    
    
}
