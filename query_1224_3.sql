------- outer join : 한 쪽 테이블에만 레코드가 존재해도 조회.
-- 모든 부서의 부서 번호, 부서명, 위치, 사원번호, 사원명, 입사일 조회
-- 단, 사원이 존재하지 않는 부서는 사원번호 - 0, 사원명 - anony, 입사일 - 오늘로 넣어 출력
-- ANSI 문법
select d.deptno, d.dname, d.loc, nvl(e.empno, 0) empno, nvl(e.ename, 'anony') ename, nvl(e.hiredate, sysdate) hiredate
from dept d left join emp e
on e.deptno = d.deptno;
-- Oracle 문법
select d.deptno, d.dname, d.loc, nvl(e.empno, 0) empno, nvl(e.ename, 'anony') ename, nvl(e.hiredate, sysdate) hiredate
from dept d,emp e
where e.deptno (+)= d.deptno;

-- select 제조사가 BMW, 쌍용, 기아인 모든 차량의 제조국, 제조사, 모델명, 가격, 연식을 조회하라.
-- ANSI 문법
select cc.country, cc.maker, cmo.model, cmo.price, cmo.car_year
from car_country cc, car_maker cma left outer join car_model cmo
on cma.model = cmo.model
where cc.maker = cma.maker and cma.maker in('기아','쌍용','BMW');

-- Oracle 문법
select cc.country, cc.maker, cma.model, cmo.price, cmo.car_year
from car_country cc, car_maker cma, car_model cmo
where ( cma.maker = cc.maker and cmo.model (+)= cma.model ) and cma.maker in('기아','쌍용','BMW');

select * from car_country;
select * from car_maker;
select * from car_model;

-- model의 배기량과 zipcode 테이블의 seq를 조인조건으로 사용.
-- 제조국이 '수입'인 모든 차량의 제조국, 제조사, 모델명, 연식, 가격, 옵션, 우편번호, 시도
-- , 구군, 동, 번지 조회
select cc.country, cc.maker, cma.model, cmo.car_year, cmo.price, cmo.car_option, z.sido, z.gugun, z.dong, z.bunji
from car_country cc, car_maker cma, car_model cmo, zipcode z
where cc.maker = cma.maker and cmo.model(+) = cma.model and z.seq(+)=cmo.cc and cc.country='수입';
