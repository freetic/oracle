------------------ ������ : �����ϴ� ��ȣ�� ����ϴ� ��ü
-- 1 ~ 9999999999���� 1�� �����ϴ� ������ ����
create sequence seq_test
increment by 1
start with 1
maxvalue 9999999999
cache 30
cycle;

-- nextval : �������� Server Instance�� �������� ������ �������� ��ȣ�� �����ϰ�
-- Server Inantance�� ������ ��ü�� �ø��� ���� �Ѵ�.
select seq_test.nextval ����
from dual;
-- currval : �������� ���� ��ȣ ��� : �������� Server Instance�� �������� ������ Error �߻�.
select seq_test.currval ����
from dual;

select * from user_sequences; -- last_number�� nextval�� �������� number

-- ������ ����
drop sequence seq_test;


-- ������ ����Ǹ� ��ȣ�� �������, �߰� ���� �ϸ� ��ȣ�� �������. (��ȣ�� �Ѿ����)

select * from cp_emp3;
--
insert into cp_emp3(empno, ename) values(seq_test.nextval, '�׽�Ʈ');


-- dual ���̺��� ����Ͽ� : S_000000001(0 8��)�� ������ ���� ��ȣ�� ���.
select concat('S_', lpad(seq_test.nextval, 2, 0))
from dual;

insert into PRIMARY_MULTI(item_no, item)
	values(concat('S_', lpad(seq_test.nextval, 2, 0)), '�׽�Ʈ');
select * from primary_multi;

-- car_country, car_maker, car_model ���̺��� �м��Ͽ� pk�� fk��
-- alter�� �ùٸ��� �߰�.
alter table car_country add constraint pk_car_country primary key(maker);
alter table car_maker add constraint pk_car_maker primary key(model);
alter table car_maker add constraint fk_maker foreign key(maker) references car_country(maker);
alter table car_model add constraint fk_model foreign key(model) references car_maker(model);
alter table car_model add column no num(10);
