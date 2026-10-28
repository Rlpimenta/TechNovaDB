/*
TechNovaDB — 18_inspecoes_devolucao.sql
Finalidade: histórico de inspeções de produtos devolvidos.
Dependências: 17_linhas_devolucao.sql.
Nota futura: o modelo permite várias inspeções por linha. Se só se permitir uma, adicionar UNIQUE(id_linha_devolucao).
*/
USE TechNovaDB;
GO
CREATE TABLE dbo.InspecoesDevolucao (
 id_inspecao INT IDENTITY(1,1) NOT NULL,
 id_linha_devolucao INT NOT NULL,
 data_inspecao DATETIME2 NOT NULL CONSTRAINT DF_InspecoesDevolucao_Data DEFAULT (SYSDATETIME()),
 resultado VARCHAR(30) NOT NULL,
 diagnostico VARCHAR(500) NULL,
 acao_recomendada VARCHAR(30) NOT NULL,
 observacoes VARCHAR(500) NULL,
 CONSTRAINT PK_InspecoesDevolucao PRIMARY KEY (id_inspecao),
 CONSTRAINT FK_InspecoesDevolucao_LinhasDevolucao FOREIGN KEY (id_linha_devolucao) REFERENCES dbo.LinhasDevolucao(id_linha_devolucao),
 CONSTRAINT CK_InspecoesDevolucao_Resultado CHECK (resultado IN ('Aprovado','Avaria','Danos','Incompleto','NaoConforme')),
 CONSTRAINT CK_InspecoesDevolucao_Acao CHECK (acao_recomendada IN ('ReintegrarStock','Reparar','DevolverFornecedor','Abater','NovaInspecao'))
);
GO
