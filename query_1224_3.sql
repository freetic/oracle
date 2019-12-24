------- outer join : �� �� ���̺��� ���ڵ尡 �����ص� ��ȸ.
-- ��� �μ��� �μ� ��ȣ, �μ���, ��ġ, �����ȣ, �����, �Ի��� ��ȸ
-- ��, ����� �������� �ʴ� �μ��� �����ȣ - 0, ����� - anony, �Ի��� - ���÷� �־� ���
-- ANSI ����
select d.deptno, d.dname, d.loc, nvl(e.empno, 0) empno, nvl(e.ename, 'anony') ename, nvl(e.hiredate, sysdate) hiredate
from dept d left join emp e
on e.deptno = d.deptno;
-- Oracle ����
select d.deptno, d.dname, d.loc, nvl(e.empno, 0) empno, nvl(e.ename, 'anony') ename, nvl(e.hiredate, sysdate) hiredate
from dept d,emp e
where e.deptno (+)= d.deptno;

-- select �����簡 BMW, �ֿ�, ����� ��� ������ ������, ������, �𵨸�, ����, ������ ��ȸ�϶�.
-- ANSI ����
select cc.country, cc.maker, cmo.model, cmo.price, cmo.car_year
from car_country cc, car_maker cma left outer join car_model cmo
on cma.model = cmo.model
where cc.maker = cma.maker and cma.maker in('���','�ֿ�','BMW');

-- Oracle ����
select cc.country, cc.maker, cma.model, cmo.price, cmo.car_year
from car_country cc, car_maker cma, car_model cmo
where ( cma.maker = cc.maker and cmo.model (+)= cma.model ) and cma.maker in('���','�ֿ�','BMW');

select * from car_country;
select * from car_maker;
select * from car_model;

-- model�� ��ⷮ�� zipcode ���̺��� seq�� ������������ ���.
-- �������� '����'�� ��� ������ ������, ������, �𵨸�, ����, ����, �ɼ�, �����ȣ, �õ�
-- , ����, ��, ���� ��ȸ
select cc.country, cc.maker, cma.model, cmo.car_year, cmo.price, cmo.car_option, z.sido, z.gugun, z.dong, z.bunji
from car_country cc, car_maker cma, car_model cmo, zipcode z
where cc.maker = cma.maker and cmo.model(+) = cma.model and z.seq(+)=cmo.cc and cc.country='����';
