-- 회원 정보;
DROP TABLE student cascade constraint;

-- 수강 신청;
DROP TABLE registration cascade constraint;

-- 강의 정보
DROP TABLE class cascade constraint;

-- 강사
DROP TABLE teacher cascade constraint;

-- 강의 소개
DROP TABLE introduction cascade constraint;

--강의 평가
DROP TABLE evaluation cascade constraint;

--문의 정보
DROP TABLE question cascade constraint;


DROP SEQUENCE registration_seq;


CREATE TABLE  student(
       student_id          	VARCHAR2(20)  PRIMARY KEY,
       student_name         	VARCHAR2(20) NOT NULL,
       student_pw               	VARCHAR2(20) NOT NULL
);


CREATE TABLE registration (
       class_code                		VARCHAR2(20) NOT NULL,
         class_name  	VARCHAR2(30) NOT NULL,
       student_id          			VARCHAR2(20) NOT NULL,
       teacher_name    	VARCHAR2(20) NOT NULL,
       start_day   VARCHAR2(20) NOT NULL,
       end_day 	  VARCHAR2(20) NOT NULL,
       result 	VARCHAR2(20) NOT NULL
);


CREATE TABLE class (
       class_code      	    	VARCHAR2(20) PRIMARY KEY,
		class_price			  	NUMBER(8) NOT NULL,
       class_name  	VARCHAR2(30) NOT NULL,
       class_time	  VARCHAR2(20) NOT NULL,
       teacher_name    	VARCHAR2(20) NOT NULL,
       start_day   VARCHAR2(20) NOT NULL,
       end_day    VARCHAR2(20) NOT NULL,
       simpmle_intro    VARCHAR2(3000) NOT NULL,
       detail_intro   VARCHAR2(3000) NOT NULL,
       max_student   number(2)
);

CREATE TABLE teacher(
	  teacher_id    		VARCHAR2(20) PRIMARY KEY,
	   teacher_name     VARCHAR2(20) NOT NULL,
	   teacher_pw 		VARCHAR2(20) NOT NULL
);


CREATE TABLE evaluation (
       class_code          	VARCHAR2(20) NOT NULL,
	  student_id    		VARCHAR2(20) NOT NULL,
	  evaluation_content 		VARCHAR2(3000) NOT NULL,
	  evaluation_day    		VARCHAR2(20) NOT NULL
);



CREATE TABLE question(
	  name    		VARCHAR2(20) NOT NULL,
	  email           VARCHAR2(20) NOT NULL,
	  content    		VARCHAR2(3000) NOT NULL
);



-- 백업 테이블 


-- 백업 테이블 
drop table backup_introduction cascade constraint;

drop table backup_class cascade constraint;

drop table backup_evaluation cascade constraint;

drop table backup_registration cascade constraint;

drop table backup_student cascade constraint;

drop table backup_teacher cascade constraint;

create table backup_introduction (
      class_code       VARCHAR2(20) NOT NULL,
     intro_video       VARCHAR2(1000) NOT NULL,
     intro_content    VARCHAR2(3000) NOT NULL,
     intro_day          VARCHAR2(20) NOT NULL
);

create table backup_class (
       class_code   VARCHAR2(20) PRIMARY KEY,
       class_price             NUMBER(8) NOT NULL,
       class_name     VARCHAR2(20) NOT NULL,
       class_time     VARCHAR2(20) NOT NULL,
       teacher_name       VARCHAR2(20) NOT NULL,
       start_day   VARCHAR2(20) NOT NULL,
       end_day    VARCHAR2(20) NOT NULL,
       simpmle_intro    VARCHAR2(3000) NOT NULL,
       detail_intro   VARCHAR2(3000) NOT NULL,
       max_student   number(2)
);

create table backup_evaluation (
      class_code             VARCHAR2(20) NOT NULL,
     student_id          VARCHAR2(20) NOT NULL,
     evaluation_content    VARCHAR2(3000) NOT NULL,
     evaluation_day       VARCHAR2(20) NOT NULL
);

create table backup_registration (
       class_code                		VARCHAR2(20) NOT NULL,
         class_name  	VARCHAR2(30) NOT NULL,
       student_id          			VARCHAR2(20) NOT NULL,
       teacher_name    	VARCHAR2(20) NOT NULL,
       start_day   VARCHAR2(20) NOT NULL,
       end_day 	  VARCHAR2(20) NOT NULL,
       result 	VARCHAR2(20) NOT NULL
);

create table backup_student (
       student_id         VARCHAR2(20)  PRIMARY KEY,
       student_pw         VARCHAR2(20) NOT NULL,
       phone_number       VARCHAR2(20) NOT NULL
);

create table backup_teacher (
      teacher_id       VARCHAR2(20) PRIMARY KEY,
      teacher_pw       VARCHAR2(20) NOT NULL,
      teacher_name     VARCHAR2(20) NOT NULL,
      teacher_intro    VARCHAR2(3000) NOT NULL
);


