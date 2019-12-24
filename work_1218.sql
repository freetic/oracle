--숙제
--1. 사원 테이블에서 '10' 부서가 아니면서 연봉이 1000이상 3000이하의
--모든 사원들의  사원번호,사원명, 입사일,부서번호, 연봉을 조회하세요.
select empno, ename, hiredate, deptno, sal
	from emp
	where deptno != 10 and sal >= 1000 and sal <= 3000;

--2. 사원 테이블에서 보너스를 수령하는 사원들의  사원번호,사원명,
--    연봉,보너스, 총수령액, 월급을 조회 하세요.
--    - 월급은 연봉을 12개월로 나눠 계산하세요.
select empno, ename, sal, comm, sal+nvl(comm, 0) 총수령액, trunc(sal/12, 2)
	from emp;

--3.  사원 테이블에서 부서번호가 10,30인  사원들의 사원명, 사원번호
--    입사일, 연봉을 조회 하세요.
--    -단, 출력은  xxxx번 xxxx사원님 xxxx년에 입사하였고 연봉은 xxx$입니다.
--        의 형식으로 하고, 컬럼명은 OUTPUT 으로 설정할것.
select empno || '번 ' || ename || '사원님 ' || hiredate || '년에 입사하였고 연봉은 ' || sal || '$입니다.' OUTPUT
	from emp
	where deptno = 10 or deptno = 30;

--4. 사원 테이블에서 연봉이 3000 미만인 사원들의 사원번호, 사원명,
--   입사일, 연봉,직무, 부서번호를 조회 하세요.
select empno, ename, hiredate, sal, job, deptno
	from emp
	where sal < 3000;

--5. 아래의 데이터를 참조하여 test_like1 테이블을 생성하고
--    레코드를추가할것.
--    1, 기임저엉은,서울시 동작구 상도동,'정기고'
--    2, 정대만,서울시 동대문구 동대문1동,'썸타고'
--    3, 송태섭,서울시 동대문구 동대문2동,'정기고'
--    4, 박찬우,서울시 동작구 상도동,'오지고'
create table test_like1(
num number(4),
name varchar2(60),
addr varchar2(300),
school varchar2(60)
);
insert into test_like1 values(1, '기임저엉은', '서울시 동작구 상도동', '정기고');
insert into test_like1 values(2, '정대만', '서울시 동대문구 동대문1동', '썸타고');
insert into test_like1 values(3, '송태섭', '서울시 동대문구 동대문2동', '정기고');
insert into test_like1 values(4, '박찬우', '서울시 동작구 상도동', '오지고');
--6. test_like1 테이블에서 '서울시'에 거주하는 학생의  번호,학생명,
--    주소, 학교정보를 아래와  같은 형식으로 출력하고
--     컬럼명은 대소문자 구분하여 Output으로  할것.
--    출력형식 :  번호 : x, 이름 : xx, 주소 : xx, 학교 : xx
select '번호 : ' || num || ', 이름 : ' || name || ', 주소 : ' || addr || ', 학교 : ' || school "Output"
	from test_like1
	where addr like '%서울시%';
--7. 사원테이블에서 사원명이 4글자이거나 연봉이 2000이상인 사원의
--   사원번호, 사원명, 연봉, 입사일, 부서번호, 직무를 조회할것.
select empno, ename, sal, hiredate, deptno, job
	from emp
	where ename = '____' or sal >= 2000;

--8. 사원 테이블에서 사원번호, 사원명, 입사일, 연봉, 내년연봉을
--    조회 하세요.
--    내년 연봉은 현재 연봉보다 7% 향상된 금액으로 계산하여 출력할것.
select empno, ename, hiredate, sal, sal*1.07 next_sal
	from emp;

--9. 사원 테이블에서 사원명이 5글자이면서 세번째 글자에 'A'가 들어
--    간 사원의 사원명, 사원번호, 입사일, 연봉,  총 수령액, 세후수령액을 조회하세요.
--   단, 총 수령액은 연봉+보너스의 합산 금액이고, 세후수령액은 총 수령액에서
--    3.3%를 제외한 실수령액을 출력한다.
select empno, ename, hiredate, sal, sal+nvl(comm, 0) "총 수령액", (sal+nvl(comm, 0))*96.7/100 "세후 수령액"
	from emp
	where ename like '__A__';
--10. 사원 테이블에서 사원명이 'A'로 시작하면서 연봉이 1600이상인
--     사원의 사원명,연봉,직무, 매니저번호, 입사일을 조회 할것.
select ename, sal, job, mgr, hiredate
	from  emp
	where ename like 'A%' and sal >= 1600