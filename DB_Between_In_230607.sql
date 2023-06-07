-- SELECT 문 
-- FROM TABLE_NAME
-- WHERE CONDITION
-- ORDER BY COIUMN 1, COIUMN 1, ... ASC|DESC;

-- 
SELECT*
FROM members
WHERE AGE IN (32, 28)
ORDER BY ADDRESS_CODE_ID DESC;

SELECT *
FROM members
WHERE AGE BETWEEN 25 AND 35     -- 해당 범위 값만 나옴(현재는 전체 포함시킴)
-- ORDER BY AGE;                -- 나이 어린 순서로 배열  컴럼을 기준으로 컬럼값이 점점 커지는 것을 'ASSENDING'
-- ORDER BY AGE DESC;              -- 'DESCENDING'은 컬럼밗이 큰 수서대로 배열
ORDER BY GENDER_CODE_ID, AGE DESC;   -- GENDER 부분이 겹침. 남성의 나이가 가장 많은 사람 보고싶음. 
								     -- 젠더 먼저 묶음으로 정렬. 이후 그 묶음 내부에서 다시 AGE로 DESC함.
                                     -- 빅데이터에서 구문별로 만든 후, 화면에서 연도순, 총합 수 등등 ORDER BY로  ASSENDING하면
                                     -- 굳이 추가적인 무언가를 하지 않아도 차트에서 바로 정렬됨. 차트에서 해 놓는게 좋다. 
                                     -- 쿼리문에서 사용하면 좋다  
