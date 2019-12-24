-- select 사용
-- 문장 형식의 조회
-- 사원 테이블에서 사원 명, 사원 번호, 연봉을 아래와 같은 형식으로 조회하시오.
-- xxxx님 (사번) 연봉 xxxx 원 입니다.

-- alias 컬럼의 별명 : as를 생략 할 수 있다.
select ename||' 님(' || empno || ') ' || sal || '원 입니다.' output from emp;

-- alias는 주로 8자 이상의 컬럼명을 줄일 때, 뜻이 전달되도록 사용.
select ename en, mgr as manager, sal en
	from emp;

-- alias는 같은 레벨의 where절에서는 사용 할 수 없다.
select s
from (select empno, ename, sal s
	from emp e
	where s > 2000);

-- 테이블에 alias 부여 : join 시 주로 사용. as는 사용 불가
select empno, job, hiredate
from emp e;

-- 칼럼을 하나로 묶어 출력.
-- 대 소문자를 구분하여 " " 으로 alias 부여
select empno || ' - ' || ename || ' - '|| job as "Output"
from emp;

-- 연산자 : 산술연산자 (null은 연산되면 null이 나온다.)
-- +, -, *, %, mod(칼럼명, 나눌 수) : 나머지
-- 사원 번호, 사원 명, 연봉, 보너스, 총 수령액을 조회. 단, 총 수령액 = 연봉+보너스
select empno 사원번호, ename "사원 명", sal 연봉, comm 보너스, sal+nvl(comm, 0) "총 수령액"
	from emp;

-- 사원 번호, 사원 명, 연봉, 월급을 조회. 단, 월급은 연봉/12
select empno, ename, sal, trunc(sal/12, 2) moth_sal
	from emp;

-- 사원 번호, 사원 명, 연봉, 세금 조회
-- 단 세금 =
select empno, ename, sal, trunc((sal+nvl(comm, 0))*3.3/100, 2) tex
	from emp;

alter table student add birth_year number(4);

insert into student(num, name, age, phone, email, gender, addr, input_date, birth_year)
	values(1, '박찬우', 27, '010-1234-4321', 'test@test.com', 'M', '서울시', sysdate,  1990);

select * from student;

-- 나눈 나머지
/*
	0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10(말띠), 11
*/

select num, name, birth_year, mod(birth_year, 12)
	from student;

-- 산술, 문자열 붙임 연산자 이외의 연산자가 조회 컬럼에 나오면 Error
select ename, job, sal, sal>2000
	from emp;

-- whwre 절 : 특정 레코드만 검색할 때:
-- 관계연산자 : >, <, >=, <=, =, !=, (<>)

-- 사원테이블에서 10번 부서에 해당하는 사원들의 사원번호, 사원명, 직무, 매니저번호, 부서번호 조회
select empno, ename, job, mgr, deptno
	from emp
	where deptno = 10;

-- 사원테이블에서 연봉이 3000 미만인 사원의 사원번호, 사원명, 연봉, 입사일 조회
select empno, ename, sal, hiredate
	from emp
	where sal < 3000;

-- 위에서 3000천 이상
select empno, ename, sal, hiredate
	from emp
	where sal >= 3000;

-- 20번 부서가 아닌 사원들의
select empno, deptno, ename, sal, comm
	from emp
	where deptno <> 20;

-- 논리연산자: 여러개의 관계연산자를 묶어서 비교
-- and, or, not

-- 사원테이블에서 사원번호가 7488이면서 연봉이 3000인 사원의 사원번호, 사원명, 입사일, 연봉 조회
select empno, ename, hiredate, sal
	from emp
	where empno = 7788 and sal = 3000;

-- 사원테이블에서 7698, 7839, 7566 매니저가 관리하는 사원들의 매니저번호, 사원번호, 사원명, 직무 조회
select mgr, empno, ename, job
	from emp
	where mgr not in (7698, 7839, 7566);
--	where mgr = 7698 or mgr = 7839 or mgr = 7566;
-- or는 in으로 대체하여 사용할 수 있다.
-- not in 은 포함하지 않는것

-- 범위 : 사원테이블에서 연봉이 1000 이상 3000 미만인 사원들의 사원번호, 사원명, 연봉, 부서번호, 입사일 조회
-- 범위는 beween으로 대체 가능 (이상 이하)
select empno, ename, sal, deptno, hiredate
	from emp
	where sal between 1000 and 3000;

-- null 값 비교
-- 사원테이블에서 보너스가 없는 사원들의 사원명, 연봉, 보너스 조회
select ename, sal, comm
	from emp
	where comm is null;    
-- null은 관계연산자로 비교 불가. ( comm = null) 불가 

--