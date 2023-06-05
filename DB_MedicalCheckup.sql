
CREATE TABLE BLOOD_GLUCOSE
(
  BLOOD_GLUCOSE      INTEGER NOT NULL COMMENT '혈당',
  BLOOD_GLUCOSE_CODE INTEGER NOT NULL COMMENT '혈당_CODE',
  PRIMARY KEY (BLOOD_GLUCOSE_CODE)
) COMMENT '혈당';

CREATE TABLE BLOODPRESSURE
(
  BLOODPRESSURE_CODE INTEGER NOT NULL COMMENT '혈압_CODE',
  BLOODPRESSURE      INTEGER NOT NULL COMMENT '혈압',
  PRIMARY KEY (BLOODPRESSURE_CODE)
) COMMENT '혈압';

CREATE TABLE BLOODPRESSURE_GLUCOSE
(
  BLOODPRESSURE_GLUCOSE_ID INTEGER NOT NULL COMMENT '혈압_혈당_ID',
  BLOOD_PRESSURE_CODE      INTEGER NOT NULL COMMENT '혈압_CODE',
  BLOOD_GLUCOSE_CODE       INTEGER NOT NULL COMMENT '혈당_CODE',
  PRIMARY KEY (BLOODPRESSURE_GLUCOSE_ID)
) COMMENT '혈압_혈당';

CREATE TABLE GENDER
(
  GENDER_ID VARCHAR(50) NOT NULL COMMENT '성별_ID',
  GENDER    VARCHAR(50) NOT NULL COMMENT '성별',
  PRIMARY KEY (GENDER_ID)
) COMMENT '성별';

CREATE TABLE MEDICAL_CHECKUP
(
  NAME                     VARCHAR(50) NOT NULL COMMENT '이름',
  MAINTAIN                 VARCHAR(50) NOT NULL COMMENT '유지방향',
  MECICAL_CHECKUP_ID       VARCHAR(50) NOT NULL COMMENT 'UNIQUE_KEY',
  GENDER_ID                VARCHAR(50) NOT NULL COMMENT '성별_ID',
  MEDICALCHECKUP_RESULT_ID VARCHAR(50) NOT NULL COMMENT '검진결과_ID',
  RECHECKARTICLE_ID        VARCHAR(50) NOT NULL COMMENT '재검진항목_ID',
  YEAR_ID                  INTEGER     NOT NULL COMMENT '나이_ID',
  BLOODPRESSURE_GLUCOSE_ID INTEGER     NOT NULL COMMENT '혈압혈당_ID',
  TALL_WEIGHT_ID           INTEGER     NOT NULL COMMENT '키체중_ID',
  PRIMARY KEY (MECICAL_CHECKUP_ID)
) COMMENT '건강검진';

CREATE TABLE RECHECKARTICLE
(
  RECHECKARTICLE    VARCHAR(50) NOT NULL COMMENT '재검진항목',
  RECHECKARTICLE_ID VARCHAR(50) NOT NULL COMMENT '재검진항목_ID',
  PRIMARY KEY (RECHECKARTICLE_ID)
) COMMENT '재검진항목';

CREATE TABLE RESULT
(
  MEDICALCHECKUP_RESULT    VARCHAR(50) NOT NULL COMMENT '검진결과',
  MEDICALCHECKUP_RESULT_ID VARCHAR(50) NOT NULL COMMENT '검진결과_ID',
  PRIMARY KEY (MEDICALCHECKUP_RESULT_ID)
) COMMENT '건강검진 결과';

CREATE TABLE TALL
(
  TALL           INTEGER NOT NULL COMMENT '키',
  TALL_CODE      INTEGER NOT NULL COMMENT '키_CODE',
  TALL_WEIGHT_ID INTEGER NOT NULL COMMENT '키체중_ID',
  PRIMARY KEY (TALL_CODE)
) COMMENT '키';

CREATE TABLE TALL_WEIGHT
(
  TALL_WEIGHT_ID INTEGER NOT NULL COMMENT '키체중_ID',
  TALL_WEIGHT    INTEGER NOT NULL COMMENT '키체중',
  PRIMARY KEY (TALL_WEIGHT_ID)
) COMMENT '키_체중';

CREATE TABLE WEIGHT
(
  WEIGHT         INTEGER NOT NULL COMMENT '체중',
  WEIGHT_CODE    INTEGER NOT NULL COMMENT '제충_CODE',
  TALL_WEIGHT_ID INTEGER NOT NULL COMMENT '키체중_ID'
) COMMENT '체중';

CREATE TABLE YEAR
(
  YEAR    INTEGER NOT NULL COMMENT '나이',
  YEAR_ID INTEGER NOT NULL COMMENT '나이_ID',
  PRIMARY KEY (YEAR_ID)
) COMMENT '나이';

ALTER TABLE MEDICAL_CHECKUP
  ADD CONSTRAINT FK_GENDER_TO_MEDICAL_CHECKUP
    FOREIGN KEY (GENDER_ID)
    REFERENCES GENDER (GENDER_ID);

ALTER TABLE MEDICAL_CHECKUP
  ADD CONSTRAINT FK_RESULT_TO_MEDICAL_CHECKUP
    FOREIGN KEY (MEDICALCHECKUP_RESULT_ID)
    REFERENCES RESULT (MEDICALCHECKUP_RESULT_ID);

ALTER TABLE MEDICAL_CHECKUP
  ADD CONSTRAINT FK_RECHECKARTICLE_TO_MEDICAL_CHECKUP
    FOREIGN KEY (RECHECKARTICLE_ID)
    REFERENCES RECHECKARTICLE (RECHECKARTICLE_ID);

ALTER TABLE MEDICAL_CHECKUP
  ADD CONSTRAINT FK_YEAR_TO_MEDICAL_CHECKUP
    FOREIGN KEY (YEAR_ID)
    REFERENCES YEAR (YEAR_ID);

ALTER TABLE BLOODPRESSURE_GLUCOSE
  ADD CONSTRAINT FK_BLOODPRESSURE_TO_BLOODPRESSURE_GLUCOSE
    FOREIGN KEY (BLOOD_PRESSURE_CODE)
    REFERENCES BLOODPRESSURE (BLOODPRESSURE_CODE);

ALTER TABLE BLOODPRESSURE_GLUCOSE
  ADD CONSTRAINT FK_BLOOD_GLUCOSE_TO_BLOODPRESSURE_GLUCOSE
    FOREIGN KEY (BLOOD_GLUCOSE_CODE)
    REFERENCES BLOOD_GLUCOSE (BLOOD_GLUCOSE_CODE);

ALTER TABLE MEDICAL_CHECKUP
  ADD CONSTRAINT FK_BLOODPRESSURE_GLUCOSE_TO_MEDICAL_CHECKUP
    FOREIGN KEY (BLOODPRESSURE_GLUCOSE_ID)
    REFERENCES BLOODPRESSURE_GLUCOSE (BLOODPRESSURE_GLUCOSE_ID);

ALTER TABLE MEDICAL_CHECKUP
  ADD CONSTRAINT FK_TALL_WEIGHT_TO_MEDICAL_CHECKUP
    FOREIGN KEY (TALL_WEIGHT_ID)
    REFERENCES TALL_WEIGHT (TALL_WEIGHT_ID);

ALTER TABLE TALL
  ADD CONSTRAINT FK_TALL_WEIGHT_TO_TALL
    FOREIGN KEY (TALL_WEIGHT_ID)
    REFERENCES TALL_WEIGHT (TALL_WEIGHT_ID);

ALTER TABLE WEIGHT
  ADD CONSTRAINT FK_TALL_WEIGHT_TO_WEIGHT
    FOREIGN KEY (TALL_WEIGHT_ID)
    REFERENCES TALL_WEIGHT (TALL_WEIGHT_ID);
