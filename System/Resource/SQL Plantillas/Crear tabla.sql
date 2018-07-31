create table videoInmueble(
    idVideoInmueble int AUTO_INCREMENT,
    rutaVideo varchar(200),
    idInmueble int,
    primary key(idVideoInmueble),
    foreign key(idInmueble) references inmuebles(idinmueble)
)