select dname, loc from DEPT;
select * from EMP;
select * from STUDENT;

select ename, job
from (select empno, ename, job, sal from emp);
