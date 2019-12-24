-------------------- select subquery ------------------
-- 단수행 : where절, scalar subquery
-- 사원테이블에서 부서의 위치가 'DALLAS' 인 부서에 근무하는 사원의
-- 사원번호, 사원명, 부서번호, 연봉, 입사일 조회

select empno, ename, deptno, sal, hiredate
	from emp
	where deptno = (select deptno from dept where loc = 'DALLAS');

-- 집계함수는 where절에서 직접 사용 할 수 없다.
-- subquery를 사용하면 가능하다.
-- 사원테이블에서 가장 연봉을 많이 받는 사원의 사원번호, 사원명, 연봉, 입사일을 조회
select empno, ename, sal, hiredate
	from emp
	where sal = (select max(sal) from emp);

-- scalar subquery : 조회 컬럼에 서브쿼리 정의
-- 사원번호, 사원명, 부서벉호, 위치, 부서명 조회
select empno, ename, deptno, (select loc from dept where emp.deptno = dept.deptno) loc,
			(select dname from dept where dept.deptno = emp.deptno) dname
from emp;

-- cp_emp3 테이블에 아래와 같은 레코드 추가
-- 사원번호 : 가장 큰 번호 다음 번호로 추가, 사원명 :  왕건모, 매니저 : 1234, job : 대리,
-- 입사일: 오늘, 연봉: emp테이블에서 사원번호가 7499인 사원의 연봉과 동일한 연봉으로 추가
create table cp_emp3 as (select empno, ename, mgr, job, hiredate, sal from emp);

insert into cp_emp3 values((select empno from cp_emp3 where empno = (select max(empno) from cp_emp3))+1,
	'왕건모', 1234, '대리', sysdate, (select sal from cp_emp3 where sal = (select sal from cp_emp3 where empno = 7499)));
select * from cp_emp3;
delete from cp_emp3 where mgr = 1234;
commit;

-- inline(조회 된 결과)을 사용해 다시 inline view 조회
-- inline : 많은 양의 레코드에서 일정부분의 레코드를 검색할때 사용.
-- 사원테이블에서 (14건 레코드) 가장 마지막에 입사한 사원부터 10명 전까지 입사한 사원의
-- 사원번호, 사원명, 입사일, 부서번호, 연봉조회

-- * 안쪽 쿼리가 실행될 떄 alias를 가지면 inline view가 alias명으로 생성되기 때문에
-- 바깥 쿼리에서는 alias로만 해당 컬럼에 접근 할 수 있따.

-- rownum은 select마다 생성되고 사용된다.

-- alias는 where절에서 사용 할 수 없으므로 alias를 실제 컬럼으로 인식시켜 where절에서 1번 이외의
-- 번호를 조회 할 수 있게 만듦.
select rnum,  empno, ename, hiredate, deptno, sal
from(
select rownum rnum,  empno, ename, hiredate, deptno, sal -- 가장 마지막 입사한 사원에게 1번 부여
from (select empno, ename, hiredate, deptno, sal  -- 가장 마지막에 입사한 사원을 가장 위로 정렬
	from emp
	order by hiredate desc)
	where  rownum <= 10)
	where rnum between 2 and 10;
	--	where hiredate = (select hiredate from emp where rownum between 1 and 10 order by hiredate);

select *
from (select row_number() over (order by hiredate desc) r, empno, ename, hiredate, deptno, sal
from emp)
where r between 2 and 10;

-- subquery로 조회된 결과가 존재 할 때 외부 쿼리를 수행
-- 1980년도에 입사한 사원이 존재하는 경우 모든 사원의 사원번호, 사원명, 입사일, 연봉 조회
select empno, ename, hiredate, sal
from emp
where exists(select * from emp where to_char(hiredate, 'yyyy') = 1980);


-------------------------- union ----------------------------
--
select from emp;
insert into cp_emp3 (select empno, ename, mgr, job, hiredate, sal from emp where deptno = 10);
select * from cp_emp3;
-- emp - 미국지사, cp_emp3 - 한국 본사
-- 한국 본사의 사원번호, 사원명, 직무, 입사일, 연봉과 미국 지사에 근무하는
-- 사원의 사원번호, 사원명, 직무, 입사일, 연봉을 조회하시오.
select empno, ename, job, hiredate, sal from emp
union
select empno, ename, job, hiredate, sal from cp_emp3;


-- 칼럼명은 달라도 된다.
select empno, ename, job, hiredate, sal from emp
union
select empno, job, ename, sysdate, sal from cp_emp3;

select * from user_constraints;
