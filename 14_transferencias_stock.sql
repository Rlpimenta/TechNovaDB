/*
TechNovaDB — 14_transferencias_stock.sql
Finalidade: transferências entre localizações.
Dependências: 02_localizacoes.sql.
Nota futura: a criação da transferência não altera stock; implementar saída/entrada em transação.
*/
USE TechNovaDB;
GO
CREATE TABLE dbo.TransferenciasStock (
 id_transferencia INT IDENTITY(1,1) NOT NULL,
 codigo_transferencia VARCHAR(30) NOT NULL,
 id_localizacao_origem INT NOT NULL,
 id_localizacao_destino INT NOT NULL,
 data_criacao DATETIME2 NOT NULL CONSTRAINT DF_TransferenciasStock_DataCriacao DEFAULT (SYSDATETIME()),
 data_envio DATETIME2 NULL,
 data_rececao DATETIME2 NULL,
 estado_transferencia VARCHAR(30) NOT NULL CONSTRAINT DF_TransferenciasStock_Estado DEFAULT ('Criada'),
 observacoes VARCHAR(500) NULL,
 CONSTRAINT PK_TransferenciasStock PRIMARY KEY (id_transferencia),
 CONSTRAINT UQ_TransferenciasStock_Codigo UNIQUE (codigo_transferencia),
 CONSTRAINT FK_TransferenciasStock_Origem FOREIGN KEY (id_localizacao_origem) REFERENCES dbo.Localizacoes(id_localizacao),
 CONSTRAINT FK_TransferenciasStock_Destino FOREIGN KEY (id_localizacao_destino) REFERENCES dbo.Localizacoes(id_localizacao),
 CONSTRAINT CK_TransferenciasStock_Localizacoes CHECK (id_localizacao_origem <> id_localizacao_destino),
 CONSTRAINT CK_TransferenciasStock_Estado CHECK (estado_transferencia IN ('Criada','Enviada','EmTransito','Recebida','Cancelada'))
);
GO
