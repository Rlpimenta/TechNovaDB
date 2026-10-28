/*
TechNovaDB — 15_linhas_transferencia_stock.sql
Finalidade: produtos e quantidades de cada transferência.
Dependências: 14_transferencias_stock.sql e 05_produtos.sql.
Nota futura: tratar diferenças entre quantidades enviadas e recebidas.
*/
USE TechNovaDB;
GO
CREATE TABLE dbo.LinhasTransferenciaStock (
 id_linha_transferencia INT IDENTITY(1,1) NOT NULL,
 id_transferencia INT NOT NULL,
 id_produto INT NOT NULL,
 quantidade_enviada INT NOT NULL,
 quantidade_recebida INT NOT NULL CONSTRAINT DF_LinhasTransferencia_QuantidadeRecebida DEFAULT (0),
 CONSTRAINT PK_LinhasTransferenciaStock PRIMARY KEY (id_linha_transferencia),
 CONSTRAINT FK_LinhasTransferencia_Transferencias FOREIGN KEY (id_transferencia) REFERENCES dbo.TransferenciasStock(id_transferencia),
 CONSTRAINT FK_LinhasTransferencia_Produtos FOREIGN KEY (id_produto) REFERENCES dbo.Produtos(id_produto),
 CONSTRAINT CK_LinhasTransferencia_QuantidadeEnviada CHECK (quantidade_enviada > 0),
 CONSTRAINT CK_LinhasTransferencia_QuantidadeRecebida CHECK (quantidade_recebida >= 0 AND quantidade_recebida <= quantidade_enviada)
);
GO
