-- 변환함수
-- 날짜변환
select to_char(sysdate, 'yyyy-mm-dd hh(hh24):mi:ss day dy q')
from dual;
-- pattern이 아닌 문자열(한글이나 영어, 특수문자, 숫자)을 사용할 때 에는 "로 묶어서 표현
select to_char(sysdate, 'yyyy"년" mm"월" dd"일" day')
from dual;

-- 사원 테이블에서 입사년도가 1981년인 사원들의 사원번호, 사원명, 직무, 입사일을 조회
--단, 입사일은 년-월-일의 형태를 가지며, 년은 두자리로 출력
select empno, ename, job, to_char(hiredate, 'yy"년-"mm"월-"dd"일"')
	from emp
	where to_char(hiredate, 'yyyy') = '1981';

select to_char(sysdate, 'yyyy " 년 " mm " 월 " dd " 일 " hh24 " 시 " mi " 분 " ss " 초 "')
	from dual;


select to_char(2019, '9,999,999'), to_char(2019, '0,000,000')
from dual;

--사원 테이블에서 사원번호, 사원명, 연봉을 조회
-- 단, 연봉은 데이터가 존재할 때 3자리 마다 ,를 넣어 출력한다.
select empno, ename, to_char(sal, '9,999,999') sal
	from emp;

-- 학생테이블에 어제의 날짜로 이름이 '이선문'인 학생의 정보를 추가하라.
insert into student(num, name, input_date) values(5, '이선문', to_date('2019-12-18'));
select * from student;

-- 함수의 매개변수가 날짜인 함수에 문자열을 넣으면 에러 발생
select to_char(to_date('2019-12-20', 'yyyy-mm-dd'), 'mm-dd-yy') as input_date
from dual;

-- 숫자 변환 : 숫자 형태의 문자열을 숫자로 변경
select to_number('21')+9 as num
from dual;

--null 변환 함수
create table test_null(
	num number,
	msg varchar2(100),
	input_date date
);

-- 숫자에 null입력: 컬럼을 생략
insert into test_null(msg, input_date) values('안녕 Oracle', sysdate);
select * from test_null;

-- 날짜에 null 입력: 컬럼을 생략
insert into test_null(num, msg) values(1, '안녕 Java');
commit;

select * from test_null;
insert into test_null(num, input_date) values(3, sysdate);

select * from test_null;
insert into test_null(num, msg, input_date) values(4, '', sysdate);
insert into test_null(num, msg, input_date) values(5, 'asdf', sysdate);

-- null 변환: nvl(컬럼명, null일때 보여줄 값)
select nvl(num,0), nvl(msg, 'hello'), nvl(input_date, sysdate)
from test_null;

-- null 변환: nvl2(컬럼명, null일때 보여줄 값, null이 아닐때 보여줄 값)
select nvl2(num, '번호 있음', '번호 없음'), num
from test_null;

-- 사원테이블에서 사원번호, 사원명, 매니저번호, 연봉, 보너스를 조회.
-- 단, 매니저번호가 null이면 9999로 출력하고, 보너스가 null이라면 100으로 출력
select empno, ename, nvl(mgr, 9999), sal, nvl(comm, 100)
	from emp;

-- 사원테이블에서 부서번호, 부서명, 사원번호, 사원명을 조회
-- 단, 부서번호가 10번 - 개발부, 20 - QA, 그 외는 탁구부로 조회
select deptno, decode(deptno, 10, '개발부', 20, 'QA', '탁구부'), empno, ename
	from emp;

-- 사원테이블에서 사원번호, 사원명, 부서번호, 연봉, 부서별 보너스를 출력
-- 단, 부서별 보너스는 10번 부서는 연봉의 5%, 20번은 10%, 30번은  20%, 그 외 15%로 계산
select empno, ename, deptno, sal, decode(deptno, 10, sal*5/100, 20, sal*10/100, 30, sal*20/100, sal*15/100) dept_bonus
	from emp;
