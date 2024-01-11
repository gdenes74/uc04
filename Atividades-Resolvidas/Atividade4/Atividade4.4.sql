/*Todos os dados da consulta de maior valor e também da de menor
valor (ambas as consultas não foram realizadas sob convênio).*/

show tables;
use atividade3uc03;
select *, min(valor_consulta), max(valor_consulta)
from consulta, Convenio
where not convenio_id;


/*Feito alterações na tabela consulta e convenio para se adequar a questao.
select * from Consulta
insert into Convenio (nome_convenio, CNPJ, carencia) values ('sem convenio','null', 'null');
select * from convenio;
update Consulta set convenio_id=6 where id_Consulta=1 ;
update Consulta set convenio_id=6 where id_Consulta=5;*/