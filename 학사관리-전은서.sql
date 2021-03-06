DROP DATABASE IF EXISTS 학사관리;
DROP USER IF EXISTS jeoneunseo@localhost;
CREATE DATABASE IF NOT EXISTS 학사관리;
CREATE USER jeoneunseo@localhost IDENTIFIED WITH mysql_native_password by 'qwer1234!';
GRANT ALL PRIVILEGES ON 학사관리.* TO jeoneunseo@localhost WITH GRANT OPTION;
SHOW DATABASES;

USE 학사관리;
SHOW TABLES;


-- -----------------------------------------
--                  정의
-- -----------------------------------------
CREATE TABLE 학과(
	학과번호 VARCHAR(10) NOT NULL,
    학과명 VARCHAR(20) NOT NULL,
    학과전화번호 VARCHAR(14) NOT NULL,
    PRIMARY KEY(학과번호)
);
DESC 학과;

CREATE TABLE 학생(
	학생번호 VARCHAR(10) NOT NULL,
    학생이름 VARCHAR(10) NOT NULL,
    학생주민번호 VARCHAR(14) NOT NULL UNIQUE,
    학생주소 VARCHAR(50) NOT NULL,
    학생전화번호 VARCHAR(13) NOT NULL,
    학생이메일 VARCHAR(30) NOT NULL,
    소속학과번호 VARCHAR(10) NOT NULL,
    PRIMARY KEY(학생번호),
	FOREIGN KEY(소속학과번호) REFERENCES 학과(학과번호) 
);
DESC 학생;

CREATE TABLE 교수(
	교수번호 VARCHAR(10) NOT NULL,
    교수이름 VARCHAR(10) NOT NULL,
    교수주민번호 VARCHAR(14) NOT NULL UNIQUE,
    교수주소 VARCHAR(50) NOT NULL,
    교수전화번호 VARCHAR(13) NOT NULL,
    교수이메일 VARCHAR(30) NOT NULL,
    소속학과번호 VARCHAR(10) NOT NULL,
    PRIMARY KEY(교수번호),
    FOREIGN KEY(소속학과번호) REFERENCES 학과(학과번호) 
);
DESC 교수;

CREATE TABLE 강좌(
	강좌번호 VARCHAR(10) NOT NULL,
    교수번호 VARCHAR(20) NOT NULL,
    강좌명 VARCHAR(20),
    취득학점 INT,
    강의시간 INT,
    강의실정보 VARCHAR(50),
    학과전화번호 VARCHAR(14) NOT NULL,
    PRIMARY KEY(강좌번호),
	FOREIGN KEY(교수번호) REFERENCES 교수(교수번호) 
);
DESC 강좌;

CREATE TABLE 수강내역(
	출석점수 INT NOT NULL,
	중간고사점수 INT NOT NULL,
	기말고수점수 INT NOT NULL,
	기타점수 INT NOT NULL,
	총점 INT NOT NULL,
	평점 VARCHAR(2) NOT NULL,
    학생번호 VARCHAR(10) NOT NULL,
	교수번호 VARCHAR(10) NOT NULL,
    강좌번호 VARCHAR(10) NOT NULL,
    PRIMARY KEY(출석점수),
    FOREIGN KEY(학생번호) REFERENCES 학생(학생번호),
	FOREIGN KEY(강좌번호) REFERENCES 강좌(강좌번호),
	FOREIGN KEY(교수번호) REFERENCES 교수(교수번호)
);
DESC 수강내역;

CREATE TABLE 담당(
	학생번호 VARCHAR(10) NOT NULL,
    교수번호 VARCHAR(10) NOT NULL,
    학년학기 VARCHAR(10) NOT NULL,
	PRIMARY KEY(학생번호),    
    FOREIGN KEY(학생번호) REFERENCES 학생(학생번호),
	FOREIGN KEY(교수번호) REFERENCES 교수(교수번호)
);
DESC 담당;




-- 	학과번호 VARCHAR(10) NOT NULL,
--  학과명 VARCHAR(20) NOT NULL,
--  학과전화번호 VARCHAR(14) NOT NULL,
INSERT INTO 학과 VALUES('11111111','컴퓨터학과','032-111-1111');
INSERT INTO 학과 VALUES('22222222','비서과','032-222-2222');
INSERT INTO 학과 VALUES('33333333','경찰행정과','032-333-3323');
INSERT INTO 학과 VALUES('44444444','시각디자인과','032-444-4444');
INSERT INTO 학과 VALUES('55555555','경영학과','032-555-5555');
SELECT * FROM 학과;


-- 	학생번호 VARCHAR(10) NOT NULL,
--  학생이름 VARCHAR(10) NOT NULL,
--  학생주민번호 VARCHAR(14) NOT NULL UNIQUE,
--  학생주소 VARCHAR(50) NOT NULL,
--  학생전화번호 VARCHAR(13) NOT NULL,
--  학생이메일 VARCHAR(30) NOT NULL,
--  소속학과번호 VARCHAR(10) NOT NULL,
INSERT INTO 학생 VALUES('15154848','홍길동','121212-1212121','인천','010-1111-1111','aaa111@naver.com','11111111');
INSERT INTO 학생 VALUES('14549862','이몽룡','131313-1313131','서울','010-2222-2222','aaa112@naver.com','33333333');
INSERT INTO 학생 VALUES('18548160','성춘향','141414-1414141','경기','010-3333-3333','aaa113@naver.com','22222222');
INSERT INTO 학생 VALUES('15649421','월매','151515-1515151','부산','010-4444-4444','aaa114@naver.com','11111111');
INSERT INTO 학생 VALUES('11616611','변사또','161616-1616161','광주','010-5555-5555','aaa115@naver.com','33333333');
SELECT * FROM 학생;


-- 	교수번호 VARCHAR(10) NOT NULL,
--  교수이름 VARCHAR(10) NOT NULL,
--  교수주민번호 VARCHAR(14) NOT NULL UNIQUE,
--  교수주소 VARCHAR(50) NOT NULL,
--  교수전화번호 VARCHAR(13) NOT NULL,
--  교수이메일 VARCHAR(30) NOT NULL,
--  소속학과번호 VARCHAR(10) NOT NULL,
INSERT INTO 교수 VALUES('101','가교수','202020-2020202','인천','010-6666-6666','aaa111@naver.com','11111111');
INSERT INTO 교수 VALUES('102','나교수','212121-2121212','서울','010-7777-7777','aaa212@naver.com','22222222');
INSERT INTO 교수 VALUES('103','다교수','222222-2222222','경기','010-8888-8888','aaa311@naver.com','33333333');
INSERT INTO 교수 VALUES('104','라교수','232323-2323232','전북','010-9999-9999','aaa412@naver.com','44444444');
INSERT INTO 교수 VALUES('105','마교수','242424-2424242','충남','010-0000-0000','aaa512@naver.com','55555555');
SELECT * FROM 교수;


-- 	강좌번호 VARCHAR(10) NOT NULL,
--  교수번호 VARCHAR(20) NOT NULL,
--  강좌명 VARCHAR(20),
--  취득학점 INT,
--  강의시간 INT,
--  강의실정보 VARCHAR(50),
--  학과전화번호 VARCHAR(14) NOT NULL,
INSERT INTO 강좌 VALUES('301','101','컴공강좌',1,1,'1호실','032-666-6666');
INSERT INTO 강좌 VALUES('302','102','비서강좌',2,2,'2호실','032-777-7777');
INSERT INTO 강좌 VALUES('303','103','경찰행정강좌',3,3,'3호실','032-888-8888');
INSERT INTO 강좌 VALUES('304','104','시각디자인강좌',4,4,'4호실','032-999-9999');
INSERT INTO 강좌 VALUES('305','101','경영강좌',5,5,'5호실','032-000-0000');
SELECT * FROM 강좌;


-- 	출석점수 INT NOT NULL,
-- 	중간고사점수 INT NOT NULL,
-- 	기말고수점수 INT NOT NULL,
-- 	기타점수 INT NOT NULL,
-- 	총점 INT NOT NULL,
-- 	평점 VARCHAR(2) NOT NULL,
--  학생번호 VARCHAR(10) NOT NULL,
-- 	교수번호 VARCHAR(10) NOT NULL,
--  강좌번호 VARCHAR(10) NOT NULL,
INSERT INTO 수강내역 VALUES(1,1,1,1,1,'1점','15154848','101','301');
INSERT INTO 수강내역 VALUES(2,2,2,2,2,'2점','14549862','102','302');
INSERT INTO 수강내역 VALUES(3,3,3,3,3,'3점','18548160','103','303');
INSERT INTO 수강내역 VALUES(4,4,4,4,4,'4점','15649421','104','304');
INSERT INTO 수강내역 VALUES(5,5,5,5,5,'5점','11616611','105','305');
SELECT * FROM 수강내역;

-- 	학생번호 VARCHAR(10) NOT NULL,
--  교수번호 VARCHAR(10) NOT NULL,
--  학년학기 VARCHAR(10) NOT NULL,
INSERT INTO 담당 VALUES('15154848','101','1/1');
INSERT INTO 담당 VALUES('14549862','101','2/2');
INSERT INTO 담당 VALUES('18548160','103','3/1');
INSERT INTO 담당 VALUES('15649421','104','4/2');
INSERT INTO 담당 VALUES('11616611','104','1/2');
SELECT * FROM 담당;



-- 교수별 담당학생 명단을 출력하시오
-- SELET 교수번호, 교수이름 , 학생번호, 학생이름
-- FROM 교수 JOIN 학생 ON 교수.학과번호 = 학생.학과번호;


-- 학과명이 '컴퓨터학과'인 자료의 학과번호와 학과명을 각각'0111','컴퓨터공학과'로 변경하시오.
-- UPDATE 학과
-- SET 학과.학과번호 = '0111', 학과.학과명 = '컴퓨터공학과' 
-- WHERE 학과.학과명 = '컴퓨터학과';
-- SELECT * FROM 학과;
