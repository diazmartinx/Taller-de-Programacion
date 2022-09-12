{
* 2.- Una agencia dedicada a la venta de autos ha organizado su stock y, dispone en papel de la información de los autos en venta.
Implementar un programa que:
a)	Genere un árbol binario de búsqueda ordenado por patente identificatoria del auto en venta. 
* Cada nodo del árbol debe contener patente, año de fabricación (2010..2018), la marca y el modelo.
* 
b)	Invoque a un módulo que reciba el árbol generado en a) y una marca y retorne la cantidad de autos de dicha marca que posee la agencia. Mostrar el resultado. 
c)	Invoque a un módulo que reciba el árbol generado en a) y retorne una estructura con la información de los autos agrupados por año de fabricación.
d)	Contenga un módulo que reciba el árbol generado en a) y una patente y devuelva el año de fabricación del auto con dicha patente. Mostrar el resultado. 
}

program ej2;

type
	anio=2010..2018;
	auto=record
		pat: integer;
		fab: anio;
		marca: integer;
		modelo: integer;
	end;
	
	arbol=^nodo;
	nodo=record
		dato: auto;
		hi: arbol;
		hd: arbol;
	end;
	
	TV = array[anio] of arbol;
	
procedure Insertar(var A:arbol; dato:auto);
var nuevo:arbol;
begin
	if A=nil then begin
		new(nuevo);nuevo^.dato:=dato;nuevo^.hi:=nil;nuevo^.hd:=nil;
		A:=nuevo;
	end else if dato.pat>=A^.dato.pat then Insertar(A^.hd,dato)
	else Insertar(A^.hi,dato);
end;
	
procedure Generar(var A:arbol; cant:integer);
var dato:auto; i:integer;
begin
	for i:=1 to cant do begin
		dato.pat:=random(10);
		dato.fab:=random(9)+2010;
		dato.marca:=random(3);
		dato.modelo:=random(3);
		Insertar(A,dato);
	end;
end;

procedure Imprimir(A:arbol);
begin
	if A<>nil then begin
		Imprimir(A^.hi);
		writeln(A^.dato.pat,' | Marca: ',A^.dato.marca,' | Anio: ',A^.dato.fab);
		Imprimir(A^.hd);
	end;
end;

function Cantidad(A:arbol; marca:integer):integer;
begin
	if A=nil then Cantidad:=0
	else if A^.dato.marca=marca then Cantidad:=1+Cantidad(A^.hi,marca)+Cantidad(A^.hd,marca)
	else Cantidad:=0+Cantidad(A^.hi,marca)+Cantidad(A^.hi,marca);
end;

procedure GenerarVector(var V:TV; A:arbol);
begin
	if A<>nil then begin
		GenerarVector(V,A^.hi);
		Insertar(V[A^.dato.fab],A^.dato);
		GenerarVector(V,A^.hd);
	end;
end;

function BuscarPatente(A:arbol; pat:integer):integer;
begin
	if A=nil then BuscarPatente:=-1 //Si no lo encontro
	else if A^.dato.pat=pat then BuscarPatente:=A^.dato.fab
	else if A^.dato.pat<pat then BuscarPatente:=BuscarPatente(A^.hd,pat) //Busca a la derecha
	else BuscarPatente:=BuscarPatente(A^.hi,pat) //Busca a la izq
end;
	
var
	A:arbol;
	marca, patente:integer;
	V:TV;
begin
	Randomize;
	Generar(A,500);
	Imprimir(A);
	marca:=2;
	writeln('Cantidad de auto de marca ',marca,': ',Cantidad(A,marca));
	writeln;
	GenerarVector(V,A); //Genero un Vector de Arboles, creo que habia que usar merge
	Imprimir(V[2011]);
	patente:=1;
	writeln('Año de fab de ',patente,': ',BuscarPatente(A,patente));
end.
