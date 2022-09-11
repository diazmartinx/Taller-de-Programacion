{
* 1.	Escribir un programa que:
a. Implemente un módulo que lea información de socios de un club y las almacene en un árbol binario de búsqueda. 
* De cada socio se lee número de socio, nombre y edad. La lectura finaliza con el número de socio 0 y el árbol debe quedar ordenado por número de socio.
* 
b. Una vez generado el árbol, realice módulos independientes que reciban el árbol como parámetro y que : 
OK i. Informe el número de socio más grande. Debe invocar a un módulo recursivo que retorne dicho valor.
* 
OK ii. Informe los datos del socio con el número de socio más chico. Debe invocar a un módulo recursivo que retorne dicho socio.
* 
iii. Informe el número de socio con mayor edad. Debe invocar a un módulo recursivo que retorne dicho valor.
* 
OK iv. Aumente en 1 la edad de todos los socios.
* 
OK v. Lea un valor entero e informe si existe o no existe un socio con ese valor. Debe invocar a un módulo recursivo que reciba el valor leído y retorne verdadero o falso.
* 
PRE vi. Lea un nombre e informe si existe o no existe un socio con ese nombre. Debe invocar a un módulo recursivo que reciba el nombre leído y retorne verdadero o falso.
* 
OK vii. Informe la cantidad de socios. Debe invocar a un módulo recursivo que retorne dicha cantidad.
* 
OK viii. Informe el promedio de edad de los socios. Debe invocar al módulo recursivo del inciso vii e invocar a un módulo recursivo que retorne la suma de las edades de los socios.
* 
PRE ix. Informe, a partir de dos valores que se leen, la cantidad de socios en el árbol cuyo número de socio se encuentra entre los dos valores ingresados. 
* Debe invocar a un módulo recursivo que reciba los dos valores leídos y retorne dicha cantidad.
* 
x. Informe los números de socio en orden creciente. 
xi. Informe los números de socio pares en orden decreciente. 
}

program ej1;

type
	TRsocio = record
		numSoc: integer;
		nombre: string;
		edad: byte;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato: TRsocio;
		HI: arbol;
		HD: arbol;
	end;
	
procedure InsertaArbol(var A:arbol; dato:TRsocio);
// Ordenado segun numero de socio
begin
	if A=nil then begin
		new(A);
		A^.dato:=dato;
		A^.HI:=nil;
		A^.HD:=nil;
	end
	else
		if dato.numSoc < A^.dato.numSoc then
			InsertaArbol(A^.HI, dato)
		else
			InsertaArbol(A^.HD, dato);
end;
	
procedure LeerArbol(var A:arbol);
var socio:TRsocio;
begin
	writeln('Ingrese numero de socio, 0 para finalizar: ');
	readln(socio.numSoc);
	while socio.numSoc <> 0 do begin
		writeln('Nombre: ');readln(socio.nombre);
		writeln('Edad: ');readln(socio.edad);
		
		InsertaArbol(A, socio);
		
		writeln('Ingrese numero de socio, 0 para finalizar: ');
		readln(socio.numSoc);
	end;
end;

function MaxSocio(A:arbol):integer;
begin
	if A<>nil then
		if A^.HD=nil then
			MaxSocio:=A^.dato.numSoc
		else
			MaxSocio:=MaxSocio(A^.HD)
	else
		MaxSocio:=-1;
end;

function MinSocio(A:arbol):arbol;
begin
	if (A=nil) or (A^.HI=nil) then MinSocio:=A
	else
		MinSocio:=MinSocio(A^.HI);
end;

{function MaxEdad(A:arbol, max:integer):integer;
begin
	if A<>nil then begin
		if A^.dato.edad>max then MaxEdad:=
		MaxEdad:=enOrden(A^.HI);
        MaxEdad:=enOrden(A^.HD);
        
	end;
	
end;}

procedure Aumenta(A:arbol; x:byte);
begin
	if A<>nil then begin
		A^.dato.edad:=x + A^.dato.edad;
		Aumenta(A^.HI,x);
		Aumenta(A^.HD,x);	
	end;
end;

function Buscar(A:arbol; x:integer):boolean;
begin
	if A=nil then Buscar:=false
	else if A^.dato.numSoc=x then Buscar:=true
	else if A^.dato.numSoc<x then Buscar:=Buscar(A^.HD,x)
	else Buscar:=Buscar(A^.HI,x);
end;

function BuscarNombre(A:arbol; x:string):boolean;
// PREGUNTAR, Recorre todo el arbol?

var aux:boolean;
begin
	if A=nil then BuscarNombre:=false
	else begin if A^.dato.nombre=x then BuscarNombre:=true
	           else begin
		              aux:=BuscarNombre(A^.HI,x);
		              if not aux then aux:=BuscarNombre(A^.HD,x);
	                  BuscarNombre:=aux;
	                end;
	     end;
end;

function Suma(A:arbol):integer;
begin
	if A<>nil then Suma:= 1 + Suma(A^.HI) + Suma(A^.HD)
	else Suma:=0;
end;

function SumaEdades(A:arbol):integer;
begin
	if A<>nil then SumaEdades:= A^.dato.edad + SumaEdades(A^.HI) + SumaEdades(A^.HD)
	else SumaEdades:=0;
end;

function Rango(A:arbol; min,max:integer):integer;
// BUSCA EN TODO EL ARBOL, PREGUNTAR
begin
	if A=nil then Rango:=0
	else if (A^.dato.numSoc>min) and (A^.dato.numSoc<max) then Rango:= 1 + Rango(A^.HI,min,max) + Rango(A^.HD,min,max)
	else if A^.dato.numSoc>=max then Rango:= 0 + Rango(A^.HI,min,max)
	else if A^.dato.numSoc<=min then Rango:= 0 + Rango(A^.HD,min,max);
end;

Procedure Creciente (a:arbol);
begin
    if ( a<> nil ) then begin
        Creciente(a^.HI);
        write (a^.dato.numSoc,'|');
        Creciente(a^.HD);
    end;
end;
	
var
	A:arbol;
	socMin:arbol;
begin
	LeerArbol(A);
	
	writeln('Numero de Socio mas Grande: ',MaxSocio(A)); //-1 -> esta vacio
	
	Aumenta(A,1);
	socMin:=MinSocio(A); //nil -> esta vacio
	writeln('SOCIO CON NUM MAS CHICO:');
	with socMin^.dato do begin
		writeln('Num: ',numSoc);
		writeln('Edad: ',edad);
		writeln('Nombre: ',nombre);
	end;
	
	writeln('Buscar Dato: ',Buscar(A,1));
	writeln('Existe Nombre: ',BuscarNombre(A,'martin'));
	writeln('Suma de Socios(nodos): ',Suma(A));
	writeln('Promedio de edades: ',SumaEdades(A)/Suma(A):2:2);
	writeln('Entre Rango: ',Rango(A,1,5));
	
	Creciente(A);writeln;
	//Decreciente(A);
end.
