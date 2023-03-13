program finalimp;

const dimf=5; sectores=50; empleados=20; totalMensajes = 100;

type
	llamada = record
		nivel: 1..dimf;
		sector: 1..sectores;
		afectados: 1..empleados;
	end;
	lista = ^nodo;
	nodo = record
		dato: llamada;
		sig: lista;
	end;
	
	TV = array[1..dimf] of lista;
	
	total = record
		sector: 1..sectores+1;
		cant: integer;
	end;
	listaT = ^nodoT;
	nodoT = record
		dato: total;
		sig: listaT;
	end;
	
	
procedure insertaOrdenado(var pri:lista; dato:llamada);
var ant, act, nue:lista;
begin
	new(nue);
	nue^.dato:=dato;
	ant:=pri;
	act:=pri;
	
	while (act<>nil) and (act^.dato.sector < dato.sector) do begin
		ant:=act;
		act:=act^.sig;
	end;
	
	if act=ant then pri:=nue
	else ant^.sig:=nue;
	nue^.sig:=act;
end;
	
procedure generaDatos(var V:TV);
var i:integer; dato:llamada;
begin
	for i:=1 to dimf do V[i]:=nil;
	for i:=1 to totalMensajes do begin
		dato.nivel:=random(dimf)+1;
		dato.sector:=random(sectores)+1;
		dato.afectados:=random(empleados)+1;
		insertaOrdenado(V[dato.nivel],dato);
	end;
end;

procedure imprime(l:lista);
begin
	if l<>nil then begin
		write(l^.dato.sector,' ');
		imprime(l^.sig);
	end else writeln;
end;

procedure imprimeT(l:listaT);
begin
	if l<>nil then begin
		write(l^.dato.sector,'(',l^.dato.cant,') ');
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
	min.sector:=sectores+1;
	pos:=-1;
	for i:=1 to dimf do
		if (V[i]<>nil) and (V[i]^.dato.sector<min.sector) then begin
			pos:=i;
			min.sector:=V[i]^.dato.sector;
		end;
	if pos<>-1 then begin
		min.cant:=V[pos]^.dato.afectados;
		V[pos]:=V[pos]^.sig;
	end;
end;

procedure mergeA(V:TV; var l:listaT);
var min, nuevo:total;
begin
	l:=nil;
	minimo(V,min);
	
	while min.sector<>sectores+1 do begin
		
		nuevo.sector:=min.sector;
		nuevo.cant:=0;

		while (min.sector<>sectores+1) and (min.sector=nuevo.sector) do begin
			nuevo.cant:=nuevo.cant+min.cant;
			minimo(V,min);
		end;

		agregaAtras(l,nuevo);
	end;

end;

procedure max(lt:listaT; cant:integer; var sector:integer);
begin
	if lt<>nil then begin
		if lt^.dato.cant>cant then begin
			cant:=lt^.dato.cant;
			sector:=lt^.dato.sector;
		end;
		max(lt^.sig,cant,sector);
	end
end;



var V:TV; i:integer; lt:listaT; sectorMax:integer;
begin
	Randomize;
	generaDatos(V);
	
	for i:=1 to dimf do imprime(V[i]);
	
	mergeA(V,lt);
	imprimeT(lt);
	
	max(lt,-1,sectorMax);
	writeln('SectorMax: ',sectorMax);
end.
		
