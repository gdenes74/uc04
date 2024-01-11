create database atividade2uc03;
show tables;
use atividade2uc03;
CREATE TABLE Medicos(
id_Medicos int not null auto_increment primary key,
nome_medico varchar(100) not null,
crm_medico varchar (45) unique,
cpf_medico varchar (11) unique, 
residente varchar (45),
especialista varchar(45)
);
CREATE TABLE Paciente(
id_Paciente int not null auto_increment primary key,
nome varchar(100),
data_nascimento date,
endereco varchar(100),
telefone varchar (100),
email varchar (100),
carteira_identidade varchar(100),
cpf varchar (11) unique

);
CREATE TABLE Convenio(
id_Convenio int not null auto_increment primary key,
nome_convenio varchar(100) not null, 
CNPJ varchar(14) unique,
carencia varchar (100)
);
CREATE TABLE Consulta(
id_Consulta int not null auto_increment primary key,
data_consulta date,
hora_consulta varchar(45), 
valor_consulta real,
Medico_id int,
Paciente_id int,
convenio_id int,
foreign key (Medico_id) references Medicos (id_Medicos),
foreign key (Paciente_id) references Paciente (id_Paciente),
foreign key (convenio_id) references Convenio(id_Convenio)
);
CREATE TABLE receituario(
id_receituario int not null auto_increment primary key,
remedios varchar(100),
quantidade int,
instrucoes_uso mediumtext,
consulta_id int,
foreign key (consulta_id) references consulta(id_consulta)
);
CREATE TABLE Tipo_quarto(
id_Tipo_quarto int not null auto_increment primary key,
descricao varchar (100),
valor_diaria decimal(9,2)
);
CREATE TABLE Quarto(
id_Quarto int not null auto_increment primary key,
numero int, 
tipo varchar(45),
tipo_quarto_id int,
foreign key (tipo_quarto_id) references tipo_quarto(id_Tipo_quarto)
);
CREATE TABLE Especialidades(
id_Especialidades int not null auto_increment primary key, 
pediatria varchar (45) not null,
clinico_geral varchar(45) not null,
gastroendocrologia varchar (45) not null,
dermatologia varchar (45) not null
);
CREATE TABLE Medico_Especialidade(
id_Medico_Especialidade int not null auto_increment primary key, 
especialidade_id int,
medico_id int,
foreign key (especialidade_id) references Especialidades(id_Especialidades),
foreign key (medico_id) references Medicos(id_Medicos)
);
CREATE TABLE Enfermeiro(
id_Enfermeiro int not null auto_increment primary key, 
nome varchar(100),
cpf varchar(11) unique,
cre varchar(20) unique
);
CREATE TABLE internacao(
id_internacao int not null auto_increment primary key,
data_entrada date,
data_prev_alta date,
data_alta date,
procedimento varchar (100),
quarto_id int,
paciente_id int,
medicos_especialidade_id int,
foreign key (quarto_id) references Quarto(id_Quarto),
foreign key (paciente_id) references Paciente(id_Paciente),
foreign key (medicos_especialidade_id) references Medico_especialidade(id_Medico_especialidade)
);