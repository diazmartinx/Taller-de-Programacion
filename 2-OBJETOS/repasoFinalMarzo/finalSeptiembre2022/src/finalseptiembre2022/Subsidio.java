/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package finalseptiembre2022;

/**
 *
 * @author Martín
 */
public abstract class Subsidio {
    private String nombreInvestigador;
    private String nombrePlan;
    private String fecha;

    public Subsidio(String nombreInvestigador, String nombrePlan, String fecha) {
        this.nombreInvestigador = nombreInvestigador;
        this.nombrePlan = nombrePlan;
        this.fecha = fecha;
    }
    
    public abstract double costoTotal();

    @Override
    public String toString() {
        return "Subsidio{" + "nombreInvestigador=" + nombreInvestigador + 
                ", nombrePlan=" + nombrePlan + 
                ", fecha=" + fecha + 
                ", MontoTotal=" + this.costoTotal() +
                '}';
    }
    
    
}
