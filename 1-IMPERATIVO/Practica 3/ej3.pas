{
3.	Implementar un programa que contenga:
a. Un módulo que lea información de alumnos de Taller de Programación y almacene en una estructura de datos
*  sólo a aquellos alumnos que posean año de ingreso posterior al 2010. 
* De cada alumno se lee legajo, DNI y año de ingreso. 
* La estructura generada debe ser eficiente para la búsqueda por número de legajo. 
* 
b. Un módulo que reciba la estructura generada en a. e informe el DNI y año de ingreso de aquellos 
* alumnos cuyo legajo sea inferior a un valor ingresado como parámetro. 
* 
c. Un módulo que reciba la estructura generada en a. e informe el DNI y año de ingreso de aquellos 
* alumnos cuyo legajo esté comprendido entre dos valores que se reciben como parámetro. 
* 
d. Un módulo que reciba la estructura generada en a. y retorne el DNI más grande.
* 
e. Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con legajo impar.
}

program ej3;

const
	anioP = 2010;

type
	alumno = record
		legajo: integer;
		dni: integer;
		anio: integer;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato: alumno;
		HI: arbol;
		HD: arbol;
	end;
	
procedure Agregar(var A:arbol; dato:alumno);
begin
	if A=nil then begin
		new(A);
		A^.dato:=dato;
		A^.HI:=nil;
		A^.HD:=nil;
	end else if dato.legajo>=A^.dato.legajo then Agregar(A^.HD,dato)
	else Agregar(A^.HI,dato)
end;
	
procedure LeerArbol(var A:arbol);
var dato: alumno;
begin
	writeln('Ingrese año de ingreso 2010 o superior');readln(dato.anio);
	while dato.anio>anioP do begin
		writeln('Legajo: ');readln(dato.legajo);
		writeln('DNI: ');readln(dato.DNI);
		
		Agregar(A,dato);
		
		writeln('Ingrese año de ingreso 2010 o superior');readln(dato.anio);
	end;
end;

procedure Inferior(A:arbol; valor:integer);
begin
	if A<> nil then
		if A^.dato.legajo>valor then Inferior(A^.HI,valor)
		else begin
			writeln('Legajo: ',A^.dato.legajo,' DNI: ',A^.dato.dni,' ANIO: ',A^.dato.anio);
			Inferior(A^.HI,valor);
			Inferior(A^.HD,valor);
			end
end;

procedure Rango(A:arbol; min,max:integer);
begin
	if A<> nil then
		if A^.dato.legajo>=max then Rango(A^.HI,min,max)
		else if A^.dato.legajo<=min then Rango(A^.HD,min,max)
		else begin
			writeln('Legajo: ',A^.dato.legajo,' DNI: ',A^.dato.dni,' ANIO: ',A^.dato.anio);
			Rango(A^.HI,min,max);
			Rango(A^.HD,min,max);
			end
end;

procedure DNIMAX(A:arbol; max:integer);
begin
	if A<>nil then begin
		if A^.dato.dni>max then max:=A^.dato.dni;
		DNIMAX(A^.HI,max);
		DNIMAX(A^.HD,max);
	end;
end;

var
	A:arbol;
	max:integer;
begin
	LeerArbol(A);
	Inferior(A,6);writeln;
	Rango(A,2,6);
	max:=-9999;
	DNIMAX(A,max);
	writeln('DNIMAX: ',max);
end.
