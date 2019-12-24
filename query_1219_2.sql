-- ��ȯ�Լ�
-- ��¥��ȯ
select to_char(sysdate, 'yyyy-mm-dd hh(hh24):mi:ss day dy q')
from dual;
-- pattern�� �ƴ� ���ڿ�(�ѱ��̳� ����, Ư������, ����)�� ����� �� ���� "�� ��� ǥ��
select to_char(sysdate, 'yyyy"��" mm"��" dd"��" day')
from dual;

-- ��� ���̺��� �Ի�⵵�� 1981���� ������� �����ȣ, �����, ����, �Ի����� ��ȸ
--��, �Ի����� ��-��-���� ���¸� ������, ���� ���ڸ��� ���
select empno, ename, job, to_char(hiredate, 'yy"��-"mm"��-"dd"��"')
	from emp
	where to_char(hiredate, 'yyyy') = '1981';

select to_char(sysdate, 'yyyy " �� " mm " �� " dd " �� " hh24 " �� " mi " �� " ss " �� "')
	from dual;


select to_char(2019, '9,999,999'), to_char(2019, '0,000,000')
from dual;

--��� ���̺��� �����ȣ, �����, ������ ��ȸ
-- ��, ������ �����Ͱ� ������ �� 3�ڸ� ���� ,�� �־� ����Ѵ�.
select empno, ename, to_char(sal, '9,999,999') sal
	from emp;

-- �л����̺� ������ ��¥�� �̸��� '�̼���'�� �л��� ������ �߰��϶�.
insert into student(num, name, input_date) values(5, '�̼���', to_date('2019-12-18'));
select * from student;

-- �Լ��� �Ű������� ��¥�� �Լ��� ���ڿ��� ������ ���� �߻�
select to_char(to_date('2019-12-20', 'yyyy-mm-dd'), 'mm-dd-yy') as input_date
from dual;

-- ���� ��ȯ : ���� ������ ���ڿ��� ���ڷ� ����
select to_number('21')+9 as num
from dual;

--null ��ȯ �Լ�
create table test_null(
	num number,
	msg varchar2(100),
	input_date date
);

-- ���ڿ� null�Է�: �÷��� ����
insert into test_null(msg, input_date) values('�ȳ� Oracle', sysdate);
select * from test_null;

-- ��¥�� null �Է�: �÷��� ����
insert into test_null(num, msg) values(1, '�ȳ� Java');
commit;

select * from test_null;
insert into test_null(num, input_date) values(3, sysdate);

select * from test_null;
insert into test_null(num, msg, input_date) values(4, '', sysdate);
insert into test_null(num, msg, input_date) values(5, 'asdf', sysdate);

-- null ��ȯ: nvl(�÷���, null�϶� ������ ��)
select nvl(num,0), nvl(msg, 'hello'), nvl(input_date, sysdate)
from test_null;

-- null ��ȯ: nvl2(�÷���, null�϶� ������ ��, null�� �ƴҶ� ������ ��)
select nvl2(num, '��ȣ ����', '��ȣ ����'), num
from test_null;

-- ������̺��� �����ȣ, �����, �Ŵ�����ȣ, ����, ���ʽ��� ��ȸ.
-- ��, �Ŵ�����ȣ�� null�̸� 9999�� ����ϰ�, ���ʽ��� null�̶�� 100���� ���
select empno, ename, nvl(mgr, 9999), sal, nvl(comm, 100)
	from emp;

-- ������̺��� �μ���ȣ, �μ���, �����ȣ, ������� ��ȸ
-- ��, �μ���ȣ�� 10�� - ���ߺ�, 20 - QA, �� �ܴ� Ź���η� ��ȸ
select deptno, decode(deptno, 10, '���ߺ�', 20, 'QA', 'Ź����'), empno, ename
	from emp;

-- ������̺��� �����ȣ, �����, �μ���ȣ, ����, �μ��� ���ʽ��� ���
-- ��, �μ��� ���ʽ��� 10�� �μ��� ������ 5%, 20���� 10%, 30����  20%, �� �� 15%�� ���
select empno, ename, deptno, sal, decode(deptno, 10, sal*5/100, 20, sal*10/100, 30, sal*20/100, sal*15/100) dept_bonus
	from emp;
