/*==============================================================*/
/* DBMS name:      SAP SQL Anywhere 16                          */
/* Created on:     4/3/2020 20:28:31                            */
/*==============================================================*/


if exists(select 1 from sys.sysforeignkey where role='FK_PRODUCTO_CATEGORIA_CATEGORI') then
    alter table producto
       delete foreign key FK_PRODUCTO_CATEGORIA_CATEGORI
end if;

drop index if exists categoria.CATEGORIA_PK;

drop table if exists categoria;

drop index if exists detalle.DETALLE_PK;

drop table if exists detalle;

drop index if exists direccion.DIRECCION_PK;

drop table if exists direccion;

drop index if exists efectivo.EFECTIVO_PK;

drop table if exists efectivo;

drop index if exists factura.FACTURA_PK;

drop table if exists factura;

drop index if exists paypal.PAYPAL_PK;

drop table if exists paypal;

drop index if exists persona.PERSONA_PK;

drop table if exists persona;

drop index if exists producto.CATEGORIAPRODUCTOS_FK;

drop index if exists producto.PRODUCTO_PK;

drop table if exists producto;

drop index if exists promociones.PROMOCIONES_PK;

drop table if exists promociones;

drop index if exists telefono.TELEFONO_PK;

drop table if exists telefono;

drop index if exists tipoentrega.TIPOENTREGA_PK;

drop table if exists tipoentrega;

drop index if exists tipopago.TIPOPAGO_PK;

drop table if exists tipopago;

drop index if exists transferenciabancaria.TRANSFERENCIABANCARIA_PK;

drop table if exists transferenciabancaria;

drop index if exists ventas.VENTAS_PK;

drop table if exists ventas;

/*==============================================================*/
/* Table: categoria                                             */
/*==============================================================*/
create table categoria 
(
   idcategoria          integer                        not null,
   convencional         char(50)                       not null,
   image                char(50)                       not null,
   estado               integer                        not null,
   created_at           date                           null,
   constraint PK_CATEGORIA primary key clustered (idcategoria)
);

/*==============================================================*/
/* Index: CATEGORIA_PK                                          */
/*==============================================================*/
create unique clustered index CATEGORIA_PK on categoria (
idcategoria ASC
);

/*==============================================================*/
/* Table: detalle                                               */
/*==============================================================*/
create table detalle 
(
   iddetalle            integer                        not null,
   id_factura           integer                        not null,
   id_producto          integer                        not null,
   cantidad             integer                        not null,
   precio               integer                        not null,
   valor                decimal(3)                     not null,
   estado               integer                        not null,
   constraint PK_DETALLE primary key clustered (iddetalle)
);

/*==============================================================*/
/* Index: DETALLE_PK                                            */
/*==============================================================*/
create unique clustered index DETALLE_PK on detalle (
iddetalle ASC
);

/*==============================================================*/
/* Table: direccion                                             */
/*==============================================================*/
create table direccion 
(
   iddireccion          integer                        not null,
   provincia            char(15)                       null,
   canton               char(15)                       null,
   parroquia            char(15)                       null,
   sector               char(100)                      not null,
   calleprincipal       char(100)                      not null,
   numeracion           integer                        null,
   callesecundaria      char(100)                      not null,
   descripcion          char(200)                      not null,
   estado               integer                        not null,
   created_at           date                           not null,
   constraint PK_DIRECCION primary key clustered (iddireccion)
);

/*==============================================================*/
/* Index: DIRECCION_PK                                          */
/*==============================================================*/
create unique clustered index DIRECCION_PK on direccion (
iddireccion ASC
);

/*==============================================================*/
/* Table: efectivo                                              */
/*==============================================================*/
create table efectivo 
(
   idefectivo           integer                        not null,
   horaentrega          char(10)                       not null,
   horalugar            char(10)                       not null,
   estado               integer                        not null,
   created_at           date                           null,
   constraint PK_EFECTIVO primary key clustered (idefectivo)
);

/*==============================================================*/
/* Index: EFECTIVO_PK                                           */
/*==============================================================*/
create unique clustered index EFECTIVO_PK on efectivo (
idefectivo ASC
);

/*==============================================================*/
/* Table: factura                                               */
/*==============================================================*/
create table factura 
(
   idfactura            integer                        not null,
   id_persona           integer                        not null,
   numfactura           integer                        not null,
   subtotal             integer                        not null,
   dto                  decimal(4,3)                   not null,
   iva                  decimal(4,3)                   not null,
   total                decimal(4,3)                   not null,
   estado               integer                        not null,
   created_at           date                           not null,
   constraint PK_FACTURA primary key clustered (idfactura)
);

/*==============================================================*/
/* Index: FACTURA_PK                                            */
/*==============================================================*/
create unique clustered index FACTURA_PK on factura (
idfactura ASC
);

/*==============================================================*/
/* Table: paypal                                                */
/*==============================================================*/
create table paypal 
(
   idpagotc             integer                        not null,
   convencional         char(50)                       not null,
   targeta              char(17)                       not null,
   diferido             char(20)                       not null,
   estado               integer                        not null,
   created_at           date                           not null,
   constraint PK_PAYPAL primary key clustered (idpagotc)
);

/*==============================================================*/
/* Index: PAYPAL_PK                                             */
/*==============================================================*/
create unique clustered index PAYPAL_PK on paypal (
idpagotc ASC
);

/*==============================================================*/
/* Table: persona                                               */
/*==============================================================*/
create table persona 
(
   idpersona            integer                        not null,
   id_telefono          integer                        null,
   id_direccion         integer                        null,
   cedula               char(15)                       not null,
   nombres              char(50)                       not null,
   apellidos            char(50)                       not null,
   fechanacimiento      date                           not null,
   email                char(50)                       not null,
   pasword              char(100)                      not null,
   estado               integer                        not null,
   created_at           date                           not null,
   constraint PK_PERSONA primary key clustered (idpersona)
);

/*==============================================================*/
/* Index: PERSONA_PK                                            */
/*==============================================================*/
create unique clustered index PERSONA_PK on persona (
idpersona ASC
);

/*==============================================================*/
/* Table: producto                                              */
/*==============================================================*/
create table producto 
(
   idproducto           integer                        not null,
   idcategoria          integer                        null,
   convencional         char(50)                       not null,
   image                char(50)                       not null,
   precio               integer                        not null,
   stock                integer                        not null,
   estado               integer                        not null,
   created_at           date                           not null,
   constraint PK_PRODUCTO primary key clustered (idproducto)
);

/*==============================================================*/
/* Index: PRODUCTO_PK                                           */
/*==============================================================*/
create unique clustered index PRODUCTO_PK on producto (
idproducto ASC
);

/*==============================================================*/
/* Index: CATEGORIAPRODUCTOS_FK                                 */
/*==============================================================*/
create index CATEGORIAPRODUCTOS_FK on producto (
idcategoria ASC
);

/*==============================================================*/
/* Table: promociones                                           */
/*==============================================================*/
create table promociones 
(
   idpromociones        integer                        not null,
   idproducto           integer                        not null,
   descuento            char(50)                       not null,
   fechainicio          char(50)                       not null,
   fechafin             char(50)                       not null,
   descripcion          char(200)                      not null,
   estado               integer                        not null,
   created_at           date                           not null,
   constraint PK_PROMOCIONES primary key clustered (idpromociones)
);

/*==============================================================*/
/* Index: PROMOCIONES_PK                                        */
/*==============================================================*/
create unique clustered index PROMOCIONES_PK on promociones (
idpromociones ASC
);

/*==============================================================*/
/* Table: telefono                                              */
/*==============================================================*/
create table telefono 
(
   idtelefono           integer                        not null,
   convencional         char(50)                       not null,
   celular1             char(10)                       not null,
   celular2             char(10)                       not null,
   estado               integer                        not null,
   created_at           date                           not null,
   constraint PK_TELEFONO primary key clustered (idtelefono)
);

/*==============================================================*/
/* Index: TELEFONO_PK                                           */
/*==============================================================*/
create unique clustered index TELEFONO_PK on telefono (
idtelefono ASC
);

/*==============================================================*/
/* Table: tipoentrega                                           */
/*==============================================================*/
create table tipoentrega 
(
   idtipoentrega        integer                        not null,
   convencional         char(50)                       not null,
   estado               integer                        not null,
   constraint PK_TIPOENTREGA primary key clustered (idtipoentrega)
);

/*==============================================================*/
/* Index: TIPOENTREGA_PK                                        */
/*==============================================================*/
create unique clustered index TIPOENTREGA_PK on tipoentrega (
idtipoentrega ASC
);

/*==============================================================*/
/* Table: formapago                                              */
/*==============================================================*/
create table formapago 
(
   idformapago          integer                        not null,
   idfactura            integer                        not null,
   nombre               char(50)                       not null,
   estado               integer                        not null,
   created_at           date                           not null,
   constraint PK_FORMAPAGO primary key clustered (idformapago)
);

/*==============================================================*/
/* Index: TIPOPAGO_PK                                           */
/*==============================================================*/
create unique clustered index TIPOPAGO_PK on tipopago (
idtipopago ASC
);

/*==============================================================*/
/* Table: transferenciabancaria                                 */
/*==============================================================*/
create table transferenciabancaria 
(
   idtransferenciabancaria integer                        not null,
   image                char(50)                       not null,
   estado               integer                        not null,
   created_at           date                           not null,
   constraint PK_TRANSFERENCIABANCARIA primary key clustered (idtransferenciabancaria)
);

/*==============================================================*/
/* Index: TRANSFERENCIABANCARIA_PK                              */
/*==============================================================*/
create unique clustered index TRANSFERENCIABANCARIA_PK on transferenciabancaria (
idtransferenciabancaria ASC
);

/*==============================================================*/
/* Table: ventas                                                */
/*==============================================================*/
create table ventas 
(
   idventas             integer                        not null,
   neto                 integer                        not null,
   iva                  decimal(4,3)                   not null,
   desct                decimal(5)                     not null,
   subtotal             integer                        not null,
   estado               integer                        not null,
   created_at           date                           not null,
   constraint PK_VENTAS primary key clustered (idventas)
);

/*==============================================================*/
/* Index: VENTAS_PK                                             */
/*==============================================================*/
create unique clustered index VENTAS_PK on ventas (
idventas ASC
);

alter table producto
   add constraint FK_PRODUCTO_CATEGORIA_CATEGORI foreign key (idcategoria)
      references categoria (idcategoria)
      on update restrict
      on delete restrict;

create table formapagopte 
(
   idformapagopte       integer                        null,
   nombre               char(50)                       null,
   estado               char(1)                        null,
   created_at           date                           null
);