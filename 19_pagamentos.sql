/*
TechNovaDB — 19_pagamentos.sql
Finalidade: registar pagamentos e reembolsos de vendas/devoluções.
Dependências: 08_vendas.sql e 16_devolucoes.sql.
Este ficheiro fica no final porque referencia Devolucoes, criada no ficheiro 16.
Nota futura: validar que a devolução pertence à mesma venda. Confirmar regra de negócio
para reembolsos: valor positivo com estado Reembolsado ou modelo separado.
*/
USE TechNovaDB;
GO
CREATE TABLE dbo.Pagamentos (
 id_pagamento INT IDENTITY(1,1) NOT NULL,
 id_venda INT NOT NULL,
 data_pagamento DATETIME2 NOT NULL CONSTRAINT DF_Pagamentos_Data DEFAULT (SYSDATETIME()),
 metodo_pagamento VARCHAR(30) NOT NULL,
 valor DECIMAL(10,2) NOT NULL,
 estado_pagamento VARCHAR(20) NOT NULL CONSTRAINT DF_Pagamentos_Estado DEFAULT ('Pendente'),
 referencia_pagamento VARCHAR(100) NULL,
 id_devolucao INT NULL,
 CONSTRAINT PK_Pagamentos PRIMARY KEY (id_pagamento),
 CONSTRAINT FK_Pagamentos_Vendas FOREIGN KEY (id_venda) REFERENCES dbo.Vendas(id_venda),
 CONSTRAINT FK_Pagamentos_Devolucoes FOREIGN KEY (id_devolucao) REFERENCES dbo.Devolucoes(id_devolucao),
 CONSTRAINT CK_Pagamentos_Metodo CHECK (metodo_pagamento IN ('Cartao','Dinheiro','Transferencia','MBWay','Outro')),
 CONSTRAINT CK_Pagamentos_Valor CHECK (valor > 0),
 CONSTRAINT CK_Pagamentos_Estado CHECK (estado_pagamento IN ('Pendente','Confirmado','Recusado','Reembolsado'))
);
GO
