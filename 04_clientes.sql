/*
TechNovaDB — 04_clientes.sql
Finalidade: clientes particulares e empresas.
Dependências: nenhuma.
Nota futura: definir política de NIF antes de impor unicidade.
*/
USE TechNovaDB;
GO
CREATE TABLE dbo.Clientes (
 id_cliente INT IDENTITY(1,1) NOT NULL,
 nome VARCHAR(150) NOT NULL,
 tipo_cliente VARCHAR(20) NOT NULL,
 nif VARCHAR(20) NULL,
 email VARCHAR(150) NULL,
 telefone VARCHAR(20) NULL,
 data_registo DATETIME2 NOT NULL CONSTRAINT DF_Clientes_DataRegisto DEFAULT (SYSDATETIME()),
 ativo BIT NOT NULL CONSTRAINT DF_Clientes_Ativo DEFAULT (1),
 CONSTRAINT PK_Clientes PRIMARY KEY (id_cliente),
 CONSTRAINT CK_Clientes_Tipo CHECK (tipo_cliente IN ('Particular','Empresa'))
);
GO
