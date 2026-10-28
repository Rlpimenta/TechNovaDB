/*
TechNovaDB — 05_produtos.sql
Finalidade: catálogo de produtos e respetivas categorias.
Dependências: 01_categorias.sql.
Nota futura: os preços atuais não substituem os preços históricos guardados nas linhas de venda/encomenda.
*/
USE TechNovaDB;
GO
CREATE TABLE dbo.Produtos (
 id_produto INT IDENTITY(1,1) NOT NULL,
 codigo_produto VARCHAR(30) NOT NULL,
 nome VARCHAR(150) NOT NULL,
 marca VARCHAR(80) NULL,
 modelo VARCHAR(80) NULL,
 preco_venda DECIMAL(10,2) NOT NULL,
 custo_aquisicao DECIMAL(10,2) NOT NULL,
 ativo BIT NOT NULL CONSTRAINT DF_Produtos_Ativo DEFAULT (1),
 id_categoria INT NOT NULL,
 taxa_iva DECIMAL(5,2) NOT NULL CONSTRAINT DF_Produtos_TaxaIVA DEFAULT (23.00),
 codigo_barras VARCHAR(50) NULL,
 descricao VARCHAR(500) NULL,
 CONSTRAINT PK_Produtos PRIMARY KEY (id_produto),
 CONSTRAINT UQ_Produtos_Codigo UNIQUE (codigo_produto),
 CONSTRAINT FK_Produtos_Categorias FOREIGN KEY (id_categoria) REFERENCES dbo.Categorias(id_categoria),
 CONSTRAINT CK_Produtos_PrecoVenda CHECK (preco_venda >= 0),
 CONSTRAINT CK_Produtos_CustoAquisicao CHECK (custo_aquisicao >= 0),
 CONSTRAINT CK_Produtos_TaxaIVA CHECK (taxa_iva >= 0 AND taxa_iva <= 100)
);
GO
CREATE UNIQUE INDEX UX_Produtos_CodigoBarras ON dbo.Produtos(codigo_barras) WHERE codigo_barras IS NOT NULL;
GO
