/*
-- �л����̺��� �л��� ��ȣ�� 1���� �л��� ���̸� 27��, �̸����� wang@sist.co.kr��, �ּҸ� ��⵵ ��õ�� ��õ������,
-- �������� ���� ������ ��¥�� ����
update student
set age = 27, email = 'wang.sist.co.kr', addr = '��⵵ ��õ��', num = 1, input_date = sysdate
where num = 30;


-- �л� ���̺��� �̸��� ������ �̰� ������ 'm'�� �л��� ���̸� 25��, �̸����� 'park@daum.net'���� ����
update student
set age = 25, email = 'park@daum.net'
where name = '������' and gender = 'm';


-- ���̺��� ��� ���ڵ� ����.
delete from student;


-- ���̺��� Ư�� ���ڵ� ����.
-- �л� ���̺��� �л� ��ȣ�� 1���� �л��� ���ڵ带 �����Ѵ�.
delete from student where num=1;


-- truncate : DDL - Ư�����̺��� ��� ���ڵ带 ����.
truncate table student;
*/


--insert into student values(2, '�հǸ�', 24, '010-1234-5678', 'test@test.com', 'm', '����� ������ ���ﵿ', sysdate);


-- ��µǴ� Į���� ũ�� ����
column num format 999
col name format a6
col age foramt 0000
col phone format a13
col phone format a10
col phone format a14


select * from student;