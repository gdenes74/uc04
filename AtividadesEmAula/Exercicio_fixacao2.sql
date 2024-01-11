/*EXERCÍCIO DE FIXACAO:
AGRUPAR TODAS AS CATEGORIAS:
>QUANTIDADE DE PRODUTOS NA CATEGORIRA (CONT)
>MÉDIA DO VALOR DE VENDA(AVG)
>PRODUTO DE MENOR VALOR (MIN)
>PRODUTO DE MAIOR VALOR (MAX)
>QUANTIDADE EM ESTOQUE (SUM)
>VALOR BRUTO(QUANTIDADE X VALOR DE VENDA)(SUM)
>FILTRANDO COM HAVING
>>>categoriasem que a quantidade de produtos é superior a 2
*/


select categoriaProduto,count(*),
min(valorVendaProduto),
max(valorVendaProduto),
avg(valorVendaProduto),
sum(quantidadeProduto),
sum(quantidadeProduto*valorVendaProduto)
from produtos 
where quantidadeProduto>200
group by categoriaProduto
having count(*)>=2


select * from produtos