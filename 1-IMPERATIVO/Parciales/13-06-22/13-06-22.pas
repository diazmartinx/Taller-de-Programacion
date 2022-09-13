program parcial;

const dimF=20;

type
	st10 = string[10];
	impresion=record
		nombre:st10;
		pags: integer;
		tam: integer;
		user: st10;
	end;
	
	impresionUser=record
		user: st10;
		cant_imp: integer;
		cant_pags: integer;
		ultimo: st10;
	end;
	
	arbol=^nodo;
	nodo=record
		dato: impresionUser;
		hi: arbol;
		hd: arbol;
	end;
	
	entre2=record
		user: st10;
		ultimo: st10;
	end;
	
	rango = 1..dimF;
	indice = 0..dimF;
	TV = array[rango] of entre2;
	
procedure Insertar(var A:arbol; dato:impresion);
begin
	if A=nil then begin
		new(A);A^.hi:=nil;A^.hd:=nil;
		A^.dato.user:=dato.user;
		A^.dato.cant_imp:=1;
		A^.dato.cant_pags:=dato.pags;
		A^.dato.ultimo:=dato.nombre;
	end else if A^.dato.user=dato.user then begin
		A^.dato.cant_imp:=A^.dato.cant_imp+1;
		A^.dato.cant_pags:=A^.dato.cant_pags+dato.pags;
		A^.dato.ultimo:=dato.nombre;
	end else if A^.dato.user<dato.user then Insertar(A^.hd,dato)
	else Insertar(A^.hi,dato);
end;
	
procedure Leer(var A:arbol);
var dato:impresion;
begin
	writeln('Ingrese Tamañano: (0 fin)');readln(dato.tam);
	while dato.tam<>0 do begin
		writeln('Usuario: ');readln(dato.user);
		writeln('Nombre de Documento: ');readln(dato.nombre);
		dato.pags:=random(20)+1;
		
		Insertar(A,dato);
	
		writeln('Ingrese Tamañano: ');readln(dato.tam);
	end;
end;

procedure Max(A:arbol; var maximo:impresionUser);
begin
	if A<>nil then begin
		if A^.dato.cant_imp>maximo.cant_imp then
			maximo:=A^.dato;
		Max(A^.hi,maximo);
		Max(A^.hd,maximo);
	end
end;

procedure MostrarA(A:arbol);
begin
	if A<>nil then begin
		MostrarA(A^.hi);
		with A^.dato do
			writeln('User: ',user,' | Cant: ',cant_imp,' | Pags: ',cant_pags,' | Ultimo: ',ultimo);
		MostrarA(A^.hd);
	end
end;

procedure AnadirEntre2(var V:TV; var dimL:indice; A:arbol; max,min:st10);
var dato:entre2;
begin
	if A<> nil then begin
		if A^.dato.user>max then AnadirEntre2(V,dimL,A^.hi,min,max)
		else if A^.dato.user<min then AnadirEntre2(V,dimL,A^.hd,min,max)
		else if dimL<dimF then begin
			AnadirEntre2(V,dimL,A^.hi,min,max);
			
			dimL:=dimL+1;
			dato.user:=A^.dato.user;
			dato.ultimo:=A^.dato.ultimo;
			V[dimL]:=dato;
			
			AnadirEntre2(V,dimL,A^.hd,min,max);
		end;
	end;
end;

procedure GenerarVector(var V:TV; var dimL:indice; A:arbol);
var max,min:st10;
begin
	max:='7';min:='3';
	dimL:=0;
	AnadirEntre2(V,dimL,A,max,min);
end;

procedure ImprimirVector(V:TV;dimL:indice);
var i:indice;
begin
	for i:=1 to dimL do
		writeln('Usuario: ',V[i].user,' | ultimo: ',V[i].ultimo);
end;
	
var
	A:arbol;
	MaxUser:impresionUser;
	V:TV;
	dimL:indice;
begin
	Randomize;
	A:=nil;
	Leer(A);
	if A<>nil then begin
		MostrarA(A);
		
		MaxUser.cant_imp:=-9999;
		Max(A,MaxUser);
		if MaxUser.cant_imp<>-9999 then
			writeln('Usuario con mas documentos impresos(',MaxUser.cant_imp,'): ',MaxUser.user)
		else writeln('Arbol Vacio');
		
		GenerarVector(V,dimL,A);
		ImprimirVector(V,dimL);
	end;
end.
