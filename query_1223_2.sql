------------------------ 제약사항 -------------------
-- user_constraints (테이블명, 제약사항명, 제약사항종류) 확인 가능
select * from user_constraints;
-- default : user_tab_cols (테이블명, 컬럼명, 데이터형, 크기, ... 디폴트 등) 확인 가능
select * from user_tab_cols;

------------------------- primary key 생성 -----------------------------
-- null 허용하지 않으면서 값이 존재한다면 유일해야 할 때 사용.
-- 컬럼단위
create table primary_column(
	id varchar2(14) constraint pk_primary_column primary key,
	name varchar2(15),
	age number
);
drop table primary_column;

insert into primary_column(id, name) values('test', 'test');
insert into dept(deptno) values(10);
select * from user_constraints;
select * from user_indexes;

-- 추가 성공 : null이 아니면서 최초입력.
insert into primary_column(id, name, age) values('park', '박찬우', 27);
commit;

insert into primary_column(id, name, age) values('wang', '왕건모', 25);
select * from primary_column;
commit;

-- Error
-- 이전의 값과 동일한 아이디 추가 시 실패
insert into primary_column(id, name, age) values('wang', '김승주', 27);
-- null 입력시 실패
insert into primary_column(id, name, age) values('', '김승주', 27);
insert into primary_column(name, age) values('김승주', 27);
insert into primary_column(id, name, age) values('', '김승주', 27);

---------- 테이블 단위 제약사항
create table primary_table(
	name varchar2(15),
	ssn char(14),
	hobby varchar2(30),
	constraint pk_primary_table primary key(ssn)
);

-- 여러개의 컬럼이 하나의 PK를 가질 때. (LOT 번호관리, 생산물관리)
-- 식별에 1 : n 관계 설정
-- 테이블단위 제약사항만 설정가능 : 모든 컬럼에 동일 값이 입력될 때만 에러 발생.
create table primary_multi(
	item_no char(5),
	item varchar2(30),
	item_info varchar2(4000),
	input_date date,
	constraint pk_primary_multi primary key(item_no, item)
);

-- 추가 성공 : 최초 데이터 null이 아니면서 추가
insert into primary_multi(item_no, item, item_info, input_date)
values('M0001', '미사일', '앞에 가는 차량을 조준하여 발사', sysdate);
-- 추가 성공 : 이 전의 데이터와 다른 경우
insert into primary_multi(item_no, item, item_info, input_date)
values('M0002', '미사일', '앞에 가는 차량을 조준하여 발사', sysdate);
insert into primary_multi(item_no, item, item_info, input_date)
values('W0001', '물폭탄', '앞에 가는 차량을 거리를 계산하여 발사. 쉴드로 커버 가능', sysdate);

--에러 : 모든 키 컬럼에 값이 같을때, null 값이 들어갔을때
insert into primary_multi(item_no, item, item_info, input_date)
values('M0001', '미사일', '앞에 가는 차량을 조준하여 발사', sysdate);
insert into primary_multi(item_no, item, item_info, input_date)
values('', '쉴드', '보호막', sysdate);


select * from primary_multi;
