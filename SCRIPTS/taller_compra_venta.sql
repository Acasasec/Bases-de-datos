create database taller_compra_venta;
use taller_compra_venta;

create table SERIE (
ID_Serie   		  integer(8)  primary key not null,
marca      		  varchar(15),
modelo      	  varchar(15),
año_fabricacion   date
 );   


create table VEHICULO (
ID_vehiculo  integer(8) primary key not null,
Matricula    varchar(7),
numBastidor  varchar(17),
Color        varchar(30),
numAsientos  integer(4),
precio       integer(8),
ID_Serie     integer(8),
foreign key (ID_Serie) references SERIE (ID_Serie) on delete cascade on update cascade
);

create table COCHE (
ID_Coche    	    integer(8) primary key not null,
numPuertas  	    integer(2),
capacidadMaletero   integer(8),
ID_vehiculo         integer(8),
foreign key (ID_vehiculo) references VEHICULO (ID_vehiculo) on delete cascade on update cascade
);

create table CAMION (
ID_Camión      integer(8) primary key not null,
tipoMercancia  varchar(30),
carga		   integer(8),
ID_vehiculo    integer(8),
foreign key (ID_vehiculo) references VEHICULO (ID_vehiculo) on delete cascade on update cascade
);
 




