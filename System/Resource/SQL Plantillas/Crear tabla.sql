create table imagenInmueble(
    idImagenInmueble int AUTO_INCREMENT,
    rutaImagen varchar(200),
    idInmueble int,
    primary key(idImagenInmueble),
    foreign key(idInmueble) references inmuebles(idinmueble)
)