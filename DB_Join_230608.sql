-- 230608(목)   JOIN

-- SELECT ?
-- FROM ?1             -- 1번째 TABLE
--     INNER JOIN ?2   -- 2번째 TABLE, 그냥 JOIN은 INNER JOIN이  기본
--     ON CONDITION             -- 어떤 조건으로 JOIN 할 것인가
-- <1>
SELECT T_MEMS.*, T_MEMS_LOGIN.EMAIL
FROM MEMBERS AS T_MEMS                    -- 주로 PK가 있는것 부터 시작 
    INNER JOIN MEMBERS_LOGIN AS T_MEMS_LOGIN
    ON T_MEMS.MEMBERS_ID = T_MEMS_LOGIN.MEMBERS_ID ;   -- JOIN이 이루어지면 COLUMN이 늘어난다
                                                          -- WHERE
														  -- GROUP BY, HAVING, ORDER BY 가능
-- TABLE 2개를 PRIMARY KEY가 있으므로 연결해서 가상의 한 TABLE이 나온 것    


-- <2>
SELECT COUNT(*), T_MEMS.AGE
FROM MEMBERS AS T_MEMS                    -- 주로 PK가 있는것 부터 시작 
    INNER JOIN MEMBERS_LOGIN AS T_MEMS_LOGIN
    ON T_MEMS.MEMBERS_ID = T_MEMS_LOGIN.MEMBERS_ID 
GROUP BY T_MEMS.AGE   ;               -- 가상의 TABLE에 하는 것    
    
    
    
    
    
    