--숙제
--1. 아래에 해당하는 데이터를 저장할 수 있는 테이블을 생성하세요.
-- 도서명, 가격, 도서코드,저자, 설명, 발간일
create table book(
name varchar2(100),
price number(6),
code varchar2(120),
author varchar2(120),
describe varchar2(300),
pub_date date
);
--2. 1번에서 추출된 결과로 테이블설계서를 작성하세요.

--3. 아래의 데이터를 생성된 테이블에 추가하고 Transaction을 처리하세요.
--  오라클 SQL과 PL/SQL, 28000, ORA_0012_11, 서진수, 오라클을 배우는, 오늘
--  Java의 정석, 38000, JAVA_1011_4511A,남궁성 , 자바의 정석을 다루는, 오늘
--  JSP2.3 웹프로그래밍, 36000, JSP_03_11, 최범균, JSP교재, 오늘
--  차세대 웹 프로그래밍, 26000, HT_981_09A, 홍성용, HTML 웹 교재, 오늘

--insert into book values('오라클 SQL과 PL/SQL', 28000, 'ORA_0012_11', '서진수', '오라클을 배우는', sysdate);
insert into book values('Java의 정석', 38000, 'JAVA_1011_4511A', '남궁성', '자바의 정석을 다루는', sysdate);
insert into book values('JSP2.3 웹프로그래밍', 36000, 'JSP_03_11', '최범균', 'JSP교재', sysdate);
insert into book values('차세대 웹 프로그래밍', 26000, 'HT_981_09A', '홍성용', 'HTML 웹 교재', sysdate);


--4. 도서 테이블에서 모든 레코드의 교재명, 저자, 가격을 조회.
select name, author, price from book

--5. 도서명이 'Java의 정석'인 도서의 가격을 40000으로 변경 하세요.
update book
	set price = 40000
	where name = 'Java의 정석';

--6. 도서코드가 'HT_981_09A' 인 도서의 도서명을
--  '차네대 웹 프로그래밍'으로 가격을  30000으로 저자를  , 황성용으로 변경 하세요.
update book
	set name = '차네대 웹 프로그래밍', price = 30000, author = '황성용'
	where code = 'HT_981_09A';

--7. 도서코드가  'HT_981_09A' 인 도서를 삭제하세요.
delete from book where code = 'HT_981_09A';

--8.  모든 도서를 삭제하세요.
truncate table book;