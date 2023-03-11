program repaso1;

type
	st32 = 0..32;
	socio = record
		numero: integer;
		nombre: st32;
		edad: integer;
	end;
	arbol = ^nodo;
	nodo = record
		dato: socio;
		hi: arbol;
		hd: arbol;
	end;

procedure InsertaArbol(var A:arbol; S:socio);
begin
	if A=nil then begin
		new(A);
		A^.dato:=S;
		A^.hi:=nil;
		A^.hd:=nil;
	end
		else
			if S.numero < A^.dato.numero then InsertaArbol(A^.hi,S)
			else InsertaArbol(A^.hd,S);
end;
	
procedure LeeSocio(var A:arbol);
var
	S:socio;
begin
	writeln('numero de socio:');readln(S.numero);
	while S.numero<>0 do begin
		//writeln('Nombre:');readln(S.nombre);
		//writeln('Edad:');readln(S.edad);
		S.nombre:=5;
		S.edad:=5;
		InsertaArbol(A,S);
		writeln('numero de socio:');readln(S.numero);
	end
end;
	
procedure muestra(A:arbol);
begin
	if A<>nil then begin		
		muestra(A^.hi);	
		
		muestra(A^.hd);	
		writeln(A^.dato.numero);
	end;
end;

function Max(A:arbol):integer;
begin
	if A^.hd=nil then
		Max := A^.dato.numero
	else
		Max := Max(A^.hd);
end;

function Min(A:arbol):integer;
begin
	if A^.hi=nil then
		Min := A^.dato.numero
	else
		Min := Min(A^.hi);
end;
	
function Buscar(A:arbol; x:integer):boolean;
begin
	if A=nil then Buscar:=false
	else if x<A^.dato.numero then Buscar:=Buscar(A^.hi,x)
	else if x>A^.dato.numero then Buscar:=Buscar(A^.hd,x)
	else Buscar:=true;
end;

function BuscarNombre(A:arbol; x:st32):boolean;
begin
	if A=nil then BuscarNombre:=false
	else if A^.dato.nombre=x then BuscarNombre:=true
	else if A^.hi<>nil then BuscarNombre:=BuscarNombre(A^.hi,x)
	else BuscarNombre:=BuscarNombre(A^.hd,x);
end;

function Rango(A:arbol; min,max:integer):integer;
begin
	if A=nil then Rango:=0
	else if A^.dato.numero<min then Rango:= Rango(A^.hd,min,max)
	else if A^.dato.numero>max then Rango:= Rango(A^.hi,min,max)
	else Rango:= 1 + Rango(A^.hd,min,max) + Rango(A^.hi,min,max);
end;

function Cantidad(A:arbol):integer;
begin
	if A=nil then Cantidad:=0
	else Cantidad := 1 + Cantidad(A^.hi) + Cantidad(A^.hd);
end;

var
	a:arbol;
begin
	LeeSocio(a);
	writeln('Max: ', Max(a));
	writeln('Min: ', Min(a));
	writeln(BuscarNombre(a,3));
	muestra(a);
end.
