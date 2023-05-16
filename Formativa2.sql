create database formativaRodrigo;
use formativaRodrigo;


create table cargos(
	cargo_id int not null auto_increment,
    nomeCargo varchar(45),
    primary key(cargo_id),
    foreign key (nivelFK) references nivel (nivel_id)
)

create table ocupacao(
	ocupacao_id int not null auto_increment,
    nomeOcupacao varchar(20) not null,
    primary key(ocupacao_id)
)

create table usuario(
	id int not null auto_increment,
    nomeUsuario varchar(45) not null,
    data_nas datetime,
    data_cad datetime,
    senha int not null,
    ocupacaoFK int not null,
    cargoFK int not null
    primary key(id),
    foreign key (ocupacaoFK) references ocupacao (ocupacao_id),
    foreign key (cargoFK) references cargo (cargo_id)
)

create table usuario_encluido(
	id int not null,
    usuarioFK varchar(45) not null,
    foreign key (usuarioFK) references usuario(id),
    primary key (id)
)

create table itens(
	iten_id int not null auto_increment,
    objeto varchar(40) not null,
    primary key(iten_id),
)

create table Ilocal(
	local_id int not null auto_increment,
    nomeLoc varchar(40) not null,
    bloco varchar(02) not null,
    capac int noto null,
    primary key(local_id),
    foreign key (objetoFK) references itens (iten_id)
)

create table checkin(
	id int not null auto_increment,
    evento varchar(45) not null,
    data_evento datetime,
    usuarioFK int not null,
    localFK int not null,
    primary key (id),
    foreign key (usuarioFK) references usuario(id),
    foreign key (localFK) references Ilocal(local_id)
)

create table evento(
	id int not null auto_increment,
    inicio datetime,
    fim datetime,
    vagas int not null, 	
    primary key(id)
)


create table nivel(
	id int not null auto_increment,
    nome varchar(40) not null,
    primary key(id)
)





