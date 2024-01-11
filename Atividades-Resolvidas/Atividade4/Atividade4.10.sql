/*Os nomes, CREs e número de internações de enfermeiros que
participaram de mais de uma internação.*/
select e.nome, e.cre, i.id_internacao, count(*)
from internacao_Enfermeiro as ie inner join internacao as i on(ie.internacao_id=i.id_internacao)
	inner join Enfermeiro as e on (ie.enfermeiro_id=e.id_Enfermeiro)
    group by i.id_internacao 
    having count(*)>=2
    