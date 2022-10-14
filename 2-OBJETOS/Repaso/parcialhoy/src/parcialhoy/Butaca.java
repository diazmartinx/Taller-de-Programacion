/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcialhoy;

/**
 *
 * @author Martín
 */
public class Butaca {
    private String descriptor;
    private double precio;
    private boolean ocupada;

    public Butaca(int n, int m) {
        this.descriptor = "Butaca "+n+","+m;
        this.precio = 800+100*n;
        this.ocupada = false;
    }

    public void setOcupada(boolean ocupada) {
        this.ocupada = ocupada;
    }

    public String getDescriptor() {
        return descriptor;
    }

    public double getPrecio() {
        return precio;
    }

    public boolean isOcupada() {
        return ocupada;
    }
    
    @Override
    public String toString() {
        return "\nButaca{" + "descriptor=" + descriptor + ", precio=" + precio + ", ocupada=" + ocupada + '}';
    }
}
