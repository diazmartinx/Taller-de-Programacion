/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcialhoy;

/**
 *
 * @author Martín
 */
public class Funcion {
    private String titulo;
    private int fecha;
    private int hora;
    private Butaca[][] sala;
    private int n;
    private int m;

    public Funcion(String titulo, int fecha, int hora, int n, int m) {
        this.titulo = titulo;
        this.fecha = fecha;
        this.hora = hora;
        this.n = n;
        this.m = m;
        sala = new Butaca[n][m];
        instanciaButacas();
    }
    
    private void instanciaButacas(){
        for (int i=0;i<n;i++){
            for (int j=0;j<m;j++){
                sala[i][j] = new Butaca(i,j);
            }
        }
    }
    
    public double ocupaButaca(int i, int j){
        sala[i][j].setOcupada(true);
        return sala[i][j].getPrecio();
    }
    
    public void desocupaFila(int fila){
        for (int j=0;j<m;j++){
            sala[fila][j].setOcupada(false);
        }
    }
    
    public String getFila(int fila){
        String aux="";
        for (int j=0;j<m;j++){
            aux+=sala[fila][j].toString();
        }
        return aux;
    }

    @Override
    public String toString() {
        String aux = "\nFuncion{" + "titulo=" + titulo + ", fecha=" + fecha + ", hora=" + hora + '}';
        for (int i=0;i<n;i++){
            for (int j=0;j<m;j++){
                aux+=sala[i][j].toString();
            }
        }
        return aux;
    }
    
    
    
    
    
}
