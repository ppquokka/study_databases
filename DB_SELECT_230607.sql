-- SELECT column1, column2, ...    (마지막)
-- FROM TABLE_NAME    ① 
-- WHERE CONDITION    ② 없으면 넘어감
    -- 여기에  추가로 by, 들어감
-- ORDER BY COIUMN 1, COIUMN 1, ... ASC|DESC;   ③ 없으면 넘어감 

-- 푸는 순서를 익히자!!! 
SELECT NAME, AGE     -- ORDER BY의 RECORD 중 SELECT에서 지정한 CULUMN만 보여줌. VIEWER MODE. RECORD는 살아있다!!! 
FROM members     -- targetting
WHERE AGE IN (32, 28)      -- primart key는 유니트하니까 정확하게 찍을 수 있다. & index key
-- AGE column에서 위의 조건에 해당하는 record 전체(해당 조건에 걸린 row's)가 선택됨 
ORDER BY ADDRESS_CODE_ID DESC;    -- order by가 되어있는 record가 select가 넘어감


-- UPDATE는 ORDER BY(정렬)가 필요없기때문에 WHERE문만 쓴다