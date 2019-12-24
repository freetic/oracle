/*
학생 정보를 저장하는 테이블 생성
번호, 이름, 나이, 전화번호, 이메일, 성별, 주소, 입력일
*/

create table student(
	num number(2) primary key,
	name varchar(15),
	age number(3),
	phone varchar2(13),
	email varchar2(50),
	gender char(1),
	addr varchar2(300),
	input_date date
);
/*
-- 접속계정이 가진 모든 테이블 확인
select tname from tab;

-- 특정 테이블의 구조확인
desc student;
*/