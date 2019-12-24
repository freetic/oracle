--1. 아래의 제약사항을 설정하는  test_constraint 테이블을 생성한다.
--   컬럼명 :  부서번호,사원번호, 사원명, 성별, 입사일, 이메일,주소,전화번호, 비고
--  - 부서번호 : dept테이블의 deptno에 해당하는 레코드만 입력할 수 있다.
--  - 사원번호 : 숫자 4자리이며 null을 허용하지 않고 유일한 값만 입력할 수 있다.
--  - 성별  :  문자 1자리 이며 'M'또는  'F'만 입력가능하다.
--  - 입사일 : 날짜 이며 insert에 입사일 컬럼이 생략되면 현재 날짜가 추가된다.
--  - 이메일 : 영문자 50 자이며 입력되는 이메일은 '@'이나 '.'이 반드시 포함되어야한다.
--  - 주소 : 한글인 경우 150자이며, 반드시 입력되어야 수 있다.
--  - 전화번호 : 문자열 13자리이며 없을 수도 있지만 있다면 유일해야 한다.
--  - 비고 : 영어 기준 2000자 까지 입력 가능하며 , insert에 비고 컬럼이 생략되면
--              '없음'을 기본 설정한다.
create table test_constraint(
	deptno	number(2) constraint fk_test_constraint_deptno references dept(deptno),
	empno		number(4) constraint pk_test_constraint primary key,
	ename		varchar2(10),
	gender	char(1) check(gender = 'M' or gender = 'F'),
	hiredate	date default sysdate,
	email			varchar2(100) check(email like '%@%' or email like '%.%'),
	addr			varchar2(450) not null,
	phone			varchar2(13) constraint uk_test_constraint_phone unique,
	descr			varchar2(4000) default '없음'
);

--2. 모든 제약사항에 대해 성공하는 경우와 실패하는 경우의 쿼리를 작성한다.
-- foreign key
insert into test_constraint(deptno, empno, addr) values(40, 1, '안산');
insert into test_constraint(deptno, empno, addr) values(50, 1, '안산');
-- primary key
insert into test_constraint(deptno, empno, addr) values(40, 2, '안산');
insert into test_constraint(deptno, addr) values(40, '안산');
-- check
insert into test_constraint(deptno, empno, addr, gender) values(40, 3, '안산', 'F');
insert into test_constraint(deptno, empno, addr, gender) values(40, 4, '안산', 's');
insert into test_constraint(deptno, empno, addr, email) values(40, 7, '안산', 'abc@test.com');
insert into test_constraint(deptno, empno, addr, email) values(40, 8, '안산', 'abcdefg');
-- unique
insert into test_constraint(deptno, empno, addr, gender, phone) values(40, 4, '안산', 'F', '010-000-0000');
insert into test_constraint(deptno, empno, addr, gender, phone) values(40, 5, '안산', 'M', '010-000-0000');

select * from test_constraint;
