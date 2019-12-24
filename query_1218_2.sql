-- select ���
-- ���� ������ ��ȸ
-- ��� ���̺��� ��� ��, ��� ��ȣ, ������ �Ʒ��� ���� �������� ��ȸ�Ͻÿ�.
-- xxxx�� (���) ���� xxxx �� �Դϴ�.

-- alias �÷��� ���� : as�� ���� �� �� �ִ�.
select ename||' ��(' || empno || ') ' || sal || '�� �Դϴ�.' output from emp;

-- alias�� �ַ� 8�� �̻��� �÷����� ���� ��, ���� ���޵ǵ��� ���.
select ename en, mgr as manager, sal en
	from emp;

-- alias�� ���� ������ where�������� ��� �� �� ����.
select s
from (select empno, ename, sal s
	from emp e
	where s > 2000);

-- ���̺� alias �ο� : join �� �ַ� ���. as�� ��� �Ұ�
select empno, job, hiredate
from emp e;

-- Į���� �ϳ��� ���� ���.
-- �� �ҹ��ڸ� �����Ͽ� " " ���� alias �ο�
select empno || ' - ' || ename || ' - '|| job as "Output"
from emp;

-- ������ : ��������� (null�� ����Ǹ� null�� ���´�.)
-- +, -, *, %, mod(Į����, ���� ��) : ������
-- ��� ��ȣ, ��� ��, ����, ���ʽ�, �� ���ɾ��� ��ȸ. ��, �� ���ɾ� = ����+���ʽ�
select empno �����ȣ, ename "��� ��", sal ����, comm ���ʽ�, sal+nvl(comm, 0) "�� ���ɾ�"
	from emp;

-- ��� ��ȣ, ��� ��, ����, ������ ��ȸ. ��, ������ ����/12
select empno, ename, sal, trunc(sal/12, 2) moth_sal
	from emp;

-- ��� ��ȣ, ��� ��, ����, ���� ��ȸ
-- �� ���� =
select empno, ename, sal, trunc((sal+nvl(comm, 0))*3.3/100, 2) tex
	from emp;

alter table student add birth_year number(4);

insert into student(num, name, age, phone, email, gender, addr, input_date, birth_year)
	values(1, '������', 27, '010-1234-4321', 'test@test.com', 'M', '�����', sysdate,  1990);

select * from student;

-- ���� ������
/*
	0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10(����), 11
*/

select num, name, birth_year, mod(birth_year, 12)
	from student;

-- ���, ���ڿ� ���� ������ �̿��� �����ڰ� ��ȸ �÷��� ������ Error
select ename, job, sal, sal>2000
	from emp;

-- whwre �� : Ư�� ���ڵ常 �˻��� ��:
-- ���迬���� : >, <, >=, <=, =, !=, (<>)

-- ������̺��� 10�� �μ��� �ش��ϴ� ������� �����ȣ, �����, ����, �Ŵ�����ȣ, �μ���ȣ ��ȸ
select empno, ename, job, mgr, deptno
	from emp
	where deptno = 10;

-- ������̺��� ������ 3000 �̸��� ����� �����ȣ, �����, ����, �Ի��� ��ȸ
select empno, ename, sal, hiredate
	from emp
	where sal < 3000;

-- ������ 3000õ �̻�
select empno, ename, sal, hiredate
	from emp
	where sal >= 3000;

-- 20�� �μ��� �ƴ� �������
select empno, deptno, ename, sal, comm
	from emp
	where deptno <> 20;

-- ��������: �������� ���迬���ڸ� ��� ��
-- and, or, not

-- ������̺��� �����ȣ�� 7488�̸鼭 ������ 3000�� ����� �����ȣ, �����, �Ի���, ���� ��ȸ
select empno, ename, hiredate, sal
	from emp
	where empno = 7788 and sal = 3000;

-- ������̺��� 7698, 7839, 7566 �Ŵ����� �����ϴ� ������� �Ŵ�����ȣ, �����ȣ, �����, ���� ��ȸ
select mgr, empno, ename, job
	from emp
	where mgr not in (7698, 7839, 7566);
--	where mgr = 7698 or mgr = 7839 or mgr = 7566;
-- or�� in���� ��ü�Ͽ� ����� �� �ִ�.
-- not in �� �������� �ʴ°�

-- ���� : ������̺��� ������ 1000 �̻� 3000 �̸��� ������� �����ȣ, �����, ����, �μ���ȣ, �Ի��� ��ȸ
-- ������ beween���� ��ü ���� (�̻� ����)
select empno, ename, sal, deptno, hiredate
	from emp
	where sal between 1000 and 3000;

-- null �� ��
-- ������̺��� ���ʽ��� ���� ������� �����, ����, ���ʽ� ��ȸ
select ename, sal, comm
	from emp
	where comm is null;    
-- null�� ���迬���ڷ� �� �Ұ�. ( comm = null) �Ұ� 

--