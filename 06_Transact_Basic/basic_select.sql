/*
SELECT memberID, memberNAME
FROM memberTbl 
WHERE memberID like 's%';
*/
--SELECT '1';

--USE BIKeStores;
--SELECT * FROM sales.customers;

--SELECT * FROM production.products;

-- DB조회
exec sp_helpdb;

-- 테이블 조회
exec sp_tables @table_type = "'table'"

-- 열 이름
EXEC sp_columns @table_name = "stocks",		
				@table_owner = "production"

