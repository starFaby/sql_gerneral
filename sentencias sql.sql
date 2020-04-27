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

SELECT MAX(factura.numfactura)+1 AS NRO_FACTURA  FROM factura;

/*************************/
consultas
/***********************************/
sonsulta persona direcion telefono
/********************************/
select persona.idpersona, persona.cedula, persona.nombres,
 persona.apellidos, persona.email, telefono.convencional, 
 telefono.celular1, telefono.celular2, direccion.provincia, 
 direccion.canton, direccion.parroquia, direccion.sector,
  direccion.calleprincipal, direccion.numeracion, 
  direccion.callesecundaria, direccion.descripcion 
  from persona 
  inner join telefono on persona.idtelefono = telefono.idtelefono 
  inner join direccion on persona.iddireccion = direccion.iddireccion
  where idpersona = 1;

select persona.idpersona, persona.cedula, persona.nombres,
 persona.apellidos, persona.email, telefono.convencional, 
 telefono.celular1, telefono.celular2, direccion.provincia, 
 direccion.canton, direccion.parroquia, direccion.sector, 
 direccion.calleprincipal, direccion.numeracion,
  direccion.callesecundaria, direccion.descripcion 
  from persona 
  inner join telefono on persona.idtelefono = telefono.idtelefono 
  inner join direccion on persona.iddireccion = direccion.iddireccion 
  where idpersona = 3;



SELECT MAX(factura.numfactura)+1 AS NRO_FACTURA  FROM factura;

select * from factura;

SELECT MAX(factura.idfactura)+1 AS idfactura  FROM factura;
























