{
* 2.	Un cine posee la lista de películas que proyectará durante el mes de octubre. 
* De cada película se conoce: código de película, código de género 
* (1: acción, 2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélica, 7: documental y 8: terror) y puntaje promedio otorgado por las críticas. 
* Implementar un programa que contenga:
* 
a.	Un módulo que lea los datos de películas y los almacene ordenados por código de película y agrupados por código de género, 
* en una estructura de datos adecuada. La lectura finaliza cuando se lee el código de película -1. 
* 
b.	Un módulo que reciba la estructura generada en el punto a y retorne una estructura de datos donde estén todas las 
* películas almacenadas ordenadas por código de película.
}

program ej2;

const dimF=8; valorGrande=9999;

type
	rangoGenero=1..dimF;
	pelicula=record
		cod:integer;
		codGen:rangoGenero;
		prom:integer;
	end;
	
	lista=^nodo;
	nodo=record
		dato: pelicula;
		sig: lista;
	end;
	
	TV = array [rangoGenero] of lista;

procedure InicializaVector(var V:TV);
var i:rangoGenero;
begin
	for i:=1 to dimF do V[i]:=nil;
end;

procedure InsertarOrdenado(var V:TV; dato:pelicula);
var nuevo, act, ant:lista;
begin
	new(nuevo);
	nuevo^.dato:=dato;
	act:=V[dato.codGen];
	ant:=V[dato.codGen];
	
	while (act<>nil) and (act^.dato.cod<dato.cod) do begin
		ant:=act;
		act:=act^.sig;
	end;
	if ant=act then V[dato.codGen]:=nuevo
	else ant^.sig:=nuevo;
	nuevo^.sig:=act;
end;

procedure LeerPeliculas(var V:TV);
var peli:pelicula;
begin
	InicializaVector(V);
	writeln('Codigo: (-1 fin))');readln(peli.cod);
	while peli.cod<>-1 do begin
		peli.codGen:=random(8)+1;
		peli.prom:=random(10)+1;
		
		InsertarOrdenado(V, peli);
		
		writeln('Codigo: (-1 fin))');readln(peli.cod);
	end;
end;

procedure ImprimirLista(L:lista);
begin
	if L<>nil then begin
		writeln('Codigo: ',L^.dato.cod,' | Genero: ',L^.dato.codGen,' | Prom: ',L^.dato.prom);
		ImprimirLista(L^.sig);
	end;
end;
procedure Imprimir(V:TV);
var i:integer;
begin
	for i:=1 to dimF do begin
		writeln('Genero: ',i);
		ImprimirLista(V[i]);
		writeln;
	end;
end;

procedure Minimo(var V:TV; var minCod:pelicula);
var i, minIndice:rangoGenero;
begin
	minCod.cod:=valorGrande;
	for i:=1 to dimF do begin
		if V[i]<>nil then
			if V[i]^.dato.cod <= minCod.cod then begin
				minCod:=V[i]^.dato;
				minIndice:=i;
			end;
	end;
	if minCod.cod<>valorGrande then V[minIndice]:=V[minIndice]^.sig;
end;

procedure Merge(V:TV; var L:lista);

	
	
	procedure AgregarAtras(var L:lista; dato:pelicula);
	var nuevo, act:lista;
	begin
		if L<>nil then begin
			act:=L;
			if (act^.dato.codGen<>dato.codGen) or (act^.dato.cod<>dato.cod) then AgregarAtras(act^.sig,dato)
			else act^.dato.prom:=act^.dato.prom+dato.prom;
		end else begin
			new(nuevo); nuevo^.dato:=dato; nuevo^.sig:=nil;
			L:=nuevo;
		end;
	end;

var minCod:pelicula;
begin
	L:=nil;
	Minimo(V, minCod);
	while minCod.cod<>valorGrande do begin
		AgregarAtras(L,minCod);
		Minimo(V, minCod);
	end;
end;

var
	V:TV;
	L:lista;
	
begin
	LeerPeliculas(V);
	Imprimir(V);writeln;
	Merge(V,L);
	ImprimirLista(L);
end.
