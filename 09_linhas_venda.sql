/*
TechNovaDB — 09_linhas_venda.sql
Finalidade: produtos, quantidades e preços por venda.
Dependências: 08_vendas.sql e 05_produtos.sql.
Nota futura: desconto é tratado como valor monetário por unidade. Se for percentagem, rever o modelo.
Limites acumulados de devolução exigem validação transacional.
*/
USE TechNovaDB;
GO
CREATE TABLE dbo.LinhasVenda (
 id_linha_venda INT IDENTITY(1,1) NOT NULL,
 id_venda INT NOT NULL,
 id_produto INT NOT NULL,
 quantidade INT NOT NULL,
 preco_unitario DECIMAL(10,2) NOT NULL,
 desconto DECIMAL(10,2) NOT NULL CONSTRAINT DF_LinhasVenda_Desconto DEFAULT (0),
 taxa_iva DECIMAL(5,2) NOT NULL CONSTRAINT DF_LinhasVenda_TaxaIVA DEFAULT (23.00),
 CONSTRAINT PK_LinhasVenda PRIMARY KEY (id_linha_venda),
 CONSTRAINT FK_LinhasVenda_Vendas FOREIGN KEY (id_venda) REFERENCES dbo.Vendas(id_venda),
 CONSTRAINT FK_LinhasVenda_Produtos FOREIGN KEY (id_produto) REFERENCES dbo.Produtos(id_produto),
 CONSTRAINT CK_LinhasVenda_Quantidade CHECK (quantidade > 0),
 CONSTRAINT CK_LinhasVenda_Preco CHECK (preco_unitario >= 0),
 CONSTRAINT CK_LinhasVenda_Desconto CHECK (desconto >= 0 AND desconto <= preco_unitario),
 CONSTRAINT CK_LinhasVenda_TaxaIVA CHECK (taxa_iva >= 0 AND taxa_iva <= 100)
);
GO
