-- 출처: https://www.w3schools.com/sql/trysql.asp?filename=trysql_is_not_null
-- 문제 TABLE:ORDER, 조건:EMPLOYEEID가 7,9직원에 주문 갯수 각각 표시

SELECT COUNT(*) 
FROM ORDERS
WHERE EMPLOYEEID IN (7,9)
GROUP BY EMPLOYEEID;
-- ERROR







-- 컬럼에 주는 경우: AS 는 이름 표시 하는 것 
SELECT COUNT(*) AS EMPLOYEE_CNT, T_ORS.EMPLOYEEID
FROM ORDERS AS T_ORS
WHERE T_ORS.EMPLOYEEID IN (7,9)
GROUP BY T_ORS.EMPLOYEEID;
-- 컬럼과 테이블에만 알리아스 AS를 준다. AS는 제3에서 사용하기 위해

-- 결과     COUNT(*)  EMPLOYEEID
--            14         7
--             6         9



(
SELECT T_INNER_ORS.*
FROM ORDERS AS T_INNER_ORS
WHERE T_INNER_ORS.EMPLOYEEID IN (7,9)
) AS T_OUTER_ORS
-- 이걸 하나의 TABLE로 사용할 수 있음 T_OUTER_ORS 테이블 명
-- _INNER_ORS. 는 저장되지 않음. 

SELECT COUNT(*) AS EMPLOYEE_CNT, T_OUTER_ORS.EMPLOYEEID
FROM(
     SELECT T_INNER_ORS.*
     FROM ORDERS AS T_INNER_ORS
     WHERE T_INNER_ORS.EMPLOYEEID IN (7,9)
     ) AS T_OUTER_ORS
GROUP BY T_OUTER_ORS.EMPLOYEEID;
-- 내가 SELECT를 하면 TABLE로 결과값이 떨어진다.
-- () 괄호는 형식만 벗어나지않으면 FROM, IN 조건에 사용 가능