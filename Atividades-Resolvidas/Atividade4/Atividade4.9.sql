 /*9.Os nomes dos médicos, seus CRMs e a quantidade de consultas
que cada um realizou.*/
select m.nome_medico, m.crm_medico, c.data_consulta,count(*)
from Consulta as c inner join Medicos as m on (c.Medico_id= id_Medicos) 
group by m.nome_medico;
