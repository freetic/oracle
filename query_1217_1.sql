-- student ���̺� ���ڵ� �߰�
-- Į������ �����ϰ� �߰�(Į���� ������� ���� �����ؾ� �Ѵ�.)
/*
insert into student values(1, '������', 27, '010-0000-0000', 'park@test.com','m', '�����', sysdate);
insert into student(num, name, age, gender, email, phone, addr, input_date) values(2, '����', '10', 'f', 'cc@test.com', '111-1111', '��⵵', sysdate);
insert into student(num, name, age) values(3, '������', 11);
insert into student values(4, '�հǸ�', 24, '010-1234-5678', 'test@test.com', 'm', '����� ������ ���ﵿ', sysdate);
insert into student(num, name, gender, age, phone, addr, email, input_date) values(5, '������', 'm', 27, '123-123-123', '����� ������ ���ﵿ', 'park@test.com', sysdate);

-- �÷����� �����Ͽ� �߰�: �������� ���� �÷����� null�� �Էµȴ�.
insert into student(name, num, phone) values('�׽�Ʈ', 6, '013-13-13');

-- ������ ��ȸ
-- �л����̺��� �л���, ��ȣ, �̸��� ��ȸ
select name, num, email from student;


-- ��� ���̺��� ��� ����� �����ȣ, �����, ����, �Ի��� ��ȸ
select empno, ename, sal, hiredate from emp;


-- �μ� ���̺��� ��� �μ��� ��� �÷��� ��ȸ
select * from dept;


-- �̸��� 27�� �̸鼭 ���̰� �������� ����� ��ȣ�� 30������ ����
update student
set num = 30
where name = '������' and age = 27;
*/

insert into student(num, name, age, phone, addr, email, input_date) values(1, '������', 27, '010-0000-0000', '�����', 'park@test.com', sysdate);
insert into student values(4, '�հǸ�', 24, '010-1234-5678', 'test@test.com', 'm', '����� ������ ���ﵿ', sysdate);


-- ��µǴ� Į���� ũ�� ����
column num format 999
col name format a6


select * from student;