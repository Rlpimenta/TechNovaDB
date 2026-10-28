/*
TechNovaDB — 16_devolucoes.sql
Finalidade: registar devoluções associadas a vendas.
Dependências: 08_vendas.sql.
Nota futura: estado da devolução não atualiza automaticamente venda ou stock; tratar em transação.
*/
USE TechNovaDB;
GO
CREATE TABLE dbo.Devolucoes (
 id_devolucao INT IDENTITY(1,1) NOT NULL,
 codigo_devolucao VARCHAR(30) NOT NULL,
 id_venda INT NOT NULL,
 data_devolucao DATETIME2 NOT NULL CONSTRAINT DF_Devolucoes_Data DEFAULT (SYSDATETIME()),
 motivo VARCHAR(200) NOT NULL,
 estado_devolucao VARCHAR(20) NOT NULL CONSTRAINT DF_Devolucoes_Estado DEFAULT ('Solicitada'),
 observacoes VARCHAR(500) NULL,
 CONSTRAINT PK_Devolucoes PRIMARY KEY (id_devolucao),
 CONSTRAINT UQ_Devolucoes_Codigo UNIQUE (codigo_devolucao),
 CONSTRAINT FK_Devolucoes_Vendas FOREIGN KEY (id_venda) REFERENCES dbo.Vendas(id_venda),
 CONSTRAINT CK_Devolucoes_Estado CHECK (estado_devolucao IN ('Solicitada','Aprovada','Recusada','EmInspecao','Concluida','Cancelada'))
);
GO
