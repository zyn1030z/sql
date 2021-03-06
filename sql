Chương 2:
1 select distinct job from emp;
2. select * from emp;
3. select distinct job from emp;
4. select ename, sal*12 + nvl(comm,0) from emp;
5. select ename || ' HAS HELP THE POSITION OF ' || job || ' IN DEPT ' || deptno || ' SINCE ' || hiredate from emp;
6. Describe emp;
7. select empno, ename, job, mgr, hiredate,to_char(sal,'$9999,999.00') salary,comm compensation from emp;

Chương 3:
1. select ename, deptno, sal from emp where sal between 1000 and 2000;
2. select deptno, dname from dept order by dname;
3. select empno, ename, job, mgr, hiredate, sal, comm, deptno from emp where deptno in (10,20) order by ename
4. select ename, job from emp where job = 'CLERK' and deptno = 20
5. select ename from emp where ename like '%TH%' or ename like '%LL%'
6. select ename, job, sal from emp where job != 'PRESIDENT';
7. select ename, deptno, hiredate from emp where extract(year from hiredate) = 1981
8. select ename, sal*12 Luong, comm from emp where sal>comm and job = 'SALESMAN' order by Luong desc, ename asc;

Chương 4:
1. SELECT ename, deptno, sal*1.15 from emp;
2. select ename || '*****' || job ename_job from tblemp;
3. select ename ||'('|| job ||')' from emp;
4. select ename, deptno,job from emp where deptno = 30;
5. select next_day(add_months(SYSDATE,2),'FRIDAY') "FIRST FRIDAY" from dual;
6. select ename, to_char( hiredate,'month,ddspth yyyy') from emp where deptno =20;
7. select ename, hiredate, add_months(hiredate,12) "Ngay xet nang luong" from emp order by "Ngay xet nang luong";
8. select ename,(case when sal<=1500 then 'BELOW 1500' when sal>1500 then to_char(sal) end ) salary from emp order by ename;
9. select to_char(sysdate,'DAY, DD-MM-YYYY') date_system from dual;
10. select decode('&values','14/24','yes','01/1a','no','99\98','no','udefine') from dual;
11. select ename,hiredate, next_day(hiredate+15,'friday') as salarydate from emp where ((sysdate-hiredate)>15) ;

Chương 5:
1. select min(sal) as minsalary,max(sal) as maxsalary,round(avg(sal),2) as average from emp;
2. select job, max(sal),min(sal) from emp group by job;
3. select count(*) as manager from emp where job= 'MANAGER';
4. select deptno,count(*)as sumemployee from emp group by deptno having count(*)>3;
5. select job,min(sal) from emp where job!='MANAGER' group by job;

Chương 6:
1. select ename,dname from dept,emp where emp.deptno=dept.deptno order by dname;
2. select ename,loc,dname from emp inner join dept on emp.deptno=dept.deptno where sal>1500;
3.  select ename,job,sal,grade from emp, salgrade where sal>=losal and sal<= hisal order by GRADE ;
4. select ename,job,sal,(case when sal>=1401 and sal<=2000 then '3' end) GRADE from emp where (case when sal>=1401 and sal<=2000 then '3' end)='3';
5. select ename,loc,sal from emp inner join dept on emp.deptno=dept.deptno where loc='DALLAS';
6. select ename,job,sal,grade,dname
   from emp inner join dept on emp.deptno=dept.deptno,salgrade
   where (sal>=losal and sal<=hisal) and job != 'clerk'
   order by job desc;
7. select ename,job,(sal*12) ANUAL_SAL,emp.deptno,dname,grade
   from emp inner join dept on emp.deptno=dept.deptno,salgrade
   where (sal>=losal and sal<=hisal) and (sal*12)=36000 or job='clerk';
8. select deptno,dname,loc from dept where deptno not in (select deptno from emp);
9. Select e.ename emp_name, e.sal emp_sal, m.ename mgr_name, m.sal mgr_sal
   from emp e, emp m
   where e.mgr = m.empno;
10. Select e.ename emp_name, e.sal emp_sal,m.ename mgr_name, m.sal mgr_sal from emp e left outer join emp m on e.mgr=m.empno;
11. Select DISTINCT Job From emp Where (Extract (Year From HireDate) = 1981) AND Job Not In (Select Job From emp
    Where Extract (Year From HireDate) = 1990 );
12. select e.ename emp_name,to_char(e.hiredate,'DD-MM-YYYY') emp_hiredate,m.ename mgr_name, to_char(m.hiredate,'DD-MM-YYYY') mgr_hiredate  	from emp e,emp m where e.mgr=m.empno and e.hiredate
Chương 8:
1. select e.ename, to_char(e.HIREDATE,'dd-mm-yyyy') emp_hiredate, m.ENAME mgr_name, to_char(m.HIREDATE,'dd-mm-yyyy') mgr_hiredate from EMP e, EMP m where e.MGR = m.EMPNO
2. select job,max(sal) from emp group by job;
3. select ENAME, JOB, DEPTNO, SAL from EMP where sal in (select max(SAL) from EMP group by DEPTNO);
4. select ENAME, HIREDATE, DEPTNO from emp where HIREDATE in (select min(HIREDATE) from EMP group by DEPTNO)
5. select EMPNO, ENAME, SAL, EMP.DEPTNO, avgsal
   from EMP inner join(select DEPTNO, avg(SAL) avgsal from EMP group by DEPTNO) tblavg on EMP.DEPTNO=tblavg.DEPTNO where SAL>tblavg.avgsal    order by DEPTNO;
6. select e.EMPNO EMP_NUMBER, e.ENAME EMP_NAME, e.SAL EMP_SAL, m.MGR MGR_NUMBER, m.ENAME mgr_name, m.DEPTNO mgr_dept,m.SAL mgr_salary
   from EMP e inner join EMP m on e.MGR = m.EMPNO
   
Chương 10:
1.create table PROJECT(PROJID number(4,0),P_DESC varchar2(20 char),P_START_DATE date,P_END_DATE date,BUDGET_AMOUNT number(7,2),
  MAX_NO_STAFF number(2,0),check (P_END_DATE > P_START_DATE),
  constraint "PROJECT_pk" primary key(PROJID));
2. CREATE TABLE ASSIGNMENTS
   (
    "PROJID"       NUMBER(4, 0) NOT NULL ENABLE,
    "EMPNO"        NUMBER(4, 0) NOT NULL ENABLE,
    "A_START_DATE" DATE,
    "A_END_DATE"   DATE,
    "BILL_AMOUNT"  NUMBER(4, 2),
    "ASSIGN_TYPE"  VARCHAR2(2 CHAR),
    CONSTRAINT "ASSIGNMENTS_EMP_FK1" FOREIGN KEY ("EMPNO") REFERENCES "EMP" ("EMPNO") ON
        DELETE CASCADE ENABLE,
    CONSTRAINT "ASSIGNMENTS_PROJECT_FK1" FOREIGN KEY ("PROJID") REFERENCES "PROJECT" ("PROJID") ON
        DELETE CASCADE ENABLE);
Chương 11:
1. alter table ASSIGNMENTS add(HOURS DECIMAL);
   alter table PROJECT add(COMMENTS INT);
2. DESCRIBE USER_OBJECTS;
3. alter table ASSIGNMENTS MODIFY(PROJID UNIQUE );
   ALTER TABLE ASSIGNMENTS MODIFY(EMPNO UNIQUE );
4. SELECT * FROM USER_CONSTRAINTS;
5. SELECT TABLE_NAME FROM USER_TABLES;

Chương 12:
1.INSERT INTO PROJECT(PROJID, P_DESC, P_START_DATE, P_END_DATE, BUDGET_AMOUNT, MAX_NO_STAFF)
  VALUES ('1', 'WRITE C030 COURSE', to_date('02-JAN-88', 'DD-MON-RR'), to_date('07-JAN-88', 'DD-MON-RR'), '500', '1');

  insert into PROJECT(projid, p_desc, p_start_date, p_end_date, budget_amount, max_no_staff)
  values ('3', 'PROOF READ NOTES', to_date('01-JAN-89', 'DD-MON-RR'), to_date('10-JAN-89', 'DD-MON-RR'), '600', '1');
2. insert into ASSIGNMENTS(PROJID,EMPNO,A_START_DATE,A_END_DATE,BILL_AMOUNT,ASSIGN_TYPE,HOURS)
   values('1','7369',to_date('01-JAN-88','DD-MON-RR'),to_date('03-JAN-88','DD-MON-RR'),'50','WR','15');

   insert into ASSIGNMENTS(PROJID,EMPNO,A_START_DATE,A_END_DATE,BILL_AMOUNT,ASSIGN_TYPE,HOURS)
   values('1','7902',to_date('01-JAN-88','DD-MON-RR'),to_date('07-JAN-88','DD-MON-RR'),'55','WR','20');

   insert into ASSIGNMENTS(PROJID,EMPNO,A_START_DATE,A_END_DATE,BILL_AMOUNT,ASSIGN_TYPE,HOURS)
   values('2','7844',to_date('04-JAN-88','DD-MON-RR'),to_date('10-JAN-88','DD-MON-RR'),'45.05','WR','30');
3. UPDATE ASSIGNMENTS SET ASSIGN_TYPE='wr' WHERE ASSIGN_TYPE = 'wt'

Chương 13:
1.        create index projid_index on ASSIGNMENTS(PROJID);
2.	  select e.empno,e.ename,e.job,m.mgr,e.hiredate,e.sal,e.comm,e.deptno
	  from EMP e join EMP m on e.mgr=m.empno
	  where m.mgr =(select mgr from EMP where ename='&ename');
Chương 14:
1. create OR REPLACE view aggredates (deptno, avgsalary, maximun, minimun, sumsal, no_sals, no_comms )
   as
   select deptno,round(avg(sal),3), max(sal), min(sal), sum(sal), count(*), sum(case when comm is null then 0 when comm is not null then 1   end)
   from tblemp
   group by deptno;
2. create view checkviewassignments
   as
   Select * From TBLASSIGNMENTS
   Where "PROJID" < 2 AND "A_START_DATE" <"A_END_DATE";
3. Create table MESSAGES ( numcol1 number(9,2),
   Numcol2 number(9,2),
   Charcol1 varchar2(60),
   Charcol2 varchar2(60),
   Datecol1 date,
   Datecol2 date);
   
Chương 18:
1. 	DECLARE
	    CURSOR CHECK_JOB IS
		SELECT JOB
		FROM EMP;
	    vjob   EMP.Job%TYPE;
	    vcount NUMBER := 0;
	BEGIN
	    OPEN CHECK_JOB;
	    LOOP
		FETCH CHECK_JOB INTO vjob;
		EXIT WHEN CHECK_JOB%NOTFOUND;
		IF vjob = '&job_input' THEN
		    vcount := vcount + 1;
		END IF;
	    END LOOP;
	    IF vcount > 0 THEN
	    INSERT INTO MESSAGES VALUES (0, 1, 'FOUNDED ' || vcount, 'JOB :' || '&job_input', sysdate, sysdate);
	    ELSE
		INSERT INTO MESSAGES VALUES (0, 0, 'NOT FOUND ' || vcount, 'JOB :' || '&job_input', sysdate, sysdate);
	    END IF;
	    CLOSE CHECK_JOB;
	 COMMIT;
	END;
2.	BEGIN
	    FOR i IN 1..10
		LOOP
		    IF i != 6 AND i != 8 THEN
		        INSERT INTO MESSAGES VALUES (i, default, default, default, default, default);
		    END IF;
		END LOOP;
	    COMMIT;
	END;
3. 	declare
	    vempno    NUMBER := '2';
	    CURSOR QUERY_DATA IS SELECT ENAME, HIREDATE, SAL
		                 FROM EMP
		                 WHERE EMPNO = vempno;
	    vrow      QUERY_DATA%ROWTYPE;
	    vname     VARCHAR2(6);
	    vsal      VARCHAR2(6);
	    vhiredate VARCHAR2(6);
	begin
	    open QUERY_DATA;
	    loop
		fetch QUERY_DATA into vrow;
		exit when QUERY_DATA%notfound;
		if vrow.SAL > 1200 then
		    vsal := 'TRUE';
		else
		    vsal := 'FALSE';
		end if;
		if vrow.ENAME like '%T%' then
		    vname := 'TRUE';
		else
		    vname := 'FALSE';
		end if;
		if extract(month from vrow.HIREDATE) = 12 then
		    vhiredate := 'TRUE';
		else
		    vhiredate := 'FALSE';
		end if;
		INSERT INTO MESSAGES
		VALUES (default, vempno, ' SALARY > 1200 ?: ' || vsal || ' ,ENAME_EMPLOY CONTRAINT T ?: ' || vname,
		        ' ,MONTH OF HIREDATE IS 12(DEC) ?: ' || vhiredate, default, default);
	    end loop;
	    close QUERY_DATA;
	    commit;
	end;
4. 
	declare
	    CURSOR QUERY_DATA IS SELECT NUMCOL1, NUMCOL2
		                 FROM MESSAGES;
	begin
	    open QUERY_DATA;
	    for i in 1..10
		loop
		    UPDATE MESSAGES
		    SET numcol2='100'
		    WHERE numcol1 = i;
		    exit when QUERY_DATA%found;
		end loop;
	    close QUERY_DATA;
	    commit;
	end;

Chương 19:

