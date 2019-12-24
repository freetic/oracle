-------------------- select subquery ------------------
-- �ܼ��� : where��, scalar subquery
-- ������̺��� �μ��� ��ġ�� 'DALLAS' �� �μ��� �ٹ��ϴ� �����
-- �����ȣ, �����, �μ���ȣ, ����, �Ի��� ��ȸ

select empno, ename, deptno, sal, hiredate
	from emp
	where deptno = (select deptno from dept where loc = 'DALLAS');

-- �����Լ��� where������ ���� ��� �� �� ����.
-- subquery�� ����ϸ� �����ϴ�.
-- ������̺��� ���� ������ ���� �޴� ����� �����ȣ, �����, ����, �Ի����� ��ȸ
select empno, ename, sal, hiredate
	from emp
	where sal = (select max(sal) from emp);

-- scalar subquery : ��ȸ �÷��� �������� ����
-- �����ȣ, �����, �μ���ȣ, ��ġ, �μ��� ��ȸ
select empno, ename, deptno, (select loc from dept where emp.deptno = dept.deptno) loc,
			(select dname from dept where dept.deptno = emp.deptno) dname
from emp;

-- cp_emp3 ���̺� �Ʒ��� ���� ���ڵ� �߰�
-- �����ȣ : ���� ū ��ȣ ���� ��ȣ�� �߰�, ����� :  �հǸ�, �Ŵ��� : 1234, job : �븮,
-- �Ի���: ����, ����: emp���̺��� �����ȣ�� 7499�� ����� ������ ������ �������� �߰�
create table cp_emp3 as (select empno, ename, mgr, job, hiredate, sal from emp);

insert into cp_emp3 values((select empno from cp_emp3 where empno = (select max(empno) from cp_emp3))+1,
	'�հǸ�', 1234, '�븮', sysdate, (select sal from cp_emp3 where sal = (select sal from cp_emp3 where empno = 7499)));
select * from cp_emp3;
delete from cp_emp3 where mgr = 1234;
commit;

-- inline(��ȸ �� ���)�� ����� �ٽ� inline view ��ȸ
-- inline : ���� ���� ���ڵ忡�� �����κ��� ���ڵ带 �˻��Ҷ� ���.
-- ������̺��� (14�� ���ڵ�) ���� �������� �Ի��� ������� 10�� ������ �Ի��� �����
-- �����ȣ, �����, �Ի���, �μ���ȣ, ������ȸ

-- * ���� ������ ����� �� alias�� ������ inline view�� alias������ �����Ǳ� ������
-- �ٱ� ���������� alias�θ� �ش� �÷��� ���� �� �� �ֵ�.

-- rownum�� select���� �����ǰ� ���ȴ�.

-- alias�� where������ ��� �� �� �����Ƿ� alias�� ���� �÷����� �νĽ��� where������ 1�� �̿���
-- ��ȣ�� ��ȸ �� �� �ְ� ����.
select rnum,  empno, ename, hiredate, deptno, sal
from(
select rownum rnum,  empno, ename, hiredate, deptno, sal -- ���� ������ �Ի��� ������� 1�� �ο�
from (select empno, ename, hiredate, deptno, sal  -- ���� �������� �Ի��� ����� ���� ���� ����
	from emp
	order by hiredate desc)
	where  rownum <= 10)
	where rnum between 2 and 10;
	--	where hiredate = (select hiredate from emp where rownum between 1 and 10 order by hiredate);

select *
from (select row_number() over (order by hiredate desc) r, empno, ename, hiredate, deptno, sal
from emp)
where r between 2 and 10;

-- subquery�� ��ȸ�� ����� ���� �� �� �ܺ� ������ ����
-- 1980�⵵�� �Ի��� ����� �����ϴ� ��� ��� ����� �����ȣ, �����, �Ի���, ���� ��ȸ
select empno, ename, hiredate, sal
from emp
where exists(select * from emp where to_char(hiredate, 'yyyy') = 1980);


-------------------------- union ----------------------------
--
select from emp;
insert into cp_emp3 (select empno, ename, mgr, job, hiredate, sal from emp where deptno = 10);
select * from cp_emp3;
-- emp - �̱�����, cp_emp3 - �ѱ� ����
-- �ѱ� ������ �����ȣ, �����, ����, �Ի���, ������ �̱� ���翡 �ٹ��ϴ�
-- ����� �����ȣ, �����, ����, �Ի���, ������ ��ȸ�Ͻÿ�.
select empno, ename, job, hiredate, sal from emp
union
select empno, ename, job, hiredate, sal from cp_emp3;


-- Į������ �޶� �ȴ�.
select empno, ename, job, hiredate, sal from emp
union
select empno, job, ename, sysdate, sal from cp_emp3;

select * from user_constraints;
