/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package finalseptiembre2022;

/**
 *
 * @author Martín
 */
public class Estadia extends Subsidio {
    private String lugar;
    private double costoPasaje;
    private int diasEstadia;
    private double montoHotelDia;

    public Estadia(String lugar, double costoPasaje, int diasEstadia, double montoHotelDia, String nombreInvestigador, String nombrePlan, String fecha) {
        super(nombreInvestigador, nombrePlan, fecha);
        this.lugar = lugar;
        this.costoPasaje = costoPasaje;
        this.diasEstadia = diasEstadia;
        this.montoHotelDia = montoHotelDia;
    }

    @Override
    public double costoTotal() {
        return costoPasaje + diasEstadia*montoHotelDia;
    }

    @Override
    public String toString() {
        return super.toString()+"\nEstadia{" + "lugar=" + lugar + ", diasEstadia=" + diasEstadia + '}';
    }
    
    
    
    
}
