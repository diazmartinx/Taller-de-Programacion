program teatro;

const
	dimf=7;
	
type
	entrada = record
		dia: 1..dimf;
		cod: integer;
		asiento: integer;
		monto: real;
	end;
	lista = ^nodo;
	nodo = record
		dato: entrada;
		sig: lista;
	end;
	
	TV = array[1..dimf] of lista;
	
	total = record
		cod: integer;
		cant: integer;
	end;
	listaT = ^nodoT;
	nodoT = record
		dato: total;
		sig: listaT;
	end;
	
	
procedure insertaOrdenado(var pri:lista; dato:entrada);
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
var i:integer; dato:entrada;
begin
	Randomize;
	for i:=1 to dimf do V[i]:=nil;
	for i:=1 to 100 do begin
		dato.dia:=random(7)+1;
		dato.cod:=random(5);
		dato.asiento:=i;
		dato.monto:=500;
		insertaOrdenado(V[dato.dia],dato);
	end;
end;

procedure imprime(l:lista);
begin
	if l<>nil then begin
		write(l^.dato.cod,' ');
		imprime(l^.sig);
	end else writeln;
end;

procedure imprimeT(l:listaT);
begin
	if l<>nil then begin
		write(l^.dato.cod,'(',l^.dato.cant,') ');
		imprimeT(l^.sig);
	end else writeln;
end;

procedure agregaAtras(var pri:listaT; dato:total);
begin
	if pri=nil then begin
		new(pri);
		pri^.dato:=dato;
		pri^.sig:=nil;
	end else agregaAtras(pri^.sig,dato);
end;

procedure minimo(var V:TV; var min:total);
var pos,i:integer;
begin
	min.cod:=9999;
	pos:=-1;
	for i:=1 to dimf do
		if (V[i]<>nil) and (V[i]^.dato.cod <= min.cod) then begin
			pos:=i;
			min.cod:=V[i]^.dato.cod;
		end;
	if pos<>-1 then V[pos]:=V[pos]^.sig;
end;

procedure mergeA(var V:TV; var l:listaT);
var min:total; nuevo:total;
begin
	l:=nil;
	minimo(V,min);
	while min.cod<>9999 do begin
		nuevo.cant:=0;
		nuevo.cod:=min.cod;
		while (min.cod<>9999) and (min.cod=nuevo.cod) do begin
			nuevo.cant:=nuevo.cant+1;
			minimo(V,min);
		end;
		
		agregaAtras(l,nuevo);
	end;
end;

var V:TV; i:integer; l:listaT;

begin
	generaDatos(V);
	for i:=1 to dimf do imprime(V[i]);
	
	mergeA(V,l);
	imprimeT(l);
end.
