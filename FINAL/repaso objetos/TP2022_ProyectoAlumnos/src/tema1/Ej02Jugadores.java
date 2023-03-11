
package tema1;

//Paso 1: Importar la funcionalidad para lectura de datos
import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;

public class Ej02Jugadores {

  
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        //Paso 2: Declarar la variable vector de double
        //Paso 3: Crear el vector para 15 double 
        int DF=15; int max=1;
        double [] V = new double[DF];
        
        //Paso 4: Declarar indice y variables auxiliares a usar
        int suma=0;
        int cant=0;
        double prom;
        //Paso 6: Ingresar 15 numeros (altura), cargarlos en el vector, ir calculando la suma de alturas
        for (int i=0;i<DF;i++){
            V[i]=GeneradorAleatorio.generarDouble(3);
            suma+=V[i];
            System.out.println(V[i]);
        }
        
        
        //Paso 7: Calcular el promedio de alturas, informarlo
        prom = suma/DF;
        System.out.println("Promedio de alturas: "+prom+" Suma: "+suma);
        
        //Paso 8: Recorrer el vector calculando lo pedido (cant. alturas que están por encima del promedio)
        for (int i=0;i<DF;i++){
            if (V[i]>prom) cant++;
        }
        
        //Paso 9: Informar la cantidad.
        System.out.println("Cantidad encima del promedio: "+cant);
    }
    
}
