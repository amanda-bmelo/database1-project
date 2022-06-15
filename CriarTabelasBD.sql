-- create schema ESCOLAS;

use ESCOLAS;

create table Cidade(
	id int auto_increment,
    nome varchar(20) not null,
	primary key(id)
);

create table Pessoa(
	id int auto_increment,
    nome varchar(40) not null,
    telefone varchar(14),
    cidade_id int not null,
	primary key(id),
    foreign key(cidade_id) references Cidade(id)
);

create table Professor(
	id int not null,
    RG varchar(15) not null,
    CPF varchar(15) not null,
    titulacao varchar(15) not null,
	primary key(id),
    foreign key(id) references Pessoa(id)
);

create table Escola(
	id int auto_increment,
    nome varchar(20) not null,
    cidade_id int not null,
    diretor_id int not null,
	primary key(id),
    foreign key(cidade_id) references Cidade(id),
    foreign key(diretor_id) references Professor(id)
);

create table Disciplina(
	id int auto_increment,
    nome varchar(20) not null,
	primary key(id)
);
76
create table Turma(
	id int auto_increment,
    nome varchar(20) not null,
    escola_id int not null,
	primary key(id),
    foreign key(escola_id) references Escola(id)
);

create table Aluno(
	id int not null,
    matricula varchar(40) not null,
    data_nasc Date not null,
    turma_id int not null,
	primary key(id),
    foreign key(id) references Pessoa(id),
	foreign key(turma_id) references Turma(id)
);

create table Contato(
	aluno_id int not null,
    nome varchar(40) not null,
    telefone varchar(14) not null,
	primary key(aluno_id, nome),
    foreign key(aluno_id) references Aluno(id)
);

create table Ministra(
	professor_id int not null,
    disciplina_id int not null,
    primary key(professor_id, disciplina_id),
    foreign key(professor_id) references Professor(id),
    foreign key(disciplina_id) references Disciplina(id)
);

create table Turma_Ministrada(
	professor_id int not null,
    turma_id int not null,
    disciplina_id int not null,
    primary key(professor_id, turma_id, disciplina_id),
    foreign key(professor_id) references Ministra(professor_id),
    foreign key(disciplina_id) references Ministra(disciplina_id),
    foreign key(turma_id) references Turma(id)
);
