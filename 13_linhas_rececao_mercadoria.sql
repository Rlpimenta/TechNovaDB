/*
TechNovaDB — 13_linhas_rececao_mercadoria.sql
Finalidade: quantidades recebidas e rejeitadas por linha de encomenda.
Dependências: 12_rececoes_mercadoria.sql e 11_linhas_encomenda_fornecedor.sql.
Nota futura: validar que a linha pertence à encomenda da receção e que totais não excedem o encomendado.
*/
USE TechNovaDB;
GO
CREATE TABLE dbo.LinhasRececaoMercadoria (
 id_linha_rececao INT IDENTITY(1,1) NOT NULL,
 id_rececao INT NOT NULL,
 id_linha_encomenda INT NOT NULL,
 quantidade_recebida INT NOT NULL,
 quantidade_rejeitada INT NOT NULL CONSTRAINT DF_LinhasRececao_QuantidadeRejeitada DEFAULT (0),
 CONSTRAINT PK_LinhasRececaoMercadoria PRIMARY KEY (id_linha_rececao),
 CONSTRAINT FK_LinhasRececao_Rececoes FOREIGN KEY (id_rececao) REFERENCES dbo.RececoesMercadoria(id_rececao),
 CONSTRAINT FK_LinhasRececao_LinhasEncomenda FOREIGN KEY (id_linha_encomenda) REFERENCES dbo.LinhasEncomendaFornecedor(id_linha_encomenda),
 CONSTRAINT CK_LinhasRececao_QuantidadeRecebida CHECK (quantidade_recebida >= 0),
 CONSTRAINT CK_LinhasRececao_QuantidadeRejeitada CHECK (quantidade_rejeitada >= 0),
 CONSTRAINT CK_LinhasRececao_AlgumaQuantidade CHECK (quantidade_recebida + quantidade_rejeitada > 0)
);
GO
