/*Todos os dados das internações em seus respectivos quartos,
calculando o total da internação a partir do valor de diária do quarto
e o número de dias entre a entrada e a alta.*/

select *,datediff(data_alta,data_entrada) as Diárias, sum(datediff(data_alta,data_entrada)*valor_diaria) as Total_internacao
from internacao as i inner join quarto as q on ( i.quarto_id=q.id_Quarto)
	inner join Tipo_quarto as tq on ( q.tipo_quarto_id=tq.id_Tipo_quarto)
group by i.id_internacao;

