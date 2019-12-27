-- 12c 이전형태의 계정명 사용 (##이 붙지 않는다.)
alter session set "_ORACLE_SCRIPT" = true;
-- 계정 생성 : 관리자 계정만 가능
create user test1 identified by tiger;

-- 권한 부여 : 관리자 계정만 가능
grant connect, resource to test1;

select count(*) from tab;

-- 테이블스페이스 사용권한
alter user test1 default tablespace users quota unlimited on users;

-- 테이블 생성                                                 +
create table test(name varchar2(30));
insert into test values('테스트');
commit;
select * from test;
select * from dba_users;
-- 계정 삭제 : 관리자만 삭제 가능하다.
-- 12c 부터는 계정명에 ##이 붙어있지 않으면 관리자로 인식하여 삭제되지 않는다.
-- 그러므로 oracle script를 사용한 후 삭제한다.
alter session set "_ORACLE_SCRIPT" = true;
-- 계정이 생성한 객체가 없을 때
drop user test1;
-- 계정이 생성한 객체가 있을 때
drop user test1 cascade;

-- 접속중인 계정을 삭제하려면 해당 계정의 연결이 끊어져야 한다.
-- 비밀번호 변경 : 접속한 모든 계정이 자신의 비밀번호를 변경 할 수 있다.
-- 비번이 바뀌면 만료된 계정도 연장된다.
-- alter user 계정명 identified by 비번;
alter user scott identified by tiger;

-- 권한 뺏기
-- test1의 접속권한 뺏기
revoke connect from test1;
                                             

select * from user_sequences;
