-- DELETE FROM table_name WHERE condition;
-- 현재 TABLE에 들어간 DATA 전체 DELETE되는 DML문 작성
-- 홍길동은 강사님과 연습으로 이미 삭제
 
-- 박영희 삭제
DELETE FROM membewrs_login
WHERE MEMBERS_ID = 'M-02';
DELETE FROM members_hobby
WHERE MEMBERS_ID = 'M-02';
DELETE FROM members
WHERE NAME = '박영희';

-- 김철수 삭제
DELETE FROM membewrs_login
WHERE MEMBERS_ID = 'M-03';
DELETE FROM members_hobby
WHERE MEMBERS_ID = 'M-03';
DELETE FROM members
WHERE NAME = '김철수';

-- 이영미 삭제
DELETE FROM members_hobby
WHERE MEMBERS_ID = 'M-04';
DELETE FROM membewrs_login
WHERE MEMBERS_ID = 'M-04';
DELETE FROM members
WHERE NAME = '이영미'; 

-- 정민호 삭제
DELETE FROM members_hobby
WHERE MEMBERS_ID = 'M-05';
DELETE FROM membewrs_login
WHERE MEMBERS_ID = 'M-05';
DELETE FROM members
WHERE NAME = '정민호';