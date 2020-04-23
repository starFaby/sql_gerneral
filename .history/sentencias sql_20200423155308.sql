****************************
vaciar una tabla e iniciar desde 1

TRUNCATE nombre_de_la_tabla;
ALTER TABLE nombre_de_la_tabla AUTO_INCREMENT = 1;

SELECT Nombres
FROM paciente
WHERE Nombres LIKE 'A%';


SELECT Nombres, Apellidos
FROM paciente
WHERE Nombres || Apellidos LIKE '%DA%';


Select ID_Paciente, Nombres, Apellidos from Paciente where Nombres LIKE '%DA%' and Estado = true;



create table categoria 
(
   idCategoria          integer                        not null AUTO_INCREMENT,
   nombre               char(50)                       null,
   image                char(50)                       null,
   estado               integer                        null,
   constraint pk_categoria primary key clustered (idCategoria)
);
ALTER TABLE categoria  AUTO_INCREMENT = 1;
create table producto
(
   idProducto           integer                        not null AUTO_INCREMENT,
   idCategoria          integer                        null,
   nombre               char(50)                       null,
   image               char(200)                       null,
   precio               integer                        null,
   stock                integer                        null,
   estado               integer                        null,
   created_at           date                           null,
   constraint pk_producto primary key clustered (idProducto)
);
ALTER TABLE producto AUTO_INCREMENT = 1;



DROP DATABASE eurekakitsdb;
CREATE DATABASE eurekakitsdb


/*************************/
consultas
/***********************************/
sonsulta persona direcion telefono
/********************************/
select persona.idpersona, persona.cedula, persona.nombres, persona.apellidos, persona.email, telefono.convencional, telefono.celular1, telefono.celular2, direccion.provincia, direccion.canton, direccion.parroquia, direccion.sector, direccion.calleprincipal, direccion.numeracion, direccion.callesecundaria, direccion.descripcion from persona inner join telefono on persona.idtelefono = telefono.idtelefono inner join direccion on persona.iddireccion = direccion.iddireccion where idpersona = 1;






























