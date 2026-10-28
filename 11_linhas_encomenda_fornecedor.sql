/*
TechNovaDB — 11_linhas_encomenda_fornecedor.sql
Finalidade: produtos, quantidades e preços de cada encomenda.
Dependências: 10_encomendas_fornecedor.sql e 05_produtos.sql.
Nota futura: a receção deve validar quantidades acumuladas contra a quantidade encomendada.
*/
USE TechNovaDB;
GO
CREATE TABLE dbo.LinhasEncomendaFornecedor (
 id_linha_encomenda INT IDENTITY(1,1) NOT NULL,
 id_encomenda INT NOT NULL,
 id_produto INT NOT NULL,
 quantidade_encomendada INT NOT NULL,
 preco_unitario DECIMAL(10,2) NOT NULL,
 CONSTRAINT PK_LinhasEncomendaFornecedor PRIMARY KEY (id_linha_encomenda),
 CONSTRAINT FK_LinhasEncomendaFornecedor_Encomendas FOREIGN KEY (id_encomenda) REFERENCES dbo.EncomendasFornecedor(id_encomenda),
 CONSTRAINT FK_LinhasEncomendaFornecedor_Produtos FOREIGN KEY (id_produto) REFERENCES dbo.Produtos(id_produto),
 CONSTRAINT CK_LinhasEncomendaFornecedor_Quantidade CHECK (quantidade_encomendada > 0),
 CONSTRAINT CK_LinhasEncomendaFornecedor_Preco CHECK (preco_unitario >= 0)
);
GO
