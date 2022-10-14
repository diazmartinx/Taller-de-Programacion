/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package repaso1;

/**
 *
 * @author Martín
 */
public class Investigador {
    private String nombre;
    private int categoria;
    private String especialidad;
    private int max;
    private int cant;
    private Subsidio[] subsidios;
    
    public Investigador(String nombre, int categoria, String especialidad){
        setNombre(nombre);
        setCategoria(categoria);
        setEspecialidad(especialidad);
        setMax(5);
        setCant(0);
        subsidios=new Subsidio[max];
    }
    
    public String getNombre() {
        return nombre;
    }

    public int getCategoria() {
        return categoria;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public int getMax() {
        return max;
    }

    public int getCant() {
        return cant;
    }

    public Subsidio[] getSubsidios() {
        return subsidios;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    public void setMax(int max) {
        this.max = max;
    }

    public void setCant(int cant) {
        this.cant = cant;
    }
  
    public void agregarSubsidio(Subsidio S){
        if (cant<max){
            getSubsidios()[cant]= new Subsidio(S.getMonto(),S.getMotivo());
            cant++;
        } else {
            System.out.println("No se pueden agregar mas subsidios");
        }
    }
    
    public void otorgarTodos(){
        for (int i=0;i<cant;i++){
            subsidios[i].setOtorgado(true);
        }
    }
    
    private double totalOtorgado(){
        double total=0;
        for (int i=0;i<cant;i++){
            if (subsidios[i].isOtorgado()) total+=subsidios[i].getMonto();
        }
        return total;
    }

    @Override
    public String toString() {
        return "\nInvestigador{" + "nombre=" + nombre + ", categoria=" + categoria + ", especialidad=" + especialidad + ", subsidios=" + totalOtorgado() + '}';
    }
    
    
    
}
