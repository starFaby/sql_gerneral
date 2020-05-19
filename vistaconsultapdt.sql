drop view personapdt;
drop view viewdetalleventadvp;
drop view viewproductouni;
drop view viewpromocionespp;
drop view viewpromocionesppi;
drop view viewPromocionesppuni;
/*selecciona a la personas*/
CREATE VIEW 
viewpersona AS 
SELECT p.idpersona, t.convencional, d.sector, p.cedula, 
       p.nombres, p.apellidos, p.fechanacimiento, p.email, 
       p.password, p.requerimiento, p.estado
       FROM persona p
       inner join direccion d on d.iddireccion = p.iddireccion
       inner join telefono t on t.idtelefono = p.idtelefono;
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

/*Vista para mostrar el descuento de la factura*/
create view 
viewdto as
select * from dto;

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
inner join producto p on p.idproducto = dv.idproducto;

/*Para ver el precio final de la factura*/
CREATE VIEW 
viewFacturaTotal AS
select f.idfactura, f.numfactura, fp.idtipopago, f.subtotal,f.dto,f.iva, f.total, f.created_at from factura f
inner join formapago fp on fp.idfactura = f.idfactura;

/*muestra las categorias para que sea visulaizado para el administrador*/
create view 
viewcategoria as
select * from categoria;

/*vista report persona*/
CREATE VIEW 
viewreportpersona AS 
SELECT p.idpersona, t.convencional, d.sector, p.cedula, 
       p.nombres, p.apellidos, p.fechanacimiento, p.email, 
       p.password, p.requerimiento, p.estado
       FROM persona p
       inner join direccion d on d.iddireccion = p.iddireccion
       inner join telefono t on t.idtelefono = p.idtelefono;

/*vista report categoria*/
create view
viewreportcategoria as
select * from categoria;
/*vista report producto*/

create view 
viewreportproducto as
select c.nombre as categoria, pr.nombre, pr.image, pr.stock, pr.estado, pr.created_at from producto pr
inner join categoria c on c.idcategoria = pr.idcategoria;

/*vista report promociones*/
create view
viewreportpromociones as
SELECT p.nombre, pr.dto, pr.fechainicio, pr.fechafin, pr.descripcion, pr.estado, pr.created_at FROM promociones pr
inner join producto p on p.idproducto = pr.idproducto;

/*ver los productos con las categorias*/
create view
viewproducto as
select p.idproducto, c.nombre as categoria, p.nombre, p.image, p.precio, p.stock, p.estado  from producto p
inner join categoria c on c.idcategoria = p.idcategoria;






