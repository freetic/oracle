-- select sysdate from dual;
-- select * from NLS_SESSION_PARAMETERS;
-- alter session
-- set NLS_DATE_FORMAT = 'yyyy-mm-dd';

-- 시험 나오는거. 5가지 방법
-- select empno, ename, hiredate
-- from emp
/* where hiredate between '1987-01-01' and '1987-12-31'; */
/* where hiredate >= '1987-01-01' and hiredate <= '1987-12-31'; */
/* where hiredate like '1987%'; */
/* where to_char(hiredate, 'yyyy') = '1987'; */
-- where substr(to_char(hiredate), 1, 4) = '1987';

-- 현재 시간 출력
-- create or replace PROCEDURE sp_today
-- IS
--     today date;
-- BEGIN
--     select sysdate
--     into today
--     from dual;
--     dbms_output.put_line(today);
-- end;
-- /


-- accept p_name prompt '찾고자 하는 이름:'

-- CREATE OR REPLACE PROCEDURE sp_emp_select(
--     p_name IN emp.ename%TYPE
-- )
-- IS
--     v_empno emp.empno%TYPE;
--     v_ename emp.ename%TYPE;
--     v_hiredate emp.hiredate%TYPE;
-- BEGIN
--     select empno, ename, hiredate
--     into v_empno, v_ename, v_hiredate
--     from emp
--     where ename = upper(p_name);
--     dbms_output.put_line(v_empno || ' ' || v_ename || ' ' || v_hiredate);
-- END;
-- /



-- create or replace procedure sp_zipcode_select(
--     p_dong in zipcode.dong%type
-- )
-- IS
--     v_zipcode zipcode.zipcode%type;
--     v_sido zipcode.sido%type;
--     v_dong zipcode.dong%type;
--     v_bunji zipcode.bunji%type;
-- begin
--     select zipcode, sido, dong, bunji
--     into v_zipcode, v_sido, v_dong, v_bunji
--     from zipcode
--     where dong like concat(concat('%', p_dong), '%');
--     dbms_output.put_line(v_zipcode || ' ' || v_sido || ' ' || v_dong || ' ' || v_bunji);
-- end;
-- /

-- 부서 이름이 디자인부인 부서의 위치는? 
-- create or replace procedure sp_dept_select(
--     p_dname in dept.dname%type,
--     v_loc out dept.loc%type
-- )
-- is
-- begin
--     select loc
--     into v_loc
--     from dept
--     where dname = p_dname;
-- end;
-- /

-- CREATE OR REPLACE PROCEDURE sp_emp_cursor_select(
--     p_deptno in emp.deptno%type
-- )
-- IS
--     CURSOR emp_cursor    
--     IS
--     SELECT  empno, ename, sal, deptno
--     FROM    emp
--     WHERE   deptno = p_deptno;
--     v_empno emp.empno%type;
--     v_ename emp.ename%type;
--     v_sal   emp.sal%type;
--     v_deptno    emp.deptno%type;
-- BEGIN
--     OPEN emp_cursor;
--     LOOP
--         FETCH emp_cursor INTO v_empno, v_ename, v_sal, v_deptno;
--         EXIT WHEN emp_cursor%NOTFOUND;
--         dbms_output.put_line(v_empno || ' ' || v_ename || ' ' || v_sal || ' ' || v_deptno);
--         END LOOP;
--     CLOSE emp_cursor;
-- END;
-- /

-- create or replace procedure sp_dept_select
-- is
--     CURSOR dept_cursor      /* 1 */
--     is 
--     select deptno, dname, loc
--     from dept;
--     v_deptno    dept.deptno%type;
--     v_dname     dept.dname%type;
--     v_loc       dept.loc%type;
-- BEGIN
--     OPEN dept_cursor;       /* 2 */
--         loop
--             fetch dept_cursor into v_deptno, v_dname, v_loc;    /* 3 */
--             exit when dept_cursor%notfound;
--             dbms_output.put_line(v_deptno || ' ' || v_dname ||
--              ' ' || v_loc);
--         end loop;
--     close dept_cursor;      /* 4 */
-- end;
-- /


-- 부서번호를 입력받아서 사원의 
-- 사번, 이름, 봉급, 부서이름, 부서위치를 출력하는 sp를 만드시오.
-- create or replace procedure sp_emp_dept_select(
--     p_deptno in emp.deptno%type
-- )
-- is
--     cursor emp_dept_cursor
--         is
--         select  e.empno, e.ename, e.sal, d.dname, d.loc
--         from    emp e inner join dept d
--         on      e.deptno = d.deptno
--         where   e.deptno = p_deptno;
--     v_empno     emp.empno%type;
--     v_ename     emp.ename%type;
--     v_sal       emp.sal%type;
--     v_dname     dept.dname%type;
--     v_loc       dept.loc%type;
-- begin
--     OPEN emp_dept_cursor;
--         dbms_output.put_line('---------------------------------------');
--         loop
--             fetch emp_dept_cursor into v_empno, v_ename, v_sal, v_dname, v_loc;
--             exit when emp_dept_cursor%NOTFOUND;
--             dbms_output.put_line(v_empno || chr(9) || v_ename || chr(9) ||
--             v_sal || chr(9) || v_dname || chr(9) || v_loc);
--         end loop;
--         dbms_output.put_line('---------------------------------------');
--     close emp_dept_cursor;
-- end;
-- /


-- 동 이름으로 검색
-- create or replace procedure sp_zipcode_cursor_select(
--     p_dong in zipcode.dong%type
-- )
-- IS
--     CURSOR zipcode_cursor
--     IS 
--     SELECT zipcode, sido, gugun, dong, bunji, seq
--     FROM zipcode
--     WHERE dong like concat(concat('%', p_dong), '%');
--     v_zipcode   zipcode.zipcode%type;   
--     v_sido      zipcode.sido%type;
--     v_gugun     zipcode.gugun%type;
--     v_dong      zipcode.dong%type;
--     v_bunji     zipcode.bunji%type;
--     v_seq       zipcode.seq%type;
-- begin
--     open zipcode_cursor;
--         loop
--             fetch zipcode_cursor into v_zipcode, v_sido, v_gugun, v_dong, v_bunji, v_seq;
--             exit when zipcode_cursor%NOTFOUND;
--             dbms_output.put_line(v_zipcode || chr(9) || v_sido || chr(9) || v_gugun || chr(9) || v_dong || chr(9) || v_bunji || chr(9) || v_seq);
--         end loop;
--     close zipcode_cursor;
-- end;
-- /

-- create table student(
--    hakbun   char(7),
--     name    varchar2(20)     not null,
--     kor     number(3)       not null,
--     eng     number(3)       not null,
--     mat     number(3)       not null,
--     edp     number(3)       not null,
--     tot     number(3),
--     avg     number(5, 2),
--     grade   char(1),
--     constraint pk_student_hakbun primary key(hakbun),
--     constraint ck_student_grade check (grade in('A', 'B', 'C', 'D', 'F'))
-- );

-- INSERT INTO student(hakbun, name, kor, eng, mat, edp) 
-- values('2019-01', 'Smith', 100, 99, 95, 93);
-- INSERT INTO student(hakbun, name, kor, eng, mat, edp) 
-- values('2019-02', 'John', 60, 70, 72, 83);

create or replace procedure sp_student_update
is
    cursor student_cursor
    is
    select kor, eng, mat, edp, hakbun
    from student;
    v_kor   student.kor%type;
    v_eng   student.eng%type;
    v_mat   student.mat%type;
    v_edp   student.edp%type;
    v_tot   student.tot%type;
    v_avg   student.avg%type;
    v_grade student.grade%type;
    v_hakbun    student.hakbun%type;
begin
    open student_cursor;
        loop
            fetch student_cursor into v_kor, v_eng, v_mat, v_edp, v_hakbun;
            exit when student_cursor%NOTFOUND;
            v_tot := v_kor+v_eng+v_mat+v_edp;
            v_avg := round(v_tot/4, 2);
            if v_avg >= 90 and v_avg <= 100 then v_grade := 'A';
                elsif v_avg >= 80 and v_avg < 90 then v_grade := 'B';
                elsif v_avg >= 70 and v_avg < 80 then v_grade := 'C';
                elsif v_avg >= 60 and v_avg < 70 then v_grade := 'D';
                else v_grade := 'F';
            end if;
            update student set tot = v_tot, avg = v_avg, grade = v_grade
            where hakbun = v_hakbun;
            dbms_output.put_line(v_kor || chr(9) || v_eng || chr(9) || v_mat || chr(9) || 
            v_edp || chr(9) || v_tot || chr(9) || v_avg || chr(9) || v_grade);
            commit;
        end loop;
    close student_cursor;
end;
/