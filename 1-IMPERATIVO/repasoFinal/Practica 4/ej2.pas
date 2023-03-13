program cine;

const
dimf=8;

type
	pelicula = record
		cod: integer;
		gen: 1..dimf;
		prom: real;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: pelicula;
		sig: lista;
	end;
	
	TV = array[1..dimf] of lista;
	
	
procedure insertaOrdenado(var pri:lista; dato:pelicula);
var ant, act, nue:lista;
begin
	new(nue);
	nue^.dato:=dato;
	ant:=pri;
	act:=pri;
	
	while (act<>nil) and (act^.dato.cod < dato.cod) do begin
		ant:=act;
		act:=act^.sig;
	end;
	
	if ant=act then pri:=nue
	else ant^.sig:=nue;
	nue^.sig:=act;
end;


procedure generaDatos(var V:TV);
var i:integer; dato:pelicula;
begin
	Randomize;
	for i:=1 to dimf do V[i]:=nil;
	for i:=1 to 20 do begin
		dato.cod:=random(100);
		dato.gen:=random(8)+1;
		dato.prom:=random(6);
		insertaOrdenado(V[dato.gen],dato);
	end;
end;

procedure imprime(l:lista);
begin
	if l<>nil then begin
		write(l^.dato.cod,' ');
		imprime(l^.sig);
	end;
end;

procedure agregaFinal(var l:lista; dato:pelicula);
begin
	if l=nil then begin
		new(l);
		l^.dato:=dato;
		l^.sig:=nil;
	end else agregaFinal(l^.sig, dato);
end;

procedure minimo(var V:TV; var min:lista);
var i,posMin:integer;
begin
	min^.dato.cod := 9999;
	posMin:=-1;
	for i:=1 to dimf do
		if (V[i]<>nil) and (V[i]^.dato.cod < min^.dato.cod) then begin
			posMin:=i;
			min:=V[i];
		end; 
	if posMin<>-1 then V[posMin]:=V[posMin]^.sig;
end;

procedure merge(V:TV; var l:lista);
var min:lista;
begin
	l:=nil;
	minimo(V,min);
	while (min^.dato.cod<>9999) do begin
		agregaFinal(l,min^.dato);
		minimo(V,min);
	end;
end;

var V:TV; i:integer; l:lista;
begin
	generaDatos(V);
	
	for i:=1 to dimf do begin
		imprime(V[i]);
		writeln;
	end;
	
	merge(V,l);
	imprime(l);
	
end.
		
