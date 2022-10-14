/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema4;

/**
 *
 * @author Martín
 */
public class VisorFiguras {
    private int guardadas;
    private int capacidadMaxima=5;
    private Figura [] vector;

    public VisorFiguras(){
        vector = new Figura[capacidadMaxima];
        guardadas=0;
    }

    public void guardar(Figura f){
        if (quedaEspacio()){
            vector[guardadas]=f;
            guardadas++;
        }
    }
    
    public boolean quedaEspacio(){
        if (guardadas<capacidadMaxima) return true;
        return false;
    }

    public void mostrar(){
        for(int i=0;i<guardadas;i++){
            System.out.println(vector[i].toString());
        }
    }
    public int getGuardadas() {
        return guardadas;
    }
    
}
