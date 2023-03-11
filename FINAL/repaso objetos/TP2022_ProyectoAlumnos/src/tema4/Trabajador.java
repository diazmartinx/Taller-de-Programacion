/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema4;

/**
 *
 * @author Martín
 */
public class Trabajador extends Persona {
    private String ocupacion;
    public Trabajador(String nombre, int dni, int edad, String ocupacion){
        super(nombre,dni,edad);
        this.ocupacion=ocupacion;
    }
    
    public String getOcupacion(){
        return ocupacion;
    }
    
    public String toString(){
        return super.toString() + " Soy "+ocupacion;
    }
}
