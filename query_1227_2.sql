--------------------------  synonym : 테이블의 별명 ----------------------
-- 권한 부여 : 관리자 계정
grant create synonym to scott;
revoke create view from scott;
select * from dba_sys_privs;

create synonym cmo for car_model;
select * from cmo;
-- synonym 삭제
drop synonym cmo;

revoke create synonym from scott;
select * from dba_sys_privs where grantee = upper('scott');
-------------------------------  백업  -------------------------------------------
drop table emp;
drop table test_constraint;
drop table dept;
drop table cp_emp3;
purge recyclebin;
select * from cp_emp3;
----------------- 다른 서버에 접속 : Oracle 11g부터 다른 서버에 접속 할 수 없다.
-- listener.ora를 수정해야 접근 가능하다.
-- 방화벽: 1521 port가 열려있어야 접근 가능.
-- sqlplus에서 외부 서버로 접속 할 때에는 sqlplus 계정명/비번@ipaddress:1521/sid


------------------------------ index ---------------------------
select rowid, empno
from emp;
-- index 조회
select * from user_indexes;

create table idx_zipcode as (select * from zipcode);

-- unique index 설정
create unique index idx_zip on idx_zipcode(seq);

select * from user_indexes;

-- 인덱스 리빌드
alter index idx_zip rebuild;

-- 인덱스 설정 컬럼을 사용하여 조회.
select idx_zipcode, sido, gugun, dong, bunji
from idx_zipcode
where seq in(3, 4000, 10000, 31002, 52100);

-- 인덱스 삭제
drop index idx_zip;
-- 우편번호는 중복된 값이 존재하여 unique 인덱스를 생성 할 수 없다.
--create unique index idx_zip on idx_zipcode(zipcode);
create index idx_zip on idx_zipcode(zipcode);

create unique index idx_zip on idx_zipcode(seq);
select * from user_indexes;
                                                  
-- index hint : 조회 컬럼에 /*+ 인덱스 컬럼 힌트 */
-- ex)
select /*+ idx_zipcode */idx_zipcode, sido, gugun, dong, bunji
from idx_zipcode
where seq in(3, 4000, 10000, 31002, 52100);
     

