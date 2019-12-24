--����
--1. ��� ���̺����� '10' �μ��� �ƴϸ鼭 ������ 1000�̻� 3000������
--��� �������  �����ȣ,�����, �Ի���,�μ���ȣ, ������ ��ȸ�ϼ���.
select empno, ename, hiredate, deptno, sal
	from emp
	where deptno != 10 and sal >= 1000 and sal <= 3000;

--2. ��� ���̺����� ���ʽ��� �����ϴ� �������  �����ȣ,�����,
--    ����,���ʽ�, �Ѽ��ɾ�, ������ ��ȸ �ϼ���.
--    - ������ ������ 12������ ���� ����ϼ���.
select empno, ename, sal, comm, sal+nvl(comm, 0) �Ѽ��ɾ�, trunc(sal/12, 2)
	from emp;

--3.  ��� ���̺����� �μ���ȣ�� 10,30��  ������� �����, �����ȣ
--    �Ի���, ������ ��ȸ �ϼ���.
--    -��, �����  xxxx�� xxxx����� xxxx�⿡ �Ի��Ͽ��� ������ xxx$�Դϴ�.
--        �� �������� �ϰ�, �÷����� OUTPUT ���� �����Ұ�.
select empno || '�� ' || ename || '����� ' || hiredate || '�⿡ �Ի��Ͽ��� ������ ' || sal || '$�Դϴ�.' OUTPUT
	from emp
	where deptno = 10 or deptno = 30;

--4. ��� ���̺����� ������ 3000 �̸��� ������� �����ȣ, �����,
--   �Ի���, ����,����, �μ���ȣ�� ��ȸ �ϼ���.
select empno, ename, hiredate, sal, job, deptno
	from emp
	where sal < 3000;

--5. �Ʒ��� �����͸� �����Ͽ� test_like1 ���̺��� �����ϰ�
--    ���ڵ带�߰��Ұ�.
--    1, ����������,����� ���۱� �󵵵�,'�����'
--    2, ���븸,����� ���빮�� ���빮1��,'��Ÿ��'
--    3, ���¼�,����� ���빮�� ���빮2��,'�����'
--    4, ������,����� ���۱� �󵵵�,'������'
create table test_like1(
num number(4),
name varchar2(60),
addr varchar2(300),
school varchar2(60)
);
insert into test_like1 values(1, '����������', '����� ���۱� �󵵵�', '�����');
insert into test_like1 values(2, '���븸', '����� ���빮�� ���빮1��', '��Ÿ��');
insert into test_like1 values(3, '���¼�', '����� ���빮�� ���빮2��', '�����');
insert into test_like1 values(4, '������', '����� ���۱� �󵵵�', '������');
--6. test_like1 ���̺����� '�����'�� �����ϴ� �л���  ��ȣ,�л���,
--    �ּ�, �б������� �Ʒ���  ���� �������� ����ϰ�
--     �÷����� ��ҹ��� �����Ͽ� Output����  �Ұ�.
--    ������� :  ��ȣ : x, �̸� : xx, �ּ� : xx, �б� : xx
select '��ȣ : ' || num || ', �̸� : ' || name || ', �ּ� : ' || addr || ', �б� : ' || school "Output"
	from test_like1
	where addr like '%�����%';
--7. ������̺����� ������� 4�����̰ų� ������ 2000�̻��� �����
--   �����ȣ, �����, ����, �Ի���, �μ���ȣ, ������ ��ȸ�Ұ�.
select empno, ename, sal, hiredate, deptno, job
	from emp
	where ename = '____' or sal >= 2000;

--8. ��� ���̺����� �����ȣ, �����, �Ի���, ����, ���⿬����
--    ��ȸ �ϼ���.
--    ���� ������ ���� �������� 7% ���� �ݾ����� ����Ͽ� ����Ұ�.
select empno, ename, hiredate, sal, sal*1.07 next_sal
	from emp;

--9. ��� ���̺����� ������� 5�����̸鼭 ����° ���ڿ� 'A'�� ���
--    �� ����� �����, �����ȣ, �Ի���, ����,  �� ���ɾ�, ���ļ��ɾ��� ��ȸ�ϼ���.
--   ��, �� ���ɾ��� ����+���ʽ��� �ջ� �ݾ��̰�, ���ļ��ɾ��� �� ���ɾ׿���
--    3.3%�� ������ �Ǽ��ɾ��� ����Ѵ�.
select empno, ename, hiredate, sal, sal+nvl(comm, 0) "�� ���ɾ�", (sal+nvl(comm, 0))*96.7/100 "���� ���ɾ�"
	from emp
	where ename like '__A__';
--10. ��� ���̺����� ������� 'A'�� �����ϸ鼭 ������ 1600�̻���
--     ����� �����,����,����, �Ŵ�����ȣ, �Ի����� ��ȸ �Ұ�.
select ename, sal, job, mgr, hiredate
	from  emp
	where ename like 'A%' and sal >= 1600