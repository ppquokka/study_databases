-- 23.06.08.(목)    HAVING

-- SELECT column_name(s)
-- FROM table_name
-- WHERE condition
-- GROUP BY column_name(s)
-- HAVING condition
-- ORDER BY column_name(s);

-- CMT=COUNT, MEMB=MEMBER
-- ① HAVING 사용,  CONDITION이기때문에 AND 조건 들어갈 수 있다.
select COUNT(T_MEMBER.AGE) AS COUNT_AGE, T_MEMBER.AGE
from members AS T_MEMBER
group by T_MEMBER.AGE
HAVING COUNT(T_MEMBER.AGE) >= 2 ;   -- HAVING은 풀리는 순서가 SELECT 다음이 아니므로, FUNCTION을 써야한다

-- ② GROUP BY, WHERE
SELECT *
FROM  (select COUNT(T_MEMBER.AGE) AS COUNT_AGE, T_MEMBER.AGE       -- COUNT가 없으면 (갯수)집계가 나오지 않음. AGE값만 나온다
        from members AS T_MEMBER
        group by T_MEMBER.AGE) AS T_INNER_MEMBERS
WHERE T_INNER_MEMBERS.COUNT_AGE >= 2;

(select COUNT(T_MEMBER.AGE) AS COUNT_AGE, T_MEMBER.AGE       -- COUNT가 없으면 (갯수)집계가 나오지 않음. AGE값만 나온다
from members AS T_MEMBER
group by T_MEMBER.AGE) AS T_INNER_MEMBERS ;


-- <강사님 공유자료>
-- SELECT column_name(s)
-- FROM table_name
-- WHERE condition
-- GROUP BY column_name(s)
-- HAVING condition
-- ORDER BY column_name(s);

SELECT *
FROM (SELECT count(T_MEMB.AGE) as CNT_AGE, T_MEMB.AGE
    FROM members as T_MEMB
	GROUP BY T_MEMB.AGE ) AS T_INNER_MEMB
WHERE T_INNER_MEMB.CNT_AGE >= 2 ;


SELECT count(T_MEMB.AGE) as CNT_AGE, T_MEMB.AGE
FROM members as T_MEMB
GROUP BY T_MEMB.AGE 
HAVING COUNT(T_MEMB.AGE) >= 2;

SELECT count(T_MEMB.AGE) as CNT_AGE, T_MEMB.AGE
FROM members as T_MEMB
GROUP BY T_MEMB.AGE ;

(SELECT count(T_MEMB.AGE) as CNT_AGE, T_MEMB.AGE
FROM members as T_MEMB
GROUP BY T_MEMB.AGE ) AS T_INNER_MEMB;
-- SELECT column_name(s)
-- FROM table_name
-- WHERE condition
-- GROUP BY column_name(s)
-- HAVING condition
-- ORDER BY column_name(s);

SELECT *
FROM (SELECT count(T_MEMB.AGE) as CNT_AGE, T_MEMB.AGE
    FROM members as T_MEMB
	GROUP BY T_MEMB.AGE ) AS T_INNER_MEMB
WHERE T_INNER_MEMB.CNT_AGE >= 2 ;


SELECT count(T_MEMB.AGE) as CNT_AGE, T_MEMB.AGE
FROM members as T_MEMB
GROUP BY T_MEMB.AGE 
HAVING COUNT(T_MEMB.AGE) >= 2;

-- (SELECT count(T_MEMB.AGE) as CNT_AGE, T_MEMB.AGE
-- FROM members as T_MEMB
-- GROUP BY T_MEMB.AGE ) AS T_INNER_MEMB;

SELECT count(T_MEMB.AGE) as CNT_AGE, T_MEMB.AGE
FROM members as T_MEMB
GROUP BY T_MEMB.AGE ;




