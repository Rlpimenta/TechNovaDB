/*
TechNovaDB — 03_fornecedores.sql
Finalidade: dados dos fornecedores.
Dependências: nenhuma.
Nota futura: definir política de NIF antes de impor unicidade, considerando NIF nulo e estrangeiro.
*/
USE TechNovaDB;
GO
CREATE TABLE dbo.Fornecedores (
 id_fornecedor INT IDENTITY(1,1) NOT NULL,
 nome VARCHAR(150) NOT NULL,
 nif VARCHAR(20) NULL,
 contacto VARCHAR(100) NULL,
 email VARCHAR(150) NULL,
 telefone VARCHAR(20) NULL,
 morada VARCHAR(250) NULL,
 ativo BIT NOT NULL CONSTRAINT DF_Fornecedores_Ativo DEFAULT (1),
 CONSTRAINT PK_Fornecedores PRIMARY KEY (id_fornecedor)
);
GO
