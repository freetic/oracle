--------------- check, not null, default ------------
-- 이름, 나이, 성별, 주소, 입력일을 저장하는 테이블 생성. 이름은 반드시 입력 받아야 하며, 나이는
-- 20대~30대 까지만 입력 가능, 주소는 없을 수 있다. 입력일은 생략되면 추가 시점의 날짜 정보로 추가
create table other_constraints(
	name		varchar2(15) not null,
	age			number(3) check( age between 20 and 39),
	addr    varchar2(300) null,
	input_date date default sysdate
);

select * from user_constraints;
select * from user_tab_cols where table_name='OTHER_CONSTRAINTS';

-- 성공
-- 이름이 입력되고, 나이가 20~30대 사이면 된다.
insert into other_constraints(name, age, addr, input_date)
	values('이선문', 27, '서울시 동작구', sysdate);
--	주소가 없는 경우:
insert into other_constraints(name, age, addr, input_date)
	values('이선문', 27, '', sysdate);
-- 입력일이 없는 경우 : default에 의해 현재 날짜가 추가
insert into other_constraints(name, age, addr)
	values('이선문', 27, '서울시 동작구');
-- Error
-- not null 조건 : 이름에 null이 입력되면
insert into other_constraints(name, age, addr, input_date)
	values('', 30, '지구', sysdate);

-- check조건 : 나이가 20~39가 아닐때
insert into other_constraints(name, age, addr, input_date)
	values('박찬우', 19, '서울시 동작구', sysdate);

select * from other_constraints;

-------------------------------- join --------------------------
---------------------- inner join
-- 사원이 존재하는 모든 부서에 부서번호, 부서명, 위치, 사원번호, 사원명, 연봉, 입사일, 직무 조회
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


-- 제조국이 '국산'인 모든 제조사의 제조국, 제조사, 모델명 조회
select cc.country, cc.maker, cma.model
from car_country cc
inner join car_maker cma
on cc.maker = cma.maker
where country = '국산';

select cc.country, cc.maker, cma.model
from car_country cc, car_maker cma
where ( cc.maker = cma.maker ) and country = '국산';

-- 제조사가 현대인 차량의 제조국, 제조사, 모델명, 연식, 가격, 옵션을 조회
-- 단, 보유중인 차량이 존재하는 경우만 조회
-- ANSI
select cc.country, cc.maker, cma.model, cmo.car_year, cmo.price, cmo.car_option
from car_country cc
inner join car_maker cma
on cma.maker = cc.maker
inner join car_model cmo
on cmo.model = cma.model
where cc.maker = '현대';
-- Oracle
select cc.country, cc.maker, cma.model, cmo.car_year, cmo.price, cmo.car_option
from car_maker cma, car_model cmo, car_country cc
where ( cma.model = cmo.model and cc.maker ) = ( cma.maker and cc.maker ) = '현대';

--차량 옵션에 'ABS'나 '물파리' 가 들어있는 차량의 제조사, 제조국, 모델명, 연식,
-- 가격, 옵션, 입력일, 개월수, 이미지 조회. 단, 가격은 데이터가 존재하는 부분에 대해서만 3자리마다 ,출력
-- 입력일은 년-월-일 형식, 개월수는 입력일로부터 현재까지 몇 개월 지났는지 출력(소수점x)
-- 이미지는 확장자만 출력하고 배기량의 내림차순으로 정렬하되, 배기량이 같다면 가격의 오름차순.
select cma.maker, cc.country, cma.model, cmo.car_year, cmo.cc, to_char(cmo.price, '999,999,999') price, cmo.car_option, to_char(cmo.hiredate, 'yy-mm-dd') hiredate, trunc((select months_between(sysdate, cmo.hiredate) from dual), 0) 개월수,
		 substr(cmo.car_img, instr(car_img, '.')+1) img
	from car_maker cma, car_model cmo, car_country cc
	where ( cma.model = cmo.model and cc.maker = cma.maker ) and (cmo.car_option like '%ABS%' or cmo.car_option like '%물파리%')
	order by cmo.cc desc, cmo.price;

select * from zipcode;
-- 부서번호, 부서명, 위치, 사원번호, 사원명, 연봉, 직무, 우편번호, 시도, 구군, 동, 번지를 조회
-- 사원테이블의 사원번호와 우편번호 테이블의 seq를 조인조건으로 사용
-- 단, 번지가 없다면 '번지없음' 출력
select d.deptno, d.dname, d.loc, e.empno, e.ename, e.sal, e.job, z.zipcode, z.sido, z.gugun,
			z.dong, nvl(z.bunji, '번지없음') bunji
from dept d, emp e, zipcode z
where e.deptno = d.deptno and d.deptno = z.seq;
