SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

CREATE DATABASE IF NOT EXISTS `pizzariaetec` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `pizzariaetec`;


CREATE TABLE FormaPagto (
  IdFormaPagto INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Descricao VARCHAR(30)  NULL    ,
PRIMARY KEY(IdFormaPagto));



CREATE TABLE Tipo (
  IdTipo INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  NomeTipo VARCHAR(50)  NOT NULL    ,
PRIMARY KEY(IdTipo));



CREATE TABLE Cliente (
  IdCliente INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  NomeCliente VARCHAR(60)  NOT NULL  ,
  Endereco VARCHAR(60)  NULL  ,
  Bairro VARCHAR(50)  NULL  ,
  Cep CHAR(8)  NULL  ,
  Telefone VARCHAR(20)  NULL  ,
  Celular VARCHAR(20)  NULL  ,
  Ativo BIT  NULL    ,
PRIMARY KEY(IdCliente));



CREATE TABLE Produto (
  IdProduto INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  IdTipo INTEGER UNSIGNED  NOT NULL  ,
  NomeProduto VARCHAR(60)  NOT NULL  ,
  Descricao VARCHAR(1000)  NULL  ,
  Qtde INTEGER UNSIGNED  NULL  ,
  Venda NUMERIC(10,2)  NULL    ,
PRIMARY KEY(IdProduto)  ,
INDEX Produto_FKIndex1(IdTipo),
  FOREIGN KEY(IdTipo)
    REFERENCES Tipo(IdTipo)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE Pedido (
  IdPedido INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  IdFormaPagto INTEGER UNSIGNED  NOT NULL  ,
  IdCliente INTEGER UNSIGNED  NOT NULL  ,
  DataPedido DATETIME  NULL  ,
  Entregar BIT  NULL  ,
  PrevisaoEntrega DATETIME  NULL    ,
PRIMARY KEY(IdPedido)  ,
INDEX Pedido_FKIndex1(IdCliente)  ,
INDEX Pedido_FKIndex2(IdFormaPagto),
  FOREIGN KEY(IdCliente)
    REFERENCES Cliente(IdCliente)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(IdFormaPagto)
    REFERENCES FormaPagto(IdFormaPagto)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE Entrega (
  IdEntrega INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  IdPedido INTEGER UNSIGNED  NOT NULL  ,
  Endereco VARCHAR(60)  NULL  ,
  Bairro VARCHAR(50)  NULL  ,
  Cep CHAR(8)  NULL    ,
PRIMARY KEY(IdEntrega)  ,
INDEX Entrega_FKIndex1(IdPedido),
  FOREIGN KEY(IdPedido)
    REFERENCES Pedido(IdPedido)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE ItemPedido (
  IdItemPedido INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  IdPedido INTEGER UNSIGNED  NOT NULL  ,
  IdProduto INTEGER UNSIGNED  NOT NULL  ,
  Qtde INTEGER UNSIGNED  NULL  ,
  Observacao VARCHAR(1000)  NULL    ,
PRIMARY KEY(IdItemPedido, IdPedido)  ,
INDEX ItemPedido_FKIndex1(IdPedido)  ,
INDEX ItemPedido_FKIndex2(IdProduto),
  FOREIGN KEY(IdPedido)
    REFERENCES Pedido(IdPedido)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(IdProduto)
    REFERENCES Produto(IdProduto)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);




CREATE TABLE Usuario (
  IdUsuario INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  NomeUsuario VARCHAR(50)  NOT NULL,
  SenhaUsuario VARCHAR(30) NOT NULL,
PRIMARY KEY(IdUsuario));