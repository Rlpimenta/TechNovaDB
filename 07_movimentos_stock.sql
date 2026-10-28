/*
TechNovaDB — 07_movimentos_stock.sql
Finalidade: histórico de entradas, saídas, ajustes e reservas.
Dependências: 05_produtos.sql e 02_localizacoes.sql.
Nota futura: referencia_tipo/referencia_id são polimórficos e não têm FK direta.
Validar referências e atualizar Stock dentro da mesma transação.
*/
USE TechNovaDB;
GO
CREATE TABLE dbo.MovimentosStock (
 id_movimento INT IDENTITY(1,1) NOT NULL,
 id_produto INT NOT NULL,
 id_localizacao INT NOT NULL,
 tipo_movimento VARCHAR(30) NOT NULL,
 quantidade INT NOT NULL,
 data_movimento DATETIME2 NOT NULL CONSTRAINT DF_MovimentosStock_Data DEFAULT (SYSDATETIME()),
 referencia_tipo VARCHAR(30) NULL,
 referencia_id INT NULL,
 motivo VARCHAR(200) NULL,
 observacoes VARCHAR(500) NULL,
 CONSTRAINT PK_MovimentosStock PRIMARY KEY (id_movimento),
 CONSTRAINT FK_MovimentosStock_Produtos FOREIGN KEY (id_produto) REFERENCES dbo.Produtos(id_produto),
 CONSTRAINT FK_MovimentosStock_Localizacoes FOREIGN KEY (id_localizacao) REFERENCES dbo.Localizacoes(id_localizacao),
 CONSTRAINT CK_MovimentosStock_Tipo CHECK (tipo_movimento IN ('Entrada','Saida','Ajuste','Reserva','LibertacaoReserva')),
 CONSTRAINT CK_MovimentosStock_Quantidade CHECK (quantidade > 0)
);
GO
