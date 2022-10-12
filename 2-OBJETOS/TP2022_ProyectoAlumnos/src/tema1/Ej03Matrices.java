/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

//Paso 1. importar la funcionalidad para generar datos aleatorios
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Ej03Matrices {

    public static void main(String[] args) {
	//Paso 2. iniciar el generador aleatorio     
        GeneradorAleatorio.iniciar();
	 
        //Paso 3. definir la matriz de enteros de 5x5 e iniciarla con nros. aleatorios 
        int df=5;
        int [][] M = new int[df+1][df+1];
        for(int i=0;i<df;i++){
            for(int j=0;j<df;j++){
                M[i][j]=GeneradorAleatorio.generarInt(31);
            }
        }
        //Paso 4. mostrar el contenido de la matriz en consola
        for(int i=0;i<df;i++){
            for(int j=0;j<df;j++){
                System.out.print(M[i][j]+" | ");
            }
            System.out.println();
        }
        //Paso 5. calcular e informar la suma de los elementos de la fila 1
        int suma=0;
        for(int j=0;j<df;j++){
            suma+=M[0][j];
        }
        System.out.println("Suma elementos fila 1: "+suma);
        //Paso 6. generar un vector de 5 posiciones donde cada posición j contiene la suma de los elementos de la columna j de la matriz. 
        //        Luego, imprima el vector.
        int [] V = {0,0,0,0,0};
        for(int i=0;i<df;i++){
            for(int j=0;j<df;j++){
                V[i]+=M[j][i];
            }
        System.out.println("Suma elementos columna "+(i+1)+": "+V[i]);
        }

        //Paso 7. lea un valor entero e indique si se encuentra o no en la matriz. En caso de encontrarse indique su ubicación (fila y columna)
        //   y en caso contrario imprima "No se encontró el elemento".
        int x = Lector.leerInt();
        int j=0,i=0;
        while(i<df && M[i][j]!=x){
            j=0;
            while (j<df && M[i][j]!=x){
                j++;
            }
            if (M[i][j]!=x) i++;
        }
        if (i<df && j<df) {
            System.out.println("Se encontro el elemento en la pos ["+i+","+j+"]");
        } else {
            System.out.println("No se encontro el elemento");
        }

    }
}
