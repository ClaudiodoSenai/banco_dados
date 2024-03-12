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

create table clientes (
id int,
nome varchar(50),
primary key (id)
);

create table pedidos(
id int,
cliente_id int,
data_pedido date,
primary key (id),
constraint fk_pedidos_clientes
foreign key (cliente_id)
references clientes(id)
);

insert into clientes (id, nome) values
(1, 'Humberto'),
(2, 'Aroldo'),
(3, 'Astolfo'),
(4, 'Nanderaldo'),
(5, 'Marcinho'),
(6, 'Bastião');

insert into pedidos (id, cliente_id, data_pedido) values
(101,1,'2024-03-01'),
(102,1,'2024-03-02'),
(103,2,'2024-03-04'),
(104,3,'2024-03-05'),
(105,4,'2024-03-08'),
(106,2,'2024-03-09'),
(107,5,'2024-03-11'),
(108,5,'2024-03-10'),
(109,3,'2024-03-21');

insert into pedidos (id, data_pedido) values (110, '2024-03-11');

select id,nome from clientes;
select id, cliente_id, data_pedido from pedidos;
/*
 * Inner Join:Retorna registros quando há pelo menos uma correspondência
 * em ambas as tabelas */
 select c.id, c.nome, p.id, p.data_pedido, p.cliente_id from clientes c 
 inner join pedidos p on c.id = p.cliente_id;

/*neste exemplo, estamos selecionando todas as colunas das tabelas (clientes e pedidos)
 * onde há uma correspondência entre o id na tabela clientes e o 
 * cliente_id na tabela pedidos
 */

/*LEFT JOIN: Retorna todos os registros da tabela da esquerda(primeira tabela mencionada) e 
 * os registros correspondentes da tabela da direita(segunda tabela mencionada). */

 select c.id, c.nome, p.id, p.data_pedido, p.cliente_id from clientes c 
left join pedidos p on c.id = p.cliente_id; 

/*aqui estamos selecionando todos os registros da abela clientes e os registros 
 * correspondentes da tabela pedidos, se houver, com base na correspondência de id e clientes_id*/

/*Right Join:Retorna todos os registros da tabela da direita (segunda tabela mencionada) e os
 * registro correspondentes da tabela da esquerda (primeira tabela mencionada)
 */
select c.id, c.nome, p.id, p.data_pedido, p.cliente_id from clientes c 
 right join pedidos p on c.id = p.cliente_id; 
/*este comando retorna todos os registros da tabela pedidos e os registros correspondentes
 * da tabela clientes, se houver, com base na correspondência de id e cliente_id
 * */
