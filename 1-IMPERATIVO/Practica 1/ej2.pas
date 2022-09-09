{
2.- El administrador de un edificio de oficinas cuenta, en papel, con la información del pago de las expensas de dichas oficinas. 
Implementar un programa modularizado que:
* 
a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra.
* De cada oficina se ingresa el código de identificación, DNI del propietario y valor de la expensa.
* La lectura finaliza cuando se ingresa el código de identificación -1, el cual no se procesa.
* 
b. Ordene el vector, aplicando el método de inserción, por código de identificación de la oficina.
* 
c. Ordene el vector aplicando el método de selección, por código de identificación de la oficina.
}

program ej2;

const
	maxOficinas = 300;

type
	oficina = 	record
		codigo: integer;
		dni: 	integer;
		valor: 	real;
	end;
	TV = array [1..maxOficinas] of oficina;
	indice = 0..maxOficinas;
	
procedure Ingresa(var V:TV; var dimL:indice);
var
	ofi:oficina;
begin
	dimL := 0; //Inicializa
	writeln('Ingrese codigo de oficina(-1 para finalizar): ');readln(ofi.codigo);
	while (ofi.codigo <> -1) and (dimL < maxOficinas) do begin
		writeln('DNI: ');readln(ofi.dni);
		writeln('Valor: ');readln(ofi.valor);
		dimL := dimL + 1;
		V[dimL] := ofi;
		writeln('Ingrese codigo de oficina(-1 para finalizar): ');readln(ofi.codigo);
	end;
end;

procedure MuestraV(V:TV; dimL:indice);
var
	i:indice;
begin
	for i:=1 to dimL do
		writeln(V[i].codigo);
end;

procedure Insercion(var V:TV; dimL:indice);
var
	i, j: indice;
	actual: oficina;
begin
	for i:=2 to dimL do begin
		actual := V[i];
		j := i-1;
		while (j>0) and (V[j].codigo > actual.codigo) do begin
			V[j+1] := V[j];
			j := j - 1;
		end;
		V[j+1] := actual;
	end;
end;

procedure Seleccion(var V:TV; dimL:indice);
var
	i, j, p: indice;
	item: oficina;
begin
	for i:=1 to dimL-1 do begin // Busca el minimo y guarda en p la pos.
		p := i;
		for j:=i+1 to dimL do
			if V[j].codigo < V[p].codigo then
				p := j;
		
		// Intercambia V[i] y V[p].
		item := V[p];
		V[p] := V[i];
		V[i] := item;
	end;
end;

var
	V:TV;
	dimL:indice;
begin
	Ingresa(V,dimL);
	
	writeln('INSERCION --------');
	Insercion(V,dimL);
	MuestraV(V,dimL);
	
	writeln('SELECCION ---------');
	Seleccion(V,dimL);
	MuestraV(V,dimL);
end.
