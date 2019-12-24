--------------- check, not null, default ------------
-- �̸�, ����, ����, �ּ�, �Է����� �����ϴ� ���̺� ����. �̸��� �ݵ�� �Է� �޾ƾ� �ϸ�, ���̴�
-- 20��~30�� ������ �Է� ����, �ּҴ� ���� �� �ִ�. �Է����� �����Ǹ� �߰� ������ ��¥ ������ �߰�
create table other_constraints(
	name		varchar2(15) not null,
	age			number(3) check( age between 20 and 39),
	addr    varchar2(300) null,
	input_date date default sysdate
);

select * from user_constraints;
select * from user_tab_cols where table_name='OTHER_CONSTRAINTS';

-- ����
-- �̸��� �Էµǰ�, ���̰� 20~30�� ���̸� �ȴ�.
insert into other_constraints(name, age, addr, input_date)
	values('�̼���', 27, '����� ���۱�', sysdate);
--	�ּҰ� ���� ���:
insert into other_constraints(name, age, addr, input_date)
	values('�̼���', 27, '', sysdate);
-- �Է����� ���� ��� : default�� ���� ���� ��¥�� �߰�
insert into other_constraints(name, age, addr)
	values('�̼���', 27, '����� ���۱�');
-- Error
-- not null ���� : �̸��� null�� �ԷµǸ�
insert into other_constraints(name, age, addr, input_date)
	values('', 30, '����', sysdate);

-- check���� : ���̰� 20~39�� �ƴҶ�
insert into other_constraints(name, age, addr, input_date)
	values('������', 19, '����� ���۱�', sysdate);

select * from other_constraints;

-------------------------------- join --------------------------
---------------------- inner join
-- ����� �����ϴ� ��� �μ��� �μ���ȣ, �μ���, ��ġ, �����ȣ, �����, ����, �Ի���, ���� ��ȸ
--ANSI
select d.deptno, d.dname, d.loc, e.empno, e.ename, e.sal, e.hiredate, e.job
from emp e
inner join dept d
on e.deptno=d.deptno;

-- Oracle inner join

