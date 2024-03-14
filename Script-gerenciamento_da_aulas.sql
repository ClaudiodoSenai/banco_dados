drop database if exists sala_de_aula ;


create database sala_de_aula;

use sala_de_aula;

create table alunos (
	id int not null auto_increment,
	nome varchar(120) not null,
	dt_nascimento date not null,
	endereco varchar(120) not null ,
	rm int(11) not null unique,
	primary key(id)
);

create table professores(
id int not null auto_increment,
nome varchar(120) not null,
ra int(11) not null unique,
especialidade varchar(45),
grau_academico varchar(45),
primary key(id)
);

create table disciplinas(
id int not null auto_increment,
nome varchar(120),
professor_id int not null,
codigo varchar(120) not null unique,
primary key(id),
constraint fk_professor_disciplina
foreign key (professor_id)
references professores (id)
);


create table alunos_has_disciplinas(
alunos_id int not null,
disciplina_id int not null,
primary key (alunos_id,disciplina_id),
constraint fk_alunos_disciplinas
foreign key (alunos_id)
references alunos (id),
constraint fk_disciplinas_alunos
foreign key (disciplina_id)
references disciplinas (id)
);

create table notas (
id int not null auto_increment,
disciplina_id int not null,
aluno_id int not null,
notas decimal(5,2) not null,
primary key (id),
constraint fk_alunos_disciplina
foreign key (aluno_id)
references alunos (id),
constraint fk_disciplinas_aluno
foreign key (disciplina_id)
references disciplinas (id)
);

INSERT INTO alunos  (nome, endereco, dt_nascimento,rm) VALUES ('Aluno', 'Rua amazonara', '2000-03-04 ', 10101560);
INSERT INTO alunos  (nome, endereco, dt_nascimento,rm) VALUES ('Aluno1', 'Rua amazonara', '2000-03-04 ', 101010);
INSERT INTO alunos  (nome, endereco, dt_nascimento,rm) VALUES ('Aluno2', 'Rua amazonara', '2000-03-04 ', 1021010);
INSERT INTO alunos  (nome, endereco, dt_nascimento,rm) VALUES ('Aluno3', 'Rua amazonara', '2000-03-04 ', 1013010);
INSERT INTO alunos  (nome, endereco, dt_nascimento,rm) VALUES ('Aluno4', 'Rua amazonara', '2000-03-04 ', 1010410);
INSERT INTO alunos  (nome, endereco, dt_nascimento,rm) VALUES ('Aluno6', 'Rua amazonara', '2000-03-04 ', 1010150);
INSERT INTO alunos  (nome, endereco, dt_nascimento,rm) VALUES ('Aluno7', 'Rua amazonara', '2000-03-04 ', 1010106);
INSERT INTO alunos  (nome, endereco, dt_nascimento,rm) VALUES ('Aluno8', 'Rua amazonara', '2000-03-04 ', 10101506);
INSERT INTO alunos  (nome, endereco, dt_nascimento,rm) VALUES ('Aluno9', 'Rua amazonara', '2000-03-04 ', 10101110);
INSERT INTO alunos  (nome, endereco, dt_nascimento,rm) VALUES ('Aluno10', 'Rua amazonara', '2000-03-04 ', 10101120);
INSERT INTO alunos  (nome, endereco, dt_nascimento,rm) VALUES ('Aluno11', 'Rua amazonara', '2000-03-04 ', 10101450);
INSERT INTO alunos  (nome, endereco, dt_nascimento,rm) VALUES ('Aluno12', 'Rua amazonara', '2000-03-04 ', 10101078);
INSERT INTO alunos  (nome, endereco, dt_nascimento,rm) VALUES ('Aluno13', 'Rua amazonara', '2000-03-04 ', 10101000);
INSERT INTO alunos  (nome, endereco, dt_nascimento,rm) VALUES ('Aluno14', 'Rua amazonara', '2000-03-04 ', 10101013);
INSERT INTO alunos  (nome, endereco, dt_nascimento,rm) VALUES ('Aluno15', 'Rua amazonara', '2000-03-04 ', 10101044);
INSERT INTO alunos  (nome, endereco, dt_nascimento,rm) VALUES ('Aluno16', 'Rua amazonara', '2000-03-04 ', 10101018);
INSERT INTO alunos  (nome, endereco, dt_nascimento,rm) VALUES ('Aluno17', 'Rua amazonara', '2000-03-04 ', 10101023);
INSERT INTO alunos  (nome, endereco, dt_nascimento,rm) VALUES ('Aluno18', 'Rua amazonara', '2000-03-04 ', 10101021);
INSERT INTO alunos  (nome, endereco, dt_nascimento,rm) VALUES ('Aluno19', 'Rua amazonara', '2000-03-04 ', 1013110);
INSERT INTO alunos  (nome, endereco, dt_nascimento,rm) VALUES ('Aluno35', 'Rua amazonara', '1980-03-04 ', 1450102120);
  
select nome,endereco , dt_nascimento , rm  from alunos  ;

insert into professores (nome, ra, grau_academico, especialidade) values('Alek', 021390, 'formado em bdeaver', 'php');
insert into professores (nome, ra, grau_academico, especialidade) values('Claudemir', 020390, 'formado em android studio', 'taipiscript');
insert into professores (nome, ra, grau_academico, especialidade) values('Ambrózio', 12221390, 'formado em fisica', 'ondas eletromagnetica');

select id, nome, ra, grau_academico , especialidade  from professores p ;

insert into disciplinas (nome,professor_id,codigo ) values ('fisica',1, 'FIS101');
insert into disciplinas (nome,professor_id,codigo) values ('quimica',3,'QUI090');
insert into disciplinas (nome,professor_id,codigo) values ('matematica',2, 'MAT101');
insert into disciplinas (nome,professor_id,codigo) values ('artes',2,'ART097');
insert into disciplinas (nome,professor_id,codigo) values ('lingua portuguesa',1,'LPT0983');


select id, nome, professor_id from disciplinas ;

-- adicionando alunos para a disciplina de matemática
/*insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (1, 2);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (2, 2);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (3, 2);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (4, 2);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (5, 2);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (6, 2);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (7, 2);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (8, 2);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (9, 2);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (10, 2);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (12, 2);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (13, 2);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (14, 2);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (15, 2);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (16, 2);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (17, 2);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (18, 2);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (19, 2);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (20, 2);

-- adicionando em quimica
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (1, 3);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (2, 3);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (3, 3);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (4, 3);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (5, 3);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (6, 3);

-- adicionando em artes
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (1, 1);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (2, 1);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (3, 1);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (4, 1);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (5, 1);
insert into alunos_has_disciplinas (alunos_id, disciplina_id) values (6, 1);*/

-- adicionando alunos em disciplinas
insert into alunos_has_disciplinas  (alunos_id,disciplina_id)
select a.id as alunos_id ,d.id as disciplina_id  from alunos a
cross join disciplinas d;

select * from alunos_has_disciplinas ;


insert into notas (aluno_id, notas,disciplina_id)
values
-- notas para física 
(1,10,1),
(2,0,1),
(3,09,1),
(4,08,1),
(5,07,1),
(6,07,1),
(7,07,1),
(8,05,1),
(9,04,1),
(10,03,1),
(11,01,1),
(12,01,1),
(13,01,1),
(14,04,1),
(15,04,1),
(16,04,1),
(17,03,1),
(18,03,1),
(19,09,1),
(20,08,1),
-- notas para química 
(1,10,2),
(2,0,2),
(3,09,2),
-- notas matemática 
(1,10,3),
(2,0,3),
(3,07,3),
-- notas para artes
(1,10,4),
(2,07,4),
(3,09,4),
-- notas lingua portuguesa 
(1,10,5),
(2,07,5),
(3,9,5);

select * from notas ;
-- tarefa 1
select a.id, a.nome, d.nome from alunos a 
inner join alunos_has_disciplinas l on a.id = l.alunos_id
inner join disciplinas d on d.id = l.disciplina_id 
where d.nome = 'matemática';

-- tarefa 2 

select p.id, p.nome from professores p
inner join disciplinas d on p.id = d.professor_id
where d.nome = 'matematica';

-- tarefa 3

select a.id as alunos_id, d.nome as disciplina from alunos a
cross join disciplinas d;

-- tarefa 4
select n.aluno_id, n.notas, n.disciplina_id from notas n
inner join alunos a on a.id = n.aluno_id
inner join disciplinas d on d.id = n.disciplina_id
where d.nome = 'física';

-- tarefa 5
select a.nome, n.notas, n.disciplina_id from notas n
inner join alunos a on a.nome = a.nome
inner join disciplinas d on d.id = n.disciplina_id
where n.notas >= 7 ;

-- tarefa 6 
select a.nome, n.notas, n.disciplina_id from notas n
inner join alunos a on a.nome = a.nome
inner join disciplinas d on d.id = n.disciplina_id
where n.notas >= 7 and d.codigo = 'MAT101';

-- 7




