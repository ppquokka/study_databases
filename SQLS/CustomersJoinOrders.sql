-- 230608(목)   JOIN 연습문제

-- SELECT ?
-- FROM ?1             -- 1번째 TABLE
--     INNER JOIN ?2   -- 2번째 TABLE, 그냥 JOIN은 INNER JOIN이  기본
--     ON CONDITION             -- 어떤 조건으로 JOIN 할 것인가

-- 출처: https://www.w3schools.com/sql/trysql.asp?filename=trysql_select_columns
-- Table : Customers, Orders
-- - 조건 : CustomerName별로 주문 갯수 표시
-- - 연결 키는 각자 찾기

SELECT COUNT(*) AS COUNT_CUSTOMER, T_CUS.CUSTOMERNAME 
FROM Customers AS T_CUS             -- PK: CUSTOMERID
    INNER JOIN ORDERS AS T_ORDER
    ON T_CUS.CUSTOMERID = T_ORDER.CUSTOMERID
GROUP BY T_CUS.CUSTOMERNAME ;    

-- NUMBER OF RECORDS : 74

-- ↓ 왜 안되지....???
-- SELECT T_CUS.*, T_ORDER.CUSTOMERNAME
-- FROM CUSTOMERS AS T_CUS
--     INNER JOIN ORDERS AS T_ORDER
--     ON T_CUS.CUSTOMERID = T_ORDER.CUSTOMERID ;

-- < JOIN 검증하기 >
-- ORDERS가 더 많고, ORDERS에서 CUSTOMERNAME '@#$'를 검사해서 
-- ORDER COUNT와 같으면 검증 완료!



