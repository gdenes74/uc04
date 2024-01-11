CREATE TABLE Produtos(
idProduto INT NOT NULL AUTO_INCREMENT,
nomeProduto VARCHAR(200),
categoriaProduto VARCHAR(200),
valorVendaProduto DOUBLE(9,2),
quantidadeProduto INT,
PRIMARY KEY (idProduto)
);
INSERT into Produtos
(nomeProduto,categoriaProduto,valorVendaProduto,quantidadeProduto) values
('Refrigerante','Bebidas','5.50',300),
('Arroz 5kg','Mercearia','8.50',100),
('Feijão','Mercearia','6.50',800),
('Detergente','Limpeza','2.10',100),
('Leite','Laticínios','2.70',600),
('Bolacha recheada',NULL,'1.50',200),
('Leite condensado','Mercearia','4.50',500);
CREATE TABLE Vendas (
IdVenda int auto_increment,
IdProduto int,
quantidadeVendida int,
valorVendido double(9,2),
dataVenda date,
PRIMARY KEY (IdVenda)
);
INSERT into Vendas
(IdProduto,quantidadeVendida,valorVendido,dataVenda)
values
(2,10,8.5,'2022-12-31'),
(2,15,8.5,'2022-01-01'),
(1,3,5.50,'2022-01-15');
CREATE TABLE Fornecedor (
idFornecedor int(11) auto_increment,
nomeFornecedor varchar(200),
cnpjFornecedor varchar(14),
PRIMARY KEY(idFornecedor)
);
INSERT INTO Fornecedor (nomeFornecedor, cnpjFornecedor) 
VALUES ('Brasil Alimentos', '10000000000101'),
		('Laticínios Norte Minas', '20000000000102'), 	
        ('Alimentos do Centro-Oeste', '30000000000103');
CREATE TABLE Marca (
idMarca int(11) auto_increment,
nomeMarca varchar(200),
PRIMARY KEY(idMarca)
);
INSERT INTO Marca (nomeMarca) VALUES
('Cereais do bom'),
('Bebidas do Brasil'),
('Doce Brasil');
ALTER TABLE Produtos ADD idFornecedor INT;
ALTER TABLE Produtos ADD CONSTRAINT FK_Fornecedor FOREIGN KEY (idFornecedor) REFERENCES Fornecedor (idFornecedor);
ALTER TABLE Produtos ADD idMarca INT;
ALTER TABLE Produtos ADD CONSTRAINT FK_Marca FOREIGN KEY (idMarca) REFERENCES Marca (idMarca);
update produtos set idFornecedor=3, idMarca=2 where idProduto=1;
update produtos set idFornecedor=1, idMarca=1 where idProduto=2;
update produtos set idFornecedor=1, idMarca=1 where idProduto=3;
update produtos set idFornecedor=3, idMarca=1 where idProduto=4;
update produtos set idFornecedor=2, idMarca=3 where idProduto=5;
update produtos set idFornecedor=3, idMarca=3 where idProduto=6;
update produtos set idFornecedor=2, idMarca=3 where idProduto=7;
CREATE TABLE Funcionario (
idFuncionario int(11) auto_increment,
nomeFuncionario varchar(200),
cpfFuncionario varchar(11),
cidadeFuncionario varchar(200),
PRIMARY KEY(idFuncionario)
);
INSERT INTO Funcionario (nomeFuncionario,cpfFuncionario,cidadeFuncionario) VALUES
('João dos Santos','10000000001','São Paulo'),
('Maria da Silva','20000000002','Rio de Janeiro'),
('Ana Maria','30000000003','Brasília'),
('Brasil Alimentos','40000000004','Cuiabá');
select * from Vendas;
select * from produtos;
alter table produtos add dataCompra date;
SET SQL_SAFE_UPDATES = 0;
update produtos set dataCompra='2021-12-08';
select*from fornecedor;
update fornecedor set dataFundacao='2000-10-01' where idFornecedor = 2;
update fornecedor set dataFundacao='1996-07-05' where idFornecedor=3;
alter table fornecedor add dataFundacao date;
update fornecedor set dataFundacao ='1982-06-22' where idFornecedor =1;
/* achar o nome do produto, categoria do produto, nome fornecedor e marca consultando multiplas tabelas*/
select p.nomeProduto, p.categoriaProduto,f.nomeFornecedor, m.nomeMarca
from produtos as p, marca as m, fornecedor as f
where p.idFornecedor=f.idFornecedor and p.idMarca=m.idMarca
order by p.nomeProduto;
-------------------------------------------------------------------
/*1/ achar o nome do produto, categoria do produto, valor venda produto e marca consultando multiplas tabelas*/
/*2/ achar pelo cnpj 20000000000102, fazendo o filtro necessário
*/
select
a.nomeProduto,
a.categoriaProduto,
a.valorVendaProduto,
a.idMarca,
b.nomeMarca,
c.nomeFornecedor,
c.cnpjFornecedor

from 
produtos as a, 
marca as b, 
fornecedor as c
where
a.idMarca=b.idMarca and
a.idFornecedor=c.idFornecedor and
c.cnpjFornecedor='20000000000102'
order by a.nomeProduto;
/*CONSULTANDO MÚLTIPLAS TABELAS UTILIZANDO INNER JOIN
DESCOBRIR NOME, VALOR, MARCA*/
select a.nomeProduto, a.valorVendaProduto, b.nomeMarca
from produtos as a inner join marca as b on (a.idMarca=b.idMarca)
;
/* CONSULTA MÚLTIPLAS TABELAS UTILIZANDO INNER JOIN 
DESCOBRIR NOME, VALOR, FORNECEDOR, CNPJ DO FORNECEDOR*/
select a.nomeProduto, a.valorVendaProduto, c.nomeFornecedor, c.cnpjFornecedor
from produtos as a inner join fornecedor as c on( a.idFornecedor=c.idFornecedor)
order by a.nomeProduto;

/* CONSULTA MÚLTIPLAS TABELAS UTILIZANDO INNER JOIN 
DESCOBRIR NOME, VALOR, MARCA, FORNECEDOR, CNPJ DO FORNECEDOR*/
select P.nomeProduto, p.valorVendaProduto,m.nomeMarca, f.nomeFornecedor, f.cnpjFornecedor
from produtos as p inner join marca as m on (p.idMarca=m.idMarca)
	inner join fornecedor as f on ( p.IdFornecedor=f.IdFornecedor)
where f.cnpjFornecedor='20000000000102'
order by p.nomeProduto;


/*encontro nome de todos funcionarios e fornecedores*/
select nomeFuncionario from funcionario
union
select nomeFornecedor  from fornecedor
order by nomeFuncionario;
	
/*TOTAL DE PRODUTOS VENDIDOS POR CATEGORIA
AGRUPANDO AS VENDAS DE PRODUTOS POR ANO */
select * from produtos;
select * from vendas;
select p.nomeProduto, p.categoriaProduto, sum(v.quantidadeVendida* v.valorVendido), count(*)
from vendas as v inner join produtos as p on (v.idProduto=p.idProduto)
group by p.categoriaProduto


/* AGRUPAR AS MARCAS QUE TIVERAM PRODUTOS VENDIDOS////// colocando tambem periodo de venda*/
SELECT m.nomeMarca,count(*), sum(v.quantidadeVendida*v.valorVendido)
FROM vendas as v inner join produtos as p on ( v.idProduto= p.idProduto)
	inner join marca as m on( p.idMarca= m.idMarca) 
    where v.dataVenda>='2022-02-01'
GROUP by m.nomeMarca

/*descobrir nome produto, datacompra, valordata venda e quantidade de DIAS DE VENDA ENTRA COMPRA E VENDA*/
select p.nomeProduto, p.dataCompra, v.dataVenda, datediff(v.dataVenda, p.dataCompra) as dias_venda
from vendas as v inner join produtos as p on (v.idProduto=p.idProduto)
==========================================================================================================
/*descobrir quantos anos da data fundacao da empresa em relacao atualidade
observacao o campo now() passa a hora do momento tb, importante, saber o tipo do date no banco, mostrando empresas que tenham mais de 25 anos de mercado */
select curdate(), datafundacao, timestampdiff(year, datafundacao, curdate()) from fornecedor
where timestampdiff(year, datafundacao, curdate())>25;
select * from vendas
where idProduto = (select min(idProduto) from produtos)
order by dataVenda
limit 1
