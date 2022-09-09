{
1.- Implementar un programa que procese la información de las ventas de productos de un comercio (como máximo 20). 
De cada venta se conoce código del producto (entre 1 y 15) y cantidad vendida (como máximo 99 unidades).
* El ingreso de las ventas finaliza con el código 0 (no se procesa).
a. Almacenar la información de las ventas en un vector. El código debe generarse automáticamente (random) y la cantidad se debe leer. 
b. Mostrar el contenido del vector resultante.
c. Ordenar el vector de ventas por código.
d. Mostrar el contenido del vector resultante.
e. Eliminar del vector ordenado las ventas con código de producto entre dos valores que se ingresan como parámetros. 
f. Mostrar el contenido del vector resultante.
g. Generar una lista ordenada por código de producto de menor a mayor a partir del vector resultante del inciso e., sólo para los códigos pares.
h. Mostrar la lista resultante.
}
program ej1;

const
	dimF = 20;
	
type
	rango1 = 0..15;
	rango2 = 1..99;
	indice = 0..dimF; //indice
	
	TRventa = 		 record
		codProd:	 rango1;
		cantVendida: rango2;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: TRventa;
		sig: lista;
	end;
	
	TV = array [1..dimF] of TRventa;

procedure LeeVentas(var V:TV; var dimL:indice);
var
	venta:TRventa;
begin
	dimL := 0;
	writeln('Ingresar venta(1), Finalizar(0))');readln(venta.codProd);
	while venta.codProd <> 0 do begin
		venta.codProd := random(15) + 1; // (0 a 14 random) + 1 = 1..15
		writeln('Cantidad: ');readln(venta.cantVendida);
		dimL := dimL + 1;
		V[dimL] := venta;
		writeln('Ingresar venta(1), Finalizar(0))');readln(venta.codProd);
	end;	
end;

procedure ImprimeV(V:TV; dimL:indice);
var
	i:indice;
begin
	for i:=1 to dimL do
		writeln(V[i].codProd,' | ', V[i].cantVendida);
end;

procedure Ordenar(var V:TV; dimL:indice);
var
	i, j, p: indice;
	item: TRventa;
begin
	for i:=1 to dimL-1 do begin // Busca el minimo y guarda en p la pos.
		p := i;
		for j:=i+1 to dimL do
			if V[j].codProd < V[p].codProd then
				p := j;
		
		// Intercambia V[i] y V[p].
		item := V[p];
		V[p] := V[i];
		V[i] := item;
	end;
end;

procedure Eliminar(var V:TV; var dimL:indice; valMin,valMax:integer);

function MinDesde(V:TV; dimL:indice; x:integer):indice;
// Busca el valor minimo mayor a x
var i:indice;
begin
	i := 1;
	while (V[i].codProd<=x) and (i<=dimL) do begin
		i := i + 1;
	end;
	
	if i>dimL then
		//No lo encontro
		minDesde := 0
	else
		//Lo encontro -> devuelve la pos anterior
		MinDesde := i - 1;
end;

var corrimiento, i:indice;
begin
	// busca max desde derecha a izq y si es mayor, modifica su dimL
	while (dimL>0) and (V[dimL].codProd>=valMax) do
		dimL := dimL - 1;	
	
	corrimiento := MinDesde(V, dimL, valMin);
	
	if corrimiento > 0 then begin
		for i:=corrimiento to dimL do
			V[i - corrimiento + 1] := V[i + 1];
		dimL := dimL - corrimiento;	
	end;
end;

procedure GeneraLista(V:TV; dimL:indice; var L:lista);
//Recorre el vector de forma inversa y si cumple la condicion agrega adelante en la lista

procedure AgregarAdelante(var L:lista; info:TRventa);
var aux: lista;
begin
	new(aux);
	aux^.dato := info;
	aux^.sig := L;
	L := aux;
end;

var i:indice;
begin
	for i:=dimL downto 1 do
		//si el codigo es par
		if (V[i].codProd mod 2 = 0) then
			//agrega nodo
			AgregarAdelante(L, V[i]);
end;

procedure ImprimirLista(L:lista);
var actual: lista;
begin
	actual := L;
	while (actual<>nil) do begin
		writeln(actual^.dato.codProd);
		actual := actual^.sig;
	end;
end;
	
var
	V: TV;
	dimL: indice;
	L: lista;
begin
	LeeVentas(V, dimL);
	ImprimeV(V, dimL);
	writeln(' --------- ORDENADO ------- ');
	Ordenar(V, dimL);
	ImprimeV(V, dimL);
	
	writeln(' --------- Eliminado ------- ');
	Eliminar(V, dimL, 1, 15);
	ImprimeV(V, dimL);
	
	writeln(' -------- LISTA ----------- ');
	L := nil;
	GeneraLista(V, dimL, L);
	ImprimirLista(L);
end.
