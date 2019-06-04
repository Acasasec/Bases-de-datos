


create table empleados(
emp_no smallint(4) unsigned not null,
apellido varchar(10),
oficio varchar(10),
dir smallint,
fecha_alt date,
salario float(6,2),
comision float(6,2),
dept_num tinyint(2) not null,
constraint pri_key primary key (emp_no),
constraint for_key foreign key (dept_num) references departamentos (dept_no)
);

create table auditoria_empleado(
fecha date,
hora time,
num_empl_viejo smallint(4),
num_empl_nuevo smallint(4),
apellido_empl_viejo varchar(10),
apellido_empl_nuevo varchar(10),
operacion varchar(15)
);


-- a.-Crea el trigger INSERTAR_EMPLEADO asociado a la tabla EMPLEADOS que se
-- active después de insertar un empleado. Tiene que insertar una fila en la tabla
-- AUDITORIA_EMPLEADO indicando la fecha de inserción, la hora, el código del
-- empleado insertado, el apellido y la operación realizada (insertar).

create trigger insertar_empleado after insert on empleados for each row
insert into auditoria_empleado (fecha, hora, num_empl_nuevo, apellido_empl_nuevo, operacion)
values (current_date, current_time, num_empl_nuevo, apellido_empl_nuevo, "insertar");

-- b.-Crea el trigger BORRAR_EMPLEADO asociado a la tabla EMPLEADOS que se
-- active después de borrar un empleado. Tiene que insertar una fila en la tabla
-- AUDITORIA_EMPLEADO indicando la fecha de borrado, la hora, el código del
-- empleado borrado, el apellido y la operación realizada (borrar).



-- c.-Crea el trigger MODIFICAR_EMPLEADO asociado a la tabla EMPLEADOS que se
-- active después de modificar un empleado. Tiene que insertar una fila en la tabla
-- AUDITORIA_EMPLEADO indicando la fecha de borrado, la hora, el código del
-- empleado modificado (el viejo y el nuevo), el apellido (el viejo y el nuevo y la operación
-- realizada (modificar). 