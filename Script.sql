drop database if exists escola;

create database if not exists escola;

use escola;

create table alunos(
	id int auto_increment,
	nome varchar(50),
	idade int ,
	primary key(id)
);

insert into alunos (nome, idade) values
('Joaozao',17),
('Carlinha',11),
('Ulisses',16);

select * from alunos a;

/* View 
 * View é uma representação virtual de uma tabela, baseada em uma consulta sql
 * ela permite simplificar consultas complexas e reutilizar a lógica de consulta
 * create view <nome> as <pesquisa>*/

create view alunosMaioresDe15 as 
select nome, idade from alunos where idade>15;

select * from alunosMaioresDe15;

alter view alunosmaioresde15 
as select nome, idade, year(now()) - idade as ano_nascimento from alunos where idade >15; 

select * from alunosMaioresDe15;

/* function
 * São blocos de códigos reutilizavéis que realizam uma tarefa especifica.
 * Pode-se us´-las parasimplificar consultas calculos ou manipulação de dados
 */

DELIMITER //
create function calculaMediaIdade()
returns decimal (5,2)
begin 
	declare media decimal(5,2);
	select avg(idade) into media from alunos;
	return media;
end// 
delimiter ;

select calculaMediaIdade() as mediaIdade;
select id, nome, idade, calculaMediaIdade() as mediaIdade from alunos;7

delimiter // 
create function calcularIdade(data_nascimento date)
returns int 
begin
	declare idade int; 
	declare data_atual date;
	set data_atual = curdate();
	set idade = year(data_atual) - year(data_nascimento);
	if month (data_atual) < month(data_nascimento) or
	(month(data_atual) = month(data_nascimento) and day(data_atual) < day(data_nascimento)
	) then 
		set idade = idade - 1;
	end if ;
return idade;
end //
delimiter ; 
select calcularIdade('2007-04-09');

/*Procedure
 * Procedimento são conjuntos de instruções sql armazenados no banco de dados
 * eles podem aceitar parametros e executar um série de comandos
 */

delimiter // 
create procedure adicionarAluno(x_nome varchar(50), x_idade int)
begin
	insert into alunos (nome, idade) values (x_nome, x_idade);
end//
delimiter ; 

call adicionarAluno('Ana', 30);

/* Difereça entre function e procedure
 * function -> retorna um valor. pode ser usado em expressão sql. exemplo select calcularMediaIdade();
 * procedure -> não retorna um valor diretamente. Pode ter efeitos colaterais, como modificar dados no banco de dados
 * . exemplo call adicionarAluno('ana', 30)
 */

select * from alunos a;
