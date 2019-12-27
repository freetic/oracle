--------------------------  synonym : ���̺��� ���� ----------------------
-- ���� �ο� : ������ ����
grant create synonym to scott;
revoke create view from scott;
select * from dba_sys_privs;

create synonym cmo for car_model;
select * from cmo;
-- synonym ����
drop synonym cmo;

revoke create synonym from scott;
select * from dba_sys_privs where grantee = upper('scott');
-------------------------------  ���  -------------------------------------------
drop table emp;
drop table test_constraint;
drop table dept;
drop table cp_emp3;
purge recyclebin;
select * from cp_emp3;
----------------- �ٸ� ������ ���� : Oracle 11g���� �ٸ� ������ ���� �� �� ����.
-- listener.ora�� �����ؾ� ���� �����ϴ�.
-- ��ȭ��: 1521 port�� �����־�� ���� ����.
-- sqlplus���� �ܺ� ������ ���� �� ������ sqlplus ������/���@ipaddress:1521/sid


------------------------------ index ---------------------------
select rowid, empno
from emp;
-- index ��ȸ
select * from user_indexes;

create table idx_zipcode as (select * from zipcode);

-- unique index ����
create unique index idx_zip on idx_zipcode(seq);

select * from user_indexes;

-- �ε��� ������
alter index idx_zip rebuild;

-- �ε��� ���� �÷��� ����Ͽ� ��ȸ.
select idx_zipcode, sido, gugun, dong, bunji
from idx_zipcode
where seq in(3, 4000, 10000, 31002, 52100);

-- �ε��� ����
drop index idx_zip;
-- �����ȣ�� �ߺ��� ���� �����Ͽ� unique �ε����� ���� �� �� ����.
--create unique index idx_zip on idx_zipcode(zipcode);
create index idx_zip on idx_zipcode(zipcode);

create unique index idx_zip on idx_zipcode(seq);
select * from user_indexes;
                                                  
-- index hint : ��ȸ �÷��� /*+ �ε��� �÷� ��Ʈ */
-- ex)
select /*+ idx_zipcode */idx_zipcode, sido, gugun, dong, bunji
from idx_zipcode
where seq in(3, 4000, 10000, 31002, 52100);
     

