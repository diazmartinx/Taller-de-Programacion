program ej3;

const
	posterior = 2010;

type
	alumno = record
		legajo: integer;
		dni: integer;
		anio: integer;
	end;
	arbol = ^nodo;
	nodo = record
		dato: alumno;
		hi: arbol;
		hd: arbol;
	end;
	
procedure creaA(var a:arbol; dato:alumno);
begin
	if a=nil then begin
		new(a);
		a^.dato:=dato;
		a^.hi:=nil;
		a^.hd:=nil;
	end else if dato.legajo<a^.dato.legajo then creaA(a^.hi,dato)
	else creaA(a^.hd,dato)
end;

procedure generaDato(var a:arbol);
var i:integer; dato:alumno;
begin
	for i:=1 to 200 do begin
		dato.legajo:=i*2+1;
		dato.dni:=i;
		dato.anio:=Random(50)+1990;
		
		if dato.anio>posterior then creaA(a,dato);
	end;
end;

procedure muestra(a:arbol);
begin
	if a<>nil then begin
		muestra(a^.hi);
		write(a^.dato.legajo,' ');
		muestra(a^.hd);
	end;
end;

procedure inferior(a:arbol; x:integer);
begin
	if a<>nil then
		if x<=a^.dato.legajo then inferior(a^.hi,x)
		else begin
			with a^.dato do writeln('L: ',legajo,' DNI: ',dni,' ANIO: ',anio);
			inferior(a^.hi,x);
			inferior(a^.hd,x);
		end;
end;

procedure entre2(a:arbol;min,max:integer);
begin
	if a<>nil then
	 if a^.dato.legajo < min then entre2(a^.hd,min,max)
	 else if a^.dato.legajo > max then entre2(a^.hi,min,max)
	 else begin
		with a^.dato do writeln('L: ',legajo,' DNI: ',dni,' ANIO: ',anio);
		entre2(a^.hi,min,max);
		entre2(a^.hd,min,max);
	 end;
end;

procedure getMax(a:arbol; var max:integer);
begin
	if a<>nil then begin
		getMax(a^.hi,max);
		
		if a^.dato.dni>max then max:=a^.dato.dni;
		
		getMax(a^.hd,max);
	end;
end;

function impares(a:arbol):integer;
begin
	if a=nil then impares:=0
	else if (a^.dato.legajo mod 2 = 0) then impares:= 0 + impares(a^.hi) + impares(a^.hd)
	else impares:= 1 + impares(a^.hi) + impares(a^.hd);
end;

var a:arbol; max:integer;
begin
	Randomize;
	a:=nil;
	generaDato(a);
	
	
	max:=-1;
	getMax(a,max);
	writeln(max);
	writeln(impares(a));
	
	inferior(a,10);writeln;writeln;
	entre2(a,10,20);writeln;writeln;
end.
