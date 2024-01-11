/*Nome do paciente, 
data da consulta e 
especialidade de todas as
consultas
em que os pacientes eram menores de 18 anos
na data da consulta e 
cuja especialidade não seja “pediatria”, 
ordenando por data de realização da consulta.*/
select *
from medicos
where especialista  like ('%pediatria%');
select * from especialidades;
select id_Medicos, nome_medico, especialista
from medicos_especialidade  
group by medico_id;
/*p.nome, c.data_consulta,p.data_nascimento, nome_medico*/;


select * from consulta;
select * from medicos;
/*Descobri que o base de dados estava com somente um médico efetuando as consultas, fiz as alterações abaixo:*/
update consulta set Medico_id=2 where id_Consulta=1;
update consulta set Medico_id=1 where id_Consulta=2;
update consulta set Medico_id=3 where id_Consulta=3;
update consulta set Medico_id=4 where id_Consulta=4;
update consulta set Medico_id=5 where id_Consulta=5;
update consulta set Medico_id=6 where id_Consulta=6;
update consulta set Medico_id=7 where id_Consulta=7;
update consulta set Medico_id=8 where id_Consulta=8;
update consulta set Medico_id=9 where id_Consulta=9;
update consulta set Medico_id=10 where id_Consulta=10;
update consulta set Medico_id=11 where id_Consulta=11;
update consulta set Medico_id=1 where id_Consulta=12;
update consulta set Medico_id=2 where id_Consulta=13;
update consulta set Medico_id=3 where id_Consulta=14;
update consulta set Medico_id=4 where id_Consulta=15;
update consulta set Medico_id=5 where id_Consulta=16;
update consulta set Medico_id=6 where id_Consulta=17;
update consulta set Medico_id=7 where id_Consulta=18;
update consulta set Medico_id=8 where id_Consulta=19;
update consulta set Medico_id=9 where id_Consulta=20;
/*Descobri que o base de dados estava com a tabela pacientes com idade superior a 18 anos, incrível, fiz algumas alterações para obter resposta*/
select id_Paciente, data_nascimento from paciente
order by id_Paciente;
update paciente set data_nascimento='2005-01-01' where id_Paciente=12;
update paciente set data_nascimento='2006-10-01' where id_Paciente=13;
update paciente set data_nascimento='2006-05-01' where id_Paciente=14;
update paciente set data_nascimento='2007-06-03' where id_Paciente=15;
update paciente set data_nascimento='2008-12-25' where id_Paciente=16;
update paciente set data_nascimento='2009-11-04' where id_Paciente=17;
update paciente set data_nascimento='2010-04-01' where id_Paciente=18;
update paciente set data_nascimento='2011-08-23' where id_Paciente=19;
update paciente set data_nascimento='2012-09-14' where id_Paciente=20;
update paciente set data_nascimento='2013-06-19' where id_Paciente=21;
update paciente set data_nascimento='2014-02-27' where id_Paciente=22;

/*----tive que separar a coluna especialista, pois mesmo colocando selecao <> ele 
marcava pediatria em conjunto com outra especialidade*/
select *
from medicos
where especialista  like ('%pediatria%');
update medicos set especialista= 'clínica geral' where id_Medicos=1;
update medicos set especialista= 'gastroenterologia' where id_Medicos=4;
update medicos set especialista= 'dermatologia' where id_Medicos=11;

select p.nome as Nome_Paciente,c.data_consulta,m.especialista,
curdate() as Data_Atual, p.data_nascimento, timestampdiff(year, p.data_nascimento, curdate()) as Idade 
from 
consulta as c inner join medicos as m on ( c.Medico_id=m.id_Medicos)
	inner join paciente as p on ( c.Paciente_id=p.id_Paciente)
  
	where timestampdiff(year, data_nascimento, curdate())<=18 and  m.especialista  <> 'pediatria'
order by c.data_consulta ; 
