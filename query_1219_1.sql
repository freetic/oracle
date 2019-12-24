-- 중복배제
-- distinct : error가 발생하지 않는다.
-- 사원 테이블에서 매니저 번호를 조회.
-- 단, 중복되는매니저 번호는 출력하지 않다.
-- 여러 레코드가 조회되는 컬럼과 같이 사용되면 중복배제를 하지 못한다.
select distinct mgr /*, empno*/
	from emp
	where mgr is not null;

-- group by
-- 사원테이블에서 매니저 번호를 조회.
-- 단, 중복되는 매니저 번호를 출력하지 않는다.
-- 주의 : group by 에 정의되지 않은 컬럼이 검색에 사용되면 Error 발생. 집계 함수 써야함.
select mgr
	from emp
	where mgr is not null
	group by mgr;

-- 사원 테이블에서 연봉을 조회
-- 단, 동일 연봉은 출력 하지 않는다.
select sal
	from emp
	group by sal;

-- 그룹으로 묶일 조건 : having
-- 사원 테이블에서 부서 인원이 4명 이상인 부서 번호 조회
-- 같은 부서 번호를 출력하지 않는다.
select deptno, count(deptno)
	from emp
	group by deptno
	having count(deptno) >= 4;

select length(ename)
	from emp;

select *
	from dual;

select '박찬우' name, 25
from dual;

----------------- 문자열 함수 -------------------
-- 문자열의 길이
select length('오늘은 목요일 입니다.')
	from dual;
-- 사원 테이블에서 사원 명이 4자 이상인 사원의 사원 명을 조회
select ename || '(' || length(ename) || ')'
	from emp
	where length(ename) >= 4;

-- 대문자, 소문자 변환
select upper('AbcdEfg'), lower('AbCdEfg')
	from dual;

-- 사원 테이블에서 사원명이 scott인 사원의 사원번호, 사원명, 연봉, 입사일 조회
select empno, ename, sal, hiredate
	from emp
	where ename = upper('scott');

-- 문자열 결합
select concat('Oracle', ' Java'), 'Oracle'||' Java'
	from dual;

select concat(concat(ename, '_'), job), ename||'_'||job
	from emp;

--  첫글자를 대문자로
select initcap('java'), initcap('i am a boy'), initcap('OASD')
	from dual;

-- 문자열의 인덱스 얻기
-- 찾는 문자열이 없다면 0 반환
select instr('ABCDEF', 'C'), instr('ABCDEF', 'G')
	from dual;

-- 사원 테이블에서 사원명에 'A'가 있는 사원은 A의 인덱스를, 그렇지 않으면 0 조회과 그렇지 않은 사원을
select ename, instr(ename, 'A')
	from emp
	where instr(ename, 'A') <> 0;

-- 문자열 자르기
select substr('ABCDEFG', 2, 4), substr('ABCDEFG',1 , 5), substr('가나다라마바사', 2, 2),
	substr('freetic1004@naver.com', 1, 11) email, substr('freetic1004@naver.com', 13) domain
	from dual;

insert into student(num, name, age, phone, email, gender, addr, input_date, birth_year)
values(2, '이선문', 28, '010-8681-8761', 'lee8761@daum.net', 'M','서울', sysdate, 1990);

insert into student(num, name, age, phone, email, gender, addr, input_date, birth_year)
values(3, '왕건모', 25, '010-1234-3461', 'wang3461@daum.net', 'M','경기', sysdate, 1990);

-- 학생 테이블에서 학생명, 이메일주소, 도메인주소 조회
select name, email, substr(email, instr(email, '@')+1) domain
	from student;

-- 문자열 공백제거
-- 앞뒤공백, 앞 공백, 뒷 공백
-- 앞뒤에 동일 문자열을 제거하는 기능 : trim('제거할 문자' from '문자열')
select '[' || trim('    A   BC   ') || ']' trim, '[' || ltrim('    A   BC   ') || ']' ltrim, '[' || rtrim('    A   BC   ') || ']' rtrim,
			trim('s' from 'asasasaOaaaOsasssss')
	from dual;

-- 문자열 채우기
-- 문자열 앞 채우기 : lpad(), rpad()
-- 채울 문자열이 한글인 경우 1자에 2byte로 계산한다.
select lpad('ABCDEFG', 10, '~') "lpad", rpad('ABC', 10, 'ㄴ') "rpad"
	from dual;

select
	from;

alter table student modify num number(10);

insert into student(num) values(15);
insert into student(num) values(109);
insert into student(num) values(1521);
insert into student(num) values(19);

select * from student;

-- 학생테이블에서 학번을 보여주는데 전체 12자리하여 아래와 같은 형식으로 번호 출력
-- SIST_0000001
select 'SIST_' || lpad(num,7 ,'0') 학번, name
	from student;

-- 치환
select replace('ABCDEFABDD', 'D', 'P'),
	replace('월요일,화요일,수요일,목요일','요일', '욜'), 
	'[' || replace('        A  BC      ') || ']'
	from dual;

select hiredate
	from emp;            

--