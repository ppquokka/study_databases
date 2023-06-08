-- 230608(목)   JOIN 3 연습문제

-- SELECT ?
-- FROM ?1             -- 1번째 TABLE
--     INNER JOIN ?2   -- 2번째 TABLE, 그냥 JOIN은 INNER JOIN이  기본
--     ON CONDITION             -- 어떤 조건으로 JOIN 할 것인가

-- [출처]: https://www.w3schools.com/sql/trysql.asp?filename=trysql_select_columns
-- ○ Table : Orders
-- ○ 조건 : 가장 많이 주문 받은 회사 직원명과 갯수
-- --- 가장많이 주문한 회사:  SupplierID    /  의 직원명: SupplierName
-- --- 가장 많이 주문 받은 갯수: Products 

SELECT MAX(T_prod),T_sup.*, T_prod.SupplierName,  
FROM(Products AS T_prod 
     INNER JOIN Suppliers AS T_sup
     ON T_prod.SupplierID = T_sup.SupplierID
    )
    INNER JOIN Oders AS T_OD 
    ON T_sup.



SELECT T_OD.*  
FROM(Oders AS T_OD 
     INNER JOIN Customers AS T_cus
     ON T_OD.CustomerID = T_cus.CustomerID
     AND T_OD.CustomerID = ''
    )
    INNER JOIN Oders AS T_OD 
    ON T_sup.



    -- < 강사님 설명 >
    -- 1. 내가 접근해야하는 TABLE 찾기 : ORDER TABLE의 COLUMN 확인하기
    -- -- EMPOLYEES 와 ORDERS와 JOIN 해서 COUNT 먼저 세기.(데이터 검증)
SELECT MAX(*), T_INNER.EmployeeID
FROM (
    SELECT count(*), T_EMPS.EmployeeID, T_EMPS.LastName 
    FROM Employees AS T_EMPS
         INNER JOIN Orders AS T_ORDS
         ON T_EMPS.EmployeeID = T_ORDS.EmployeeID
    GROUP BY T_EMPS.EmployeeID                          -- 검증 완료
    ) T_INNER
