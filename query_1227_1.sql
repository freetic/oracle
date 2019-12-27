----------------------------------------View --------------------------------
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

----------------------------- ���� View -------------------------
-- update�� delete�� ���� �����ϴ�. �׷��� view�� �Լ��� �������� ������ Error �߻�.

-- ������, �𵨸�, ����, ����, ��ⷮ, �ɼ�, �̹���, �Է����� ��ȸ�Ͽ�
-- car_view ����
create or replace view car_view
as (select cma.maker, cma.model, cmo.car_year, cmo.price, cmo.cc, cmo.car_option, cmo.car_img, cmo.hiredate
		from car_model cmo, car_maker cma
		where cmo.model = cma.model
		);
select * from car_view;

-- �����簡 'BMW'�� ������ �𵨸�, ����, ����, ��ⷮ, �ɼ�, �̹���, �Է��� ��ȸ
select *
from car_view
where maker='BMW';

-- ����View�� insert Eror
insert into car_view(maker, model, car_year, price, cc, car_option, car_img, hiredate)
values('BMW', 7, 2019, 9000, 5000, 'ABS, ���', ' bmw7.jpg', sysdate);

-- ����View�� update
--���� �̹����� 328i.jpg�� ������ ������ 3000���� ������ 2019�� ����
update car_view
set price = 3000, car_year = 2019, model = 4
where car_img = '328i.jpg';

-- ����View�� delete
delete from car_view
where price = 2000 and hiredate = '1012-01-25';

-- �� ����
drop view car_view;
drop view emp_view;
