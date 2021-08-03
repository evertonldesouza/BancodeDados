/*-----------------------------------------------------------------------
  Curso Técnico em Desenvolvimento de Sistemas
  Banco de Dados II - Prof. Sérgio Lacerda
  Script para banco de dados: Controle de Pokémon
  Banco de dados para a lista de exercícios sobre Selects
 ----------------------------------------------------------------------*/

/*-----------------------------------------------------------------------
  Criação do banco de dados (Schemma)
-----------------------------------------------------------------------*/
CREATE DATABASE dbpokemon;
USE dbpokemon;

/*-----------------------------------------------------------------------
  Criação da tabela de tipos
-----------------------------------------------------------------------*/
CREATE TABLE Especie (
	Codigo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Especie VARCHAR(20) NOT NULL
);

/*-----------------------------------------------------------------------
  Criação da tabela de tipos
-----------------------------------------------------------------------*/
CREATE TABLE Tipo (
	Codigo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Tipo VARCHAR(20) NOT NULL
);

/*-----------------------------------------------------------------------
  Criação da tabela Pokemon
-----------------------------------------------------------------------*/
CREATE TABLE Pokemon (
	Numero INT NOT NULL PRIMARY KEY,
    Nome VARCHAR(20) NOT NULL,
    Descricao VARCHAR(300) NOT NULL,
    Altura DECIMAL(3, 1) NOT NULL,
    Peso DECIMAL(4, 1) NOT NULL,
    Imagem VARCHAR(15) NOT NULL
);

/*-----------------------------------------------------------------------
  Alteração da tabela Pokemon para incluir relacionamento com Espécie
-----------------------------------------------------------------------*/
ALTER TABLE Pokemon
ADD COLUMN CodigoEspecie INT NOT NULL AFTER Descricao, 
ADD CONSTRAINT fk_PokemonEspecie FOREIGN KEY (CodigoEspecie) REFERENCES Especie (Codigo);

/*-----------------------------------------------------------------------
  Criação da tabela PokemonTipo
-----------------------------------------------------------------------*/
CREATE TABLE PokemonTipo (
	NumeroPokemon INT NOT NULL,
    CodigoTipo INT NOT NULL    
);

/*-----------------------------------------------------------------------
  Alteração da tabela Pokemon para criar uma PK composta e as FKs com
  as tabelas Pokemon e Tipo
-----------------------------------------------------------------------*/
ALTER TABLE PokemonTipo
ADD CONSTRAINT pk_PokemonTipo PRIMARY KEY (NumeroPokemon, CodigoTipo),
ADD CONSTRAINT fk_PokemonTipo_Pokemon FOREIGN KEY (NumeroPokemon) REFERENCES Pokemon (Numero),
ADD CONSTRAINT fk_PokemonTipo_Tipo FOREIGN KEY (CodigoTipo) REFERENCES Tipo (Codigo);

/*-----------------------------------------------------------------------
  Inserindo registros na tabela de tipos
-----------------------------------------------------------------------*/
INSERT INTO Tipo (Tipo) VALUES ("Água");
INSERT INTO Tipo (Tipo) VALUES ("Fogo");
INSERT INTO Tipo (Tipo) VALUES ("Inseto");
INSERT INTO Tipo (Tipo) VALUES ("Planta");
INSERT INTO Tipo (Tipo) VALUES ("Venenoso");
INSERT INTO Tipo (Tipo) VALUES ("Voador");

/*-----------------------------------------------------------------------
  Inserindo registros na tabela de espécies
-----------------------------------------------------------------------*/
INSERT INTO Especie (Especie) VALUES ("Butterfly");
INSERT INTO Especie (Especie) VALUES ("Cocoon");
INSERT INTO Especie (Especie) VALUES ("Flame");
INSERT INTO Especie (Especie) VALUES ("Lizard");
INSERT INTO Especie (Especie) VALUES ("Seed");
INSERT INTO Especie (Especie) VALUES ("Shellfish");
INSERT INTO Especie (Especie) VALUES ("Tiny Turtle");
INSERT INTO Especie (Especie) VALUES ("Turtle");
INSERT INTO Especie (Especie) VALUES ("Worm");

/*-----------------------------------------------------------------------
  Inserindo registros na tabela de Pokémons
-----------------------------------------------------------------------*/
INSERT INTO Pokemon (Numero, Nome, Descricao, CodigoEspecie, Altura, Peso, Imagem)
VALUES (1, "Bulbasaur", "Insira a descrição", 5, 0.7, 6.9, "img/001.png");

INSERT INTO Pokemon (Numero, Nome, Descricao, CodigoEspecie, Altura, Peso, Imagem)
VALUES (2, "Ivysaur", "Insira a descrição", 5, 1, 13, "img/002.png");

INSERT INTO Pokemon (Numero, Nome, Descricao, CodigoEspecie, Altura, Peso, Imagem)
VALUES (3, "Venusaur", "Insira a descrição", 5, 2, 100, "img/003.png");

INSERT INTO Pokemon (Numero, Nome, Descricao, CodigoEspecie, Altura, Peso, Imagem)
VALUES (4, "Charmander", "Insira a descrição", 4, 0.6, 8.5, "img/004.png");

INSERT INTO Pokemon (Numero, Nome, Descricao, CodigoEspecie, Altura, Peso, Imagem)
VALUES (5, "Charmeleon", "Insira a descrição", 3, 1.1, 19, "img/005.png");

INSERT INTO Pokemon (Numero, Nome, Descricao, CodigoEspecie, Altura, Peso, Imagem)
VALUES (6, "Charizard", "Insira a descrição", 3, 1.7, 90.5, "img/006.png");

INSERT INTO Pokemon (Numero, Nome, Descricao, CodigoEspecie, Altura, Peso, Imagem)
VALUES (7, "Squirtle", "Insira a descrição", 7, 0.5, 9, "img/007.png");

INSERT INTO Pokemon (Numero, Nome, Descricao, CodigoEspecie, Altura, Peso, Imagem)
VALUES (8, "Wartortle", "Insira a descrição", 8, 1, 22.5, "img/008.png");

INSERT INTO Pokemon (Numero, Nome, Descricao, CodigoEspecie, Altura, Peso, Imagem)
VALUES (9, "Blastoise", "Insira a descrição", 6, 1.6, 85.5, "img/009.png");

INSERT INTO Pokemon (Numero, Nome, Descricao, CodigoEspecie, Altura, Peso, Imagem)
VALUES (10, "Caterpie", "Insira a descrição", 9, 0.3, 2.9, "img/010.png");

INSERT INTO Pokemon (Numero, Nome, Descricao, CodigoEspecie, Altura, Peso, Imagem)
VALUES (11, "Metapod", "Insira a descrição", 2, 0.7, 9.9, "img/011.png");

INSERT INTO Pokemon (Numero, Nome, Descricao, CodigoEspecie, Altura, Peso, Imagem)
VALUES (12, "Butterfree", "Insira a descrição", 1, 1.1, 32, "img/012.png");

/*-----------------------------------------------------------------------
  Inserindo registros na tabela de PokemonTipo
-----------------------------------------------------------------------*/
INSERT INTO PokemonTipo (NumeroPokemon, CodigoTipo) VALUES (1, 4);  
INSERT INTO PokemonTipo (NumeroPokemon, CodigoTipo) VALUES (1, 5);
INSERT INTO PokemonTipo (NumeroPokemon, CodigoTipo) VALUES (2, 4);
INSERT INTO PokemonTipo (NumeroPokemon, CodigoTipo) VALUES (2, 5);
INSERT INTO PokemonTipo (NumeroPokemon, CodigoTipo) VALUES (3, 4);
INSERT INTO PokemonTipo (NumeroPokemon, CodigoTipo) VALUES (3, 5);
INSERT INTO PokemonTipo (NumeroPokemon, CodigoTipo) VALUES (4, 2);
INSERT INTO PokemonTipo (NumeroPokemon, CodigoTipo) VALUES (5, 2);
INSERT INTO PokemonTipo (NumeroPokemon, CodigoTipo) VALUES (6, 2);
INSERT INTO PokemonTipo (NumeroPokemon, CodigoTipo) VALUES (6, 6);
INSERT INTO PokemonTipo (NumeroPokemon, CodigoTipo) VALUES (7, 1);
INSERT INTO PokemonTipo (NumeroPokemon, CodigoTipo) VALUES (8, 1);
INSERT INTO PokemonTipo (NumeroPokemon, CodigoTipo) VALUES (9, 1);
INSERT INTO PokemonTipo (NumeroPokemon, CodigoTipo) VALUES (10, 3);
INSERT INTO PokemonTipo (NumeroPokemon, CodigoTipo) VALUES (11, 3);
INSERT INTO PokemonTipo (NumeroPokemon, CodigoTipo) VALUES (12, 3);
INSERT INTO PokemonTipo (NumeroPokemon, CodigoTipo) VALUES (12, 6);

