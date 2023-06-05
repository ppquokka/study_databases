-- GENDER_CODE : primary key를 가지고 있는 것부터 넣어주기
-- 키 하나 입력 할 때.....
INSERT INTO GENDER_CODE
(GENDER, GENDER_CODE)
VALUES
('남', 'G-01'), ('여', 'G-04');

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


INSERT INTO hobby_code
(NOBBY_CODE_ID, HOBBY)
VALUES
('요리', 'H-1'),
('등산', 'H-2'),
('음악감상', 'H-3'),
('독서', 'H-4'),
('요가', 'H-5'),
('여행', 'H-6'),
('사진촬영', 'H-7'),
('수영', 'H-8');

--
-- 오류가 나는 이유는 해당 FOREIN키 외래키 에러다. 
-- 1. Primary Key에 내가 넣으려고 하는 값이 없다
-- 2. 해당 값의 FK를 넣어줘야 한다
INSERT INTO members
(NAME, AGE, PHONENUMBER, MEMBERS_ID, GENDER_CODE, ADRESS_CODE)
VALUES
('John Doe', 30, '123-456-7890', 'M-01', 'G-01', 'A-01'),
('Jane Smith', 25, '987-654-3210', 'M-02', 'G-04', 'A-02'),
('David Johnson', 35, '456-123-7890', 'M-03', 'G-01', 'A-03'),
('Emily Davis', 28, '789-123-4560', 'M-04', 'G-04', 'A-04'),
('Michael Wilson', 32, '321-789-4560', 'M-05', 'G-01', 'A-05');


INSERT INTO members_login
(EMAIL, MEMBERS_ID, MEMBERS_LOGIN_ID)
VALUES
('johndoe@example.com', 'M-01', 'L-01'),
('janesmith@example.com', 'M-02', 'L-02'),
('davidjohnson@example.com', 'M-03', 'L-03'),
('emilydavis@example.com', 'M-04', 'L-04'),
('michaelwilson@example.com', 'M-05', 'L-05');


INSERT INTO members_hobby
(NOBBY_CODE_ID, MEMBERS_ID)
VALUES
( 'H-1', 'M-01'),
( 'H-2', 'M-01'),
( 'H-3', 'M-02'),
( 'H-4', 'M-02'),
( 'H-3', 'M-03'),
( 'H-5', 'M-03'),
( 'H-6', 'M-04'),
( 'H-7', 'M-04'),
( 'H-2', 'M-05'),
( 'H-8', 'M-05');