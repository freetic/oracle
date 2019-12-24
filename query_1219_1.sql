-- �ߺ�����
-- distinct : error�� �߻����� �ʴ´�.
-- ��� ���̺��� �Ŵ��� ��ȣ�� ��ȸ.
-- ��, �ߺ��Ǵ¸Ŵ��� ��ȣ�� ������� �ʴ�.
-- ���� ���ڵ尡 ��ȸ�Ǵ� �÷��� ���� ���Ǹ� �ߺ������� ���� ���Ѵ�.
select distinct mgr /*, empno*/
	from emp
	where mgr is not null;

-- group by
-- ������̺��� �Ŵ��� ��ȣ�� ��ȸ.
-- ��, �ߺ��Ǵ� �Ŵ��� ��ȣ�� ������� �ʴ´�.
-- ���� : group by �� ���ǵ��� ���� �÷��� �˻��� ���Ǹ� Error �߻�. ���� �Լ� �����.
select mgr
	from emp
	where mgr is not null
	group by mgr;

-- ��� ���̺��� ������ ��ȸ
-- ��, ���� ������ ��� ���� �ʴ´�.
select sal
	from emp
	group by sal;

-- �׷����� ���� ���� : having
-- ��� ���̺��� �μ� �ο��� 4�� �̻��� �μ� ��ȣ ��ȸ
-- ���� �μ� ��ȣ�� ������� �ʴ´�.
select deptno, count(deptno)
	from emp
	group by deptno
	having count(deptno) >= 4;

select length(ename)
	from emp;

select *
	from dual;

select '������' name, 25
from dual;

----------------- ���ڿ� �Լ� -------------------
-- ���ڿ��� ����
select length('������ ����� �Դϴ�.')
	from dual;
-- ��� ���̺��� ��� ���� 4�� �̻��� ����� ��� ���� ��ȸ
select ename || '(' || length(ename) || ')'
	from emp
	where length(ename) >= 4;

-- �빮��, �ҹ��� ��ȯ
select upper('AbcdEfg'), lower('AbCdEfg')
	from dual;

-- ��� ���̺��� ������� scott�� ����� �����ȣ, �����, ����, �Ի��� ��ȸ
select empno, ename, sal, hiredate
	from emp
	where ename = upper('scott');

-- ���ڿ� ����
select concat('Oracle', ' Java'), 'Oracle'||' Java'
	from dual;

select concat(concat(ename, '_'), job), ename||'_'||job
	from emp;

--  ù���ڸ� �빮�ڷ�
select initcap('java'), initcap('i am a boy'), initcap('OASD')
	from dual;

-- ���ڿ��� �ε��� ���
-- ã�� ���ڿ��� ���ٸ� 0 ��ȯ
select instr('ABCDEF', 'C'), instr('ABCDEF', 'G')
	from dual;

-- ��� ���̺��� ����� 'A'�� �ִ� ����� A�� �ε�����, �׷��� ������ 0 ��ȸ�� �׷��� ���� �����
select ename, instr(ename, 'A')
	from emp
	where instr(ename, 'A') <> 0;

-- ���ڿ� �ڸ���
select substr('ABCDEFG', 2, 4), substr('ABCDEFG',1 , 5), substr('�����ٶ󸶹ٻ�', 2, 2),
	substr('freetic1004@naver.com', 1, 11) email, substr('freetic1004@naver.com', 13) domain
	from dual;

insert into student(num, name, age, phone, email, gender, addr, input_date, birth_year)
values(2, '�̼���', 28, '010-8681-8761', 'lee8761@daum.net', 'M','����', sysdate, 1990);

insert into student(num, name, age, phone, email, gender, addr, input_date, birth_year)
values(3, '�հǸ�', 25, '010-1234-3461', 'wang3461@daum.net', 'M','���', sysdate, 1990);

-- �л� ���̺��� �л���, �̸����ּ�, �������ּ� ��ȸ
select name, email, substr(email, instr(email, '@')+1) domain
	from student;

-- ���ڿ� ��������
-- �յڰ���, �� ����, �� ����
-- �յڿ� ���� ���ڿ��� �����ϴ� ��� : trim('������ ����' from '���ڿ�')
select '[' || trim('    A   BC   ') || ']' trim, '[' || ltrim('    A   BC   ') || ']' ltrim, '[' || rtrim('    A   BC   ') || ']' rtrim,
			trim('s' from 'asasasaOaaaOsasssss')
	from dual;

-- ���ڿ� ä���
-- ���ڿ� �� ä��� : lpad(), rpad()
-- ä�� ���ڿ��� �ѱ��� ��� 1�ڿ� 2byte�� ����Ѵ�.
select lpad('ABCDEFG', 10, '~') "lpad", rpad('ABC', 10, '��') "rpad"
	from dual;

select
	from;

alter table student modify num number(10);

insert into student(num) values(15);
insert into student(num) values(109);
insert into student(num) values(1521);
insert into student(num) values(19);

select * from student;

-- �л����̺��� �й��� �����ִµ� ��ü 12�ڸ��Ͽ� �Ʒ��� ���� �������� ��ȣ ���
-- SIST_0000001
select 'SIST_' || lpad(num,7 ,'0') �й�, name
	from student;

-- ġȯ
select replace('ABCDEFABDD', 'D', 'P'),
	replace('������,ȭ����,������,�����','����', '��'), 
	'[' || replace('        A  BC      ') || ']'
	from dual;

select hiredate
	from emp;            

--