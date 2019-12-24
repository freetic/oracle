-- Foreign key : �ٸ� ���̺��� �÷� �����θ� ���� ���� �ؾ� �� �� ���.

insert into primary_column(id, name, age) values('kim', '�����', 27);
insert into primary_column(id, name, age) values('choi', '����', 27);

-- id�� ���� �л��� �л� ���� ������ �����ϴ� ���̺� ����
-- on delete cascade �� �����ϸ� �θ����̺��� ���ڵ尡 ������ ��
-- �ڽ����̺��� ��� ���ڵ带 ���� �����Ѵ�.
create table foreign_column(
	r_id varchar2(14) constraint fk_r_id references primary_column(id)
		on delete cascade,
	phone varchar2(13),
	email varchar(50)
);

select * from user_constraints;
-- �߰� ����
-- �θ� ���̺� �����ϴ� �÷������� �߰� �� ��.
insert into foreign_column(r_id, phone, email) values('kim', '010-123-4567', 'park@test.com');
-- �θ����̺� �����ϴ� �÷������� ������ �߰� �� ��.
insert into foreign_column(r_id, phone, email) values('park', '010-111-9999', 'park@test.com');
insert into foreign_column(r_id, phone, email) values('wang', '010-3333-2222', 'wang@sist.com');
-- null ���
insert into foreign_column(r_id, phone, email) values('', '', null);
insert into foreign_column(phone, email) values('017-000-0000', 'bbb@bbb.com');



-- error �߻�
--�θ� ���̺� �������� �ʴ� ������ �߰� �� ��.
insert into foreign_column(r_id, phone, email) values('test', '000-0000-0000', 'xxx@xxxx.com');

-- �θ����̺��� �����ϴ� �ڽ� ���ڵ尡 �����ϸ� �������� �ʴ´�.
delete from primary_column where id = 'wang';
delete from primary_column where id = 'park';
-- �θ����̺��� �����ϴ� �ڽ� ���ڵ尡 �������� ������ �����ȴ�.
delete from primary_column where id = 'choi';
commit;
rollback;

-- �����Ϸ��� 1. �ڽ� ���ڵ带 ��� �����ϰ� 2. �θ� ���ڵ带 �����Ѵ�.
delete from foreign_column where r_id = 'wang';
delete from primary_column where id = 'wang';

drop table foreign_column;

select * from primary_column;
select * from foreign_column;

---------------- ���̺� ���� �������
create table foreign_table(
	r_id 					varchar2(14),
	oracle_score	number(3),
	java_score		number(3),
	constraint fk_foreign_table_r_id foreign key(r_id) references primary_column(id)
);

select * from user_constraints;
                                          


--------------------------- unique ------------------
-- �÷��� ���� ���� �� �� ������,  ���� �����Ѵٸ� �����ؾ� �� �� ���.
-- �÷�����
create table unique_column(
  name varchar2(10),
  age number(3),
  email varchar2(50)	
);
