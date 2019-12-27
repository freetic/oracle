-- full outer join : 양쪽 테이블에 존재하는 레코드도 조회되고
-- 한쪽 테이블에만 존재하는 레코드도 조회.
-- cp_emp3
-- 한국 본사에 근무하는 사원의 사원번호, 사원명, 매니저번호, 직무, 입사일, 연봉 조회
-- and 미국지사에 근무하는 사원에 대한 동일 컬럼을 조회. 주재원은 한국 본사와 미국지사에도
-- 동일 레코드가 존재하므로 양쪽 테이블의 결과 출력.(미국 지사의 주재원이 한국 본사에
-- 들어올 때 본사 테이블에 추가되는 구성)
select ce.empno, ce.ename, ce.mgr, ce.job, ce.hiredate, ce.sal,
e.empno, e.ename, e.mgr, e.job, e.hiredate, e.sal
from cp_emp3 ce
full join emp e
on e.empno = ce.empno;

-- sub query 버전 (self join은 sub query로 대체 가능)
select empno, ename, sal, hiredate, deptno, job
from emp
where sal > (select sal from emp where ename='SCOTT');

-- self join : 사원테이블에서 사원명이 'SCOTT'인 사원보다 연봉을 많이 받는
-- 사원의 사원번호, 사원명, 직무, 연봉, 매니저번호, 입사일 조회
select e1.empno, e1.ename, e1.job, e1.sal, e1.mgr, e1.hiredate
from emp e1, emp e2
where e1.sal > e2.sal and e2.ename = 'SCOTT';


----------------------- alter 테이블 변경 --------------------------
create table test_alter(
	neam	varchar2(30),
	age number(1),
	addr number(22)
);

insert into test_alter(neam, age) values('왕건모', 2);
commit;

truncate table test_alter;
-- 아이디 컬럼, 비번 컬럼 추가
alter table test_alter add id varchar2(16) constraint pk_test_alter primary key;
-- 제약사항 없이 비번 컬럼 추가
alter table test_alter add passwd varchar2(20);
insert into test_alter(neam, age, id) values('왕건모', 2, 'wang');

-- 컬럼 데이터형 변경
-- 나이 number(1) -> number(3) : 컬럼 값이 존재하는 경우에는 동일형에서 크기만 변경 가능
alter table test_alter modify age number(3);

-- 컬럼의 값이 존재하지 않으면 데이터형 자체를 변경 할 수 있다. number(22) -> varchar2(300)
alter table test_alter modify addr varchar2(300);

-- 컬럼을 변경하면서 제약사항을 추가 할 수 있다. 비번 동일크기의 not null로 변경
update test_alter
set passwd = 'a'
where id='wang';
alter table test_alter modify passwd not null;
-- 컬럼 삭제
alter table test_alter drop column passwd;
-- 컬럼명 변경
alter table test_alter rename column neam to name;
-- 테이블명 변경
-- alter table 테이블명 rename to 변경할 테이블명;
alter table test_alter1 rename to test_alter;
-- 제약사항 삭제
alter table test_alter drop constraint pk_test_alter;
--제약사항 추가
-- id에 primary key 추가
alter table test_alter add constraint pk_test_alter primary key(id);
-- age에 check 조건 추가 : skdlsms 19~39까지
alter table test_alter add constraint ck_age check (age between 19 and 39);

alter table test_alter modify addr varchar2(300) not null;
-- 제약사항의 비활성화
alter table test_alter disable primary key;
alter table test_alter disable constraint ck_age;
-- 제약사항이 비활성화 되었다면 존재하나 추가하는 레코드에 대해 제약사항을 체크하지 않는다.
insert into test_alter(name, age, addr, id) values('왕건모', 27, '서울', 'test');
insert into test_alter(name, age, addr, id) values('왕건모', 2, '서울', 'test');
insert into test_alter(name, age, addr, id) values('왕건모', 2, '서울', 'test');

truncate table test_alter;
-- 제약사항 활성화
alter table test_alter enable constraint pk_test_alter;
alter table test_alter enable constraint ck_age;

select * from test_alter;
select * from user_constraints where table_name = 'TEST_ALTER';

select * from user_tablespaces; -- Data Dictionary

select * from user_objects;
