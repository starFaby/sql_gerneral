drop view personapdt;
drop view viewdetalleventadvp;
drop view viewproductouni;
drop view viewpromocionespp;
drop view viewpromocionesppi;
drop view viewPromocionesppuni;
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

/*vista detalle_venta ==> producto*/
CREATE VIEW 
viewdetalleventadvp AS 
select dv.iddetalleventa, dv.idfactura, p.nombre as idproducto, 
dv.cantidad, dv.precio, dv.total, dv.estado from  detalleventas dv
inner join producto p on p.idproducto = dv.idproducto;

/*visualizando productos por unidades*/
CREATE VIEW 
viewproductouni AS
select * from producto;

/*vista producto ==> promociones*/
CREATE VIEW 
viewpromocionespp AS 
select m.idpromociones, p.nombre, m.dto, m.fechainicio,
 m.fechafin, m.descripcion, m.estado from promociones m 
inner join producto p on p.idproducto = m.idproducto;

/*visualizacion de las promociones en el index*/
CREATE VIEW 
viewpromocionesppi AS 
select p.idproducto, m.idpromociones, p.nombre, m.dto, p.image, m.fechainicio,
 m.fechafin, m.descripcion, m.estado from promociones m 
inner join producto p on p.idproducto = m.idproducto;

/*view de las promociones por unidades*/

CREATE VIEW 
viewpromocionesppuni AS 
select m.idpromociones, 
p.idproducto, p.idcategoria, p.nombre, p.image, p.precio, m.dto, p.stock, p.estado 
from promociones m 
inner join producto p on p.idproducto = m.idproducto;
