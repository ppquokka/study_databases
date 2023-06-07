-- UPDATE는 ORDER BY(정렬)가 필요없기때문에 WHERE문만 쓴다

-- UPDATE table_name
-- SET column1 = value1, column2 = value2, ... 컬럼 여러개 가능. (예: 회원정보 갱신 후 수정할 때)
-- WHERE condition;

UPDATE members      -- 컴퓨터는 변경 항목만이 아닌 전체를 UPDATE함. 그렇기 때문에 MEMBERS 전체를 UPDATE하는게 유리하다 
SET AGE = 29
WHERE AGE IN (32, 30) ;

SELECT *
FROM members
ORDER BY AGE ;   -- ASCENDING 오름차순

-- 