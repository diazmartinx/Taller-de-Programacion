/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcial;

/**
 *
 * @author Martín
 */
public class Funcion {
    private String titulo;
    private String fecha;
    private int hora;
    private Butaca[][] sala;
    private int m;
    private int n;

    public Funcion(String titulo, String fecha, int hora, int n, int m) {
        this.titulo = titulo;
        this.fecha = fecha;
        this.hora = hora;
        this.n = n;
        this.m = m;
        this.sala = new Butaca[n][m]; //inicia matriz
        for (int i=0; i<n; i++){
            for (int j=0; j<m; j++){
                sala[i][j] = new Butaca(i,j);
            }
        }//instancia cada butaca
    }
    
    public double ocupaButaca(int n, int m){
        return sala[n][m].ocupa();
    }
    
    public void desocupaFila(int f){
        for (int j=0; j<m; j++)
            sala[f][j].setEstado(false);
    }
    private String armaString(){
        String total = "";
        for (int j=0; j<m; j++)
            total += obtieneColumna(j);
        return total;
    }
    
    public String obtieneColumna(int m){
        String total = "";
        for (int i=0; i<n; i++){
            total += sala[i][m].toString() + "\n";
        }
        return total;
    }
    
    

    @Override
    public String toString() {
        return "Funcion{" 
                + "titulo=" + titulo 
                + ", fecha=" + fecha 
                + ", hora=" + hora + "\n"
                + armaString()
                +'}';
    }
    
}
