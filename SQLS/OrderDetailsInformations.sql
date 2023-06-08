-- 230608(목)   QUEST

-- [출처]: https://www.w3schools.com/sql/trysql.asp?filename=trysql_select_columns
-- ○ Table : OrderDetails
-- ○ 조건 : 제품명,        | 가격       | 주문 갯수    |  고객명 표시 (회사에서 봄)
--        PRO_ProductName | PRO_Price |  OD_Quantity | CUT_CustomerName
-- -- (OD)OrderDetails : OrderDetailID, OrderID, ProductID, Quantity
-- -- (CUT)Customers : CustomerID, CustomerName, ...
-- -- (OS)Orders : OrderID, CustomerID, OrderDate...
-- -- (PRO)Products : ProductID, ProductName, Price....

-- SELECT (*)
-- FROM (OrderDetails AS T_OD
--     INNER JOIN Orders AS T_OS
--     ON T_OD.OrderID = T_OS.OrderID) AS T_ODS   -- T_OD의 NumberRecord: 518 과 동일. 검증 완
--     INNER JOIN Customers AS T_CUT
--     ON T_ODS.CustomerID = T_CUT.CustomerID  ----- Customers와 T_ODS의 컬럼 값이 다 들어옴 / NumberRecord: 518 과 동일. 검증 완
-- GROUP BY CustomerName; 

-- -- 제품명에 따른 가격, 주문 갯수, 고객명을 표시해야 함.........
(
SELECT COUNT(*) CNT, T_OD.ProductID,T_OD.ProductName, T_OD.Price    
FROM (OrderDetails AS T_OD
     INNER JOIN Products AS T_PRO 
     ON T_OD.ProductID = T_PRO.ProductID) -- T_OD의 NumberRecord: 518 과 동일. 검증 완
-- GROUP BY T_OD.ProductID                 -- T_RO의 NumberRecord: 77 과 동일. 검증 완
)