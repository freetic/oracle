-- 1
select empno, ename, to_char(sal, '0,000,000') sal, nvl(comm, 100) comm, to_char(hiredate, 'mm-dd-yy-dy') hiredate
from (select rownum r,empno, ename, sal, comm, hiredate
from emp
order by empno desc)
where r between 3 and 5;
                   215 ~ 235
-- 2 emp - 미국, cp_emp3 - 한국
select case sal when dept = 10 then sum(sal) end deptn, EMPNO, ENAME, MGR, JOB, HIREDATE, SAL
	from cp_emp3
union
select EMPNO, ENAME, MGR, JOB, HIREDATE, SAL
	from emp;


-- 3
select count(job), max(sal), min(sal), sum(sal)
from (
select job, max(sal), min(sal), sum(sal)
from emp
union all
select job, max(sal), min(sal), sum(sal)
from cp_emp3)
group by job;
