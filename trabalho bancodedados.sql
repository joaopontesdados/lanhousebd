DROP DATABASE lanhouseads;
CREATE DATABASE lanhouseads;
USE lanhouseads;
/* primaykey not null unique binary unsigned zerofill autoincremant general column */
create table empregado(
CPF VARCHAR(11) primary key not null unique,
nome VARCHAR(60) not null,
nomeSocial VARCHAR(45) null ,
sexo CHAR(1) not null,
salario DECIMAL(6,2) not null, 
email VARCHAR(45) not null unique,
telefone VARCHAR(11) not null,
dataNasc DATE not null,
dataAdm DATETIME not null,
dataDem DATETIME null,
empregostatus TINYINT not null);

INSERT INTO empregado (CPF, nome, sexo, salario, email, telefone, dataNasc, dataAdm, empregostatus) 
VALUES(23423454634, 'Rodrigo Alves Silveira', 'M', 1350.23 , 'rodrigo@gmail.com', 08192345687, '1980-12-30', '2022-10-21 08:35:10', '1');
INSERT INTO empregado (CPF, nome, sexo, salario, email, telefone, dataNasc, dataAdm, empregostatus) 
VALUES(23423454645, 'Fabiana Silva de Luna', 'F', 1500.00 ,'fabiana_879@gmail.com', 08192338768, '1992-02-23', '2018-03-10 10:25:35', '0');
INSERT INTO empregado (CPF, nome, sexo, salario, email, telefone, dataNasc, dataAdm, empregostatus) 
VALUES(23423454663, 'Renato da Silva Sauro', 'M', 8000.00 ,'renato.sauroboladao@gmail.com', 08192331234, '2000-11-24', '2022-02-01 11:30:45', '1');
INSERT INTO empregado (CPF, nome, sexo, salario, email, telefone, dataNasc, dataAdm, empregostatus) 
VALUES(23423454789, 'Isaac da Silva Boladao', 'M', 8000.00 ,'isaac_24@gmail.com', 08192333265, '1999-08-01', '2018-03-10 12:35:00', '0');
INSERT INTO empregado (CPF, nome, sexo, salario, email, telefone, dataNasc, dataAdm, empregostatus) 
VALUES(23423454665, 'Fabiano Silveira Rodrigue', 'F', 1500.00 ,'fabiano_087@gmail.com', 08192336875, '1994-07-12', '2019-10-10 10:45:00', '0');

create table cliente(
idCliente INT primary key not null,
nome VARCHAR(60) not null,
email VARCHAR(70) not null unique,
senha VARCHAR(15) null,
sexo CHAR(1),
dataNasc DATE not null,
telefone VARCHAR(11) not null);

INSERT INTO cliente(idCliente, nome, email, sexo, dataNasc, telefone) 
VALUES(24, 'Beatriz Nascimento da Silva', 'beatriz_oloco@gmail.com', 'F', '2003-07-12', 08174567892),
(1203, 'João Rodrigues da Silva', 'joaorodrigues210@hotmail.com', 'M', '1993-04-23', 0817454535),
(0032, 'Lauro Rodrigues Peugeot', 'laurincriadacomuna@gmail.com', 'M', '2001-05-10', 0817458924),
(2410, 'Lais Soares Ribeiro', 'laismodelo2000@gmail.com', 'F', '1992-09-14', 0817453592),
(2419, 'Mauro Luiz Louco', 'mauroluizinhodomario@gmail.com', 'M', '1998-02-27', 08174562409);

create table endereco(
idEndereco INT not null primary key auto_increment,
UF VARCHAR(2) not null ,
cidade VARCHAR(30) not null,
bairro VARCHAR(30) not null,
rua VARCHAR(60) not null,
numero INT not null,
comp VARCHAR(45) null,
cep VARCHAR(9) not null,
empregado_CPF VARCHAR(11) not null,
foreign key (empregado_CPF) references empregado(CPF)
on update cascade
on delete cascade);
INSERT INTO endereco(idEndereco, UF, cidade, bairro, rua, numero, cep, empregado_CPF) VALUES(
'1', 'PE', 'Recife', 'Espinheiro', 'Rua Marquês do Paraaná', 143, 54132000, 23423454634),(
'2', 'PE', 'Recife', 'Nova Descoberta', 'Rua Nova Descoberta', 83, 55420140, 23423454645),(
'3', 'PE', 'Recie', 'Vasco da Gama', 'Rua Pedro Álvares Cabral', 172, 54678000, 23423454663),(
'4', 'PE', 'Recife', 'Alto do Mandú', 'Rua do lado', 1120, 55213000, 23423454789),(
'5', 'PE', 'Recife', 'Macaxeira', 'Rua Maria Carolina', 300, 56798000, 23423454665);

create table ferias(
idFerias INT primary key not null auto_increment,
anoRef YEAR(4) not null,
qtdDias INT not null,
dataInicio DATE not null,
dataFim DATE not null,
empregado_CPF VARCHAR(11) not null,
foreign key (empregado_CPF) references empregado(CPF)
on update cascade
on delete cascade);

INSERT INTO ferias(idFerias, anoRef, qtdDias, dataInicio, dataFim, empregado_CPF) values
('1', 2023, 30, '2023-10-01', '2023-11-01', 23423454634),
('2', 2020, 30, '2020-03-01', '2020-04-01', 23423454645),
('3', 2024, 40, '2024-07-01', '2024-08-10', 23423454663),
('4', 2019, 30, '2019-01-02', '2019-02-02', 23423454789),
('5', 2021, 30, '2021-08-01', '2021-09-01', 23423454665);

select idFerias, anoRef, qtdDias from ferias
where qtdDias = 40 or idFerias = 4;

select bairro, rua ,numero from endereco
where rua = '%Álvares%' or numero like 300;

select count(*) from cliente;

create table vendas(
idVendas INT primary key not null auto_increment,
valorTotal DECIMAL (6,2) not null,
dataVendas date not null,
desconto DECIMAL (4,2) null,
cliente_idCliente INT not null,
empregado_CPF VARCHAR(11) not null,
foreign key (cliente_idCliente) references cliente(idCliente)
on update cascade
on delete cascade,
foreign key (empregado_CPF) references empregado(CPF)
on update cascade
on delete cascade);

select idCliente from cliente;
select CPF from empregado;

INSERT INTO vendas(idVendas, valorTotal, dataVendas ,desconto, cliente_idCliente, empregado_CPF) VALUES(
'1', 0288.99, '2022-02-28',43.25, 24, 23423454634),
('2', 1790.99, '2022-06-16',87.90, 1203, 23423454645),
('3', 1280.99, '2022-10-20',23.90, 2410, 23423454663),
('4', 899.99, '2022-11-13',53.90, 32, 23423454665),
('5', 7890.99, '2022-04-25',90.99, 2419, 23423454789);

create table formaPag(
idformaPag INT primary key not null auto_increment ,
tipoPag VARCHAR(45) not null,
valorPag DECIMAL(6,2) not null,
dataPag DATETIME not null,
vendas_idVendas INT not null,
foreign key (vendas_idVendas) references vendas(idVendas)
on update cascade
on delete cascade);
/* 1 - dinheiro/ pix
2 - crédito
3 - débito*/

select valorTotal from vendas;

INSERT INTO formaPag(idFormaPag, tipoPag, valorPag, dataPag, vendas_idVendas) VALUES
('1', 'Pix', 288.99, '2022-04-10 14:30:00', '1'),
('2', 'À vista', 1790.99, '2022-10-22 09:45:36', '2'),
('3', 'Parcelado', 1280.99, '2022-09-15 16:30:22', '3'),
('4', 'Pix', 899.99, '2022-12-15 17:30:00', '4'),
('5', 'Parcelado', 7890.99, '2022-06-16 09:50:00', '5');

create table servico(
idServico INT not null primary key ,
nome VARCHAR(45) not null,
valor DECIMAL(6,2) not null );

INSERT INTO servico(idServico, nome, valor) VALUES
('1', 'Venda de memória ram', 288.99),
('2', 'Venda de placa de vídeos', 1790.99),
('3', 'Venda de memória-ram, placa-mãe e SSD', 1280.99),
('4', 'Venda de gabinete e limpeza de peças', 899.99),
('5', 'Venda de placa de vídeo', 7890.99);
desc servico;

 
create table vendasServico(
qtd INT not null,
vendas_idVendas INT not null,
servico_idServico INT not null,
foreign key (vendas_idVendas) references vendas(idVendas)
on delete cascade,
foreign key (servico_idServico) references servico(idServico)
on update cascade
on delete cascade);

INSERT INTO vendasServico(qtd, vendas_idVendas, servico_idServico) VALUES
(1, '1', '1'),
(4, '2', '2'),
(2, '3', '3'),
(6, '4', '4'),
(3, '5', '5');

create table estoque(
idProduto INT not null primary key auto_increment,
nome VARCHAR(45) not null,
valor DECIMAL(6,2) not null,
qtd INT not null,
categoria VARCHAR(45) not null,
descricao VARCHAR(150) null,
validade DATE null,
marca VARCHAR(45) null);

select valorTotal from vendas; 
INSERT INTO estoque(idProduto, nome, valor, qtd, categoria) VALUES
(1, '8GB HyperX', 288.99, 10, 'memória ram'),
(2, 'GTX 970', 1790.99, 35 , 'placa de vídeo'),
(3, '8GB HyperX, HK1342, Kingston SSD 450G', 1280.99, 22 ,'placa mãe, memória ram e SSD'),
(7, 'Limepza de peças e gabinete Storm 8100', 899.99, 12 , 'gabinete e limpeza'),
(4,  'RTX 3070', 7890.99, 10, 'placa de vídeo');

create table itensVendas(
qtd INT not null,
estoque_idProduto INT not null,
vendas_idVendas INT not null,
foreign key (estoque_idProduto) references estoque(idProduto)
on update cascade
on delete cascade,
foreign key (vendas_idVendas) references vendas(idVendas)
on update cascade
on delete cascade);

INSERT INTO itensVendas(qtd, estoque_idProduto, vendas_idVendas) VALUES
(3, 1, '1'),
(25, 2, '2'),
(15, 3, '3'),
(10, 7, '4'),
(9, 4, '5');

create table fornecedor(
CNPJ_CPF VARCHAR(15) primary key not null,
nome VARCHAR (60) not null, 
telefone VARCHAR(11) not null ,
email VARCHAR(45) not null);

INSERT INTO fornecedor(CNPJ_CPF, nome, telefone, email) VALUES
(14354789031, 'Ricardo Ribeiro', 08198567890, 'ricardo_consultoria@gmail.com'),
(98787791200, 'Fernanda Gonçalves de Lima', 08198546700, 'fernanda_gonca144@gmail.com'),
(89690987621, 'Rosemare Soares de Luna', 08198891234, 'rosemareluna_123@gmail.com'),
(432989000113, 'Informática Jubart LTDA', 08130408400, 'jubarinfo@jubart.com.br'),
(321568000145, 'Mineradora BTC SA', 08132897588, 'mineradorabtf@mineradorabtc.com.br');

create table estoque_fornecedor(
estoque_idProduto INT not null,
fornecedor_CNPJ_CPF VARCHAR(15), 
foreign key (estoque_idProduto) references estoque(idProduto)
on update cascade
on delete cascade,
foreign key (fornecedor_CNPJ_CPF) references fornecedor(CNPJ_CPF)
on update cascade
on delete cascade);


select qtd from estoque;
select CNPJ_CPF from fornecedor;

INSERT INTO estoque_fornecedor(estoque_idProduto, fornecedor_CNPJ_CPF) VALUES
(1, 14354789031),
(2, 321568000145),
(3, 432989000113),
(7, 89690987621),
(4, 98787791200);

create table servicofornecedor(
servico_idServico INT not null,
fornecedor_CNPJ_CPF VARCHAR(15),
foreign key (servico_idServico) references servico(idServico)
on delete cascade,
foreign key (fornecedor_CNPJ_CPF) references fornecedor(CNPJ_CPF)
on delete cascade);

INSERT INTO servicofornecedor(servico_idServico, fornecedor_CNPJ_CPF) VALUES
('1', 14354789031),
('2', 321568000145),
('3', 432989000113),
('4', 89690987621),
('5', 98787791200);



/* 3 */ 
select nome 'Nome Empregado', vendas.empregado_CPF 'CPF empregado', sexo 'Sexo', salario 'Salário', vendasServico.qtd 'Quantidade de vendas' from empregado, vendasServico, vendas
where vendasServico.vendas_idVendas = vendas.idVendas and vendas.empregado_CPF = empregado.CPF
order by qtd desc;
/* 1 */
select emp.nome as "Nome Empregado",emp.CPF "CPF Empregado",emp.dataAdm "Data de Admissao",endereco.cidade from empregado emp, endereco
where endereco.empregado_CPF = emp.CPF and dataAdm between '2019-01-01' and '2022-12-31'
order by dataAdm;
/*4*/ 
select tipoPag 'Tipo de pagamento', vendasServico.qtd 'Quantidade de vendas' from formaPag, vendasServico, vendas
where vendasServico.vendas_idVendas = vendas.idVendas and formaPag.vendas_idVendas = vendas.idVendas
order by qtd;

/*5*/ 
select vendas.dataVendas 'Data Vendas', vendas.valorTotal 'Valor Total', itensVendas.qtd 'Itens Vendas', estoque.nome 'Nome do produto', estoque.valor 'Valor do produto', empregado.nome 'Nome do empregado'
from vendas, itensVendas, estoque , empregado
where itensVendas.estoque_idProduto = estoque.idProduto and itensVendas.vendas_idVendas = vendas.idVendas and vendas.empregado_CPF = empregado.CPF
order by dataVendas;
/*2*/
select nome as "Nome Empregado",CPF "CPF Empregado",dataAdm "Data de Admissao",salario "Salario" from empregado
where salario < (select avg(salario) from empregado)
order by nome;
/*6*/
select  valorTotal 'Valor Total', dataVendas 'Data da Venda', servico.nome 'Nome do serviço', servico.valor 'Valor do serviço',vendasServico.qtd 'Quantidade das vendas de serviço', empregado.nome 'Nome do empregado'
from vendas, servico, vendasServico, empregado
where vendas.empregado_CPF = empregado.CPF and vendasServico.vendas_idVendas = vendas.idVendas and vendasServico.servico_idServico = servico.idServico 
order by dataVendas; 
/*7*/

select estoque.nome 'Nome do produto', estoque.valor 'Valor do produto', fornecedor.nome 'Nome do fornecedor', telefone 'Telefone', email 'E-mail'  
from fornecedor, estoque, estoque_fornecedor
where estoque_fornecedor.estoque_idProduto = estoque.idProduto and estoque_fornecedor.fornecedor_CNPJ_CPF = fornecedor.CNPJ_CPF
order by estoque.nome; 

/*8*/ 
select servico.nome 'Nome do serviço', servico.valor 'Valor do serviço', fornecedor.nome 'Nome do fornecedor', email 'E-mail', telefone 'Telefone'
from servico, fornecedor, servicofornecedor
where servicofornecedor.servico_idServico = servico.idServico and servicofornecedor.fornecedor_CNPJ_CPF = fornecedor.CNPJ_CPF
group by servico.nome;

/*9*/
select estoque.nome 'Nome do produto', sum(itensVendas.qtd) 'Quantidade total'
from estoque, itensVendas
where itensVendas.estoque_idProduto = estoque.idProduto
group by estoque.nome
order by sum(itensVendas.qtd) desc; 

/*10*/
select servico.nome 'Nome do serviço', sum(vendasServico.qtd) 'Quantidade total'
from servico, vendasServico
where vendasServico.servico_idServico = servico.idServico
group by servico.nome
order by sum(vendasServico.qtd); 

















