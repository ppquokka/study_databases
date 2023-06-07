-- reference(출처) : 
-- 조건: 1.CustomerID 50 ~ 89     2.city가 Berlin
SELECT * 
FROM Customers
WHERE CUSTOMERID BETWEEN 50 AND 89
AND CITY LIKE 'LONDON';
-- NUMBER OFRECORDS : 2


-- [ 답 ]
-- source: https://www.w3schools.com/sql/trysql.asp?filename=trysql_select_where
-- 조건 : CustomerID가 50에서 89이고, City가 London인 고객
     -- SELECT * 
     -- FROM Customers
     -- WHERE CustomerID BETWEEN 50 AND 89 AND City = 'London' ;
-- Number of Records: 2