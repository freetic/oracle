------------------ 시퀀스 : 증가하는 번호를 사용하는 객체
-- 1 ~ 9999999999까지 1씩 증가하는 시퀀스 생성
create sequence seq_test
increment by 1
start with 1
maxvalue 9999999999
cache 30
cycle;

-- nextval : 시퀀스가 Server Instance에 존재하지 않으면 시퀀스의 번호를 변경하고
-- Server Inantance에 시퀀스 객체를 올리는 일을 한다.
select seq_test.nextval 다음
from dual;
-- currval : 시퀀스의 현재 번호 얻기 : 시퀀스가 Server Instance에 존재하지 않으면 Error 발생.
select seq_test.currval 현재
from dual;

select * from user_sequences; -- last_number는 nextval이 꺼내지는 number

-- 시퀀스 삭제
drop sequence seq_test;


-- 서버가 종료되면 번호가 사라지고, 추가 실패 하면 번호가 사라진다. (번호가 넘어가버림)

select * from cp_emp3;
--
insert into cp_emp3(empno, ename) values(seq_test.nextval, '테스트');


-- dual 테이블을 사용하여 : S_000000001(0 8개)의 형식을 가진 번호를 얻기.
select concat('S_', lpad(seq_test.nextval, 2, 0))
from dual;

insert into PRIMARY_MULTI(item_no, item)
	values(concat('S_', lpad(seq_test.nextval, 2, 0)), '테스트');
select * from primary_multi;

-- car_country, car_maker, car_model 테이블을 분석하여 pk와 fk를
-- alter로 올바르게 추가.
alter table car_country add constraint pk_car_country primary key(maker);
alter table car_maker add constraint pk_car_maker primary key(model);
alter table car_maker add constraint fk_maker foreign key(maker) references car_country(maker);
alter table car_model add constraint fk_model foreign key(model) references car_maker(model);
alter table car_model add column no num(10);
