create database super;
use super;
create table Produtos(
idProduto int not null auto_increment,
nomeProduto varchar(200),
categoriaProduto varchar(200),
quantidadeProduto int,
primary key (idProduto)
);
alter table Produtos add valorVendaProduto double (9,2);
insert into Produtos (nomeProduto, categoriaProduto, valorVendaProduto, quantidadeProduto) values 
('Refrigerante', 'Bebidas', '5.50', 300),
('Arroz 5 Kg', 'Mercearia', '8.50', 100),
('Feijão', 'Mercearia', '6.50', 800),
('Detergente', 'Limpeza', '2.10', 100),
('Leite', 'Laticínios', '2.70', 600),
('Bolacha Recheada', 'Null','1.50', 200),
('Leite condensado', 'Mercearia', '4.50', 500);
select * from Produtos;
select nomeProduto, valorVendaProduto from Produtos
select * from Produtos where nomeProduto='Leite';
select nomeProduto, valorVendaProduto from Produtos where nomeProduto ='Leite';

select * from Produtos where categoriaProduto='Limpeza' or valorVendaProduto =5.50;
select * from Produtos where quantidadeProduto >= 300;
select * from Produtos where valorVendaProduto <=5 ;
select * from Produtos where valorVendaProduto >0;
select nomeProduto, valorVendaProduto from produtos where nomeProduto like '%_conde_%';
SELECT (valorVendaProduto*quantidadeProduto) AS Valor_Total FROM Produtos;
select * from produtos order by categoriaProduto desc;
SELECT COUNT(nomeProduto) FROM produtos WHERE nomeProduto LIKE '%leite%';
select * from produtos;
create table Vendas(
idVenda int auto_increment primary key,
idProduto int,
quantidadeVendida int, 
valorVendido double (9,2),
dataVenda date
);
insert into Vendas(idProduto, quantidadeVendida, valorVendido, dataVenda)values
(2,10,8.5,'2022-12-31'),
(2,15,8.5,'2022-01-01'),
(1,3,5.50,'2022-01-15');
select *from Vendas;

select nomeProduto from Produtos where idProduto in (select idProduto from Vendas);




 
