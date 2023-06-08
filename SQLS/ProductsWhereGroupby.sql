-- 23.06.08(목)   HAVING 연습문제

-- SELECT column_name(s)
-- FROM table_name
-- WHERE condition
-- GROUP BY column_name(s)
-- HAVING condition
-- ORDER BY column_name(s);

-- W3SCHOOL
-- SELECT COUNT(CustomerID), Country
-- FROM Customers
-- GROUP BY Country
-- HAVING COUNT(CustomerID) > 5;

-- Table : Products
-- 조건 : CategoryID 가 10개 이상

-- SELECT COUNT(CATEGORYID), RODUCTs
-- FROM RODUCTs
-- GROUP BY CATEGORYID
-- HAVING COUNT(CATEGORYID) >= 10;

-- 출처: https://www.w3schools.com/sql/trysql.asp?filename=trysql_select_having

SELECT COUNT (CATEGORYID) AS COUNT_CATEGORYID, T_PROD.CATEGORYID
FROM PRODUCTS AS T_PROD
GROUP BY T_PROD.CATEGORYID
HAVING COUNT (CATEGORYID) >= 10 ;

-- NUMBER OF RECORD : 5
-- COUNT_CATEGORYID  |   CATEGORYID
--       12                  1
--       12                  2
--       13                  3
--       10                  4
--       12                  8