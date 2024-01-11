
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
create table Internacao_Enfermeiro(
id_Internacao_Enfermeiro int not null auto_increment primary key,
internacao_id int,
enfermeiro_id int,
foreign key (internacao_id ) references internacao(id_internacao),
foreign key (enfermeiro_id ) references enfermeiro(id_enfermeiro)

);

create database atividade3uc03;
show tables;
use atividade3uc03;

show create table medicos;
insert into medicos( nome_medico, crm_medico, cpf_medico, residente, especialista)values('Anny Quintanilha','120935','86132473009','Não é residente','pediatria e clinica geral');
insert into medicos( nome_medico, crm_medico, cpf_medico, residente, especialista)values('Sueli Simão Pegado','15891/sp','62876978067','É residente','clinica geral');
insert into medicos( nome_medico, crm_medico, cpf_medico, residente, especialista)values('Alisson Sacramento','178105/mg','80814279023','Não é residente','gastroenterologia');
insert into medicos( nome_medico, crm_medico, cpf_medico, residente, especialista)values('Lívia Veloso','17897/mg','20924987030','Não é residente','pediatria e gastroenterologia');
insert into medicos( nome_medico, crm_medico, cpf_medico, residente, especialista)values('Gael Milheiro Lemes','9826/rs','38603737061','Não é residente	dermatologista');
insert into medicos( nome_medico, crm_medico, cpf_medico, residente, especialista)values('Gisela Espinosa','34548/sp','23529091049','Não é residente','clinica geral');
insert into medicos( nome_medico, crm_medico, cpf_medico, residente, especialista)values('Nelson Anjos Palmeira','344789/sp','03626639045','Não é residente','pediatria');
insert into medicos( nome_medico, crm_medico, cpf_medico, residente, especialista)values('Ezequiel Pestana Henrique','9756/rs','67297959057','Não é residente','pediatria');
insert into medicos( nome_medico, crm_medico, cpf_medico, residente, especialista)values('Tito Carqueijeiro','14777/rs','74588651056','Não é residente','clinica geral');
insert into medicos( nome_medico, crm_medico, cpf_medico, residente, especialista)values('Fabiano Gomide','65765/rs','32972518080','É residente','clinica geral');
insert into medicos( nome_medico, crm_medico, cpf_medico, residente, especialista)values('Cristovão Xavier','67432/rs','92690490005','Não é residente','dermatologista e pediatria');
select  *from medicos;
select * from paciente;
insert into paciente( nome, data_nascimento, endereco, telefone, email, carteira_identidade) values(12, 'Karine Macena Porciúncula', '1940-01-01', 'R Caminho do Meio, 1', '51-999489918', 'karinem@gmail.com', '27.840.673-7', '05871119093');
insert into paciente( nome, data_nascimento, endereco, telefone, email, carteira_identidade) values(13, 'Daiane Lorena Assunção', '1942-06-19', 'R Caminho do Início, 2', '51-999489914', 'daianelorena@gmail.com', '47.841.673-8', '91273803000');
insert into paciente( nome, data_nascimento, endereco, telefone, email, carteira_identidade) values(14, 'Danilo Pedro Henrique Dias', '1942-03-13', 'R Caminho do Fim, 3', '51-988889918', 'danilopedrodias@comercialrizzo.com', '22.682.666-1', '42844106013');
insert into paciente( nome, data_nascimento, endereco, telefone, email, carteira_identidade) values(15, 'Julia Aparecida Adriana de Paula', '1942-05-21', 'R Sem Caminho do Meio, 21', '51-35819918', 'juliaaparecidadepaula@efetivaseguros.com.br', '36.475513-1', '32439888028');
insert into paciente( nome, data_nascimento, endereco, telefone, email, carteira_identidade) values(16, 'Camila Fátima Lara Rezende', '1984-06-25', 'Av Tromppowsky, 100', '48-98850264848', 'camila_rezende@jotace.eti.br', '255058093', '10181257106');
insert into paciente( nome, data_nascimento, endereco, telefone, email, carteira_identidade) values(17, 'Lara Analu Barbosa', '1958-04-06', 'Quadra D-1, 327', '82984442319', 'laraanalubarbosa@redhouse.com.br', '110184099', '01381227333');
insert into paciente( nome, data_nascimento, endereco, telefone, email, carteira_identidade) values(18, 'Pietra Juliana Isabelly Nascimento', '1973-06-15', 'R Rua Tacílio Leite, 353', '98-984195208', 'pietra_nascimento@novadeliveri.com.br', '150909962', '74868383620');
insert into paciente( nome, data_nascimento, endereco, telefone, email, carteira_identidade) values(19, 'Nelson Caio José Lima', '1982-06-11', 'Rua Tenente Antônio Reginatto, 869', '5137269278', 'nelson_caio_lima@teravida.com.br', '439587256', '52732309001');
insert into paciente( nome, data_nascimento, endereco, telefone, email, carteira_identidade) values(20, 'Lorenzo Luiz Miguel da Paz', '1978-05-22', 'R Rua Alberto Soczek, 870', '41982358455', 'lorenzoluizdapaz@iedi.com.br', '285526364', '99450144800');
insert into paciente( nome, data_nascimento, endereco, telefone, email, carteira_identidade) values(21, 'Tânia Nair Stefany Bernardes', '2000-06-23', 'R Antonio de Miranda, 511', '98992713580', 'tania_nair_bernardes@nine9.com.br', '402169918', '38001780872');
insert into paciente( nome, data_nascimento, endereco, telefone, email, carteira_identidade) values(22, 'Vitória Alícia Nair Drumond', '1992-02-17', 'Rua Beatriz de Barros Bumlai, 386', '67985104243', 'vitoria_drumond@facebook.com', '419311877', '15429311340');
insert into paciente( nome, data_nascimento, endereco, telefone, email, carteira_identidade) values(23, 'Mariane Bárbara Luciana Fogaça', '1959-06-15', 'Avenida Melício Machado, 523', '79991387555', 'mariane-fogaca74@lphbrasil.com.br', '329708958', '72366358989');
insert into paciente( nome, data_nascimento, endereco, telefone, email, carteira_identidade) values(24, 'Daiane Amanda Agatha Araújo', '1981-06-12', 'Travessa Niterói, 5447', '82984822267', 'daianeamandaaraujo@csa.edu.br', '339743803', '81804764566');
insert into paciente( nome, data_nascimento, endereco, telefone, email, carteira_identidade) values(25, 'Luís Manuel Theo Castro', '1950-02-08', 'Rua João Paulo Rodrigues de Lima, 936', '71986627109', 'luis.manuel.castro@paulistadovale.org.br', '208590584', '37132771680');
insert into paciente( nome, data_nascimento, endereco, telefone, email, carteira_identidade) values(26, 'Tatiane Olivia Mariana Pereira', '1977-04-14', 'Avenida Guilherme de Paula Xavier, 858', '44983029636', 'tatiane-pereira77@doucedoce.com.br', '446817478', '48751056909');
select * from paciente;
select*from convenio;
insert into convenio(nome_convenio, CNPJ, carencia)values(1, 'Unimed', '02812468000106', '06');
insert into convenio(nome_convenio, CNPJ, carencia)values(2, 'Bradesco Seguros', '33055146000193', '03');
insert into convenio(nome_convenio, CNPJ, carencia)values(3, 'Banco do Brasil Seguros', '28196889000143', '06');
insert into convenio(nome_convenio, CNPJ, carencia)values(4, 'Itau Seguros Saúde', '61557039000107', '12');
insert into convenio(nome_convenio, CNPJ, carencia)values(5, 'Porto Seguro -Seguro Saúde S/A', '04540010000170', '3');
select *from convenio;
insert into consulta( data_consulta, hora_consulta, valor_consulta, Medico_id, Paciente_id, convenio_id)values('2015-02-10','11:00',120.00,10,13,2);
insert into consulta( data_consulta, hora_consulta, valor_consulta, Medico_id, Paciente_id, convenio_id)values('2015-03-10','10:00',120.00,10,14,3);
insert into consulta( data_consulta, hora_consulta, valor_consulta, Medico_id, Paciente_id, convenio_id)values('2015-04-10','14:00',120.00,10,15,4);
insert into consulta( data_consulta, hora_consulta, valor_consulta, Medico_id, Paciente_id, convenio_id)values('2015-05-10','09:00',110.00,10,16,5);
insert into consulta( data_consulta, hora_consulta, valor_consulta, Medico_id, Paciente_id, convenio_id)values('2015-06-10','10:00',120.00,10,17,5);
insert into consulta( data_consulta, hora_consulta, valor_consulta, Medico_id, Paciente_id, convenio_id)values('2015-07-10','11:00',120.00,10,18,3);
insert into consulta( data_consulta, hora_consulta, valor_consulta, Medico_id, Paciente_id, convenio_id)values('2015-08-10','08;38',120.00,10,19,2);
insert into consulta( data_consulta, hora_consulta, valor_consulta, Medico_id, Paciente_id, convenio_id)values('2015-09-10','17:00',110.00,10,20,1);
insert into consulta( data_consulta, hora_consulta, valor_consulta, Medico_id, Paciente_id, convenio_id)values('2015-10-10','16:00',120.00,10,21,3);
insert into consulta( data_consulta, hora_consulta, valor_consulta, Medico_id, Paciente_id, convenio_id)values('2015-11-10','13:00',120.00,10,22,2);
insert into consulta( data_consulta, hora_consulta, valor_consulta, Medico_id, Paciente_id, convenio_id)values('2015-01-10','14:00',110.00,10,12,1);
insert into consulta( data_consulta, hora_consulta, valor_consulta, Medico_id, Paciente_id, convenio_id)values('2015-12-10','17:15',110.00,10,23,5);
insert into consulta( data_consulta, hora_consulta, valor_consulta, Medico_id, Paciente_id, convenio_id)values('2015-01-11','11:00',120.00,10,12,1);
insert into consulta( data_consulta, hora_consulta, valor_consulta, Medico_id, Paciente_id, convenio_id)values('2015-02-11','14:15',120.00,10,12,2);
insert into consulta( data_consulta, hora_consulta, valor_consulta, Medico_id, Paciente_id, convenio_id)values('2015-03-11','13:00',110.00,10,12,1);
insert into consulta( data_consulta, hora_consulta, valor_consulta, Medico_id, Paciente_id, convenio_id)values('2015-04-11','14:00',120.00,10,12,4);
insert into consulta( data_consulta, hora_consulta, valor_consulta, Medico_id, Paciente_id, convenio_id)values('2015-05-11','09:15',120.00,10,20,1);
insert into consulta( data_consulta, hora_consulta, valor_consulta, Medico_id, Paciente_id, convenio_id)values('2015-06-11','08:00',120.00,10,19,3);
insert into consulta( data_consulta, hora_consulta, valor_consulta, Medico_id, Paciente_id, convenio_id)values('2015-07-11','16:00',110.00,10,17,1);
insert into consulta( data_consulta, hora_consulta, valor_consulta, Medico_id, Paciente_id, convenio_id)values('2015-08-11','10:00',120.00,10,26,2);
select * from consulta;
select * from receituario;
insert into receituario (remedios, quantidade, instrucoes_uso, consulta_id)values('paracetamol', '10', 'Tomar 2 x ao dia entre 8 e 20 horas', 1);
insert into receituario (remedios, quantidade, instrucoes_uso, consulta_id)values('aldol', '1 ', 'Tomar 3 x ao dia, durante 7 dias', 3);
insert into receituario (remedios, quantidade, instrucoes_uso, consulta_id)values('AAS', '10 ', 'Tomar em caso de dor na cabeça', 3);
insert into receituario (remedios, quantidade, instrucoes_uso, consulta_id)values('Fluoxetina ', '30', 'Tomar 1 x ao dia pela manhâ, durante um mês ao dia entre 8 e 20 horas', 5);
insert into receituario (remedios, quantidade, instrucoes_uso, consulta_id)values('Ranitidina', '30', 'Tomar 1 x ao dia, para dores no estômago',7);
insert into receituario (remedios, quantidade, instrucoes_uso, consulta_id)values('Loratadina', '28', 'Tomar 1 x ao dia, em caso de renite, se piorar voltar consulta', 10);
insert into receituario (remedios, quantidade, instrucoes_uso, consulta_id)values('Prednisolona', '07', 'Tomar 1 x durante 7 dias', 13);
insert into receituario (remedios, quantidade, instrucoes_uso, consulta_id)values('Nimesulida', '28', 'Tomar 3 x ao dia, durante 7 dias, em caso do dente doer mais, tomar junto o remédio AASS', 16);
insert into receituario (remedios, quantidade, instrucoes_uso, consulta_id)values('Aciclovir ', '10', 'Tomar 1 x ao dia, indicado para Herpes Zoster', 19);
insert into receituario (remedios, quantidade, instrucoes_uso, consulta_id)values('Diazepam', '28', 'Tomar 1 x ao dia', 20);
insert into receituario (remedios, quantidade, instrucoes_uso, consulta_id)values('Amitriptilina ', '10', 'Tomar 2 x ao dia entre 8 e 20 horas', 19);
insert into receituario (remedios, quantidade, instrucoes_uso, consulta_id)values('paracetamol', '10', 'Tomar 3 x ao dia de 8 em 8 horas, caso tenha dor ou febre',5);
insert into receituario (remedios, quantidade, instrucoes_uso, consulta_id)values('paracetamol', '10', 'Tomar 3 x ao dia de 8 em 8 horas, caso tenha dor ou febre',7);
insert into receituario (remedios, quantidade, instrucoes_uso, consulta_id)values('paracetamol', '10', 'Tomar 3 x ao dia de 8 em 8 horas, caso tenha dor ou febre',10);
insert into receituario (remedios, quantidade, instrucoes_uso, consulta_id)values('paracetamol', '10', 'Tomar 3 x ao dia de 8 em 8 horas, caso tenha dor ou febre',13);
insert into receituario (remedios, quantidade, instrucoes_uso, consulta_id)values('paracetamol', '10', 'Tomar 3 x ao dia de 8 em 8 horas, caso tenha dor ou febre',16);
insert into receituario (remedios, quantidade, instrucoes_uso, consulta_id)values('paracetamol', '10', 'Tomar 3 x ao dia de 8 em 8 horas, caso tenha dor ou febre',19);
insert into receituario (remedios, quantidade, instrucoes_uso, consulta_id)values('paracetamol', '10', 'Tomar 3 x ao dia de 8 em 8 horas, caso tenha dor ou febre',20);
insert into receituario (remedios, quantidade, instrucoes_uso, consulta_id)values('paracetamol', '10', 'Tomar 3 x ao dia de 8 em 8 horas, caso tenha dor ou febre',16);
insert into receituario (remedios, quantidade, instrucoes_uso, consulta_id)values('Novalgina', '10', 'Tomar 3 gotas',1);
select * from receituario;
select *from tipo_quarto;
insert into tipo_quarto(descricao, valor_diaria) values ( 'standart', '450.00');
insert into tipo_quarto(descricao, valor_diaria) values ( 'duplo standart', '750.00');
insert into tipo_quarto(descricao, valor_diaria) values ( 'triples standart', '1100.00');
select *from tipo_quarto;
select*from quarto;
insert into quarto(numero, tipo, tipo_quarto_id) values ('10', 'Privado', 1);
insert into quarto(numero, tipo, tipo_quarto_id) values ('100', 'Sus', 3);
insert into quarto(numero, tipo, tipo_quarto_id) values ('200', 'Convenio', 2);
select*from quarto;

alter table especialidades drop column clinico_geral;
alter table especialidades drop column pediatria;
alter table especialidades drop column gastroendocrologia;
alter table especialidades drop column dermatologia;
select*from especialidades;
alter table especialidades add descricao varchar(100);
insert into especialidades ( descricao ) values ('clínico geral');
insert into especialidades ( descricao ) values ('pediatria');
insert into especialidades ( descricao ) values ('gastroendocrologia');
insert into especialidades ( descricao ) values ('dermatologia');
insert into especialidades (descricao) values ('pneumologista');
insert into especialidades (descricao) values ('oftalmologista');
insert into especialidades (descricao) values ('geriatra');
insert into especialidades (descricao) values ('cardiologista');
insert into especialidades (descricao) values ('Laringologista');
insert into especialidades (descricao) values ('ginecologista');
select*from especialidades;
select*from medico_especialidade;
insert into medico_especialidade(especialidade_id, medico_id) values (2,1);
insert into medico_especialidade(especialidade_id, medico_id) values (1,1);
insert into medico_especialidade(especialidade_id, medico_id) values (1,2);
insert into medico_especialidade(especialidade_id, medico_id) values (3,3);
insert into medico_especialidade(especialidade_id, medico_id) values (2,4);
insert into medico_especialidade(especialidade_id, medico_id) values (3,4);
insert into medico_especialidade(especialidade_id, medico_id) values (4,5);
insert into medico_especialidade(especialidade_id, medico_id) values (1,6);
insert into medico_especialidade(especialidade_id, medico_id) values (2,7);
insert into medico_especialidade(especialidade_id, medico_id) values (2,8);
insert into medico_especialidade(especialidade_id, medico_id) values (1,9);
insert into medico_especialidade(especialidade_id, medico_id) values (1,10);
insert into medico_especialidade(especialidade_id, medico_id) values (1,11);
insert into medico_especialidade(especialidade_id, medico_id) values (4,11);
select*from medico_especialidade;
select*from internacao;
insert into internacao (data_entrada, data_prev_alta, data_alta,procedimento, quarto_id, paciente_id, medicos_especialidade_id)values('2015-02-15','2015-03-15','2015-03-15','Amputação perna esquerda, acidente moto',2,20,1);
insert into internacao (data_entrada, data_prev_alta, data_alta,procedimento, quarto_id, paciente_id, medicos_especialidade_id)values('2015-03-15','2016-03-15','2015-04-15','Cirurgia no estômago',1,15,3);
insert into internacao (data_entrada, data_prev_alta, data_alta,procedimento, quarto_id, paciente_id, medicos_especialidade_id)values('2015-04-15','2015-06-15','2015-05-15','Cancêr no estômago, remocão e transplante',3,22,3);
insert into internacao (data_entrada, data_prev_alta, data_alta,procedimento, quarto_id, paciente_id, medicos_especialidade_id)values('2015-05-15','2015-06-15','2015-06-15','Diagnosticada com covid',2,15,1);
insert into internacao (data_entrada, data_prev_alta, data_alta,procedimento, quarto_id, paciente_id, medicos_especialidade_id)values('2015-06-15','2015-08-15','2015-12-15','Diagnóstico covid, caso gravíssimo',2,22,1);
insert into internacao (data_entrada, data_prev_alta, data_alta,procedimento, quarto_id, paciente_id, medicos_especialidade_id)values('2015-07-02','2015-08-15','2015-08-15','Tratamento nos rins',1,15,3);
insert into internacao (data_entrada, data_prev_alta, data_alta,procedimento, quarto_id, paciente_id, medicos_especialidade_id)values('2015-08-15','2015-01-16','2016-03-15','Nascimento de criança cesária prematuro',3,18,2);
select*from internacao;
select*from enfermeiro;
insert into enfermeiro(nome, cpf, cre) values ('Isabela Barher', '44479182934', '151874rs');
insert into enfermeiro(nome, cpf, cre) values ('Luciano Tomas Borges','45668194264','18188415rs');
insert into enfermeiro(nome, cpf, cre) values ('Nicole Dores Oliveira', '40076220354','47691172rs');
insert into enfermeiro(nome, cpf, cre) values ('Glauco da Souza Negris', '23495178538','412863625rs');
insert into enfermeiro(nome, cpf, cre) values ('Wesley Carvalho Gabrig','66715108145', '297131850rs');
insert into enfermeiro(nome, cpf, cre) values ('Ruan Peixoto Barthon', '22182912401', '233871123rs');
insert into enfermeiro(nome, cpf, cre) values ('Adelina Braga Pinto', '87807365803', '122844119rs');
insert into enfermeiro(nome, cpf, cre) values ('Elizabeth Dutra Caldas', '40111249406', '474783790rs');
insert into enfermeiro(nome, cpf, cre) values ('Elaine Celestino Ximenes', '22206029405', '223585221rs');
insert into enfermeiro(nome, cpf, cre) values ('Arlete Theodoro Rego', '07828151462', '118038655rs');
select * from enfermeiro;
select * from internacao_enfermeiro;
insert into internacao_enfermeiro( internacao_id, enfermeiro_id)values( 1,1);
insert into internacao_enfermeiro( internacao_id, enfermeiro_id)values( 1,2);
insert into internacao_enfermeiro( internacao_id, enfermeiro_id)values( 2,3);
insert into internacao_enfermeiro( internacao_id, enfermeiro_id)values( 2,4);
insert into internacao_enfermeiro( internacao_id, enfermeiro_id)values( 3,5);
insert into internacao_enfermeiro( internacao_id, enfermeiro_id)values( 3,6);
insert into internacao_enfermeiro( internacao_id, enfermeiro_id)values( 4,7);
insert into internacao_enfermeiro( internacao_id, enfermeiro_id)values( 4,8);
insert into internacao_enfermeiro( internacao_id, enfermeiro_id)values( 5,9);
insert into internacao_enfermeiro( internacao_id, enfermeiro_id)values( 5,10);
insert into internacao_enfermeiro( internacao_id, enfermeiro_id)values( 6,1);
insert into internacao_enfermeiro( internacao_id, enfermeiro_id)values( 6,2);
insert into internacao_enfermeiro( internacao_id, enfermeiro_id)values( 7,3);
insert into internacao_enfermeiro( internacao_id, enfermeiro_id)values( 7,4);
select * from internacao_enfermeiro;
alter table medicos add ativo char (1); 
select * from medicos;
alter table medicos modify column ativo varchar (40) ;
set Sql_safe_updates=0;
update medicos set ativo='ativo';
update medicos set ativo='inativo' where id_Medicos=10;
update medicos set ativo='inativo' where id_Medicos=11;
select * from medicos;
select * from tipo_quarto;
update tipo_quarto set descricao= 'enfermaria' where id_Tipo_quarto=1;
select*from quarto;
select*from internacao;
update internacao set data_alta='2015-03-18' where quarto_id =1;
update internacao set data_alta= '2015-07-05' where id_internacao=6;
select*from internacao;
select*from convenio;

delete from convenio where id_Convenio=5;
select *from consulta where id_Consulta=5 ;
select*from consulta where id_Con;
delete from consulta where id_Consulta=5;
delete from consulta  where convenio_id=5;
update consulta set convenio_id=4 where convenio_id=5;
delete from convenio where id_Convenio=5;
select *from convenio;
