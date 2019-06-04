/*TABLA DEPARTAMENTOS*/
--
use tema14;
CREATE TABLE departamentos (
 dept_no  TINYINT(2) NOT NULL,
 dnombre  VARCHAR(15), 
 loc      VARCHAR(15)
);

INSERT INTO departamentos VALUES (10,'CONTABILIDAD','SEVILLA');
INSERT INTO departamentos VALUES (20,'INVESTIGACI�N','MADRID');
INSERT INTO departamentos VALUES (30,'VENTAS','BARCELONA');
INSERT INTO departamentos VALUES (40,'PRODUCCI�N','BILBAO');
COMMIT;

--
-- TABLA EMPLEADOS
--

CREATE TABLE empleados (
 emp_no    SMALLINT(4) UNSIGNED NOT NULL,
 apellido  VARCHAR(10),
 oficio    VARCHAR(10),
 dir       SMALLINT,
 fecha_alt DATE      ,
 salario   FLOAT(6,2),
 comision  FLOAT(6,2),
 dept_no   TINYINT(2) NOT NULL
);

INSERT INTO empleados VALUES (7369,'S�NCHEZ','EMPLEADO',7902,'1990/12/17',
                        1040,NULL,20);
INSERT INTO empleados VALUES (7499,'ARROYO','VENDEDOR',7698,'1990/02/20',
                        1500,390,30);
INSERT INTO empleados VALUES (7521,'SALA','VENDEDOR',7698,'1991/02/22',
                        1625,650,30);
INSERT INTO empleados VALUES (7566,'JIM�NEZ','DIRECTOR',7839,'1991/04/02',
                        2900,NULL,20);
INSERT INTO empleados VALUES (7654,'MART�N','VENDEDOR',7698,'1991/09/29',
                        1600,1020,30);
INSERT INTO empleados VALUES (7698,'NEGRO','DIRECTOR',7839,'1991/05/01',
                        3005,NULL,30);
INSERT INTO empleados VALUES (7782,'CEREZO','DIRECTOR',7839,'1991/06/09',
                        2885,NULL,10);
INSERT INTO empleados VALUES (7788,'GIL','ANALISTA',7566,'1991/11/09',
                        3000,NULL,20);
INSERT INTO empleados VALUES (7839,'REY','PRESIDENTE',NULL,'1991/11/17',
                        4100,NULL,10);
INSERT INTO empleados VALUES (7844,'TOVAR','VENDEDOR',7698,'1991/09/08',
                        1350,0,30);
INSERT INTO empleados VALUES (7876,'ALONSO','EMPLEADO',7788,'1991/09/23',
                        1430,NULL,20);
INSERT INTO empleados VALUES (7900,'JIMENO','EMPLEADO',7698,'1991/12/03',
                        1335,NULL,30);
INSERT INTO empleados VALUES (7902,'FERN�NDEZ','ANALISTA',7566,'1991/12/03',
                        3000,NULL,20);
INSERT INTO empleados VALUES (7934,'MU�OZ','EMPLEADO',7782,'1992/01/23',
                        1690,NULL,10);

COMMIT;


-- ---------------------------------------------------
--  TABLAS PERSONAL, PROFESORES, CENTROS  -----------
-- ---------------------------------------------------


-- TABLA PERSONAL 

CREATE TABLE personal (
 cod_centro   SMALLINT NOT NULL,
 dni          INT UNSIGNED,
 apellidos    VARCHAR(30),
 funcion      VARCHAR(15),
 salario      FLOAT(7,2) 
);

INSERT INTO personal VALUES (10,4123005, 'G�mez Bueno, Elisa', 'LIMPIADORA', 1200.00);
INSERT INTO personal VALUES (10,4122025, 'Garc�a Garc�a, Sabina', 'LIMPIADORA', 1200.00);
INSERT INTO personal VALUES (10,4480099, 'Ruano Cerezo, Manuel','ADMINISTRATIVO', 1800.00);
INSERT INTO personal VALUES (15,1002345, 'Albarr�n Serrano, Alicia', 'ADMINISTRATIVO', 1800.00);
INSERT INTO personal VALUES (15,7002660, 'Mu�oz Rey, Felicia', 'ADMINISTRATIVO', 1800.00);
INSERT INTO personal VALUES (22,5502678, 'Mar�n Mar�n, Pedro', 'ADMINISTRATIVO', 1800.00);
INSERT INTO personal VALUES (22,6600980, 'Peinado Gil, Elena','CONSERJE', 1750.00);
INSERT INTO personal VALUES (45,4163222, 'Sarro Molina, Carmen','CONSERJE', 1750.00);
INSERT INTO personal VALUES (22,1112345, 'Flores P�rez, Fernando','CONSERJE', 1300.00);


-- TABLA PROFESORES

CREATE TABLE profesores (
 cod_centro   SMALLINT NOT NULL,
 dni          INT UNSIGNED,
 apellidos    VARCHAR(30),
 especialidad VARCHAR(16) 
) ;


INSERT INTO profesores VALUES (10,1112345,'Mart�nez Salas, Fernando',  'INFORM�TICA');
INSERT INTO profesores VALUES (10,4123005,'Bueno Zarco, Elisa', 'MATEM�TICAS');
INSERT INTO profesores VALUES (10,4122025,'Montes Garc�a, M.Pilar', 'MATEM�TICAS');
INSERT INTO profesores VALUES (15,9800990, 'Ramos Ruiz, Luis', 	'LENGUA');
INSERT INTO profesores VALUES (15,1112345,'Rivera Silvestre, Ana', 'DIBUJO');
INSERT INTO profesores VALUES (15,8660990, 'De Lucas Fdez, M.Angel',  'LENGUA');
INSERT INTO profesores VALUES (22,7650000, 'Ruiz Lafuente, Manuel',  'MATEM�TICAS');
INSERT INTO profesores VALUES (45,43526789, 'Serrano Lagu�a, Mar�a','INFORM�TICA');

-- TABLA CENTROS

CREATE TABLE centros (
 cod_centro   SMALLINT NOT NULL,
 tipo_centro  CHAR(1),
 nombre       VARCHAR(30),
 direccion    VARCHAR(26),
 telefono     VARCHAR(10),
 num_plazas   SMALLINT  UNSIGNED
 ) ;


INSERT INTO centros VALUES (10,'S','IES El Quijote','Avda. Los Molinos 25', '965-887654',538);
INSERT INTO centros VALUES (15,'P','CP Los Danzantes', 'C/Las Musas s/n','985-112322',250);
INSERT INTO centros VALUES (22,'S', 'IES Planeta Tierra', 'C/Mina 45','925-443400',300);
INSERT INTO centros VALUES (45,'P', 'CP Manuel Hidalgo', 'C/Granada 5','926-202310',220);
INSERT INTO centros VALUES (50,'S', 'IES Anto�ete 1', 'C/Los Toreros 21','989-406090',310);
INSERT INTO centros VALUES (60,'P', 'CP Anto�ete 2', 'C/Los Toreros 22','989-406092',300);

COMMIT;

-- ******** FIN ***********************