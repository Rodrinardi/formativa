create database formativaRodrigo;
use formativaRodrigo;

create table cargo(
cargo_id bigint not null auto_increment,
Cargo varchar(250) not null,
primary key(cargo_id)
);

create table ocupacoes(
ocupacao_id bigint not null auto_increment,
Ocupacao varchar(200) not null,
primary key(ocupacao_id)
);

create table usuarios(
usuario_id bigint not null auto_increment,
nome varchar(200) not null,
email varchar(150) not null,
data_cadastro date not null,
data_nascimento date not null,
senha varchar(45) not null,
OcupacaoFK bigint not null,
CargoFK bigint not null,
primary key (usuario_id),
foreign key (OcupacaoFK) references ocupacoes(ocupacao_id),
foreign key (CargoFK) references cargo(cargo_id)
);

create table usuariosExcluidos(
excluidos_id bigint not null auto_increment,
UsuarioFK bigint not null, 
primary key(excluidos_id),
foreign key (UsuarioFK) references usuarios(usuario_id)
);

create table predios(
predio_id bigint not null auto_increment, 
predio varchar(50) not null,
primary key(predio_id)
);

create table salas(
sala_id bigint not null auto_increment,
nome_sala varchar(250),
lotacao int not null,
predioFK bigint not null,
primary key(sala_id),
foreign key (predioFK) references predios(predio_id)
);

create table itens(
iten_id bigint not null auto_increment,
tipo varchar(250) not null,
 primary key(iten_id)
);

create table checkList(
checklist_id bigint not null auto_increment,
salaFK bigint not null,
itenFK bigint not null,
primary key(checklist_id),
foreign key (salaFK) references salas(sala_id),
foreign key (itenFK) references itens(iten_id)
);


create table eventos(
evento_id bigint not null auto_increment,
data_criacao date not null default(now()),
data_evento datetime not null,
numero_vagas int not null,
tempo_checkIn datetime not null,
responsavelFK bigint not null,
primary key(evento_id),
foreign key (responsavelFK) references usuarios(usuario_id)
);

create table checkIn(
checkin_id bigint not null auto_increment,
usuarioFK bigint not null,
eventoFK bigint not null,
primary key(checkin_id),
foreign key (usuarioFK) references usuarios(usuario_id),
foreign key (eventoFK) references eventos(evento_id)
);

INSERT INTO cargo (cargo_id, Cargo) VALUES
('1', 'Administrador'),
('2', 'Gestor'),
('3', 'Usuários'),
('4', 'Visitante');

INSERT INTO ocupacoes (ocupacao_id, Ocupacao) VALUES
('1', 'Coordenador'),
('2', 'Diretor'),
('3', 'Aluno'),
('4', 'Inspetor'),
('5', 'Seceretária');

INSERT INTO usuarios (usuario_id, nome, email, data_cadastro, data_nascimento, senha, OcupacaoFK, CargoFK) VALUES
('1', 'Alberto Ernesto', 'albertoernesto@email.com.br', '2022-05-12', '2000-05-14', 'senha A', 1, 1),
('2', 'José Felipe', 'josefelipe@email.com.br', '2021-04-11', '1999-05-22', 'senha B', 2, 2),
('3', 'Gustavo Fernandes', 'gustavofernandes@email.com.br', '2012-05-12', '1998-11-14', 'senha C', 3, 3),
('4', 'Beatriz Almeida', 'beatrizalmeida@email.com.br', '2023-05-12', '1995-03-14', 'senha D', 3, 4),
('5', 'Carla Junqueira', 'carlajunqueira@email.com.br', '2019-01-23', '2002-10-05', 'senha EA', 1, 2);

INSERT INTO usuariosExcluidos (excluidos_id, UsuarioFK) VALUES
('1', '3'),
('2', '2'),
('3', '5');

INSERT INTO predios (predio_id, predio) VALUES
('1', 'Predio A'),
('2', 'Predio B'),
('3', 'Predio C'),
('4', 'Predio D');

INSERT INTO salas (sala_id, nome_sala, lotacao, predioFK) VALUES
('1', 'laboratório de Informática', '50', '2'),
('2', 'Auditório Central', '150', '3'),
('3', 'Sala de Reuniões', '30', '1'),
('4', 'Biblioteca Área Eventos', '50', '4');

INSERT INTO itens (iten_id, tipo) VALUES
('1', 'Projetor'),
('2', 'TV Smart'),
('3', 'Ar Condicionado'),
('4', 'Work Station');

INSERT INTO checkList (checklist_id, salaFK, itenFK) VALUES
('1', 1, 1),
('2', 3, 4),
('3', 2, 1),
('4', 4, 2),
('5', 1, 3);

INSERT INTO eventos (evento_id, data_criacao, data_evento, numero_vagas, tempo_checkIn, responsavelFK) VALUES
('1', '2017-07-06', '2017-08-12', '40', '2017-08-05 21:00:00', 1),
('2', '2015-05-02', '2015-06-10', '50', '2015-06-01 17:30:00', 2),
('3', '2019-12-25', '2020-01-12', '40', '2020-01-03 15:45:00', 3),
('4', '2023-04-25', '2023-05-23', '40', '2023-05-17 19:30:00', 4);

INSERT INTO checkIn (checkin_id, usuarioFK, eventoFK) VALUES
('1', 1, 2),
('2', 3, 1),
('3', 4, 3),
('4', 2, 4);


SELECT *
FROM salas
WHERE sala_id IN (SELECT DISTINCT responsavelFk FROM eventos);

SELECT *
FROM salas
WHERE sala_id NOT IN (SELECT DISTINCT responsavelFk FROM eventos);

SELECT *
FROM eventos
WHERE data_criacao >= '2023-05-28 20:40:00' AND data_evento <= '2023-05-28 21:40:00';

SELECT *
FROM Usuarios
WHERE usuario_id IN (SELECT DISTINCT usuarioFK FROM checkIN);

select * from ocupacoes;

select * from usuarios;

select * from salas;

select * from predios;

select * from salas;

select * from itens;

select * from checklist;

select * from eventos;

select * from checkin;