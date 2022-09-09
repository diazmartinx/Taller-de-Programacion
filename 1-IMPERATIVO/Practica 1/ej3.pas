{
3.- Netflix ha publicado la lista de películas que estarán disponibles durante el mes de diciembre de 2022. 
* De cada película se conoce: código de película, código de género 
* (1: acción, 2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélica, 7: documental y 8: terror) y puntaje promedio otorgado por las críticas. 
Implementar un programa modularizado que:
* 
a. Lea los datos de películas y los almacene por orden de llegada y agrupados por código de género, en una estructura de datos adecuada. 
* La lectura finaliza cuando se lee el código de la película -1. 
* 
b. Una vez almacenada la información, genere un vector que guarde, para cada género, el código de película con mayor puntaje obtenido entre todas las críticas.
* 
c. Ordene los elementos del vector generado en b) por puntaje utilizando alguno de los dos métodos vistos en la teoría. 
* 
d. Luego de ordenar el vector, muestre el código de película con mayor puntaje y el código de película con menor puntaje.
}

program ej3;

const
	dimF = 8;

type
	rangoGenero = 1..dimF;
	indice = 0..dimF;
	
	TRpelicula = record
		codPelicula: integer;
		codGenero: rangoGenero;
		puntajeProm: real;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: TRpelicula;
		sig: lista;
	end;
	
	TVPunt = array [rangoGenero] of lista; //Array de 1 a 8 que alacena PUNTEROS
	TVMax = array [rangoGenero] of integer;
	
procedure AgregarAlFinal(var V:TVPunt; dato:TRpelicula);
var nue, actual:lista;
begin
	//Crea el nuevo nodo y lo almacena en new
	new(nue);
	nue^.dato:=dato;
	nue^.sig:=nil;
	if V[dato.codGenero]=nil then //Si la lista esta vacia -> asigna new a L
		V[dato.codGenero]:=nue
	else
		begin
			//Si la lista no esta vacia, itera hasta el final y agrega el nodo
			actual:=V[dato.codGenero];
			while actual^.sig<>nil do
				actual:=actual^.sig;
			actual^.sig := nue;
		end;
end;

procedure inicializarVecListas(var V:TVPunt);
var i:integer;
begin
    for i:= 1 to dimF do begin
        V[i]:=nil;
    end;  
end; 

procedure LeePeliculas(var V:TVPunt);
var
	pelicula:TRpelicula;
begin
	inicializarVecListas(V);
	writeln('Ingrese codigo(-1 para finalizar): ');
	readln(pelicula.codPelicula);
	while pelicula.codPelicula <> -1 do begin
		writeln('Codigo de Genero: ');readln(pelicula.codGenero);
		writeln('Puntaje Promedio: ');readln(pelicula.puntajeProm);

		AgregarAlFinal(V,pelicula);
		
		writeln('Ingrese codigo(-1 para finalizar): ');
		readln(pelicula.codPelicula);
	end;

end;

function BuscaMaxPuntaje(pri:lista):integer;
var max:real; cod:integer;	
begin
	max:=-9999; cod:=0;
	while pri<>nil do begin
	if pri^.dato.puntajeProm > max then begin
		max:=pri^.dato.puntajeProm;
		cod:=pri^.dato.codPelicula;
	end;
	pri:=pri^.sig;
	end;
	BuscaMaxPuntaje:=cod;	
end;

procedure MaxPuntaje(var VMax:TVMax; V:TVPunt);
var i:indice;
begin
	for i:=1 to dimF do 
		VMax[i]:=BuscaMaxPuntaje(V[i]);
end;

procedure Ordenar(var V:TVMax);
var i,j,p:indice; item:integer;
begin
	for i:=1 to dimF-1 do begin
		p:=i;
		for j:=i+1 to dimF do // busca el minimo y lo guarda en j
			if V[j]<V[i] then // p:=i implica que se considera a si mismo
				p:=j;
				
		//intercambia
		item:=V[p];
		V[p]:=V[i];
		V[i]:=item;
	end;
end;
	
var
	V:TVPunt;
	VMax:TVMax;

begin
	LeePeliculas(V);
	MaxPuntaje(VMax, V);
	Ordenar(Vmax);
end.
