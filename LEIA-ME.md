# TechNovaDB — revisão e reconstrução

## Ordem de execução
Executar os 19 scripts, pela ordem numérica, numa base de dados `TechNovaDB` vazia:
01 categorias; 02 localizações; 03 fornecedores; 04 clientes; 05 produtos; 06 stock;
07 movimentos de stock; 08 vendas; 09 linhas de venda; 10 encomendas a fornecedor;
11 linhas de encomenda; 12 receções; 13 linhas de receção; 14 transferências;
15 linhas de transferência; 16 devoluções; 17 linhas de devolução;
18 inspeções de devolução; 19 pagamentos.

Cada ficheiro inclui `USE TechNovaDB; GO`. A base de dados tem de existir previamente.
Não executar estes scripts sobre uma base de dados que já contenha estas tabelas.

## Melhorias aplicadas
- Um ficheiro por tabela e ordem de dependências sem referências a tabelas futuras.
- `dbo` explícito, nomes explícitos de constraints e defaults.
- CHECKs para estados, quantidades, preços, descontos, IVA e localizações de transferência.
- A unicidade de produto/localização é assegurada apenas por `UQ_Stock_Produto_Localizacao`, sem índice redundante.
- Índice único filtrado para código de barras não nulo.
- Comentários de finalidade, dependências e decisões futuras em cada ficheiro.

## Pontos que ainda exigem lógica de negócio
- Movimentos, vendas, receções, transferências e devoluções não atualizam automaticamente `Stock`.
  Implementar operações transacionais que atualizem saldo e histórico de movimentos juntos.
- Validar que uma linha de devolução pertence à venda indicada e que o total devolvido não excede o vendido.
- Validar que uma linha de receção pertence à encomenda indicada e que os totais recebidos/rejeitados não excedem o encomendado.
- Validar que uma devolução associada a pagamento pertence à mesma venda.
- Confirmar a semântica de reembolsos, estados e os valores permitidos para tipos de localização/movimento.
- Definir regras de proteção e retenção para dados pessoais.
- NIF não é único porque a política para NIF nulo/estrangeiro ainda não foi definida.

## Teste pós-criação
Executar `validar_reconstrucao.sql` depois dos 19 scripts. Para validar CHECKs e FKs,
usar uma base de dados de teste e tentar inserir valores inválidos; não testar estes casos
na base de dados de trabalho.
