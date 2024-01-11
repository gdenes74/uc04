/*Todos os dados das internações que tiveram data de alta maior que
a data prevista para a alta.*/
select * 
from internacao
where data_alta > data_prev_alta;