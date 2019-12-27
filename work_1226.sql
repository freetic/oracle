--숙제.
--1. 배기량이 1500~3000 사이인 차량의 제조국,제조사,모델명,년식,가격,
--    이미지,입력일,배기량, 옵션을 조회
--   단. 출력은 배기량의 내림차순 정렬했을때 3~6번째 레코드만 조회하고,
--     옵션은 처음 ',' 까지만 출력 할것. 가격과 연식은 3자리마다 ,를 넣어출력,
--     입력일은 월-일-년 의 형식으로 출력 할것.
select country, maker, model, car_year, price, car_img, hiredate, cc, car_option
from (select rownum r, cc.country, cma.maker, cma.model, cmo.car_year, cmo.price, cmo.car_img, cmo.hiredate, cmo.cc, cmo.car_option
from car_country cc, car_maker cma, car_model cmo
where cma.maker = cc.maker and cmo.model = cma.model
order by cc desc)
where r between 3 and 6;

--2. 부서번호가 10과 30,40번인
--모든 부서의 사원번호,사원명,입사일,연봉,연봉순위,부서명,부서번호,위치, 우편번호,시도, 구군,동,번지 를 조회.
--  단,출력은 사원번호의 오름차순으로 정렬했을 때 2~5번째 레코드만 출력,
--   우편번호는 '-' 뒤부터 끝까지 출력, 번지가 없다면 '번지없음'으로 대체
--  하여 출력 ,입사일은 월-일-년 요일까지 출력
select empno, ename, to_char(hiredate, 'mm-dd-yyyy dy'), sal, r sal_rank, dname, deptno, loc, nvl(substr(zipcode, instr(zipcode, '-')+1), '번지없음'), sido, gugun, dong, bunji
from (select rownum rr, r,empno, ename, hiredate, sal, dname, deptno, loc, zipcode, sido, gugun, dong, bunji
from (select rownum r, empno, ename, hiredate, sal, rn, dname, deptno, loc, zipcode, sido, gugun, dong, bunji
from ( select rownum rn, e.empno, e.ename, e.hiredate, e.sal, d.dname, d.deptno, d.loc, zc.zipcode, zc.sido, zc.gugun, zc.dong, zc.bunji
from emp e, dept d, zipcode zc
where (e.deptno = d.deptno and zc.seq = e.deptno) and (d.deptno = 10 or d.deptno = 30 or d.deptno=40)
order by sal desc
)
order by empno))
where rr between 2 and 5;

--3. 차량의 제조사가 '현대','기아','삼성','BMW','AUDI'이고 옵션에 'ABS','TCS'가
-- 있는 차량의  제조국, 제조사,모델명, 연식,가격, 옵션, 이미지, 배기량 조회
--  --단, 연식의 내림차순 정렬하고, 연식이 같다면 가격의 내림차순으로 정렬
--   하여 출력, 이미지는 이미지명과 확장자를 구분하여 출력할것,
--   제조사명이 영어라면 Bmw, Audi 의 형식으로 출력 .
select cc.country, decode(cc.maker, 'BMW', initcap(cc.maker), 'AUDI', initcap(cc.maker), cc.maker) maker,
	cmo.model, cmo.car_year, cmo.price, cmo.car_option, substr(cmo.car_img, 1, instr(cmo.car_img, '.')-1) img_name, substr(cmo.car_img, instr(cmo.car_img, '.')+1) img_ext, cmo.cc
from car_country cc, car_maker cma, car_model cmo
where (cma.maker = cc.maker and cmo.model = cma.model) and  cc.maker in ('현대', '기아', '삼성', 'BMW', 'AUDI') and (cmo.car_option like '%ABS%' or cmo.car_option like '%TCS%')
order by cmo.car_year desc, cmo.price desc;


--4. 모델명이 'K5','아반테', '소렌토','A8','SM3' 인 차량의 모델명, 제조국,
--  제조사,가격,연식을 아래와 같은 형식의 문장으로 출력.
--  단, 출력 가격의 오름차순을 정렬했을 때 2~7 사이의 레코드만 출력,
--   [모델명] 차량의 연식은 [ xxxx ]이고, 제조국은 [국산|수입]이며,
--   [XX]사가 제조사입니다. 가격은 [0,000,000]원 입니다.

select '[' || model || '] 차량의 연식은 [' || car_year || ']이고, 제조국은 [' || country || ']이며, [' || maker || ']사가 제조사입니다. 가격은 [' || to_char(price, '0,000,00') || ']원 입니다.' car_info
from (select rownum r, cma.model, cc.country, cma.maker, cmo.price, cmo.car_year
from car_country cc, car_maker cma, car_model cmo
where cma.maker = cc.maker and cmo.model = cma.model
order by cmo.price)
where r between 2 and 7                  ;

update car_model
set car_img = 'qm5_005.jpg'
where car_img='qm5_005.jpg,qm5_006.jpg';

--5. 제조사가 '현대'인 차량의 년식, 모델명, 연식별 총가격을 조회.
select cmo.car_year, cmo.model, sum(cmo.price) over(order by car_year)
from car_country cc, car_maker cma, car_model cmo
where cma.maker = cc.maker and cmo.model = cma.model and cma.maker = '현대';


select * from car_model;

--6. 사원명이 'S'로 끝나거나 이름5자이면서 세번째 글자가 'A'인
--   사원의  사원번호, 사원명, 입사일,연봉,세금, 실수령액, 연봉인상액,
--   부서번호,부서명,위치,우편번호,시도, 구군,동,번지 를 조회
--   단,실수령액은 연봉+퇴직금+보너스-세금(연봉 3.3) 로 계산
--     연봉인상액은 부서번호에 따라 차등 인상
--     10- 년봉 7%, 20- 년봉 4%, 30- 년봉+보너스 10%, 그외 3%로
--     계산하여 3자리마다 ,를 넣어 출력.
--     모든 영어는 소문자로 출력.
select e.empno, lower(e.ename), e.hiredate,  e.sal, sal*3.3/100 tax, to_char(sal+(sal*0.1)+nvl(comm, 0)-(sal*3.3/100), '9,999,999') real_sal, decode(e.deptno, 10, sal*7/100, 20, sal*4/100, 30, sal*0.1, sal*3/100) sal_up, d.deptno, lower(d.dname), lower(d.loc), z.zipcode, z.sido, z.gugun, z.dong, z.bunji
from emp e, dept d, zipcode z
where e.deptno = d.deptno and d.deptno = z.seq and (e.ename like '%S' or ( length(e.ename) = 5 and substr(e.ename, 3, 3) = 'A' ));

--7. 아래 제시된 Data Dictionary를 파악하고 조건절에 입력되는 테이블 명이 들어어오면
--   해당 테이블에 컬럼명,데이터형, 크기, 기본값, 제약사항명을  조회
--    단, 크기는 숫자인 경우 22자가 아닌 실제 크기를 출력할 것.
--	user_tab_cols utc , user_cons_columns ucc,user_constraints uc
select utc.column_name, utc.data_type, decode(utc.data_type, 'NUMBER', ceil(utc.data_length/2)+1, utc.data_length) siz_e, utc.data_default data_default, decode(uc.constraint_type, 'P', 'primary key', 'R', 'foreign key', 'C', 'check_or_not_null', 'U', 'unique', '제약사항X') const
from user_tab_cols utc, user_cons_columns ucc, user_constraints uc
where utc.column_name = ucc.column_name and utc.table_name = uc.table_name;

select *
from user_tab_cols;
select *
from user_cons_columns;
select *
from user_constraints;
commit;
