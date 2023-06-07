SELECT * 
FROM db_members.members
WHERE NAME != '홍길동';     -- 홍길동 제외 한 나머지 보여줘
-- WHERE NAME = '홍길동';     -- 홍길동 보여줘


SELECT *
FROM members
WHERE GENDER_CODE_ID NOT LIKE 'G-01';      -- 'G-04'가 나옴
-- WHERE GENDER_CODE_ID = 'G-01';

SELECT*
FROM members
WHERE AGE  NOT IN (32, 28)        -- WHERE에서 이건 TRUE가 됨. WHERE 조건이 걸리면 실제 튀어나올땐 그 조건이 걸리는 RECODER 전체가 나온다
ORDER BY ADDRESS_CODE_ID DESC;

-- 컬럼 2,3개 등 여러개 조건을 같이걸면 된다
-- 조건: 1.텔레폰 안에 1이 들어감 2.남자인 것만 골라낸다
SELECT *
FROM members
WHERE TELEPHONE LIKE '%1%' AND GENDER_CODE_ID = 'G-01';
-- AND 조건은 2,3가지 조건 컬럼에 걸 수 있다.  LIKE 빼고 =, 나머지 특정 사항은 IN, =, RANGE를 PK를 쓰는 경우가 많다
-- 쿼리에서 OR 조건은 사용하지 않는다. 쿼리는 계속 걸러내서 데이터를 줄이는데, OR는 데이터를 늘리기 때문에 숙달되면 빅데이터 때 쓰자.
-- 지금은 AND 조건을 연습하자!

