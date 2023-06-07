-- 출처: https://www.w3schools.com/sql/trysql.asp?filename=trysql_is_not_null

-- - Table : Categories
-- - 조건 : CategoryName가 Produce, Beverages 제품에 갯수 각각 표시
-- - where 완료 후 가상 Table로 groupby 진행
-- 예) SELECT COUNT(*) AS EMPLOYEE_CNT, T_OUTER_ORS.EmployeeID
-- FROM (
--      SELECT T_INNER_ORS.*
--      FROM ORDERS AS T_INNER_ORS
--      WHERE T_INNER_ORS.EmployeeID IN (7,9)
--     ) AS T_OUTER_ORS
-- GROUP BY T_OUTER_ORS.EmployeeID;

SELECT COUNT(*)AS CATEGOY_CNT, T_OUTER_ORS.CategoryName
FROM (
      SELECT T_inner_ORS.* 
      FROM CATEGORIES AS T_INNER_ORS
      WHERE T_INNER_ORS.CategoryName IN ('Produce', 'Beverages')
     ) AS T_OUTER_ORS
     --   CATEGORYID    |     CATEGORYNAME    |     DESCRIPTION
     --        1        |         BEVERAGES   |      SOFT DRINKS, COFFEES, TEAS, BEERS AND ALES
     --        2        |    PRODUCE          |  Dried fruit and bean curd
GROUP BY T_OUTER_ORS.CategoryName;
     -- Number of Records : 2
     -- CATEGORY_CNT   |   CATEGORYNAME
     --      1         |     BEVERAGES
     --      1         |     PRODUCE