-- view�� �����ϴ��� ��ȸ
select * from user_views;

-- �ο��� ���� ��ȸ : dba_roles_privs
-- �ܼ� �� ���� : ������ �ο��� ������ ���� �����ϴ�. �޷�~
select * from dba_role_privs
where grantee = 'SCOTT';

-- view ���� ���� �ο�
grant create view to scott;

-- �ܼ� view ����
-- create view emp_view as (select * from cp_emp3);
-- ���� �̸��� �䰡 ������ �� ��� ��ü�Ҷ����� 
-- create or replace ���
create or replace view emp_view as (select * from cp_emp3);

-- view ����� ��ȸ
select * from emp_view;

-- view�� �߰�
insert into emp_view (empno, ename, mgr, job, hiredate, sal)
values(1111, '������', 1234, '����', sysdate, 6000);
-- view�� �߰��ϸ� ���� ���̺� �ݿ��ȴ�.
select * from cp_emp3;

update emp_view
set job = '����', sal = 8000
where empno = 1111;

update cp_emp3
set job = '�̻�', sal = 9900
where empno = 1111;

delete from emp_view where empno = 9;
