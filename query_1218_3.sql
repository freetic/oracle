create table test_like(
	name varchar2(15),
	address varchar2(300byte)
);

insert into test_like values('최승현', '서울시 강남구 역삼동');
insert into test_like values('김승주', '서울시 동대문구 동대문동');
insert into test_like values('김소현', '서울시 강남구 논현 3동');
insert into test_like values('김승현', '경기도 수원시 염통구');
insert into test_like values('김율', '경기도 용인시 용인동');
insert into test_like values('선우용녀', '충청남도 아산군 아산읍');
insert into test_like values('최우혁', '서울시 구로구 구로동');

select * from test_like;

-- _의 조회
-- 이름이 3글자 이며 '김'씨인 레코드 조회
select name
	from test_like
	where name like '김__';

-- 이름이 3글자 이며 '현'으로 끝나는 레코드 조회
select name
	from test_like
	where name like '__현';

-- 이름이 4글자인 레코드를 조회
select name
	from test_like
	where name like '____';

-- %는 모든 글자를 포함
-- 서울시로 시작하는 모든 주소 검색
select address
	from test_like
	where address like '서울시%';

-- '동'으로 끝나는 모든 주소 검색
select address
	from test_like
	where address like '%동';

-- '시'가 들어가는 모든 주소 검색
select address
	from test_like                                          IS NOT NULL
	where address like '%시%';

-- 사원테이블에서 사원명에 'L'이 두 개 들어가는 사원의 사원명, 사원번호 조회
select ename, empno
	from emp
	where ename like '%L%L%';

create table zipcode(
	zipcode char(7),
	sido char(6),
	gugun varchar2(25),
	dong varchar2(150),
	bunji varchar2(25),
	seq number(5)
);

select * from zipcode;

-- 동을 입력 하여 우편번호 검색
select *
	from zipcode
	where dong like '%원곡동%';

truncate table zipcode;

select count(*) from zipcode;

-- 저장점을 생성
savepoint insert_sql;
insert into test_like values('larry ellison', '서울시 은평뉴타운');
savepoint update_sql;
update test_like
	set address='LA'
	where name='larry ellison';

savepoint delete_sql;
delete from test_like where name='larry ellison';

commit;
rollback to insert_sql;
rollback to update_sql;
rollback to delete_sql;
select * from test_like;

