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

