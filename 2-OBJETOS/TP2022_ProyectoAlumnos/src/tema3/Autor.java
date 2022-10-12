/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema3;

/**
 *
 * @author Martín
 */
public class Autor {
    private String nombre;
    private String biografia;
    private String origen;
    
    public Autor(String unNombre){
        nombre = unNombre;
        biografia = "asd";
        origen = "arg";
    }
    public String getNombre(){
        return nombre;
    }
    public String getBiografia(){
        return biografia;
    }
    public String getOrigen(){
        return origen;
    }
    public void setNombre(String unNombre){
        nombre = unNombre;
    }
    
    @Override
    public String toString(){
        return nombre+" | "+biografia+" | "+origen;
    }
}
