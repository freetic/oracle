--����
--1. �Ʒ��� �ش��ϴ� �����͸� ������ �� �ִ� ���̺��� �����ϼ���.
-- ������, ����, �����ڵ�,����, ����, �߰���
create table book(
name varchar2(100),
price number(6),
code varchar2(120),
author varchar2(120),
describe varchar2(300),
pub_date date
);
--2. 1������ ����� ����� ���̺��輭�� �ۼ��ϼ���.

--3. �Ʒ��� �����͸� ������ ���̺� �߰��ϰ� Transaction�� ó���ϼ���.
--  ����Ŭ SQL�� PL/SQL, 28000, ORA_0012_11, ������, ����Ŭ�� ����, ����
--  Java�� ����, 38000, JAVA_1011_4511A,���ü� , �ڹ��� ������ �ٷ��, ����
--  JSP2.3 �����α׷���, 36000, JSP_03_11, �ֹ���, JSP����, ����
--  ������ �� ���α׷���, 26000, HT_981_09A, ȫ����, HTML �� ����, ����

--insert into book values('����Ŭ SQL�� PL/SQL', 28000, 'ORA_0012_11', '������', '����Ŭ�� ����', sysdate);
insert into book values('Java�� ����', 38000, 'JAVA_1011_4511A', '���ü�', '�ڹ��� ������ �ٷ��', sysdate);
insert into book values('JSP2.3 �����α׷���', 36000, 'JSP_03_11', '�ֹ���', 'JSP����', sysdate);
insert into book values('������ �� ���α׷���', 26000, 'HT_981_09A', 'ȫ����', 'HTML �� ����', sysdate);


--4. ���� ���̺��� ��� ���ڵ��� �����, ����, ������ ��ȸ.
select name, author, price from book

--5. �������� 'Java�� ����'�� ������ ������ 40000���� ���� �ϼ���.
update book
	set price = 40000
	where name = 'Java�� ����';

--6. �����ڵ尡 'HT_981_09A' �� ������ ��������
--  '���״� �� ���α׷���'���� ������  30000���� ���ڸ�  , Ȳ�������� ���� �ϼ���.
update book
	set name = '���״� �� ���α׷���', price = 30000, author = 'Ȳ����'
	where code = 'HT_981_09A';

--7. �����ڵ尡  'HT_981_09A' �� ������ �����ϼ���.
delete from book where code = 'HT_981_09A';

--8.  ��� ������ �����ϼ���.
truncate table book;