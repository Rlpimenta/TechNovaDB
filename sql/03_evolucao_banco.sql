/*
    Projeto: TechNovaDB
    Ficheiro: 03_evolucao_banco.sql

    Objetivo:
    Documentar a evolucao da base de dados.

    Alteracoes realizadas:
    - Criacao da tabela Localizacoes.
    - Adicao de codigos para as localizacoes.
    - Padronizacao dos codigos dos produtos.
    - Criacao da sequencia para gerar codigos de produtos.
    - Criacao da tabela Categorias.
    - Relacao entre Produtos e Categorias.
    - Criacao da tabela Stock.
*/

USE TechNovaDB;
GO

-- Consultar produtos e respetivas categorias
SELECT
    p.id_produto,
    p.codigo_produto,
    p.nome AS produto,
    c.nome AS categoria
FROM Produtos AS p
INNER JOIN Categorias AS c
    ON p.id_categoria = c.id_categoria;
GO

-- Consultar as localizacoes
SELECT
    id_localizacao,
    codigo_localizacao,
    nome,
    tipo,
    cidade,
    ativa
FROM Localizacoes;
GO

-- Consultar o stock registado
SELECT *
FROM Stock;
GO