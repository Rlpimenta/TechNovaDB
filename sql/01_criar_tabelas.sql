CREATE TABLE Produtos (
    id_produto INT IDENTITY(1,1) PRIMARY KEY,
    codigo_produto VARCHAR(30) NOT NULL UNIQUE,
    nome VARCHAR(100) NOT NULL,
    marca VARCHAR(50),
    modelo VARCHAR(50),
    preco_venda DECIMAL(10,2) NOT NULL,
    custo_aquisicao DECIMAL(10,2),
    ativo BIT NOT NULL DEFAULT 1
);

SELECT * FROM Produtos;