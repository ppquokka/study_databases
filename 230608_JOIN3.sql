-- 23.06.08.(목)  JOIN 3개

-- JOIN이 필요한 이유: 이 데이터가 사용자에게 그대로 보여질 것인데 충분하지 않다 
-- GENDER_CODE_ID는 사용자에게는 '남/여'로 보여줘야 한다. 내부적으로는 시스템을 돌리기 위해 코드ID 필요
-- 결론: '남/여'가 표시된 표와 JOIN 한다 

-- JOIN 순서는 상관없음. 시작되는 곳이 중요하므로 회원정보(주 데이터)를 먼저 JOIN하고, GENDER_CODE(OPTIONAL DATA)로 한다. 
-- PK가 어디있는지는 여기서 중요하지 않다 

              
SELECT T_MEMS.*, T_MEMS_LOGIN.EMAIL, T_GENDERS.GENDER 
FROM (members AS T_MEMS
	INNER JOIN members_login AS T_MEMS_LOGIN
    ON T_MEMS.MEMBERS_ID = T_MEMS_LOGIN.MEMBERS_ID
	AND T_MEMS.MEMBERS_ID = 'M-02'
    )
	INNER JOIN gender_code AS T_GENDERS
    ON T_MEMS.GENDER_CODE_ID = T_GENDERS.GENDER_CODE_ID
;




