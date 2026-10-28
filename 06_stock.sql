/*
TechNovaDB — 06_stock.sql
Finalidade: quantidade física, reservada e mínima por produto/localização.
Dependências: 02_localizacoes.sql e 05_produtos.sql.
Nota futura: UQ_Stock_Produto_Localizacao já assegura unicidade; não criar outro índice igual.
Movimentos e saldo de stock devem ser atualizados em transação.
*/
USE TechNovaDB;
GO
CREATE TABLE dbo.Stock (
 id_stock INT IDENTITY(1,1) NOT NULL,
 id_produto INT NOT NULL,
 id_localizacao INT NOT NULL,
 quantidade_fisica INT NOT NULL CONSTRAINT DF_Stock_QuantidadeFisica DEFAULT (0),
 quantidade_reservada INT NOT NULL CONSTRAINT DF_Stock_QuantidadeReservada DEFAULT (0),
 stock_minimo INT NOT NULL CONSTRAINT DF_Stock_StockMinimo DEFAULT (0),
 data_atualizacao DATETIME2 NOT NULL CONSTRAINT DF_Stock_DataAtualizacao DEFAULT (SYSDATETIME()),
 CONSTRAINT PK_Stock PRIMARY KEY (id_stock),
 CONSTRAINT UQ_Stock_Produto_Localizacao UNIQUE (id_produto,id_localizacao),
 CONSTRAINT FK_Stock_Produtos FOREIGN KEY (id_produto) REFERENCES dbo.Produtos(id_produto),
 CONSTRAINT FK_Stock_Localizacoes FOREIGN KEY (id_localizacao) REFERENCES dbo.Localizacoes(id_localizacao),
 CONSTRAINT CK_Stock_QuantidadeFisica CHECK (quantidade_fisica >= 0),
 CONSTRAINT CK_Stock_QuantidadeReservada CHECK (quantidade_reservada >= 0 AND quantidade_reservada <= quantidade_fisica),
 CONSTRAINT CK_Stock_StockMinimo CHECK (stock_minimo >= 0)
);
GO
