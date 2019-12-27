-- full outer join : ���� ���̺� �����ϴ� ���ڵ嵵 ��ȸ�ǰ�
-- ���� ���̺��� �����ϴ� ���ڵ嵵 ��ȸ.
-- cp_emp3
-- �ѱ� ���翡 �ٹ��ϴ� ����� �����ȣ, �����, �Ŵ�����ȣ, ����, �Ի���, ���� ��ȸ
-- and �̱����翡 �ٹ��ϴ� ����� ���� ���� �÷��� ��ȸ. ������� �ѱ� ����� �̱����翡��
-- ���� ���ڵ尡 �����ϹǷ� ���� ���̺��� ��� ���.(�̱� ������ ������� �ѱ� ���翡
-- ���� �� ���� ���̺� �߰��Ǵ� ����)
select ce.empno, ce.ename, ce.mgr, ce.job, ce.hiredate, ce.sal,
e.empno, e.ename, e.mgr, e.job, e.hiredate, e.sal
from cp_emp3 ce
full join emp e
on e.empno = ce.empno;

-- sub query ���� (self join�� sub query�� ��ü ����)
select empno, ename, sal, hiredate, deptno, job
from emp
where sal > (select sal from emp where ename='SCOTT');

-- self join : ������̺��� ������� 'SCOTT'�� ������� ������ ���� �޴�
-- ����� �����ȣ, �����, ����, ����, �Ŵ�����ȣ, �Ի��� ��ȸ
select e1.empno, e1.ename, e1.job, e1.sal, e1.mgr, e1.hiredate
from emp e1, emp e2
where e1.sal > e2.sal and e2.ename = 'SCOTT';


----------------------- alter ���̺� ���� --------------------------
create table test_alter(
	neam	varchar2(30),
	age number(1),
	addr number(22)
);

insert into test_alter(neam, age) values('�հǸ�', 2);
commit;

truncate table test_alter;
-- ���̵� �÷�, ��� �÷� �߰�
alter table test_alter add id varchar2(16) constraint pk_test_alter primary key;
-- ������� ���� ��� �÷� �߰�
alter table test_alter add passwd varchar2(20);
insert into test_alter(neam, age, id) values('�հǸ�', 2, 'wang');

-- �÷� �������� ����
-- ���� number(1) -> number(3) : �÷� ���� �����ϴ� ��쿡�� ���������� ũ�⸸ ���� ����
alter table test_alter modify age number(3);

-- �÷��� ���� �������� ������ �������� ��ü�� ���� �� �� �ִ�. number(22) -> varchar2(300)
alter table test_alter modify addr varchar2(300);

-- �÷��� �����ϸ鼭 ��������� �߰� �� �� �ִ�. ��� ����ũ���� not null�� ����
update test_alter
set passwd = 'a'
where id='wang';
alter table test_alter modify passwd not null;
-- �÷� ����
alter table test_alter drop column passwd;
-- �÷��� ����
alter table test_alter rename column neam to name;
-- ���̺�� ����
-- alter table ���̺�� rename to ������ ���̺��;
alter table test_alter1 rename to test_alter;
-- ������� ����
alter table test_alter drop constraint pk_test_alter;
--������� �߰�
-- id�� primary key �߰�
alter table test_alter add constraint pk_test_alter primary key(id);
-- age�� check ���� �߰� : skdlsms 19~39����
alter table test_alter add constraint ck_age check (age between 19 and 39);

alter table test_alter modify addr varchar2(300) not null;
-- ��������� ��Ȱ��ȭ
alter table test_alter disable primary key;
alter table test_alter disable constraint ck_age;
-- ��������� ��Ȱ��ȭ �Ǿ��ٸ� �����ϳ� �߰��ϴ� ���ڵ忡 ���� ��������� üũ���� �ʴ´�.
insert into test_alter(name, age, addr, id) values('�հǸ�', 27, '����', 'test');
insert into test_alter(name, age, addr, id) values('�հǸ�', 2, '����', 'test');
insert into test_alter(name, age, addr, id) values('�հǸ�', 2, '����', 'test');

truncate table test_alter;
-- ������� Ȱ��ȭ
alter table test_alter enable constraint pk_test_alter;
alter table test_alter enable constraint ck_age;

select * from test_alter;
select * from user_constraints where table_name = 'TEST_ALTER';

select * from user_tablespaces; -- Data Dictionary

select * from user_objects;
