-- reference(출처): https://www.w3schools.com/sql/trysql.asp?filename=trysql_select_where
SELECT * 
FROM Customers       -- NUMBER OF RECORDS: 91
WHERE COUNTRY NOT IN ('GERMANY', 'USA');  
-- NUMBER OF RECORDS: 78 
--WHERE COUNTRY IN ('GERMANY', 'USA');  -- NUMBER OF RECORDS: 13

