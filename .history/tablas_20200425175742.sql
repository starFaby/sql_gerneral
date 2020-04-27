/**Factura**/
create table factura 
(
   idfactura            integer                        not null,
 
  idpersona           integer                        not null,
  
 numfactura           integer                        not null UNIQUE,
  
 subtotal             integer                        not null,
   
dto                   decimal(4,3)                   not null,
   
iva                  decimal(4,3)                   not null,
   
total                decimal(4,3)                   not null,
  
 estado               integer                       not null,
   
created_at           date                           not null,
   
constraint PK_FACTURA primary key clustered (idfactura)
);

create table transferenciabancaria 
(
   idtransferenciabancaria integer                        not null,
   image                char(50)                       not null,
   estado               integer                        not null,
   created_at           date                           not null,
   constraint PK_TRANSFERENCIABANCARIA primary key clustered (idtransferenciabancaria)
);

create table formapago 
(
   idformapago          integer                        not null,
   idfactura            integer                        not null,
   nombre               char(50)                       not null,
   estado               integer                        not null,
   created_at           date                           not null,
   constraint PK_FORMAPAGO primary key clustered (idformapago)
);

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

create table categoria 
(
   idCategoria          integer                        not null AUTO_INCREMENT,
   nombre               char(50)                       null,
   image                char(50)                       null,
   estado               integer                        null,
   constraint pk_categoria primary key clustered (idCategoria)
);

create table formapagopte 
(
   idformapagopte       integer                        null,
   nombre               char(50)                       null,
   estado               char(1)                        null,
   created_at           date                           null
);