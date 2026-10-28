/*
TechNovaDB — 12_rececoes_mercadoria.sql
Finalidade: registar receções de mercadoria associadas a encomendas.
Dependências: 10_encomendas_fornecedor.sql.
Nota futura: uma encomenda pode ter várias receções; atualizar estado e stock após validação.
*/
USE TechNovaDB;
GO
CREATE TABLE dbo.RececoesMercadoria (
 id_rececao INT IDENTITY(1,1) NOT NULL,
 codigo_rececao VARCHAR(30) NOT NULL,
 id_encomenda INT NOT NULL,
 data_rececao DATETIME2 NOT NULL CONSTRAINT DF_RececoesMercadoria_Data DEFAULT (SYSDATETIME()),
 estado_rececao VARCHAR(30) NOT NULL CONSTRAINT DF_RececoesMercadoria_Estado DEFAULT ('EmValidacao'),
 documento_fornecedor VARCHAR(100) NULL,
 observacoes VARCHAR(500) NULL,
 CONSTRAINT PK_RececoesMercadoria PRIMARY KEY (id_rececao),
 CONSTRAINT UQ_RececoesMercadoria_Codigo UNIQUE (codigo_rececao),
 CONSTRAINT FK_RececoesMercadoria_Encomendas FOREIGN KEY (id_encomenda) REFERENCES dbo.EncomendasFornecedor(id_encomenda),
 CONSTRAINT CK_RececoesMercadoria_Estado CHECK (estado_rececao IN ('EmValidacao','Aceite','ParcialmenteAceite','Rejeitada','Cancelada'))
);
GO
