/*
TechNovaDB — 01_categorias.sql
Finalidade: categorias do catálogo.
Dependências: nenhuma. Executar primeiro.
Nota futura: categorias hierárquicas exigem uma FK adicional e prevenção de ciclos.
*/
USE TechNovaDB;
GO
CREATE TABLE dbo.Categorias (
 id_categoria INT IDENTITY(1,1) NOT NULL,
 nome VARCHAR(50) NOT NULL,
 descricao VARCHAR(200) NULL,
 ativa BIT NOT NULL CONSTRAINT DF_Categorias_Ativa DEFAULT (1),
 CONSTRAINT PK_Categorias PRIMARY KEY (id_categoria),
 CONSTRAINT UQ_Categorias_Nome UNIQUE (nome)
);
GO
