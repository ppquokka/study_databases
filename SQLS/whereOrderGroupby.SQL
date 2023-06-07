-- 출처: https://www.w3schools.com/sql/trysql.asp?filename=trysql_is_not_null
-- 문제 TABLE:ORDER, 조건:EMPLOYEEID가 7,9직원에 주문 갯수 각각 표시
SELECT COUNT(*), EMPLOYEEID
FROM ORDERS
WHERE EMPLOYEEID IN (7,9)
GROUP BY EMPLOYEEID;

-- 결과     COUNT(*)  EMPLOYEEID
--            14         7
--             6         9