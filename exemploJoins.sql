drop database if exists tipo_joins;

create database tipos_joins;

use tipos_joins;

create table cores(
	id int auto_increment,
	cor varchar(50),
	primary key(id)
);

create table frutas(
	id int auto_increment,
	fruta varchar(50),
	primary key(id)
);

create table cores_frutas(
	frutas_id int not null,
	cores_id int not null,
	primary key (frutas_id,cores_id),
	constraint fk_cores_frutas_cores
	foreign key (cores_id)
	references cores(id),
	constraint fk_cores_frutas_frutas
	foreign key (frutas_id)
	references frutas(id)
);

INSERT INTO tipos_joins.cores(cor)values
('Preto'),
('Marrom'),
('Verde');

select * from cores c ;

insert into frutas (fruta) values
('jamelao'),
('jaca'),
('maracuja'),
('tomate'),
('limão'),
('goiaba');

select id , fruta  from frutas f ;
/*
 * Cross join é um tipo de junção em que cada linha de uma tabela
 * é combinada com todas as linhas de outra tabela. Isso resulta 
 * em um produto cartesiano entre as duas tabelas,ou seja, todas as
 * combinações possíveis de linhas são produzidas
 * Por exemplo: temos duas tabela, uma chamada cores e outra chama
 * e queremos encomtrar todas as combinações possiíveis de cores e frutas
 */
insert into cores_frutas (cores_id,frutas_id)
select c.id as cores_id ,f.id as frutas_id  from cores c
cross join frutas f; 

select cores_id, frutas_id from cores_frutas

