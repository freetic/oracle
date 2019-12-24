-- Foreign key : 다른 테이블의 컬럼 값으로만 값을 저장 해야 할 때 사용.

insert into primary_column(id, name, age) values('kim', '김승주', 27);
insert into primary_column(id, name, age) values('choi', '최주', 27);

-- id를 가진 학생의 학생 개인 정보를 저장하는 테이블 생성
-- on delete cascade 를 설정하면 부모테이블의 레코드가 삭제될 때
-- 자식테이블의 모든 레코드를 같이 삭제한다.
create table foreign_column(
	r_id varchar2(14) constraint fk_r_id references primary_column(id)
		on delete cascade,
	phone varchar2(13),
	email varchar(50)
);

select * from user_constraints;
-- 추가 성공
-- 부모 테이블에 존재하는 컬럼값으로 추가 할 때.
insert into foreign_column(r_id, phone, email) values('kim', '010-123-4567', 'park@test.com');
-- 부모테이블에 존재하는 컬럼값으로 여러개 추가 할 때.
insert into foreign_column(r_id, phone, email) values('park', '010-111-9999', 'park@test.com');
insert into foreign_column(r_id, phone, email) values('wang', '010-3333-2222', 'wang@sist.com');
-- null 허용
insert into foreign_column(r_id, phone, email) values('', '', null);
insert into foreign_column(phone, email) values('017-000-0000', 'bbb@bbb.com');



-- error 발생
--부모 테이블에 존재하지 않는 값으로 추가 할 때.
insert into foreign_column(r_id, phone, email) values('test', '000-0000-0000', 'xxx@xxxx.com');

-- 부모테이블은 참조하는 자식 레코드가 존재하면 삭제되지 않는다.
delete from primary_column where id = 'wang';
delete from primary_column where id = 'park';
-- 부모테이블은 참조하는 자식 레코드가 존재하지 않으면 삭제된다.
delete from primary_column where id = 'choi';
commit;
rollback;

-- 삭제하려면 1. 자식 레코드를 모두 삭제하고 2. 부모 레코드를 삭제한다.
delete from foreign_column where r_id = 'wang';
delete from primary_column where id = 'wang';

drop table foreign_column;

select * from primary_column;
select * from foreign_column;

---------------- 테이블 단위 제약사항
create table foreign_table(
	r_id 					varchar2(14),
	oracle_score	number(3),
	java_score		number(3),
	constraint fk_foreign_table_r_id foreign key(r_id) references primary_column(id)
);

select * from user_constraints;
                                          


--------------------------- unique ------------------
-- 컬럼의 값이 없을 수 도 있으나,  값이 존재한다면 유일해야 할 때 사용.
-- 컬럼단위
create table unique_column(
  name varchar2(10),
  age number(3),
  email varchar2(50)	
);
