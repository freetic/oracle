/*
�л� ������ �����ϴ� ���̺� ����
��ȣ, �̸�, ����, ��ȭ��ȣ, �̸���, ����, �ּ�, �Է���
*/

create table student(
	num number(2) primary key,
	name varchar(15),
	age number(3),
	phone varchar2(13),
	email varchar2(50),
	gender char(1),
	addr varchar2(300),
	input_date date
);
/*
-- ���Ӱ����� ���� ��� ���̺� Ȯ��
select tname from tab;

-- Ư�� ���̺��� ����Ȯ��
desc student;
*/