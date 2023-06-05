-- GENDER_CODE : primary key를 가지고 있는 것부터 넣어주기
-- 키 하나 입력 할 때.....
INSERT INTO GENDER_CODE
(GENDER, GENDER_CODE)
VALUES
('남', 'G-01');

INSERT INTO GENDER_CODE
(GENDER, GENDER_CODE)
VALUES
('여', 'G-04');

--
-- 하나의 테이블에 values는 하나. INSERT는 값은 여러개여도 된다 -- 여러개 INSERT 할 때 --
INSERT INTO adress_code
(ADRESS, ADRESS_CODE)
VALUES
('서울시', 'A-01'),
('부산시', 'A-02'), 
('경기도', 'A-03'), 
('대전시', 'A-04'), 
('인천시', 'A-05');

--
-- 오류가 나는 이유는 해당 FOREIN키 외래키 에러다. 
-- 1. Primary Key에 내가 넣으려고 하는 값이 없다
-- 2. 해당 값의 FK를 넣어줘야 한다
INSERT INTO members
(NAME, AGE, PHONENUMBER, MEMBERS_ID, GENDER_CODE, ADRESS_CODE)
VALUES
('John Doe', 30, '123-456-7890', 'M-01', 'G-01', 'A-01'); 