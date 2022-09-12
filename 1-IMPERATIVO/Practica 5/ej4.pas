{
* 4.- Un teatro tiene funciones los 7 días de la semana. Para cada día se tiene una lista con las entradas vendidas. 
Se desea procesar la información de una semana. Se pide:
* 
a)	Generar 7 listas con las entradas vendidas para cada día. 
* De cada entrada se lee día (de 1 a 7), código de la obra, asiento, monto. 
* La lectura finaliza con el código de obra igual a 0. Las listas deben estar ordenadas por código de obra de forma ascendente.
* 
b)	Generar una nueva lista que totalice la cantidad de entradas vendidas por obra. 
* Esta lista debe estar ordenada por código de obra de forma ascendente.
* 
c)	Realice un módulo recursivo que informe el contenido de la lista generada en b)
}

program ej4;

const
	dimF=7;
	minC=9999;
	
type
	rangoDias=1..dimF;
	
	entrada=record
		dia: rangoDias;
		cod: integer;
		asiento: integer;
		monto: integer;
	end;
	
	lista=^nodo;
	nodo=record
		dato: entrada;
		sig: lista;
	end;
	TV = array[rangoDias] of lista;
	
	elemAcum=record
		cod: integer;
		cant: integer;
	end;
	listaA=^nodoA;
	nodoA=record
		dato: elemAcum;
		sig: listaA;
	end;
	
procedure InicializaVector(var V:TV);
var i:rangoDias;
begin
	for i:=1 to dimF do V[i]:=nil;
end;

procedure InsertarOrdenado(var V:TV; dato:entrada);
var nuevo, act, ant:lista;
begin
	new(nuevo);
	nuevo^.dato:=dato;
	act:=V[dato.dia];
	ant:=V[dato.dia];
	
	while (act<>nil) and (act^.dato.cod<dato.cod) do begin
		ant:=act;
		act:=act^.sig;
	end;
	if ant=act then V[dato.dia]:=nuevo
	else ant^.sig:=nuevo;
	nuevo^.sig:=act;
end;

procedure Leer(var V:TV);
var ent:entrada;
begin
	InicializaVector(V);
	writeln('Codigo: (0 fin))');readln(ent.cod);
	while ent.cod<>0 do begin
		ent.dia:=random(7)+1;
		ent.asiento:=random(5);
		ent.monto:=random(100)+100;
		
		InsertarOrdenado(V, ent);
		
		writeln('Codigo: (-1 fin))');readln(ent.cod);
	end;
end;

procedure ImprimirLista(L:lista);
begin
	if L<>nil then begin
		writeln('Codigo: ',L^.dato.cod,' | Asiento: ',L^.dato.asiento,' | Monto: ',L^.dato.monto);
		ImprimirLista(L^.sig);
	end;
end;
procedure Imprimir(V:TV);
var i:integer;
begin
	for i:=1 to dimF do begin
		if V[i]<>nil then begin
			writeln('Dia: ',i);
			ImprimirLista(V[i]);
			writeln;
		end;
	end;
end;

procedure Minimo(var V:TV;var minDato:elemAcum);
var i, minIndice:rangoDias;
begin
	minDato.cod:=minC;
	//Recorro el vector
	for i:=1 to dimF do begin
		if V[i]<>nil then // si hay dato, comparo
			if V[i]^.dato.cod<minDato.cod then begin
				minDato.cod:=V[i]^.dato.cod;
				minIndice:=i;
			end;
	end;
	if minDato.cod<>minC then V[minIndice]:=V[minIndice]^.sig;
end;

procedure AgregarAtras(var L:listaA; dato:elemAcum);
var act,nuevo:listaA;
begin
	if L<>nil then begin
		act:=L;
		AgregarAtras(act^.sig,dato) 
	end else begin
		new(nuevo); nuevo^.dato:=dato; nuevo^.sig:=nil;
		L:=nuevo;
	end;
end;

procedure MergeAcum(V:TV; var L:listaA);
var minDato, minActual:elemAcum;
begin
	L:=nil;
	Minimo(V,minDato);
	while minDato.cod<>minC do begin
		minActual.cant:=0;
		minActual.cod:=minDato.cod;
		
		while (minDato.cod<>minC) and (minDato.cod=minActual.cod) do begin
			minActual.cant:=minActual.cant+1;
			Minimo(V,minDato);
		end;
		
		AgregarAtras(L,minActual);
	end;
end;

procedure Imprimir2(L:listaA);
begin
	if L<>nil then begin
		writeln('Codigo: ',L^.dato.cod,' | Cant: ',L^.dato.cant);
		Imprimir2(L^.sig);
	end;
end;

var
	V:TV;
	LA:listaA;
begin
	Leer(V);
	Imprimir(V);
	MergeAcum(V,LA);
	Imprimir2(LA);
end.
