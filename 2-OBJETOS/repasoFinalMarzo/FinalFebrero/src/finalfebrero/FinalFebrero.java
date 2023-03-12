/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package finalfebrero;
import PaqueteLectura.GeneradorAleatorio;
/**
 *
 * @author Martín
 */
public class FinalFebrero {
    
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        String[] catNombres = {
            "Paisaje","Naturaleza","Retrato",
            "Surrealista", "Nocturna", "Submarina"
        };
        int catCant = catNombres.length;
        Categoria[] categorias = new Categoria[catCant];
        
        for (int i=0;i<catCant;i++){
            categorias[i] = new Categoria(i+1,catNombres[i],100);
        }
        
      
        for (int i=0;i<100;i++){
           int numeroCategoria = PaqueteLectura.GeneradorAleatorio.generarInt(6)+1;
           Alumno alumno = new Alumno("A"+(i+1),i+1);
           Fotografia fotografia = new Fotografia(i+1,"F"+i+1,alumno);
           categorias[numeroCategoria-1].agregaFoto(fotografia); 
        }
        
        
        //Inciso b
        int maxInscriptas = -1;
        int maxInscriptasId = -1;
        for (int i=0;i<catCant;i++){
            
            //Inciso c
            categorias[i].asignaPuntaje();
            
            //Incsiso 2 -> test resultados
            System.out.println(categorias[i].toString());
            
            if (categorias[i].getDimL()>maxInscriptas){
                maxInscriptas = categorias[i].getDimL();
                maxInscriptasId = categorias[i].getId();
            }
        }
        System.out.println("Categoria con mayor inscriptas: "+maxInscriptasId);
    }
    
}
