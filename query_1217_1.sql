-- student 테이블에 레코드 추가
-- 칼럼명을 생략하고 추가(칼럼의 순서대로 값을 나열해야 한다.)
/*
insert into student values(1, '박찬우', 27, '010-0000-0000', 'park@test.com','m', '서울시', sysdate);
insert into student(num, name, age, gender, email, phone, addr, input_date) values(2, '김김김', '10', 'f', 'cc@test.com', '111-1111', '경기도', sysdate);
insert into student(num, name, age) values(3, '나나나', 11);
insert into student values(4, '왕건모', 24, '010-1234-5678', 'test@test.com', 'm', '서울시 강남구 역삼동', sysdate);
insert into student(num, name, gender, age, phone, addr, email, input_date) values(5, '박찬우', 'm', 27, '123-123-123', '서울시 강남구 역삼동', 'park@test.com', sysdate);

-- 컬럼명을 생략하여 추가: 정의하지 않은 컬럼에는 null이 입력된다.
insert into student(name, num, phone) values('테스트', 6, '013-13-13');

-- 간단한 조회
-- 학생테이블에서 학생명, 번호, 이메일 조회
select name, num, email from student;


-- 사원 테이블에서 모든 사원의 사원번호, 사원명, 연봉, 입사일 조회
select empno, ename, sal, hiredate from emp;


-- 부서 테이블에서 모든 부서의 모든 컬럼을 조회
select * from dept;


-- 이름이 27세 이면서 나이가 박찬우인 사람의 번호를 30번으로 변경
update student
set num = 30
where name = '박찬우' and age = 27;
*/

insert into student(num, name, age, phone, addr, email, input_date) values(1, '박찬우', 27, '010-0000-0000', '서울시', 'park@test.com', sysdate);
insert into student values(4, '왕건모', 24, '010-1234-5678', 'test@test.com', 'm', '서울시 강남구 역삼동', sysdate);


-- 출력되는 칼럼의 크기 조절
column num format 999
col name format a6


select * from student;