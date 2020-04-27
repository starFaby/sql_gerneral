/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     4/27/2020 08:53:59                           */
/*==============================================================*/


drop table if exists categoria;

drop table if exists detalleventas;

drop table if exists direccion;

drop table if exists efectivo;

drop table if exists factura;

drop table if exists formapago;

drop table if exists paypal;

drop table if exists persona;

drop table if exists producto;

drop table if exists promociones;

drop table if exists telefono;

drop table if exists transferenciabancaria;

/*==============================================================*/
/* Table: categoria                                             */
/*==============================================================*/
create table categoria
(
   idcategoria          int not null auto_increment,
   nombre               int not null,
   image                char(50) not null,
   estado               char(1) not null,
   created_at           date not null,
   primary key (idcategoria)
);

/*==============================================================*/
/* Table: detalleventas                                         */
/*==============================================================*/
create table detalleventas
(
   iddetalleventa       int not null auto_increment,
   idfactura            int not null,
   idproducto           int not null,
   cantidad             int not null,
   precio               decimal(7,2) not null,
   total                decimal(7,2) not null,
   estado               char(1) not null,
   created_at           date not null,
   primary key (iddetalleventa, idproducto, idfactura)
);

/*==============================================================*/
/* Table: direccion                                             */
/*==============================================================*/
create table direccion
(
   iddireccion          int not null auto_increment,
   domisoci             char(15) not null,
   provincia            char(15) not null,
   canton               char(15) not null,
   parroquia            char(15) not null,
   sector               char(100) not null,
   calleprincipal       char(100) not null,
   numeracion           int not null,
   callesecundaria      char(100) not null,
   descripcion          char(200) not null,
   estado               char(1) not null,
   created_at           date not null,
   primary key (iddireccion)
);

/*==============================================================*/
/* Table: efectivo                                              */
/*==============================================================*/
create table efectivo
(
   idefectivo           int not null auto_increment,
   idformapago          int,
   numfactura           int not null,
   preciofactura        decimal(7,2) not null,
   horaentrega          char(10) not null,
   horalugar            char(10) not null,
   estado               char(1) not null,
   created_at           date not null,
   primary key (idefectivo)
);

/*==============================================================*/
/* Table: factura                                               */
/*==============================================================*/
create table factura
(
   idfactura            int not null auto_increment,
   idpersona            int,
   numfactura           int not null,
   subtotal             decimal(7,2) not null,
   dto                  int not null,
   iva                  decimal(7,2) not null,
   total                decimal(7,2) not null,
   estado               char(1) not null,
   created_at           date not null,
   primary key (idfactura)
);

/*==============================================================*/
/* Table: formapago                                             */
/*==============================================================*/
create table formapago
(
   idformapago          int not null auto_increment,
   idfactura            int,
   nombre               int not null,
   estado               char(1) not null,
   created_at           date not null,
   primary key (idformapago)
);

/*==============================================================*/
/* Table: paypal                                                */
/*==============================================================*/
create table paypal
(
   idpaypal             int not null auto_increment,
   idformapago          int,
   numfactura           int not null,
   preciofactura        decimal(7,2) not null,
   estado               char(1) not null,
   created_at           date not null,
   primary key (idpaypal)
);

/*==============================================================*/
/* Table: persona                                               */
/*==============================================================*/
create table persona
(
   idpersona            int not null auto_increment,
   idtelefono           int,
   iddireccion          int,
   cedula               char(15) not null,
   nombres              char(50) not null,
   apellidos            char(50) not null,
   fechanacimiento      date not null,
   email                char(50) not null,
   password             char(100) not null,
   estado               char(1) not null,
   created_at           date not null,
   primary key (idpersona)
);

/*==============================================================*/
/* Table: producto                                              */
/*==============================================================*/
create table producto
(
   idproducto           int not null auto_increment,
   idcategoria          int,
   nombre               int not null,
   image                char(50) not null,
   precio               decimal(7,2) not null,
   stock                int not null,
   estado               char(1) not null,
   created_at           date not null,
   primary key (idproducto)
);

/*==============================================================*/
/* Table: promociones                                           */
/*==============================================================*/
create table promociones
(
   idpromociones        int not null auto_increment,
   idproducto           int,
   dto                  int not null,
   fechainicio          char(50) not null,
   fechafin             char(50) not null,
   descripcion          char(200) not null,
   estado               char(1) not null,
   created_at           date not null,
   primary key (idpromociones)
);

/*==============================================================*/
/* Table: telefono                                              */
/*==============================================================*/
create table telefono
(
   idtelefono           int not null auto_increment,
   domisoci             char(15) not null,
   convencional         char(15) not null,
   celular1             char(10) not null,
   celular2             char(10) not null,
   estado               char(1) not null,
   created_at           date not null,
   primary key (idtelefono)
);

/*==============================================================*/
/* Table: transferenciabancaria                                 */
/*==============================================================*/
create table transferenciabancaria
(
   idtransferenciabancaria int not null auto_increment,
   idformapago          int,
   numerofactura        int not null,
   preciofactura        decimal(7,2) not null,
   fecha                date not null,
   estado               char(1) not null,
   created_at           date not null,
   primary key (idtransferenciabancaria)
);

alter table detalleventas add constraint FK_detalleventas foreign key (idproducto)
      references producto (idproducto) on delete restrict on update restrict;

alter table detalleventas add constraint FK_detalleventas2 foreign key (idfactura)
      references factura (idfactura) on delete restrict on update restrict;

alter table efectivo add constraint FK_formapagoefectivos foreign key (idformapago)
      references formapago (idformapago) on delete restrict on update restrict;

alter table factura add constraint FK_personafacturas foreign key (idpersona)
      references persona (idpersona) on delete restrict on update restrict;

alter table formapago add constraint FK_facturaformapagos foreign key (idfactura)
      references factura (idfactura) on delete restrict on update restrict;

alter table paypal add constraint FK_formapagopaypals foreign key (idformapago)
      references formapago (idformapago) on delete restrict on update restrict;

alter table persona add constraint FK_personadirecciones foreign key (iddireccion)
      references direccion (iddireccion) on delete restrict on update restrict;

alter table persona add constraint FK_personatelefonos foreign key (idtelefono)
      references telefono (idtelefono) on delete restrict on update restrict;

alter table producto add constraint FK_categoriaproductos foreign key (idcategoria)
      references categoria (idcategoria) on delete restrict on update restrict;

alter table promociones add constraint FK_productopromociones foreign key (idproducto)
      references producto (idproducto) on delete restrict on update restrict;

alter table transferenciabancaria add constraint FK_formapagotransfereciabancarias foreign key (idformapago)
      references formapago (idformapago) on delete restrict on update restrict;

