------- outer join : �� �� ���̺��� ���ڵ尡 �����ص� ��ȸ.
-- ��� �μ��� �μ� ��ȣ, �μ���, ��ġ, �����ȣ, �����, �Ի��� ��ȸ
-- ��, ����� �������� �ʴ� �μ��� �����ȣ - 0, ����� - anony, �Ի��� - ���÷� �־� ���
select d.deptno, d.dname, d.loc, nvl(e.empno, 0) empno, nvl(e.ename, 'anony') ename, nvl(e.hiredate, sysdate) hiredate
from dept d left join emp e
on e.deptno = d.deptno;

-- select �����簡 BMW, �ֿ�, ����� ��� ������ ������, ������, �𵨸�, ����, ������ ��ȸ�϶�.
select cc.country, cc.maker, cmo.model, cmo.price, cmo.car_year
from car_country cc, car_maker cma left join car_model cmo
on cma.model = cmo.model
where cc.maker = cma.maker and cma.maker in('���','�ֿ�','BMW');

select * from car_maker;
select * from car_model;
