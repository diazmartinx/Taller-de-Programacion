program socios;

type
	TRsocio = record
		numero: integer;
		nombre: string[32];
		edad: integer;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato: TRsocio;
		hi: arbol;
		hd: arbol;
	end;
	
	procedure insertar(var a:arbol; dato:TRsocio);
	begin
		if a=nil then begin
			new(a);
			A^.dato:=dato;
			A^.hi:=nil;
			a^.hd:=nil;
		end
			else
				if dato.numero < A^.dato.numero then insertar(A^.hi,dato)
				else insertar(A^.hd,dato);
	end;
	
	procedure generarDatos(var a:arbol);
	var i:integer; socio:TRsocio;
	begin
		for i:=1 to 100 do begin
			socio.numero := Random(5000);
			socio.nombre := 'asd';
			socio.edad := 18 + i;
			insertar(a,socio);
		end;
		socio.nombre:='a';
		insertar(a,socio);
	
	end;
	
	function max(a: arbol):integer;
	begin
		if a=nil then max:=-1
		else if a^.hd <> nil then max:=max(a^.hd)
		else max:=a^.dato.numero;
	end;
	
	function min(a: arbol):arbol;
	begin
		if a=nil then min:=nil
		else if a^.hi <> nil then min:=min(a^.hi)
		else min:=a;
	end;
	
	procedure aumentaEdad(a:arbol; cant:integer);
	begin
		if a<>nil then begin
			a^.dato.edad := a^.dato.edad+1;
			aumentaEdad(a^.hi,cant);
			aumentaEdad(a^.hd,cant);
		end;
	end;
	
	function busca(a:arbol; x:integer):boolean;
	begin
		if a=nil then busca:=false
		else if a^.dato.numero = x then busca:=true
		else if a^.dato.numero > x then busca:=busca(a^.hi,x)
		else busca:=busca(a^.hd,x);
	end;
	
	function buscaNombre(a:arbol; x:string):boolean;
	begin
		if a=nil then buscaNombre:=false
		else if a^.dato.nombre=x then buscaNombre:=true
		else buscaNombre:= buscaNombre(a^.hi,x) or buscaNombre(a^.hd,x)
	end;
	
	function cantidad(a:arbol):integer;
	begin
		if a=nil then cantidad:=0
		else cantidad:= 1 + cantidad(a^.hi) + cantidad(a^.hd);
	end;
	
	function sumaEdades(a:arbol):integer;
	begin
		if a=nil then sumaEdades:=0
		else sumaEdades:=a^.dato.edad+sumaEdades(a^.hi)+sumaEdades(a^.hd);
	end;
	
	procedure creciente(a:arbol);
	begin
		if a<>nil then begin
			creciente(a^.hi);
			write(a^.dato.numero,' ');
			creciente(a^.hd);
		end;
		
	end;
	
	procedure decreciente(a:arbol);
	begin
		if a<>nil then begin
		
			decreciente(a^.hd);
			write(a^.dato.numero,' ');
			decreciente(a^.hi);
			
		end;
	end;
	
	function entre2(a:arbol;min,max:integer):integer;
	begin
		if a=nil then entre2:=0
		else if a^.dato.numero < min then entre2:=entre2(a^.hd,min,max)
		else if a^.dato.numero > max then entre2:=entre2(a^.hi,min,max)
		else entre2:= 1 + entre2(a^.hi,min,max) + entre2(a^.hd,min,max);
	end;
	
	var
	A: arbol;
	minSocio: TRsocio;
	begin
		Randomize;
		A:=nil;
		generarDatos(A);
		writeln(max(A));
		
		minSocio := min(A)^.dato;
		if min(A)<>nil then writeln(minSocio.numero,minSocio.nombre,minSocio.edad);
		
		aumentaEdad(A,1);
		writeln(busca(a,10));
		writeln(buscaNombre(a,'a'));
		writeln(cantidad(A));
		writeln(sumaEdades(A)/cantidad(A):2:2);
		
		creciente(A);writeln;
		decreciente(A);writeln;writeln;
		writeln(entre2(A,0,40));
	end.
	
