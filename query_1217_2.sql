/*
-- 학생테이블에서 학생의 번호가 1번인 학생의 나이를 27로, 이메일을 wang@sist.co.kr로, 주소를 경기도 인천시 인천동으로,
-- 변경일을 변경 시점의 날짜로 변경
update student
set age = 27, email = 'wang.sist.co.kr', addr = '경기도 인천시', num = 1, input_date = sysdate
where num = 30;


-- 학생 테이블에서 이름이 박찬우 이고 성별이 'm'인 학생의 나이를 25로, 이메일을 'park@daum.net'으로 변경
update student
set age = 25, email = 'park@daum.net'
where name = '박찬우' and gender = 'm';


-- 테이블의 모든 레코드 삭제.
delete from student;


-- 테이블의 특정 레코드 삭제.
-- 학생 테이블의 학생 번호가 1번인 학생의 레코드를 삭제한다.
delete from student where num=1;


-- truncate : DDL - 특정테이블의 모든 레코드를 절삭.
truncate table student;
*/


--insert into student values(2, '왕건모', 24, '010-1234-5678', 'test@test.com', 'm', '서울시 강남구 역삼동', sysdate);


-- 출력되는 칼럼의 크기 조절
column num format 999
col name format a6
col age foramt 0000
col phone format a13
col phone format a10
col phone format a14


select * from student;