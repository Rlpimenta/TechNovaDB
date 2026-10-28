/*
TechNovaDB — validar_reconstrucao.sql
Executar depois dos 19 scripts. Apenas consulta metadados.
*/
USE TechNovaDB;
GO
SELECT COUNT(*) AS total_tabelas FROM sys.tables WHERE is_ms_shipped = 0;
GO
SELECT s.name AS esquema, t.name AS tabela
FROM sys.tables t JOIN sys.schemas s ON s.schema_id=t.schema_id
WHERE t.is_ms_shipped=0 ORDER BY s.name,t.name;
GO
SELECT COUNT(*) AS total_chaves_estrangeiras FROM sys.foreign_keys;
GO
SELECT fk.name AS chave_estrangeira,
       OBJECT_NAME(fk.parent_object_id) AS tabela_origem,
       OBJECT_NAME(fk.referenced_object_id) AS tabela_referenciada
FROM sys.foreign_keys fk ORDER BY tabela_origem,fk.name;
GO
SELECT OBJECT_NAME(parent_object_id) AS tabela, name AS restricao, is_disabled, is_not_trusted
FROM sys.check_constraints
WHERE is_disabled=1 OR is_not_trusted=1
ORDER BY tabela,restricao;
GO
