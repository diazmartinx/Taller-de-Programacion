{ Una biblioteca nos ha encargado procesar la información de los préstamos realizados durante cada el año 2021. 
* De cada préstamo se conoce el ISBN del libro, el número de socio, día y mes del préstamo y cantidad de días prestados. Implementar un programa con:
* 
a.	Un módulo que lea préstamos y retorne en una estructura adecuada la información de los préstamos organizada por mes. Para cada mes, los préstamos 
deben quedar ordenados por ISBN. La lectura de los préstamos finaliza con ISBN -1.
* 
b.	Un módulo recursivo que reciba la estructura generada en a. y muestre, para cada mes, ISBN y numero de socio.
* 
c.	Un módulo que reciba la estructura generada en a. y retorne una nueva estructura con todos los préstamos ordenados por ISBN.
* 
d.	Un módulo recursivo que reciba la estructura generada en c. y muestre todos los ISBN y número de socio correspondiente.
* 
e.	Un módulo que reciba la estructura generada en a. y retorne una nueva estructura ordenada ISBN, donde cada ISBN aparezca una vez junto a 
la cantidad total de veces que se prestó durante el año 2021.
* 
f.	Un módulo recursivo que reciba la estructura generada en e. y muestre su contenido.
}

program ej1;

const dimF=12; valorGrande=9999;

type
	rangoDias=1..31;
	rangoMes=1..12;
	prestamo=record
		isbn: integer;
		socio: integer;
		dia: rangoDias;
		mes: rangoMes;
		cant: integer;
	end;
	
	lista=^nodo;
	nodo=record
		dato: prestamo;
		sig: lista;
	end;
	
	TV = array [rangoMes] of lista;
	
procedure InsertarOrdenado(var V:TV; dato:prestamo);
var nuevo, act, ant:lista;
begin
	new(nuevo);
	nuevo^.dato:=dato;
	act:=V[dato.mes];
	ant:=V[dato.mes];
	
	while (act<>nil) and (act^.dato.isbn<dato.isbn) do begin
		ant:=act;
		act:=act^.sig;
	end;
	if ant=act then V[dato.mes]:=nuevo
	else ant^.sig:=nuevo;
	nuevo^.sig:=act;
end;
	
procedure LeerPrestamo(var V:TV);

	procedure InicializaVector(var V:TV);
	var i:rangoMes;
	begin
		for i:=1 to dimF do V[i]:=nil
	end;

var pre:prestamo;
begin
	InicializaVector(V);
	writeln('Ingrese ISBN: (-1 fin)');readln(pre.isbn);
	while pre.isbn<>-1 do begin
		pre.socio:=random(999);
		pre.dia:=random(31)+1;
		pre.mes:=random(12)+1;
		pre.cant:=1;
		
		InsertarOrdenado(V,pre);
	
		writeln('Ingrese ISBN: (-1 fin)');readln(pre.isbn);
	end;
end;

procedure ImprimirLista(L:lista);
begin
	if L<>nil then begin
		writeln('ISBN: ',L^.dato.isbn,' | Socio: ',L^.dato.socio);
		ImprimirLista(L^.sig);
	end;
end;

procedure ImprimirPorMes(V:TV);
var i:rangoMes;
begin
	for i:=1 to dimF do begin
		if V[i]<>nil then begin
			writeln('----- Mes: ',i,' ------');
			ImprimirLista(V[i]);
		end;
	end;
end;

procedure Minimo(var V:TV; var prestamoMin:prestamo);
var indiceMin, i:integer;
begin
	prestamoMin.isbn:=valorGrande;
	for i:=1 to dimF do begin
		if V[i]<>nil then
			if V[i]^.dato.isbn <= prestamoMin.isbn then begin
				prestamoMin:=V[i]^.dato;
				indiceMin:=i;
			end;
	end;
	if (prestamoMin.isbn<>valorGrande) then V[indiceMin]:= V[indiceMin]^.sig;
end;

procedure MergeV(var L:lista; V:TV);
	
	procedure AgregarAtras(var L:lista; dato:prestamo);
	var nuevo, act:lista;
	begin
		if L<>nil then begin
			act:=L;
			AgregarAtras(act^.sig,dato) 
		end else begin
			new(nuevo); nuevo^.dato:=dato; nuevo^.sig:=nil;
			L:=nuevo;
		end;
	end;

var prestamoMin:prestamo;
begin
	L:=nil;
	Minimo(V, prestamoMin);
	while prestamoMin.isbn<>valorGrande do begin
		AgregarAtras(L, prestamoMin);
		Minimo(V, prestamoMin);
	end;
end;



procedure MergeAcum(var L:lista; V:TV);
	
	procedure AgregarAcumulado(var L:lista; dato:prestamo);
	var nuevo, act:lista;
	begin
		if L<>nil then begin
			act:=L;
			if act^.dato.isbn<>dato.isbn then AgregarAcumulado(act^.sig,dato) //si isbn es distinto, avanzo
			else act^.dato.cant:=act^.dato.cant+dato.cant; //si es igual, sumo
		end else begin //si es nil, creo un nodo
			new(nuevo); nuevo^.dato:=dato; nuevo^.sig:=nil;
			L:=nuevo;
		end;
	end;

var prestamoMin:prestamo;
begin
	L:=nil;
	Minimo(V, prestamoMin);
	while prestamoMin.isbn<>valorGrande do begin
		AgregarAcumulado(L, prestamoMin);
		Minimo(V, prestamoMin);
	end;
end;

procedure ImprimirLista2(L:lista);
begin
	if L<>nil then begin
		writeln('ISBN: ',L^.dato.isbn,' | Cant: ',L^.dato.cant);
		ImprimirLista2(L^.sig);
	end;
end;
	
var
	V:TV;
	L:lista;
begin
	LeerPrestamo(V);
	ImprimirPorMes(V);writeln;
	
	writeln('---------- Merge ----------');
	MergeV(L,V);
	ImprimirLista(L);
	
	writeln('---------- Merge Acum ----------');
	MergeAcum(L,V);
	ImprimirLista2(L);
end.
