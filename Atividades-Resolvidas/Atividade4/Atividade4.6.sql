/* Data, procedimento e número de quarto de internações em quartos
do tipo “apartamento”*/
/* Nesta parte estou descobrindo quais sao os tipos de quartos, verifiquei que estavam confusos e alterei a ordem,
para facilitar as questoes.*/
select * from tipo_quarto join quarto on ( id_Tipo_quarto=id_Quarto);
update quarto set tipo_quarto_id=2 where id_Quarto=2;
update quarto set tipo_quarto_id=3 where id_Quarto=3;
select * from internacao;
select *from quarto;

select i.data_entrada, i.data_alta, i.procedimento,q.numero, tq.descricao,count(*)
from 
internacao as i inner join quarto as q on (i.id_internacao=q.id_Quarto)
inner join tipo_quarto as tq on ( i.id_internacao=tq.id_Tipo_quarto)
where tq.descricao = 'apartamento';


