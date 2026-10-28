/*
TechNovaDB — 08_vendas.sql
Finalidade: cabeçalho das vendas.
Dependências: 04_clientes.sql e 02_localizacoes.sql.
Nota futura: confirmar se vendas online devem ter localização associada.
*/
USE TechNovaDB;
GO
CREATE TABLE dbo.Vendas (
 id_venda INT IDENTITY(1,1) NOT NULL,
 codigo_venda VARCHAR(30) NOT NULL,
 id_cliente INT NULL,
 id_localizacao INT NULL,
 data_venda DATETIME2 NOT NULL CONSTRAINT DF_Vendas_Data DEFAULT (SYSDATETIME()),
 canal_venda VARCHAR(20) NOT NULL,
 estado_venda VARCHAR(30) NOT NULL CONSTRAINT DF_Vendas_Estado DEFAULT ('Pendente'),
 observacoes VARCHAR(500) NULL,
 CONSTRAINT PK_Vendas PRIMARY KEY (id_venda),
 CONSTRAINT UQ_Vendas_Codigo UNIQUE (codigo_venda),
 CONSTRAINT FK_Vendas_Clientes FOREIGN KEY (id_cliente) REFERENCES dbo.Clientes(id_cliente),
 CONSTRAINT FK_Vendas_Localizacoes FOREIGN KEY (id_localizacao) REFERENCES dbo.Localizacoes(id_localizacao),
 CONSTRAINT CK_Vendas_Canal CHECK (canal_venda IN ('LojaFisica','Online')),
 CONSTRAINT CK_Vendas_Estado CHECK (estado_venda IN ('Pendente','Concluida','Cancelada','Devolvida','ParcialmenteDevolvida'))
);
GO
