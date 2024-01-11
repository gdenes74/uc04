/*Nome do paciente, nome do médico, data da internação e
procedimentos das internações realizadas por médicos da
especialidade “gastroenterologia”, que tenham acontecido em
“enfermaria”.*/
 /*alterar o nome da descricao especialidade, que estava errado e posterior, alterando a especialidade de um medico para essa mesma especialidade*/
 update Especialidades set  descricao='gastroenterologia' where id_Especialidades=3	
 select * from Medico_especialidade
 update Medico_especialidade set medico_id= 3 where especialidade_id=2
 update Medico_especialidade set especialidade_id= 3 where Id_Medico_Especialidade=2
 select * from tipo_quarto
 update tipo_quarto set descricao= 'enfermaria' where id_Tipo_quarto=3 
 
 /*Script resposta 4.8*/
 
 select i.id_internacao,p.nome,m.nome_medico, i.data_entrada,e.descricao, tq.descricao
from internacao as i inner join paciente as p on (i.paciente_id=p.id_Paciente)
	inner join quarto as q on (i.quarto_id=q.id_Quarto)
    inner join tipo_quarto as tq on (q.id_Quarto=tq.id_Tipo_quarto)
    inner join Medico_especialidade as me on ( i.medicos_especialidade_id=me.id_Medico_especialidade)
    inner join Especialidades as e on ( me.especialidade_id=e.id_Especialidades)
    inner join Medicos as m on ( me.medico_id=m.id_Medicos)
    where e.descricao = 'gastroenterologia' and tq.descricao='enfermaria'
 
    