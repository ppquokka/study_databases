/*  23.06.13.(화) 

*/

SELECT T_FAC.COMPANY, T_CAR_INFOR.CAR_NAME, COUNT(*) AS CNT
FROM (factorys AS T_FAC
     INNER JOIN car_infors AS T_CAR_INFOR
     ON T_FAC.COMPANY_ID = T_CAR_INFOR.COMPANY_ID)    -- 2 테이블 연결시킴. JOIN을 한 괄호 자체가 TABLE
                                                     -- SELECT에 JOIN 된 상태 표시
     INNER JOIN `options` AS T_OPTS
     ON T_CAR_INFOR.CAR_INFOR_ID = T_OPTS.CAR_INFOR_ID  -- 셀렉트 갯수가 옵션 갯수만큼 커짐
GROUP BY T_FAC.COMPANY_ID, T_CAR_INFOR.CAR_INFOR_ID   /* 이 두가지는 문자형식. 컴퓨터는 숫자형식을 좋아하므로 그룹바이에서는 PRIMARY KEY를 한다. 이름은 바뀔 수 있지만, PK는 바뀌지않는다 */
;


-- OPTIONS는 명령어라 명령어로 인식되므로, 테이블 또는 컬럼으로 인식시키려면 ``를 넣어주면 됨 
INSERT INTO `options`    
(OPTION_ID, CAR_INFOR_ID, OPTION_INFOR_ID)
VALUES
('O006', 'CI001', 'OI005')
INSERT INTO `options`       
(OPTION_ID, CAR_INFOR_ID, OPTION_INFOR_ID)
VALUES
('O008', 'CI001', 'OI003')
INSERT INTO `options`       
(OPTION_ID, CAR_INFOR_ID, OPTION_INFOR_ID)
VALUES
('O007', 'CI002', 'OI004')
/*옵션 추가 시 해쉬맵 만들 때 차 회사 ID, 옵션번호, 인포메이션 KEY값  새로 생성되야 INSERT
좌우 2개는 가져오는데, 가운데는 PK다. 그래서 얘는 프로그램에서 다시 새롭게 만들어줘야 함
INSERT 전에 (방법 1)SELECT해서 중복되는 RECORD 값이 있는지 확인해야 함. 중복되면 안됨. 
(방법 2)해당 키로 RECORD를 DELETE하고 다시 INSERT 넣어줌 
DELTE는 사용하는게 좋지 않음
*/
;

DELETE FROM `OPTIONS`
WHERE  CAR_INFOR_ID = 'CI001' AND OPTION_INFOR_ID = 'OI003'
;
SELECT T_FAC.COMPANY, T_CAR_INFOR.CAR_NAME
     , T_CAR_INFOR.CAR_INFOR_ID              -- 옵션 가져올때 사용
FROM (factorys AS T_FAC
     INNER JOIN car_infors AS T_CAR_INFOR
     ON T_FAC.COMPANY_ID = T_CAR_INFOR.COMPANY_ID)    -- 그룹 바이 해도 되지만, 안해도 문제가 없는 구조라서 안함
												      -- 애매하면 그룹바이 하면 됨 
;                                                      -- EIDT 창 새로 열어서 옵션과 옵션정보를 JOIN시키기

SELECT OPTION_INFOR_ID, OPTON_NAME        
FROM option_infors
/*옵션 추가 시 해쉬맵 만들때 넣음*/
;     

SELECT T_OPT_INFO.OPTION_NAME
FROM OPTION_INFORS AS T_OPT_INFO
     INNER JOIN `options` AS T_OPTS
     ON T_OPT_INFO.OPTION_INFOR_ID = T_OPTS.OPTION_INFOR_ID  -- OPTION_NAME을 가져오려고 하기 때문에 SELECT에 넣기
     AND T_OPTS.CAR_INFOR_ID = 'CI001'   -- JOIN 된 후 거는거라서 WHERE가 아닌 ON 조건 안에서 걸어줘야 한다 
;

/*
SELECT COUNT(*)
FROM `OPTIONS`
WHERE T_OPTS.CAR_INFOR_ID = 'CI001'
;
*/     
     
     
     