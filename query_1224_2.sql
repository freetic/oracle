--------------- check, not null, default ------------
-- �̸�, ����, ����, �ּ�, �Է����� �����ϴ� ���̺� ����. �̸��� �ݵ�� �Է� �޾ƾ� �ϸ�, ���̴�
-- 20��~30�� ������ �Է� ����, �ּҴ� ���� �� �ִ�. �Է����� �����Ǹ� �߰� ������ ��¥ ������ �߰�
create table other_constraints(
	name		varchar2(15) not null,
	age			number(3) check( age between 20 and 39),
	addr    varchar2(300) null,
	input_date date default sysdate
);

select * from user_constraints;
select * from user_tab_cols where table_name='OTHER_CONSTRAINTS';

-- ����
-- �̸��� �Էµǰ�, ���̰� 20~30�� ���̸� �ȴ�.
insert into other_constraints(name, age, addr, input_date)
	values('�̼���', 27, '����� ���۱�', sysdate);
--	�ּҰ� ���� ���:
insert into other_constraints(name, age, addr, input_date)
	values('�̼���', 27, '', sysdate);
-- �Է����� ���� ��� : default�� ���� ���� ��¥�� �߰�
insert into other_constraints(name, age, addr)
	values('�̼���', 27, '����� ���۱�');
-- Error
-- not null ���� : �̸��� null�� �ԷµǸ�
insert into other_constraints(name, age, addr, input_date)
	values('', 30, '����', sysdate);

-- check���� : ���̰� 20~39�� �ƴҶ�
insert into other_constraints(name, age, addr, input_date)
	values('������', 19, '����� ���۱�', sysdate);

select * from other_constraints;

-------------------------------- join --------------------------
---------------------- inner join
-- ����� �����ϴ� ��� �μ��� �μ���ȣ, �μ���, ��ġ, �����ȣ, �����, ����, �Ի���, ���� ��ȸ
--ANSI
select d.deptno, d.dname, d.loc, e.empno, e.ename, e.sal, e.hiredate, e.job
from emp e
inner join dept d
on e.deptno=d.deptno;

-- Oracle inner join
select d.deptno, d.dname, d.loc, e.empno, e.ename, e.sal, e.hiredate, e.job
from emp e, dept d
where e.deptno=d.deptno;

select * from car_country;
select * from car_maker;
select * from car_model;


-- �������� '����'�� ��� �������� ������, ������, �𵨸� ��ȸ
select cc.country, cc.maker, cma.model
from car_country cc
inner join car_maker cma
on cc.maker = cma.maker
where country = '����';

select cc.country, cc.maker, cma.model
from car_country cc, car_maker cma
where ( cc.maker = cma.maker ) and country = '����';

-- �����簡 ������ ������ ������, ������, �𵨸�, ����, ����, �ɼ��� ��ȸ
-- ��, �������� ������ �����ϴ� ��츸 ��ȸ
-- ANSI
select cc.country, cc.maker, cma.model, cmo.car_year, cmo.price, cmo.car_option
from car_country cc
inner join car_maker cma
on cma.maker = cc.maker
inner join car_model cmo
on cmo.model = cma.model
where cc.maker = '����';
-- Oracle
select cc.country, cc.maker, cma.model, cmo.car_year, cmo.price, cmo.car_option
from car_maker cma, car_model cmo, car_country cc
where ( cma.model = cmo.model and cc.maker ) = ( cma.maker and cc.maker ) = '����';

--���� �ɼǿ� 'ABS'�� '���ĸ�' �� ����ִ� ������ ������, ������, �𵨸�, ����,
-- ����, �ɼ�, �Է���, ������, �̹��� ��ȸ. ��, ������ �����Ͱ� �����ϴ� �κп� ���ؼ��� 3�ڸ����� ,���
-- �Է����� ��-��-�� ����, �������� �Է��Ϸκ��� ������� �� ���� �������� ���(�Ҽ���x)
-- �̹����� Ȯ���ڸ� ����ϰ� ��ⷮ�� ������������ �����ϵ�, ��ⷮ�� ���ٸ� ������ ��������.
select cma.maker, cc.country, cma.model, cmo.car_year, cmo.cc, to_char(cmo.price, '999,999,999') price, cmo.car_option, to_char(cmo.hiredate, 'yy-mm-dd') hiredate, trunc((select months_between(sysdate, cmo.hiredate) from dual), 0) ������,
		 substr(cmo.car_img, instr(car_img, '.')+1) img
	from car_maker cma, car_model cmo, car_country cc
	where ( cma.model = cmo.model and cc.maker = cma.maker ) and (cmo.car_option like '%ABS%' or cmo.car_option like '%���ĸ�%')
	order by cmo.cc desc, cmo.price;

select * from zipcode;
-- �μ���ȣ, �μ���, ��ġ, �����ȣ, �����, ����, ����, �����ȣ, �õ�, ����, ��, ������ ��ȸ
-- ������̺��� �����ȣ�� �����ȣ ���̺��� seq�� ������������ ���
-- ��, ������ ���ٸ� '��������' ���
select d.deptno, d.dname, d.loc, e.empno, e.ename, e.sal, e.job, z.zipcode, z.sido, z.gugun,
			z.dong, nvl(z.bunji, '��������') bunji
from dept d, emp e, zipcode z
where e.deptno = d.deptno and d.deptno = z.seq;
