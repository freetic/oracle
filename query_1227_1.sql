----------------------------------------View --------------------------------
-- view가 존재하는지 조회
select * from user_views;

-- 부여된 권한 조회 : dba_roles_privs
-- 단순 뷰 생성 : 권한이 부여된 계정만 생성 가능하다. 메롱~
select * from dba_role_privs
where grantee = 'SCOTT';

-- view 생성 권한 부여
grant create view to scott;

-- 단순 view 생성
-- create view emp_view as (select * from cp_emp3);
-- 같은 이름의 뷰가 존재할 할 경우 대체할때에는
-- create or replace 사용
create or replace view emp_view as (select * from cp_emp3);

-- view 사용한 조회
select * from emp_view;

-- view에 추가
insert into emp_view (empno, ename, mgr, job, hiredate, sal)
values(1111, '오원식', 1234, '차장', sysdate, 6000);
-- view에 추가하면 실제 테이블에 반영된다.
select * from cp_emp3;

update emp_view
set job = '부장', sal = 8000
where empno = 1111;

update cp_emp3
set job = '이사', sal = 9900
where empno = 1111;

delete from emp_view where empno = 9;

----------------------------- 다중 View -------------------------
-- update나 delete가 수행 가능하다. 그러나 view를 함수나 계산식으로 만들경우 Error 발생.

-- 제조사, 모델명, 연식, 가격, 배기량, 옵션, 이미지, 입력일을 조회하여
-- car_view 생성
create or replace view car_view
as (select cma.maker, cma.model, cmo.car_year, cmo.price, cmo.cc, cmo.car_option, cmo.car_img, cmo.hiredate
		from car_model cmo, car_maker cma
		where cmo.model = cma.model
		);
select * from car_view;

-- 제조사가 'BMW'인 차량의 모델명, 연식, 가격, 배기량, 옵션, 이미지, 입력일 조회
select *
from car_view
where maker='BMW';

-- 복합View의 insert Eror
insert into car_view(maker, model, car_year, price, cc, car_option, car_img, hiredate)
values('BMW', 7, 2019, 9000, 5000, 'ABS, 등등', ' bmw7.jpg', sysdate);

-- 복랍View의 update
--차량 이미지가 328i.jpg인 차량의 가격을 3000으로 연식은 2019로 변경
update car_view
set price = 3000, car_year = 2019, model = 4
where car_img = '328i.jpg';

-- 복합View의 delete
delete from car_view
where price = 2000 and hiredate = '1012-01-25';

-- 뷰 삭제
drop view car_view;
drop view emp_view;
