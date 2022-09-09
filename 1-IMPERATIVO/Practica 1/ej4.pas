{
4.- Una librería requiere el procesamiento de la información de sus productos. 
* De cada producto se conoce el código del producto, código de rubro (del 1 al 8) y precio. 
Implementar un programa modularizado que:
a. Lea los datos de los productos y los almacene ordenados por código de producto y agrupados por rubro, en una estructura de datos adecuada. 
* El ingreso de los productos finaliza cuando se lee el precio 0.
b. Una vez almacenados, muestre los códigos de los productos pertenecientes a cada rubro.
c. Genere un vector (de a lo sumo 30 elementos) con los productos del rubro 3. 
* Considerar que puede haber más o menos de 30 productos del rubro 3. 
* Si la cantidad de productos del rubro 3 es mayor a 30, almacenar los primeros 30 que están en la lista e ignore el resto. 
d. Ordene, por precio, los elementos del vector generado en b) utilizando alguno de los dos métodos vistos en la teoría. 
e. Muestre los precios del vector ordenado.
}

program ej4;

const
	dimF = 8;
	maxProd = 30;

type
	indice = 0..dimF;
	codRub = 1..dimF;
	TRproducto = record
		codProd: integer;
		codRub: codRub;
		precio: real;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: TRproducto;
		sig: lista;
	end;
	
	TVL = array [codRub] of lista;
	TVR3 = array [1..maxProd] of TRproducto;
	dimLTVR3 = 0..maxProd;


{
a) * Inicializar Vector de Listas 
* Leer Product en TRproducto, 
* almacenar en una lista ordenada, 
* agrupar en en array de 1..8 segun codRub
}
procedure AlmacenarOrdenado(var V:TVL; dato:TRproducto);
var actual,nuevo,ant:lista;
begin
	new(nuevo);
	nuevo^.dato:=dato;
	nuevo^.sig:=nil;
	
	actual:=V[dato.codRub];
	ant:=V[dato.codRub];
	
	while (actual<>nil) and (actual^.dato.codProd<dato.codProd) do begin
		ant:=actual;
		actual:=actual^.sig;
	end;
	
	if (ant = actual) then // si esta vacia
		V[dato.codRub]:=nuevo
	else
		ant^.sig:=nuevo;
	nuevo^.sig:=actual;
end;

procedure inicializarVecListas(var V:TVL);
var i:integer;
begin
    for i:= 1 to dimF do begin
        V[i]:=nil;
    end;  
end;

procedure LeerProducto(var V:TVL);
var prod:TRproducto;
begin
	inicializarVecListas(V);
	writeln('Ingrese precio de producto: (0 para finalizar)');
	readln(prod.precio);
	while prod.precio <> 0 do begin
		writeln('Codigo: ');readln(prod.codProd);
		writeln('Rubro: ');readln(prod.codRub);
		
		AlmacenarOrdenado(V, prod);
		
		writeln('Ingrese precio de producto: (0 para finalizar)');
		readln(prod.precio);
	end;
end;

procedure ImprimeLista(nodo:lista);
begin
	while nodo<>nil do begin
		writeln(nodo^.dato.codProd);
		nodo:=nodo^.sig;
	end;
end; 

procedure MuestraV(V:TVL);
var i:indice;
begin
	for i:=1 to dimF do begin
		if V[i]<>nil then begin
			writeln('Rubro: ',V[i]^.dato.codRub);
			ImprimeLista(V[i]);
			writeln('-------------------------');
		end;
	end;
end;

procedure GenerarV(var V:TVR3; var dimL:dimLTVR3; VL:TVL; rubro:codRub);
var pri:lista;
begin
	pri:=VL[rubro]; dimL:=0;
	while (pri<>nil) and (dimL<30) do begin
		dimL:=dimL+1;
		V[dimL]:=pri^.dato;
		pri:=pri^.sig;
	end;
end;

procedure Ordenar(var V:TVR3; dimL:dimLTVR3);
var i,j,p:dimLTVR3; item:TRproducto;
begin
	for i:=1 to dimL-1 do begin
		p:=i;
		for j:=i+1 to dimL do
			if V[p].precio > V[j].precio then
				p:=j;
		
		item:=V[i];
		V[i]:=V[p];
		V[p]:=item;
	end;
end;

procedure MuestraVOrd(V:TVR3; dimL:dimLTVR3);
var i:dimLTVR3;
begin
	writeln('Ordenado ----');
	for i:=1 to dimL do begin
		writeln(V[i].precio:2:2);
	end;
end;

var
	VL:TVL;
	V:TVR3;
	dimL:dimLTVR3;

begin
	LeerProducto(VL);
	MuestraV(VL);
	GenerarV(V,dimL,VL,1);
	Ordenar(V,dimL);
	MuestraVOrd(V,dimL);
end.
