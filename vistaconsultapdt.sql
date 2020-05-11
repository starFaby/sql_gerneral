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
select dv.iddetalleventas, dv.idfactura, p.nombre as idproducto, 
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
select m.idpromociones, p.idproducto, p.idcategoria, p.nombre, p.image, p.precio, m.dto, p.stock, p.estado 
from promociones m 
inner join producto p on p.idproducto = m.idproducto;



/*para visualizar que cada persona tiene su propia factura*/

CREATE VIEW 
viewpersonafactura AS

select p.idpersona, f.idfactura, f.numfactura, f.estado

from factura f 

inner join persona p on p.idpersona = f.idpersona;


/*selecciona para saber si es efentivo paypapal o transferencia*/

CREATE VIEW 
viewtipopago AS

select * from tipopago;

/*pago de factura de tipo paypal, transferencia bancaria, efectivo, ver por separado tipo tipo de pago*/


CREATE VIEW 
viewpagofactptbe AS 

select fp.idtipopago, p.idpersona, f.idfactura, f.numfactura, fp.estado

from formapago fp

inner join factura f on f.idfactura = fp.idfactura
inner join persona p on p.idpersona = f.idpersona;


/*visualizando la factura  y forma de pago para ser visualizada en tipos de pagos*/

CREATE VIEW 
viewformapagopy AS
select fp.idformapago, f.numfactura, f.total 
from formapago fp 
inner join factura f on f.idfactura = fp.idfactura;

/*Pago final de los pagos en paypal*/
CREATE VIEW 
viewPagoPaypal AS
select pyp.idpaypal, f.numfactura, fp.idtipopago, p.idpersona from paypal pyp
inner join formapago fp on fp.idformapago = pyp.idformapago
inner join factura f on f.idfactura = fp.idfactura
inner join persona p on p.idpersona = f.idpersona;

/*Pago final de los pagos en transferenciabancaria*/
CREATE VIEW 
viewPagoTrasnBanc AS
select tfb.idtransferenciabancaria, f.numfactura, fp.idtipopago, p.idpersona  from transferenciabancaria tfb
inner join formapago fp on fp.idformapago = tfb.idformapago
inner join factura f on f.idfactura = fp.idfactura
inner join persona p on p.idpersona = f.idpersona;
/*Pago final de los pagos en efectivo*/
CREATE VIEW 
viewPagoEfectivo AS
select e.idefectivo, f.numfactura, fp.idtipopago, p.idpersona from efectivo e
inner join formapago fp on fp.idformapago = e.idformapago
inner join factura f on f.idfactura = fp.idfactura
inner join persona p on p.idpersona = f.idpersona;


/*Para ver todos los productos vendidos de esa factura*/
CREATE VIEW 
viewFacturadv AS
select dv.cantidad, p.nombre, dv.precio, dv.total, f.numfactura  from detalleventas dv
inner join factura f on f.idfactura = dv.idfactura 
inner join producto p on p.idproducto = dv.idproducto;/*  where f.numfactura = 4;*/

/*Para ver el precio final de la factura*/
CREATE VIEW 
viewFacturaTotal AS
select f.idfactura, f.numfactura, fp.idtipopago, f.subtotal,f.dto,f.iva, f.total from factura f
inner join formapago fp on fp.idfactura = f.idfactura; /*  where f.numfactura = 4;*/






