-- SQL MIN & MAX

-- SELECT MIN(column_name)
-- FROM table_name
-- WHERE condition;

SELECT COUNT(*)    -- 가장 많이 사용하는 펑션 중 하나.()안에 컬럼의 갯수를 넣어주기. 갯수가 명확하게 있는거 넣어주기 PRIMARY KEY를 넣는게 좋다
FROM members ;     -- WHERE 조건 걸고 실제 갯수가 몇개인지 알고싶을 때 사용
                   -- 통계 펑션, 합계 펑션, 집계 펑션 RECORD가 FROM절의 TABLE의 RECORD가 튀어나옴. WHERE, ORDER BY 조건 없음 그래서 전체 TABLE에 해당
-- 웬만하면 PK로 지정된 컬럼을 사용하면 빠진 조건이 없어서 좋다. BUT BIG DATA 분석 시 전체 갯수와 컬럼에 해당되는 값이 차이가 나면, 차이나는 수는 값이 빠져있다는 뜻alter
-- BIG DATA에서는 걸러내는 작업으로 씀.  웹에서는 전체 수를 알기위해 사용. COLUMN 중 NULL이 들어가있으면 COUNT가 되지 않음 
-- 누락된 데이터의 RECORD를 찾기 위해사용하기도 함

SELECT COUNT(MEMBERS_ID) 
FROM members 
WHERE gender_code_ID = 'G-04'         -- 여자만 알고싶다 (RESULT COUNT : 2)
GROUP BY MEMBERS_ID                   -- WHERE와 ORDER BY사이에 그룹바이가 들어가있음 (RESULT COUNT : 1, 1)
 ;  
-- -- -- QUEST 성별 당 COUNT는 각각 몇명인가?
-- COUNT 펑션을 쓴다 = GROUP BY를 쓴다.   BUT 전체(DATA, TABLE)에서 보고싶다는 GROUP BY 안씀  
SELECT COUNT(*), gender_code_ID, MIN(NAME) 
FROM members 
GROUP BY gender_code_ID;     -- MEMBERS에서 성별 당 이라고 했으므로, 'GENDER_CODE_id'를 사용한다 
                             -- COLUMN의 해당 값을 기준으로 GROUP BY를 한다=묶여있는 상태.
                             -- MIN. MAX는 웬만해서는 전체를 기준으로 한다. WHERE조건을 걸어서 필터링을 할 수 있음
                             -- GRUOP BY 한다고 해도 RECORD 단위로 움직인다. RECORD로 묵으면 그 묶인 값은 같은 값이므로 하나로 묶이지만, 
                             -- RECORD의 다른 값은 다를 수 있다. 
                             -- 따라서 GRUOP BY 이후 나오는 값은 레코드별 랜덤 값이므로 이 값을 SELECT의 값으로 사용하면 위험하다. 
                             -- GROUP BY의 컬럼 조건이 A,B 2개이면 값끼리 + 하여 묶음. GROUP BY이후 값은 허상이다. 
                             -- 하지만 "MIN(NAME)"은 허상의 값이다