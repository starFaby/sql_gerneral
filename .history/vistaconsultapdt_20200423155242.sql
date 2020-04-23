/*vista producto persona direccion telefono*/
CREATE VIEW 
personapdt AS 
select persona.idpersona, persona.cedula,
 persona.nombres, persona.apellidos, persona.email, 
telefono.convencional, 
telefono.celular1, telefono.celular2, 
direccion.provincia, direccion.canton, 
direccion.parroquia, direccion.sector,
direccion.calleprincipal, direccion.numeracion, 
direccion.callesecundaria, direccion.descripcion from persona

inner join telefono on persona.idtelefono = telefono.idtelefono 

inner join direccion on persona.iddireccion = direccion.iddireccion;

/*vista producto ==> promociones*/
CREATE VIEW 
viewpromocionespp AS 
select m.idpromociones, p.nombre, m.descuento, m.fechainicio,
 m.fechafin, m.descripcion, m.estado from promociones m 

inner join producto p on p.idproducto = m.idproducto;


/*vista detalle_venta ==> producto*/
CREATE VIEW 
viewdetalleventadvp AS 
select dv.iddetalleventa, dv.idfactura, p.nombre as idproducto, 
dv.cantidad, dv.precio, dv.total, dv.estado from  detalleventa dv
inner join producto p on p.idproducto = dv.idproducto;


/*visualizacion de las promociones en el index*/
CREATE VIEW 
viewpromocionesppi AS 
select p.idproducto, m.idpromociones, p.nombre, m.descuento, p.image, m.fechainicio,

 m.fechafin, m.descripcion, m.estado from promociones m 
inner join producto p on p.idproducto = m.idproducto;