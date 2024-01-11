
/*Início atividade 4.1
Todos os dados e o valor médio das consultas do ano de 2020 e
das que foram feitas sob convênio.
*/
show databases;
use atividade3uc03;
show tables;
update consulta set data_consulta= '2020-01-10' where id_Consulta=1; 
update consulta set data_consulta= '2020-02-10' where id_Consulta=2;
update consulta set data_consulta= '2020-03-10' where id_Consulta=3;
update consulta set data_consulta= '2020-04-10' where id_Consulta=4;
update consulta set data_consulta= '2020-05-10' where id_Consulta=5;
update consulta set data_consulta= '2020-06-10' where id_Consulta=6;
update consulta set data_consulta= '2020-07-10' where id_Consulta=7;
update consulta set data_consulta= '2020-08-10' where id_Consulta=8;
update consulta set data_consulta= '2020-09-10' where id_Consulta=9;
update consulta set data_consulta= '2020-10-10' where id_Consulta=10;
update consulta set data_consulta= '2020-11-10' where id_Consulta=11;
update consulta set data_consulta= '2020-12-10' where id_Consulta=12;
/*Todos os dados e o valor médio das consultas do ano de 2020 e
das que foram feitas sob convênio.*/
select *, avg (valor_consulta) from consulta where data_consulta >'2020-01-01' and convenio_id>0; 





