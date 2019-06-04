/*
 - ESTRUCTURA VISTA -
 CREATE [OR REPLACE] VIEW nombre_vista [columna [,columnas])]
 AS consulta;
  [columna [,columnas])] --> son los nombres de columnas que va a contener la vista. Si no se ponen, se asumen los nombres de columna devueltos por la consulta.
  [OR REPLACE] --> determina las columnas y las tablas que aparecerán en la vista. 
 */
 
 /*
 Una vez creada la vista se puede tratar como una tabla, se puede consultar,se pueden borrar filas, actualizar filas siempre y cuando las columnas obligatorias de la tabla asociada estén presentes en la vista.
 */
 ---------------------------------------------------------------------------------------
 
 create view dep30
 as select apellido, oficio, salario FROM empleados
	where dept_no=30;
    
/*Tambien se puede crear la misma tbla dando nombre a las columnas*/

create view dep30 (ape, ofi, sal)
as select apellido, oficio, salario FROM empleados
	where dept_no=30;
    
/* la siguiente inserción dará error porque las columnas definidas como NOT NULL no están en la vista que he creado antes (EMP_NO y DEPT_NO)*/
insert into dep30 values ('Perez', 'empleado', 1300);

/*modificacion*/
update dep30 set salario = salario + 100;

/* Borra todas las filas de la tabla empleados del departamento 30*/
delete from dep30;

----------------------------------------------------------------------------------------

/*ejercicio no resuelto 14.7*/

create view dep10
as select apellido, oficio, salario FROM empleados
	where dept_no =10 and salario > 1200;
    
select * from dep10;

----------------------------------------------------------------------------------------
/* - EJERCICIOS RESUELTOS -  */

/* - vista con dos tablas - */
Create view emp_dept 
as select emp_no, apellido, e.dept_no, dnombre
	from empleados e, departamentos d
    where e.dept_no = d.dept_no;
    
----------------------------------------------------------------------------------------

create view pagos (nombre, sal_mes, sal_an, dept_no)
as select lower(apellido), salario, salario*12, dept_no
	from empleados
    where dept_no = 10;
    
update pagos set sal_mes = 5000 where nombre = 'rey';

select * from pagos;

----------------------------------------------------------------------------------------
/*BORRADO DE VISTAS*/

drop view nombre_vista;


    


 