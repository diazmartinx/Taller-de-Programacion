{
* 3.- Un supermercado requiere el procesamiento de sus productos. 
* De cada producto se conoce código, rubro (1..10), stock y precio unitario. Se pide:
* 
a)	Generar una estructura adecuada que permita agrupar los productos por rubro. 
* A su vez, para cada rubro, se requiere que la búsqueda de un producto por código sea lo más eficiente posible. 
* La lectura finaliza con el código de producto igual a -1..
* 
b)	Implementar un módulo que reciba la estructura generada en a), 
* un rubro y un código de producto y retorne si dicho código existe o no para ese rubro.
* 
c)	Implementar un módulo que reciba la estructura generada en a), 
* y retorne, para cada rubro, el código y stock del producto con mayor código.
* 
d)	Implementar un módulo que reciba la estructura generada en a), 
* dos códigos y retorne, para cada rubro, la cantidad de productos con códigos entre los dos valores ingresados.
}

program ej3;

const dimF=10;

type
	rango=1..dimF;
	producto=record
		cod: integer;
		rubro: rango;
		stock: integer;
		precio: integer;	
	end;
	
	arbol=^nodo;
	nodo=record
		dato: producto;
		hi: arbol;
		hd: arbol;
	end;
	
	TV=array[rango] of arbol;

procedure LeerProducto(var dato:producto);
begin
	dato.cod:=random(30);
	dato.rubro:=random(10)+1;
	dato.stock:=random(10);
	dato.precio:=random(30);
end;

procedure Insertar(var A:arbol; dato:producto);
begin
	if A=nil then begin
		new(A);
		A^.dato:=dato;
		A^.hi:=nil;
		A^.hd:=nil;
	end else if dato.cod>A^.dato.cod then Insertar(A^.hd,dato)
	else if dato.cod<A^.dato.cod then Insertar(A^.hi,dato)
	else writeln(dato.cod,' -> Error: El codigo de producto ya existe');
end;
	
procedure Generar(var V:TV; cant:integer);
var dato:producto; i:integer;
begin
	for i:=1 to cant do begin
		LeerProducto(dato);
		Insertar(V[dato.rubro],dato);
	end;
end;

procedure Mostrar(A:arbol);
begin
	if A<>nil then begin
		Mostrar(A^.hi);
		with A^.dato do
			writeln('Codigo: ',cod,' | Precio: ',precio);
		Mostrar(A^.hd);
	end;
end;

procedure MostrarVector(V:TV);
var i:integer;
begin
	for i:=1 to dimF do begin
		writeln(' -- -- -- Rubro: ',i);
		Mostrar(V[i]);
	end;
end;

function Esta(A:arbol; cod:integer):boolean;
begin
	if A=nil then Esta:=false
	else if A^.dato.cod=cod then Esta:=true
	else if cod>A^.dato.cod then Esta:=Esta(A^.hd,cod)
	else Esta:=Esta(A^.hi,cod);
end;

function Max(A:arbol):producto;
begin
	if A^.hd<>nil then Max:=Max(A^.hd)
	else Max:=A^.dato;
end;

procedure MayorRubro(V:TV);
var i:integer; mayor:producto;
begin
	for i:=1 to dimF do begin
		mayor:=Max(V[i]);	
		writeln('Rubro: ',i,' | Codigo: ',mayor.cod,' | Stock: ',mayor.stock);
	end;
end;

function Cantidad(A:arbol; min,max:integer):integer;
begin
	if A=nil then Cantidad:=0
	else if A^.dato.cod>=max then Cantidad:= 0 + Cantidad(A^.hi,min,max)
	else if A^.dato.cod<=min then Cantidad:= 0 + Cantidad(A^.hd,min,max)
	else Cantidad:= 1 + Cantidad(A^.hi,min,max) + Cantidad(A^.hd,min,max);
end;

procedure Entre2(V:TV);
var i,min,max,cant:integer;
begin
	min:=10;max:=20;
	for i:=1 to dimF do begin
		cant:=Cantidad(V[i],min,max);
		writeln('Rubro: ',i,' | Cantidad: ',cant);	
	end;
end;
	
var
	V:TV;
begin
	Randomize;
	Generar(V,100);
	MostrarVector(V);writeln;
	writeln('Esta en arbol: ',Esta(V[10],5));writeln;
	MayorRubro(V);writeln;
	Entre2(V);
end.
