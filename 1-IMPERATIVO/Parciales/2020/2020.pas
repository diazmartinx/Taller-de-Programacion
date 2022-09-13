{21) Se lee información acerca de las ventas de productos realizadas en las 5 sucursales 
de una empresa. Cada sucursal realizó a lo sumo 200 ventas. De cada venta se conoce el
código de producto, cantidad vendida y monto total de la venta. Las ventas de cada 
sucursal se leen de manera consecutiva y ordenadas por código de producto. La lectura 
por cada sucursal finaliza al completar las 200 ventas o cuando se lee el código de 
producto -1, el cual no se procesa. 
* 
* Implementar un programa para que a partir de la 
información leída, resuelva los siguientes ítems: 
a)Utilizando la técnica de merge o merge acumulador según corresponda, generar una 
lista que contenga la cantidad total vendida para cada código de producto, ordenada por 
código de producto. }

program p2020;

const 
	maxV=200;
	dimF=5;

type
	rango=1..dimF;
	indice=0..dimF;
	venta=record
		cod: integer;
		cant: integer;
		monto: integer;
	end;
	
	lista=^nodo;
	nodo=record
		dato:venta;
		sig:lista;
	end;
	
	TV=array[rango]of lista;
		
	ventaA=record
		cod: integer;
		cant: integer;
	end;
		
	listaA=^nodoA;
	nodoA=record
		dato:ventaA;
		sig:listaA;
	end;

procedure InsertarOrdenado(var L:lista; dato:venta);
var nuevo, act, ant:lista;
begin
	new(nuevo);
	nuevo^.dato:=dato;
	act:=L;
	ant:=L;
	
	while (act<>nil) and (act^.dato.cod<dato.cod) do begin
		ant:=act;
		act:=act^.sig;
	end;
	if ant=act then L:=nuevo
	else ant^.sig:=nuevo;
	nuevo^.sig:=act;
end;

procedure Generar(var V:TV);
var dato:venta; i:rango; total:integer;
begin
	for i:=1 to dimF do begin
		dato.cod:=random(5);
		total:=0;
		while (total<200) and (dato.cod<>-1) do begin
			total:=total+1;
			dato.cant:=random(10)+1;
			dato.monto:=random(100)+1;
			
			InsertarOrdenado(V[i],dato);
			
			dato.cod:=random(5)-1;
		end;
	end;
end;

procedure MostrarLista(L:lista);
begin
	while L<>nil do begin
		writeln('Codigo: ',L^.dato.cod,' | Cantidad: ',L^.dato.cant,' | Monto: ',L^.dato.monto);
		L:=L^.sig;
	end;
end;

procedure MostrarVector(V:TV);
var i:rango;
begin
	for i:=1 to dimF do begin
		writeln('Sucursal ',i);
		MostrarLista(V[i]);writeln;
	end;
end;

procedure MergeAcum(V:TV; var L:listaA);
const BIG=9999;

	procedure Minimo(var V:TV; var minimo:ventaA);
	var minimoI,i:integer;
	begin
		//Busco el minimo en el vector
		minimo.cod:=BIG;
		for i:=1 to dimF do begin
			if (V[i]<>nil) and (V[i]^.dato.cod<minimo.cod) then begin
				minimo.cod:=V[i]^.dato.cod;
				minimo.cant:=V[i]^.dato.cant;
				minimoI:=i;
			end;
		end;
		//Avanzo al elemento siguiente en la lista
		if minimo.cod<>BIG then V[minimoI]:=V[minimoI]^.sig;
	end;
	
	procedure AgregarAtras(var L,ult:listaA; dato:VentaA);
	var nuevo:listaA;
	begin
		new(nuevo);nuevo^.dato:=dato;nuevo^.sig:=nil;
		if L<>nil then ult^.sig:=nuevo
		else L:=nuevo;
		ult:=nuevo;
	end;

var min,actual:ventaA; ult:listaA;
begin 
	L:=nil;
	Minimo(V,min);
	while min.cod<>BIG do begin
		actual.cod:=min.cod;
		actual.cant:=0;
		while (min.cod<>BIG) and (min.cod=actual.cod) do begin
			actual.cant:=actual.cant+min.cant;
			Minimo(V,min);
		end;
		AgregarAtras(L,ult,actual);
	end;
end;

procedure MostrarLista(L:listaA);
begin
	while L<>nil do begin
		writeln('Codigo: ',L^.dato.cod,' | Cantidad: ',L^.dato.cant);
		L:=L^.sig;
	end;
end;

var
	V:TV;
	LA:listaA;
begin
	Randomize;
	Generar(V);
	MostrarVector(V);writeln;
	
	MergeAcum(V,LA);
	MostrarLista(LA);
end.
	
	
