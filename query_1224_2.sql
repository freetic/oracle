--------------- check, not null, default ------------
-- 이름, 나이, 성별, 주소, 입력일을 저장하는 테이블 생성. 이름은 반드시 입력 받아야 하며, 나이는
-- 20대~30대 까지만 입력 가능, 주소는 없을 수 있다. 입력일은 생략되면 추가 시점의 날짜 정보로 추가
create table other_constraints(
	name		varchar2(15) not null,
	age			number(3) check( age between 20 and 39),
	addr    varchar2(300) null,
	input_date date default sysdate
);

select * from user_constraints;
select * from user_tab_cols where table_name='OTHER_CONSTRAINTS';

-- 성공
-- 이름이 입력되고, 나이가 20~30대 사이면 된다.
insert into other_constraints(name, age, addr, input_date)
	values('이선문', 27, '서울시 동작구', sysdate);
--	주소가 없는 경우:
insert into other_constraints(name, age, addr, input_date)
	values('이선문', 27, '', sysdate);
-- 입력일이 없는 경우 : default에 의해 현재 날짜가 추가
insert into other_constraints(name, age, addr)
	values('이선문', 27, '서울시 동작구');
-- Error
-- not null 조건 : 이름에 null이 입력되면
insert into other_constraints(name, age, addr, input_date)
	values('', 30, '지구', sysdate);

-- check조건 : 나이가 20~39가 아닐때
insert into other_constraints(name, age, addr, input_date)
	values('박찬우', 19, '서울시 동작구', sysdate);

select * from other_constraints;

-------------------------------- join --------------------------
---------------------- inner join
-- 사원이 존재하는 모든 부서에 부서번호, 부서명, 위치, 사원번호, 사원명, 연봉, 입사일, 직무 조회
--ANSI
select d.deptno, d.dname, d.loc, e.empno, e.ename, e.sal, e.hiredate, e.job
from emp e
inner join dept d
on e.deptno=d.deptno;

-- Oracle inner join

