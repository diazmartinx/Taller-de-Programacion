program finalarbol;

type
	alumno = record
		nombre : integer;
		dni: integer;
		puntaje: real;
	end;
	arbol = ^nodo;
	nodo = record
		dato: alumno;
		hi: arbol;
		hd: arbol;
	end;
	
	lista = ^nodoL;
	nodoL = record
		dato: alumno;
		sig: lista;
	end;
	
procedure insertar(var a:arbol; dato:alumno);
begin
	if a=nil then begin
		new(a);
		a^.dato:=dato;
		a^.hi:=nil;
		a^.hd:=nil;
	end else if dato.puntaje < a^.dato.puntaje then insertar(a^.hi,dato)
	else insertar(a^.hd,dato);
end;
	
procedure generaDatos(var a:arbol);
var i:integer; dato:alumno;
begin
	for i:=1 to 100 do begin
		dato.nombre:=i;
		dato.dni:=random(1000);;
		dato.puntaje:=i-1;
		insertar(a,dato);
	end;
end;

procedure dniMin(a:arbol; dni:integer; var puntaje:real);
begin

	if a<>nil then begin
		dniMin(a^.hi,dni,puntaje);
		
		if a^.dato.dni < dni then begin
			dni:=a^.dato.dni;
			puntaje:=a^.dato.puntaje;
		end;
		
		dniMin(a^.hd,dni,puntaje);
	end;
end;

procedure insertaAtras(var l:lista; dato:alumno);
begin
	if l=nil then begin
		new(l);
		l^.dato:=dato;
		l^.sig:=nil;
	end else insertaAtras(l^.sig,dato);
end;

procedure entre2(a:arbol;min,max:real; var l:lista);
begin
	if a<>nil then
		if a^.dato.puntaje <= min then entre2(a^.hd,min,max,l)
		else if a^.dato.puntaje >= max then entre2(a^.hi,min,max,l)
		else begin
			insertaAtras(l,a^.dato);
			entre2(a^.hd,min,max,l);
			entre2(a^.hi,min,max,l);
		end;
end;

procedure imprimeL(l:lista);
begin
	if l<>nil then begin
		write(l^.dato.puntaje:2:2,' ');
		imprimeL(l^.sig);
	end;
end;

var a:arbol; puntaje:real; l:lista;
begin
	Randomize;
	generaDatos(a);
	
	dniMin(a,9999,puntaje);
	writeln(puntaje:4:4);
	
	l:=nil;
	entre2(a,20.5,50.5,l);
	imprimeL(l);
end.
