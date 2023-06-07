-- reference(출처) : 
-- 조건: 1.CustomerID 50 ~ 89     2.city가 Berlin
SELECT * 
FROM Customers
WHERE CUSTOMERID BETWEEN 50 AND 89
AND CITY LIKE 'LONDON';
-- NUMBER OFRECORDS : 2