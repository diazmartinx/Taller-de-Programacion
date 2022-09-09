{
* 1.- Implementar un programa que invoque a los siguientes módulos.
a. Implementar un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y los almacene en un vector con dimensión física igual a 10.
b. Implementar un módulo que imprima el contenido del vector.
c. Implementar un módulo recursivo que imprima el contenido del vector.
d. Implementar un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y retorne la cantidad de caracteres leídos. 
El programa debe informar el valor retornado.
e. Implementar un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y retorne una lista con los caracteres leídos.
f. Implemente un módulo recursivo que reciba la lista generada en d. e imprima los valores de la lista en el mismo orden que están almacenados.
g. Implemente un módulo recursivo que reciba la lista generada en d. e imprima los valores de la lista en orden inverso al que están almacenados.
}

program ej1;

const
	dimF = 10;
	
type
	TV = array [1..dimF] of char;
	TdimL = 0..dimF;
	
	lista=^nodo;
	nodo = record
		dato:char;
		sig:lista;
	end;
	
procedure a(var V:TV; var dimL:TdimL);
var x:char;
begin
	if dimL<10 then begin
		writeln('Ingrese caracter: ');readln(x);
		if (x='.') then begin
			dimL:=dimL+1;
			V[dimL]:=x;
		end
			else
				begin
					dimL:=dimL+1;
					V[dimL]:=x;
					a(V,dimL);
				end;
	end;
end;

procedure c(V:TV; dimL:TdimL);
begin
	if dimL > 0 then begin
		c(V,dimL-1);
		writeln(V[dimL]);	
	end;
end;

function CantLeidos():integer;
var x:char;
begin
	writeln('Ingrese caracter: ');readln(x);
	if x='.' then
		CantLeidos:=1
	else
		CantLeidos:=1+CantLeidos();
end;

function GenerarLista():pointer;
var x:char; nuevo:lista;
begin
	writeln('Ingrese caracter: ');readln(x);
	new(nuevo);
	nuevo^.dato:=x;
	nuevo^.sig:=nil;
	
	if x='.' then		
		GenerarLista:=nuevo
	else
		begin
			nuevo^.sig:=GenerarLista();
			GenerarLista:=nuevo;
		end;
end;

procedure imp(pri:lista);
begin
	while pri<>nil do begin
		writeln(pri^.dato);
		pri:=pri^.sig;
	end;
end;

procedure ImprimirLista(pri:lista);
begin
	if pri<>nil then begin
		writeln(pri^.dato);
		ImprimirLista(pri^.sig);
	end;
end;

procedure ImprimirLista2(pri:lista);
begin // ESTE NO FUNCIONA, PREGUNTAR
	if pri<>nil then begin
		ImprimirLista(pri^.sig);
		writeln(pri^.dato);
	end;
end;

var
	V:TV;
	dimL:TdimL;
	L:lista;
begin
	//a(V,dimL);
	//c(V,dimL);
	//writeln('Car leidos: ',CantLeidos());
	L:=GenerarLista();
	writeln('---------------');
	imp(L);writeln('---------------');
	ImprimirLista(L);writeln('---------------');
	ImprimirLista2(L);writeln('---------------');
end.
