-- 12c ���������� ������ ��� (##�� ���� �ʴ´�.)
alter session set "_ORACLE_SCRIPT" = true;
-- ���� ���� : ������ ������ ����
create user test1 identified by tiger;

-- ���� �ο� : ������ ������ ����
grant connect, resource to test1;

select count(*) from tab;

-- ���̺����̽� ������
alter user test1 default tablespace users quota unlimited on users;

-- ���̺� ����                                                 +
create table test(name varchar2(30));
insert into test values('�׽�Ʈ');
commit;
select * from test;
select * from dba_users;
-- ���� ���� : �����ڸ� ���� �����ϴ�.
-- 12c ���ʹ� ������ ##�� �پ����� ������ �����ڷ� �ν��Ͽ� �������� �ʴ´�.
-- �׷��Ƿ� oracle script�� ����� �� �����Ѵ�.
alter session set "_ORACLE_SCRIPT" = true;
-- ������ ������ ��ü�� ���� ��
drop user test1;
-- ������ ������ ��ü�� ���� ��
drop user test1 cascade;

-- �������� ������ �����Ϸ��� �ش� ������ ������ �������� �Ѵ�.
-- ��й�ȣ ���� : ������ ��� ������ �ڽ��� ��й�ȣ�� ���� �� �� �ִ�.
-- ����� �ٲ�� ����� ������ ����ȴ�.
-- alter user ������ identified by ���;
alter user scott identified by tiger;

-- ���� ����
-- test1�� ���ӱ��� ����
revoke connect from test1;
                                             

select * from user_sequences;
