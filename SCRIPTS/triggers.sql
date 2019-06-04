create table historial_vehiculos (
codigo 				  int(11) not null auto_increment,
usuario 			  varchar(100) not null,
fecha 				  datetime not null,
Operación			  varchar(15),
ID_vehiculo_OLD		  integer(8),
Matricula_OLD	      varchar(7),
numBastidor_OLD       varchar(17),
Color_OLD             varchar(30),
numAsientos_OLD       integer(4),
precio_OLD            integer(8),
ID_Serie_OLD          integer(8),
ID_vehiculo_NEW		  integer(8),
Matricula_NEW	      varchar(7),
numBastidor_NEW       varchar(17),
Color_NEW             varchar(30),
numAsientos_NEW       integer(4),
precio_NEW            integer(8),
ID_Serie_NEW          integer(8),
primary key (codigo))
auto_increment=1;




create trigger Historial_vehiculo
after insert on taller.vehiculo
for each row
insert into taller.historial_vehiculos (usuario, fecha, Operación, ID_vehiculo_NEW,Matricula_NEW,
numBastidor_NEW,Color_NEW,numAsientos_NEW,precio_NEW,ID_Serie_NEW) values 
(current_user(), now(),'insert',NEW.ID_vehiculo,NEW.Matricula,NEW.numBastidor,NEW.Color,
NEW.numAsientos, NEW.precio,NEW.ID_Serie); 





create trigger Historial_vehiculo_modificar
after UPDATE on taller.vehiculo
for each row
insert into taller.historial_vehiculos (usuario, fecha, Operación, ID_vehiculo_OLD,ID_vehiculo_NEW,
Matricula_OLD, Matricula_NEW, numBastidor_OLD, numBastidor_NEW,Color_OLD, Color_NEW, numAsientos_OLD, 
numAsientos_NEW, precio_OLD, precio_NEW, ID_Serie_OLD,ID_Serie_NEW) 
VALUES (current_user(), now(),'MODIFICACIÓN',
OLD.ID_vehiculo, NEW.ID_vehiculo, old.Matricula,NEW.Matricula, old.numBastidor, NEW.numBastidor, old.Color, 
NEW.Color, old.numAsientos, NEW.numAsientos, old.precio, NEW.precio, old.ID_Serie, NEW.ID_Serie);





create trigger historial_vehiculo_eliminar
after DELETE on taller.vehiculo
for each row
insert into taller.historial_vehiculos (usuario, fecha, Operación, ID_vehiculo_OLD,Matricula_OLD,
numBastidor_OLD,Color_OLD,numAsientos_OLD,precio_OLD,ID_Serie_OLD)
VALUES (current_user(), now(), 'ELIMINADO', OLD.ID_vehiculo, OLD.Matricula, OLD.numBastidor, OLD.Color,
OLD.numAsientos, OLD.precio, OLD.ID_Serie);




/*INSERTAR DATOS*/
INSERT INTO vehiculo VALUES ('123','5060GHZ','12345678912345678','AMARILLO','5', '3999','1');
INSERT INTO vehiculo VALUES ('122','6789JKI','254698YTK4598POIM','ROJO','3','5000.80','2');
INSERT INTO vehiculo VALUES ('124','9585KJL','LKIW78542WCDE9654','ROJO','5','8000','1');


/*hacer un cambio para comprobar el trigger update.*/
update vehiculo set numAsientos='6' where ID_vehiculo='123';/*modificar datos en la base datos*/



/*BORRAR UNA LINEA DE DATOS*/
delete from vehiculo where ID_vehiculo='123';

/*borrar trigger*/
drop trigger Historial_vehiculo; 

/*ver los triggers*/
show triggers;

---------------------------------------------------------------------------------------------------------------

create table test1 (campo1 varchar(30));
create table test2 (campo2 varchar(30), fecha DATE, hora TIME);

DELIMITER |
create trigger trg1 BEFORE INSERT ON test1
for each row begin
	insert into test2 values (NEW.campo1, curdate(), curtime());
END;
|
DELIMITER ;

INSERT INTO test1 values ("PRIMERA FILA");
INSERT INTO test2 values ("SEGUNDA FILA");
SELECT * FROM test2;
---------------------------------------------------------------------------------------------------------------
/*- ESTRUCTURA DE UN TRIGGER - */

DELIMITER |
CREATE TRIGGER nombre_trigger
	(BEFORE | AFTER) (INSERT | UPDATE | DELETE)
ON nombre_tabla
FOR EACH ROW BEGIN
	sentencias;
END;
|
DELIMITER ;

/* INSERT solo se pueden usar valores New.columna
DELETE solo se pueden usar valores OLD.columna
UPDATE se pueden acceder a los valores NEW.columna y OLD.columna*/

---------------------------------------------------------------------------------------------------------------

/* - EJERCICIO RESUELTOS 14.8 - */

CREATE TABLE auditatest1(
antiguovalor VARCHAR(30),
nuevovalor VARCHAR(30),
operacion VARCHAR(30),
fecha DATE,
hora TIME
);

DELIMITER |
CREATE TRIGGER trig2 AFTER UPDATE ON test1
FOR EACH ROW BEGIN
	INSERT INTO auditest1 VALUES (OLD.campo1, NEW.campo1, "MODIFICACION", CURDATE(), CURTIME());
end;
|
DELIMITER ;

UPDATE test1 SET campo1 = "FILA 1" WHERE campo1 = "PRIMERA FILA";
UPDATE test1 SET campo1 = "FILA 2" WHERE campo1 = "SEGUNDA FILA";
SELECT * FROM auditatest1;

--------------------------------------------------------------------------------------------------------------
DELIMITER |
CREATE TRIGGER trig3 AFTER DELETE ON test1
FOR EACH ROW BEGIN
	INSERT INTO auditest1 VALUES (OLD.campo1, NULL, "BORRADO", CURDATE(), CURTIME());
end;
|
DELIMITER ;

DELETE FROM test1 WHERE campo1 = "Fila 1";
SELECT * FROM auditatest;

-------------------------------------------------------------------------------------------------------------
 















