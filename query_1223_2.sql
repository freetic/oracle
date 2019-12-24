------------------------ ������� -------------------
-- user_constraints (���̺��, ������׸�, �����������) Ȯ�� ����
select * from user_constraints;
-- default : user_tab_cols (���̺��, �÷���, ��������, ũ��, ... ����Ʈ ��) Ȯ�� ����
select * from user_tab_cols;

------------------------- primary key ���� -----------------------------
-- null ������� �����鼭 ���� �����Ѵٸ� �����ؾ� �� �� ���.
-- �÷�����
create table primary_column(
	id varchar2(14) constraint pk_primary_column primary key,
	name varchar2(15),
	age number
);
drop table primary_column;

insert into primary_column(id, name) values('test', 'test');
insert into dept(deptno) values(10);
select * from user_constraints;
select * from user_indexes;

-- �߰� ���� : null�� �ƴϸ鼭 �����Է�.
insert into primary_column(id, name, age) values('park', '������', 27);
commit;

insert into primary_column(id, name, age) values('wang', '�հǸ�', 25);
select * from primary_column;
commit;

-- Error
-- ������ ���� ������ ���̵� �߰� �� ����
insert into primary_column(id, name, age) values('wang', '�����', 27);
-- null �Է½� ����
insert into primary_column(id, name, age) values('', '�����', 27);
insert into primary_column(name, age) values('�����', 27);
insert into primary_column(id, name, age) values('', '�����', 27);

---------- ���̺� ���� �������
create table primary_table(
	name varchar2(15),
	ssn char(14),
	hobby varchar2(30),
	constraint pk_primary_table primary key(ssn)
);

-- �������� �÷��� �ϳ��� PK�� ���� ��. (LOT ��ȣ����, ���깰����)
-- �ĺ��� 1 : n ���� ����
-- ���̺���� ������׸� �������� : ��� �÷��� ���� ���� �Էµ� ���� ���� �߻�.
create table primary_multi(
	item_no char(5),
	item varchar2(30),
	item_info varchar2(4000),
	input_date date,
	constraint pk_primary_multi primary key(item_no, item)
);

-- �߰� ���� : ���� ������ null�� �ƴϸ鼭 �߰�
insert into primary_multi(item_no, item, item_info, input_date)
values('M0001', '�̻���', '�տ� ���� ������ �����Ͽ� �߻�', sysdate);
-- �߰� ���� : �� ���� �����Ϳ� �ٸ� ���
insert into primary_multi(item_no, item, item_info, input_date)
values('M0002', '�̻���', '�տ� ���� ������ �����Ͽ� �߻�', sysdate);
insert into primary_multi(item_no, item, item_info, input_date)
values('W0001', '����ź', '�տ� ���� ������ �Ÿ��� ����Ͽ� �߻�. ����� Ŀ�� ����', sysdate);

--���� : ��� Ű �÷��� ���� ������, null ���� ������
insert into primary_multi(item_no, item, item_info, input_date)
values('M0001', '�̻���', '�տ� ���� ������ �����Ͽ� �߻�', sysdate);
insert into primary_multi(item_no, item, item_info, input_date)
values('', '����', '��ȣ��', sysdate);


select * from primary_multi;
