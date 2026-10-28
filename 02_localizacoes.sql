/*
TechNovaDB — 02_localizacoes.sql
Finalidade: lojas, armazéns e outros locais físicos.
Dependências: nenhuma.
Nota futura: manter os códigos estáveis para preservar o histórico.
*/
USE TechNovaDB;
GO
CREATE TABLE dbo.Localizacoes (
 id_localizacao INT IDENTITY(1,1) NOT NULL,
 nome VARCHAR(100) NOT NULL,
 tipo VARCHAR(30) NOT NULL,
 cidade VARCHAR(100) NULL,
 ativa BIT NOT NULL CONSTRAINT DF_Localizacoes_Ativa DEFAULT (1),
 codigo_localizacao VARCHAR(30) NOT NULL,
 morada VARCHAR(250) NULL,
 telefone VARCHAR(20) NULL,
 email VARCHAR(150) NULL,
 CONSTRAINT PK_Localizacoes PRIMARY KEY (id_localizacao),
 CONSTRAINT UQ_Localizacoes_Codigo UNIQUE (codigo_localizacao),
 CONSTRAINT CK_Localizacoes_Tipo CHECK (tipo IN ('Loja','Armazem','CentroDistribuicao','Outro'))
);
GO
