/*
TechNovaDB — 10_encomendas_fornecedor.sql
Finalidade: encomendas a fornecedores e localização de destino.
Dependências: 03_fornecedores.sql e 02_localizacoes.sql.
Nota futura: validar coerência de datas e atualizar estados com o processo de receção.
*/
USE TechNovaDB;
GO
CREATE TABLE dbo.EncomendasFornecedor (
 id_encomenda INT IDENTITY(1,1) NOT NULL,
 codigo_encomenda VARCHAR(30) NOT NULL,
 id_fornecedor INT NOT NULL,
 id_localizacao_destino INT NOT NULL,
 data_encomenda DATETIME2 NOT NULL CONSTRAINT DF_EncomendasFornecedor_Data DEFAULT (SYSDATETIME()),
 data_prevista_entrega DATE NULL,
 estado_encomenda VARCHAR(30) NOT NULL CONSTRAINT DF_EncomendasFornecedor_Estado DEFAULT ('Pendente'),
 observacoes VARCHAR(500) NULL,
 CONSTRAINT PK_EncomendasFornecedor PRIMARY KEY (id_encomenda),
 CONSTRAINT UQ_EncomendasFornecedor_Codigo UNIQUE (codigo_encomenda),
 CONSTRAINT FK_EncomendasFornecedor_Fornecedores FOREIGN KEY (id_fornecedor) REFERENCES dbo.Fornecedores(id_fornecedor),
 CONSTRAINT FK_EncomendasFornecedor_Localizacoes FOREIGN KEY (id_localizacao_destino) REFERENCES dbo.Localizacoes(id_localizacao),
 CONSTRAINT CK_EncomendasFornecedor_Estado CHECK (estado_encomenda IN ('Pendente','Enviada','ParcialmenteRecebida','Recebida','Cancelada'))
);
GO
