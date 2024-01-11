/* Receituário completo da primeira consulta registrada com
receituário associado.*/
show tables;
/* fazendo um teste para selecionar as datas,,
select * from consulta order by data_consulta;
select min(data_consulta) from consulta;*/

select * from 
receituario as r inner join consulta as c on (r.consulta_id= c.id_consulta)
where data_consulta= (select min(data_consulta) from consulta);
