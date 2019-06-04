-- CREATE TRIGGER nombre_disp momento_disp evento_disp
--     ON nombre_tabla FOR EACH ROW sentencia_disp

create table DEPARTAMENTOS(
dept_no tinyint(2) not null,
dnombre varchar(15),
localidad varchar(15),
primary key (dept_no)
);

create table AUDITORIA_DEPART_I_B(
fecha date,
hora time,
usuario varchar(20),
codigo_dept tinyint(2),
nombre_dept varchar(15),
operacion varchar(15)
);

-- a.-Crea el trigger INSERTAR_DEPART asociado a la tabla DEPARTAMENTOS que
-- se active después de insertar un departamento. Tiene que insertar una fila en la tabla
-- AUDITORIA_DEPART_I_B indicando la fecha de inserción, la hora, el usuario que
-- hace la operación, el código del departamento insertado, el nombre y la operación
-- realizada (insertar). 


create trigger insertar_depart after insert on departamentos for each row
insert into auditoria_depart_i_b (fecha, hora, usuario, codigo_dept, nombre_dept, operacion)
values (current_date, current_time, current_user(), current_codigo_dept, current_nombre_dept, "insertar");


-- b.-Crea el trigger BORRAR_DEPART asociado a la tabla DEPARTAMENTOS que se
-- active después de borrar un departamento. Tiene que insertar una fila en la tabla
-- AUDITORIA_DEPART_I_B indicando la fecha de borrado, la hora, el usuario que hace
-- la operación, el código del departamento borrado, el nombre y la operación realizada
-- (borrar). 

create trigger borrar_depart after delete on departamentos for each row
insert into auditoria_depart_i_b (fecha, hora, usuario, codigo_dept, nombre_dept, operacion)
values (current_date, current_time, current_user(), current_codigo_dept, current_nombre_dept, "borrar");
