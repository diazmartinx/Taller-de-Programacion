program ej2;

type
	TRventa = record
		codigoP: integer;
		fecha: integer;
		cantidad: integer;
	end;
	arbol = ^nodo;
	nodo = record
		dato: TRventa;
		hi: arbol;
		hd: arbol;
	end;
	
	TRtotal = record
		codigoP: integer;
		total: integer;
	end;
	arbolA = ^nodoA;
	nodoA = record
		dato: TRtotal;
		hi: arbolA;
		hd: arbolA;
	end;
		
	
procedure creaArbol(var a:arbol; dato:TRventa);
begin
	if a=nil then begin
		new(a);
		a^.dato:=dato;
		a^.hi:=nil;
		a^.hd:=nil;
	end else if dato.codigoP<a^.dato.codigoP then creaArbol(a^.hi,dato)
	else creaArbol(a^.hd,dato);
end;
	
procedure generarDatos(var a:arbol);
var i:integer; dato:TRventa;
begin
	for i:=0 to 100 do begin
		dato.codigoP:=Random(50);
		dato.fecha:=i;
		dato.cantidad:=i;
		creaArbol(a,dato);
	end;
end;

procedure muestra(a:arbol);
begin
	if a<>nil then begin
		muestra(a^.hi);
		write(a^.dato.codigoP,'(',a^.dato.cantidad,') ');
		muestra(a^.hd);
	end;
end;

procedure crearArbolA(var a:arbolA; dato:TRtotal);
begin
	if a=nil then begin
		new(a);
		a^.dato:=dato;
		a^.hi:=nil;
		a^.hd:=nil;
	end else if dato.codigoP=a^.dato.codigoP then begin
		a^.dato.total:=a^.dato.total+dato.total
	end else if dato.codigoP<a^.dato.codigoP then crearArbolA(a^.hi,dato)
	else crearArbolA(a^.hd,dato);
end;

procedure creaArbolTotal(var aa:arbolA; a:arbol);
var dato:TRtotal;
begin

	if a<>nil then begin
		creaArbolTotal(aa,a^.hi);
		
		dato.codigoP:=a^.dato.codigoP;
		dato.total:=a^.dato.cantidad;
		crearArbolA(aa,dato);
		
		creaArbolTotal(aa,a^.hd);
	end;

end;

function totalNoA(a:arbol; codigo:integer):integer;
begin
	if a=nil then totalNoA:=0
	else if codigo=a^.dato.codigoP then totalNoA:= a^.dato.cantidad + totalNoA(a^.hd,codigo)
	else if codigo<a^.dato.codigoP then totalNoA:=totalNoA(a^.hi,codigo)
	else totalNoA:=totalNoA(a^.hd,codigo);
end;

function totalA(a:arbolA; codigo:integer):integer;
begin
	if a=nil then totalA:=0
	else if codigo=a^.dato.codigoP then totalA:=a^.dato.total
	else if codigo<a^.dato.codigoP then totalA:=totalA(a^.hi,codigo)
	else totalA:=totalA(a^.hd,codigo);
end;

procedure muestra2(a:arbolA);
begin
	if a<>nil then begin
		muestra2(a^.hi);
		write(a^.dato.codigoP,'(',a^.dato.total,') ');
		muestra2(a^.hd);
	end;
end;

var
	a:arbol;
	aa:arbolA;
begin
	a:=nil;
	generarDatos(a);
	muestra(a);writeln;writeln;
	
	aa:=nil;
	creaArbolTotal(aa,a);
	muestra2(aa);writeln;writeln;

	writeln(totalNoA(a,11));
	writeln(totalA(aa,11));
end.
