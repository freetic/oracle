-- view가 존재하는지 조회
select * from user_views;

-- 부여된 권한 조회 : dba_roles_privs
-- 단순 뷰 생성 : 권한이 부여된 계정만 생성 가능하다. 메롱~
select * from dba_role_privs
where grantee = 'SCOTT';

-- view 생성 권한 부여
grant create view to scott;

-- 단순 view 생성
-- create view emp_view as (select * from cp_emp3);
-- 같은 이름의 뷰가 존재할 할 경우 대체할때에는 
-- create or replace 사용
create or replace view emp_view as (select * from cp_emp3);

-- view 사용한 조회
select * from emp_view;

-- view에 추가
insert into emp_view (empno, ename, mgr, job, hiredate, sal)
values(1111, '오원식', 1234, '차장', sysdate, 6000);
-- view에 추가하면 실제 테이블에 반영된다.
select * from cp_emp3;

update emp_view
set job = '부장', sal = 8000
where empno = 1111;

update cp_emp3
set job = '이사', sal = 9900
where empno = 1111;

delete from emp_view where empno = 9;
