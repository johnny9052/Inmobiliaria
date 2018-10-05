create table audit_propertie_search(
    id int auto_increment,
    usuario_id varchar(20),
    id_register int, 
    dia varchar(20),
    mes varchar(20),
    anio varchar(5),
    hora varchar(20),
    ip varchar(20),
    dispositivo varchar(20),
    sistema_operativo varchar(20),
    navegador varchar(20),
    primary key (id) 
);