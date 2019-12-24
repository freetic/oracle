--1. 사원테이블에서 3,4분기에 입사한 사원들의 사원번호,사원명,입사일,연봉을 조회하세요.
----단, 입사일은 월-일-년 분기의 형식으로 출력하고 연봉은 총 7자리로 맞춰 3자리 마다,를 넣어 출력할것.

select empno, ename, hiredate, sal
	from emp
	where to_char(hiredate, 'q') = '3' or to_char(hiredate, 'q') = '4';

--2.사원테이블에서 부서번호, 사원번호, 연봉,보너스,총수령액, 입사일을 조회하세요.
--   단. 총수령액은 '연봉+월급+보너스'를 합산한 금액으로
--   조회하세요.  월급은 연봉을 12로 나눈 값으로 계산하세요.

select deptno, empno, sal, comm, trunc(sal+nvl(comm, 0)+sal/12, 2) bouse, hiredate
from emp;

--3. 사원 테이블에서 부서번호,부서명,연봉, 보너스, 인센티브를
--   조회하세요.
--   인센티브는  아래표와 같이 부서별로 차등 지급합니다.
--   10- 월급에 100%, 20- 월급에 150%, 30 - 월급에 300%
--   그외 월급에 50%

select deptno, decode(deptno, 10, '개발부', 20, '회계부', 30, '비서부', 'no!') 부서명, sal, comm, decode(deptno, 10, trunc(sal/12, 2), 20, trunc(sal/12*1.5, 2), 30, trunc(sal/4), sal/24) incentive
from emp;

--4. student 테이블에서 번호, 이름 , 주민번호,
--   성별을 조회 하세요.
--   성별은 주민번호의   8번째 자리로 구하고,
--   8번째 자리가 1,3이면 '남자', 2,4면 '여자' 5,6,7,8이면 '외국인'그렇지
--   않으면 "오류" 로 출력한다.

select num, name, ssn, decode(to_number(substr(ssn, 8, 1)), 1, '남자', 2, '여자', 3, '남자', 4, '여자', 5, '외국인', 6, '외국인', 7, '외국인', 8, '외국인', '오류') gender
from student;

--5. student 테이블에서 번호, 이름 , 나이, 태어난 해를 조회 하세요.
--   태어난 해는 현재년도-나이+1 로 구합니다.



select num, name, age, to_char(input_date, 'yy')-age+1+2000 birth_year
from student;
--6. student 테이블에  이름 나이, 이메일, 이메일의 유효성 여부를  조회하세요.
--   단, 이메일의 유효성은 '@'만으로 판단하며 '@'가 없으면 '무효', '@'이 존재하면 '유효'를출력
select name, age, email, decode(instr(email, '@'), 0, '무효', '유효')
from student;

--alter table student add ssn char(14);
select * from student;
--delete from student where name is null;
--alter table student drop column age;
--commit;
--
--update student
--set email = 'test'
--where num in (4,5);
--
update student
set ssn = '800101-2234567'
where num=5;


alter table student add age number default 27;
update student set age = 30
where num=4;
