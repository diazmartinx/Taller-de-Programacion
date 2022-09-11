{
* 2.	Escribir un programa que:
a. Implemente un módulo que lea información de ventas de un comercio. 
* De cada venta se lee código de producto, fecha y cantidad de unidades vendidas. 
* La lectura finaliza con el código de producto 0. Un producto puede estar en más de una venta. Se pide:
* 
i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de producto.
* 
ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por código de producto. 
* Cada nodo del árbol debe contener el código de producto y la cantidad total vendida.
               Nota: El módulo debe retornar los dos árboles.
               * 
b. Implemente un módulo que reciba el árbol generado en i. y un código de producto y retorne la cantidad total de unidades vendidas de ese producto.
c. Implemente un módulo que reciba el árbol generado en ii. y un código de producto y retorne la cantidad total de unidades vendidas de ese producto.
}

program ej2;

type
	TRVenta = record
		codProd: integer;
		fecha: integer;
		cant: integer;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato: TRVenta;
		HI: arbol;
		HD: arbol;
	end;
	
procedure Agregar(var A:arbol; dato:TRVenta);
begin
	if A=nil then begin
		new(A);
		A^.dato:=dato;
		A^.HI:=nil;
		A^.HD:=nil;
	end
	else if dato.codProd < A^.dato.codProd then Agregar(A^.HI, dato)
	else Agregar(A^.HD, dato);
end;

procedure AgregarAcum(var A:arbol; dato:TRVenta);
begin
	if A=nil then begin
		new(A);
		A^.dato:=dato;
		A^.HI:=nil;
		A^.HD:=nil;
	end
	//si es cod es igual, suma cant
	else if dato.codProd = A^.dato.codProd then A^.dato.cant:=A^.dato.cant+dato.cant
	//busca por izq
	else if dato.codProd < A^.dato.codProd then AgregarAcum(A^.HI, dato)
	//bussca por derecha
	else AgregarAcum(A^.HD, dato);
end;
	
procedure GenerarArbol(var A:arbol; var AA:arbol);
var venta:TRVenta;
begin
	writeln('Ingrese codigo de producto (0 fin)');readln(venta.codProd);
	while venta.codProd<>0 do begin
		writeln('Cantidad: ');readln(venta.cant);
		venta.fecha:=0;
		
		Agregar(A, venta);
		AgregarAcum(AA, venta);
		
		writeln('Ingrese codigo de producto (0 fin)');readln(venta.codProd);
	end;
end;

procedure Imprimir(A:arbol);
begin
	if A<>nil then begin
		Imprimir(A^.HI);
		writeln('COD: ',A^.dato.codProd,' CANT: ', A^.dato.cant);
		Imprimir(A^.HD);
	end;
end;

function CantTotalAcum(A:arbol; codigo:integer):integer;
begin
	if A=nil then CantTotalAcum:=0
	else if A^.dato.codProd=codigo then CantTotalAcum:=A^.dato.cant
	else if codigo<A^.dato.codProd then CantTotalAcum:=CantTotalAcum(A^.HI,codigo)
	else CantTotalAcum:=CantTotalAcum(A^.HD,codigo)
end;

function CantTotalNoAcum(A:arbol; codigo:integer):integer;
begin
	if A=nil then CantTotalNoAcum:=0
	else if A^.dato.codProd=codigo then CantTotalNoAcum:=A^.dato.cant+CantTotalNoAcum(A^.HD,codigo)
	else if A^.dato.codProd<codigo then CantTotalNoAcum:=0+CantTotalNoAcum(A^.HD,codigo)
	else CantTotalNoAcum:=0+CantTotalNoAcum(A^.HI,codigo)
end;

var
	A,AA:arbol;
	
begin
	GenerarArbol(A, AA);
	Imprimir(A);writeln;
	Imprimir(AA);writeln;
	
	writeln('Cantidad Vendida(1): ',CantTotalAcum(AA,1));
	writeln('Cantidad Vendida(1): ',CantTotalNoAcum(A,1));
end.
