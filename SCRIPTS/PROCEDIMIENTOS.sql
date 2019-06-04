/* - PROCEDIMIENTOS - 
ESTRUCTURA
create procedure nombre (Modo nombre tipo) 
	[caracteristicas] definición
    
MODO --> es opcional puede ser IN(el valor por defecto, son los parámtros que el procedimiento recibirá), OUT (son los parámetros que el procedimiento podrá modificar) INOUT (mezcla de los dos anteriores)

NOMBRE --> es el nombre del parámetro.

TIPO --> es cualquier tipo de dato de los provistos por MySQL.  

CARACTERISTICAS --> aquí se define qué hace cómo lo hace y bajo qué circunstancias lo hace. 
*/

delimiter $$ 
create procedure procedimiento (IN cod INT)
begin
select * from tabla where cod_t = cod;
end $$ 

-----------------------------------------------------------------------------------------
/* Ejemplo: creamos dos tablas, una para mayores de 18 y otra para menores*/
create table ninos(edad int, nombre varchar(50));
create table adultos (edad int, nombre varchar(50));

/*procedimiento para introducir datos en la tabla segun la edad lo pone en una tabla o en otra*/

delimiter //
create procedure introducePersona(in edad int,in nombre
varchar(50))
begin
if edad < 18 then
insert into ninos values(edad,nombre);
else
insert into adultos values(edad,nombre);
end if;
end;
//

------------------------------------------------------------------------------------------
/*ejercicio del proyecto*/
delimiter $$
create procedure IDVEHICULO (in ID_vehiculo integer(8) )
begin
select * from vehiculo
where vehiculo.ID_vehiculo = ID_vehiculo ;
end $$



delimiter $$
create procedure Colores (in Color varchar(30))
begin
select * from vehiculo
where vehiculo.Color = Color;
END $$



/*para llamar a la funcion*/
/*CALL taller.colores('ROJO');*/

/*borrar un procedure*/
/*drop procedure nombre_procedure;*/

----------------------------------------------------------------------------------------
/* en el documento hay mas tipos de sentencias, if then else, switch....*/
    

