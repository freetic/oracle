create table test_like(
	name varchar2(15),
	address varchar2(300byte)
);

insert into test_like values('�ֽ���', '����� ������ ���ﵿ');
insert into test_like values('�����', '����� ���빮�� ���빮��');
insert into test_like values('�����', '����� ������ ���� 3��');
insert into test_like values('�����', '��⵵ ������ ���뱸');
insert into test_like values('����', '��⵵ ���ν� ���ε�');
insert into test_like values('������', '��û���� �ƻ걺 �ƻ���');
insert into test_like values('�ֿ���', '����� ���α� ���ε�');

select * from test_like;

-- _�� ��ȸ
-- �̸��� 3���� �̸� '��'���� ���ڵ� ��ȸ
select name
	from test_like
	where name like '��__';

-- �̸��� 3���� �̸� '��'���� ������ ���ڵ� ��ȸ
select name
	from test_like
	where name like '__��';

-- �̸��� 4������ ���ڵ带 ��ȸ
select name
	from test_like
	where name like '____';

-- %�� ��� ���ڸ� ����
-- ����÷� �����ϴ� ��� �ּ� �˻�
select address
	from test_like
	where address like '�����%';

-- '��'���� ������ ��� �ּ� �˻�
select address
	from test_like
	where address like '%��';

-- '��'�� ���� ��� �ּ� �˻�
select address
	from test_like                                          IS NOT NULL
	where address like '%��%';

-- ������̺��� ����� 'L'�� �� �� ���� ����� �����, �����ȣ ��ȸ
select ename, empno
	from emp
	where ename like '%L%L%';

create table zipcode(
	zipcode char(7),
	sido char(6),
	gugun varchar2(25),
	dong varchar2(150),
	bunji varchar2(25),
	seq number(5)
);

select * from zipcode;

-- ���� �Է� �Ͽ� �����ȣ �˻�
select *
	from zipcode
	where dong like '%���%';

truncate table zipcode;

select count(*) from zipcode;

-- �������� ����
savepoint insert_sql;
insert into test_like values('larry ellison', '����� ����Ÿ��');
savepoint update_sql;
update test_like
	set address='LA'
	where name='larry ellison';

savepoint delete_sql;
delete from test_like where name='larry ellison';

commit;
rollback to insert_sql;
rollback to update_sql;
rollback to delete_sql;
select * from test_like;

