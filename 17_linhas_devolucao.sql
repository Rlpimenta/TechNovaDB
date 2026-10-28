/*
TechNovaDB — 17_linhas_devolucao.sql
Finalidade: produtos e quantidades devolvidos.
Dependências: 16_devolucoes.sql e 09_linhas_venda.sql.
Nota futura: validar que a linha de venda pertence à venda da devolução e que a soma devolvida não ultrapassa a vendida.
Estas regras exigem lógica transacional, não apenas CHECK.
*/
USE TechNovaDB;
GO
CREATE TABLE dbo.LinhasDevolucao (
 id_linha_devolucao INT IDENTITY(1,1) NOT NULL,
 id_devolucao INT NOT NULL,
 id_linha_venda INT NOT NULL,
 quantidade INT NOT NULL,
 estado_produto VARCHAR(30) NOT NULL CONSTRAINT DF_LinhasDevolucao_Estado DEFAULT ('PendenteInspecao'),
 reintegrar_stock BIT NOT NULL CONSTRAINT DF_LinhasDevolucao_ReintegrarStock DEFAULT (0),
 CONSTRAINT PK_LinhasDevolucao PRIMARY KEY (id_linha_devolucao),
 CONSTRAINT FK_LinhasDevolucao_Devolucoes FOREIGN KEY (id_devolucao) REFERENCES dbo.Devolucoes(id_devolucao),
 CONSTRAINT FK_LinhasDevolucao_LinhasVenda FOREIGN KEY (id_linha_venda) REFERENCES dbo.LinhasVenda(id_linha_venda),
 CONSTRAINT CK_LinhasDevolucao_Quantidade CHECK (quantidade > 0),
 CONSTRAINT CK_LinhasDevolucao_Estado CHECK (estado_produto IN ('PendenteInspecao','Aprovado','Avaria','EmReparacao','DevolucaoFornecedor','Abate'))
);
GO
