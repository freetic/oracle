--1. ������̺��� 3,4�б⿡ �Ի��� ������� �����ȣ,�����,�Ի���,������ ��ȸ�ϼ���.
----��, �Ի����� ��-��-�� �б��� �������� ����ϰ� ������ �� 7�ڸ��� ���� 3�ڸ� ����,�� �־� ����Ұ�.

select empno, ename, hiredate, sal
	from emp
	where to_char(hiredate, 'q') = '3' or to_char(hiredate, 'q') = '4';

--2.������̺��� �μ���ȣ, �����ȣ, ����,���ʽ�,�Ѽ��ɾ�, �Ի����� ��ȸ�ϼ���.
--   ��. �Ѽ��ɾ��� '����+����+���ʽ�'�� �ջ��� �ݾ�����
--   ��ȸ�ϼ���.  ������ ������ 12�� ���� ������ ����ϼ���.

select deptno, empno, sal, comm, trunc(sal+nvl(comm, 0)+sal/12, 2) bouse, hiredate
from emp;

--3. ��� ���̺��� �μ���ȣ,�μ���,����, ���ʽ�, �μ�Ƽ�긦
--   ��ȸ�ϼ���.
--   �μ�Ƽ���  �Ʒ�ǥ�� ���� �μ����� ���� �����մϴ�.
--   10- ���޿� 100%, 20- ���޿� 150%, 30 - ���޿� 300%
--   �׿� ���޿� 50%

select deptno, decode(deptno, 10, '���ߺ�', 20, 'ȸ���', 30, '�񼭺�', 'no!') �μ���, sal, comm, decode(deptno, 10, trunc(sal/12, 2), 20, trunc(sal/12*1.5, 2), 30, trunc(sal/4), sal/24) incentive
from emp;

--4. student ���̺��� ��ȣ, �̸� , �ֹι�ȣ,
--   ������ ��ȸ �ϼ���.
--   ������ �ֹι�ȣ��   8��° �ڸ��� ���ϰ�,
--   8��° �ڸ��� 1,3�̸� '����', 2,4�� '����' 5,6,7,8�̸� '�ܱ���'�׷���
--   ������ "����" �� ����Ѵ�.

select num, name, ssn, decode(to_number(substr(ssn, 8, 1)), 1, '����', 2, '����', 3, '����', 4, '����', 5, '�ܱ���', 6, '�ܱ���', 7, '�ܱ���', 8, '�ܱ���', '����') gender
from student;

--5. student ���̺��� ��ȣ, �̸� , ����, �¾ �ظ� ��ȸ �ϼ���.
--   �¾ �ش� ����⵵-����+1 �� ���մϴ�.



select num, name, age, to_char(input_date, 'yy')-age+1+2000 birth_year
from student;
--6. student ���̺�  �̸� ����, �̸���, �̸����� ��ȿ�� ���θ�  ��ȸ�ϼ���.
--   ��, �̸����� ��ȿ���� '@'������ �Ǵ��ϸ� '@'�� ������ '��ȿ', '@'�� �����ϸ� '��ȿ'�����
select name, age, email, decode(instr(email, '@'), 0, '��ȿ', '��ȿ')
from student;

--alter table student add ssn char(14);
select * from student;
--delete from student where name is null;
--alter table student drop column age;
--commit;
--
--update student
--set email = 'test'
--where num in (4,5);
--
update student
set ssn = '800101-2234567'
where num=5;


alter table student add age number default 27;
update student set age = 30
where num=4;
