



create table auditoria_depart_modif(
fecha date,
hora time,
usuario varchar(20),
cod_dept_viejo tinyint(2),
cod_dept_nuevo tinyint(2),
nom_dept_viejo varchar(15),
nom_dept_nuevo varchar(15)
);


-- Crea el trigger MODIFICAR_DEPART asociado a la tabla DEPARTAMENTOS que se
-- active después de modificar un departamento. Tiene que insertar una fila en la tabla
-- AUDITORIA_DEPART_MODIF indicando la fecha de inserción, la hora, el usuario que
-- hace la operación, el código del departamento antes de la modificación, el código del
-- departamento después de la modificación, el nombre del departamento antes de la
-- modificación y el nombre del departamento después de la modificación

create trigger modificar_depart after update on departamentos for each row
insert into auditoria_depart_modif (fecha, hora, usuario, cod_dept_viejo, cod_dept_nuevo, nom_dept_viejo, nom_dept_nuevo)
values (current_date, current_time, current_user(), current_cod_dept, cod_dept, current_nom_dept, nom_dept);
