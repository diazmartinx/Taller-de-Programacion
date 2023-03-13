program ej1;


type
	mes = 1..12;
	dia = 1..31;
	
	prestamo = record
		ISBN: integer;
		socio: integer;
		dia:dia;
		mes:mes;
		cantidad: integer;
	end;
	lista = ^nodo;
	nodo = record
		dato: prestamo;
		sig: lista;
	end;
	
	TV = array[mes] of lista;
	
	prestamoT = record
		ISBN: integer;
		total: integer;
	end;
	listaT = ^nodo2;
	nodo2 = record
		dato: prestamoT;
		sig: listaT;
	end;
	
	procedure inserta(var pri:lista; dato:prestamo);
	var ant, nue, act: lista;
	begin
		// 1-Genero nuevo nodo y le asigno el dato
		new(nue);
		nue^.dato := dato;
		// 2-Inicializo anterior y actual al valor de la lista inicial
		act := pri;
		ant := pri;
		
		// 3-Busca la posicion correcta para insertar el nuevo nodo
		while (act<>nil) and (act^.dato.ISBN<dato.ISBN) do begin
			ant := act;
			act := act^.sig;
		end;
		
		// 4-Se verifica si la pos es la primera de la lista es decir ant=act
		if (ant=act) then pri:=nue // nuestro nuevo nodo es entonces el unico nodo en la lista
		else ant^.sig:=nue; // insertamos nuestro nuevo nodo luego del "anterior"
		nue^.sig:=act; // enlasamos el resto de la lista a nuestro nuevo nodo
	end;
	
	procedure generaDato(var V:TV);
	var i:integer; dato:prestamo;
	begin
		for i:=1 to 30 do begin
			with dato do begin
				ISBN:=Random(30);
				socio:=Random(100);
				dia:=Random(28)+1;
				mes:=Random(12)+1;
				cantidad:=Random(50)+1;
			end;
			inserta(V[dato.mes],dato);
		end;
	end;
	
	procedure imprimeL(l:lista);
	begin
		if l<>nil then begin
			write(l^.dato.ISBN,' ');
			imprimeL(l^.sig);
		end;
	end;
	
	procedure imprime(V:TV);
	var i:integer;
	begin
		for i:=1 to 12 do begin
			write('Mes ',i,': ');
			imprimeL(V[i]);writeln;
		end;
	end;
	
	procedure minimo(var V:TV; var min:lista);
	var pos, i:integer;
	begin
		min^.dato.isbn:=9999;
		pos:=-1;
		for i:=1 to 12 do
			if (V[i]<>nil) and (V[i]^.dato.isbn<min^.dato.isbn) then begin
				min:=V[i];
				pos:=i;
			end;
		if pos<>-1 then V[pos]:=V[pos]^.sig;
	end;
	
	procedure agregaAtras(var pri:lista; dato:prestamo);
	begin
		if pri=nil then begin
			new(pri);
			pri^.dato:=dato;
			pri^.sig:=nil		
		end else agregaAtras(pri^.sig,dato);
	end;
	
	//Merge de un vector de lista c:
	procedure merge(V:TV; var l:lista);
	var min:lista;
	begin
		minimo(v,min);
		while min^.dato.isbn<>9999 do begin
			agregaAtras(l,min^.dato);
			minimo(v,min);
		end;
	end;
	
	procedure agregaFinal(var pri:listaT;dato:prestamoT);
	begin
		if pri=nil then begin
			new(pri);
			pri^.dato:=dato;
			pri^.sig:=nil;
		end else agregaFinal(pri^.sig,dato);
	end;
	
	procedure mergeA(V:TV; var l:listaT);
	var min:lista;nuevo:prestamoT;
	begin
		l:=nil;
		minimo(v,min);
		while min^.dato.isbn<>9999 do begin
			nuevo.total:=min^.dato.cantidad;
			nuevo.isbn:=min^.dato.isbn;
			while (min^.dato.isbn=nuevo.isbn) do begin
				nuevo.total:=nuevo.total+min^.dato.cantidad;
				minimo(v,min);
			end;
			writeln(nuevo.isbn);
			agregaFinal(l,nuevo);
		end;
	end;
	
	procedure imprimeLT(l:listaT);
	begin
		if l<>nil then begin
			write(l^.dato.ISBN,'(',l^.dato.total,') ');
			imprimeLT(l^.sig);
		end;
	end;	
	
	var V:TV;l:lista;lt:listaT;
	begin
		Randomize;
		generaDato(V);
		imprime(V);writeln;writeln;
		
		
		l:=nil;
		merge(V,l);
		imprimeL(l);writeln;writeln;
		
		lt:=nil;
		mergeA(V,lt);
		imprimeLT(lt);
	end.
