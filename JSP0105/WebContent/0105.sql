select now();
-- 테이블 목록
show TABLES;
-- 테이블 구조
desc hr_employees ;

-- ----------------------------------------------------------
-- SELECT 연습
-- ----------------------------------------------------------
-- 8. 매니저가 없는 사원의 사번과 LAST_NAME그리고 매니저 아이디를 조회하시오
select
	EMPLOYEE_ID 사번, LAST_NAME 이름, MANAGER_ID 관리자
from 
	hr_employees
where 
	MANAGER_ID is null 
order by 
	1
;

-- 8-2. 매니저가 있는 사람들의 LAST_NAME 및 JOB_ID 를 조회한다.
select
	LAST_NAME 이름, JOB_ID 직업종류
from 
	hr_employees
where 
	MANAGER_ID is not null ;

-- 9. 커미션을 버는 모든 사원들의 LAST_ANME, 연봉 및 커미션을 조회한다.
--    연봉 역순, 커미션 역순차로 정렬한다.
select 
	LAST_NAME , SALARY , COMMISSION_PCT 
from 
	hr_employees
where 
	COMMISSION_PCT is not null 
order by 
	SALARY desc, COMMISSION_PCT desc ;

-- 10. LAST_NAME 의 네번째 글자가 a 인 사원들의 LAST_NAME 을 조회한다.
select 
	LAST_NAME 
from 
	hr_employees
where 
	LAST_NAME like '___a%'
;

-- 11. LAST_NAME 에 a 및(OR) e 글자가 있는 사원들의 LAST_NAME 을 조회한다.
select 
	LAST_NAME 
from 
	hr_employees
where 
	LAST_NAME like '%a%' or LAST_NAME like '%e%'
;

-- 12. 연봉이 2,500, 3,500, 7000 이 아니며 직업이 SA_REP 이나 ST_CLERK 인 사람들을 조회한다.
select 
	LAST_NAME , SALARY , JOB_ID 
from 
	hr_employees
where 
	SALARY not in (2500,3500,700)
	and
	JOB_ID in ('SA_REP','ST_CLERK')
;

-- 13-1.  직업이 AD_PRES인 사람은 A 등급을, ST_MAN 인 사람은 B 등급을, IT_PROG 인 사람은 C 등급을,
--        SA_REP 인 사람은 D 등급을, ST_CLERK 인 사람은 E 등급을 기타는 0 을 부여하여 조회한다.

/*
case 필드명
	when 조건1 then 참인경우값
	when 조건2 then 참인경우값
	when 조건3 then 참인경우값
	when 조건4 then 참인경우값
	else
		모두 거짓인 경우 값
end
 */
select 
	LAST_NAME , JOB_ID ,
	case JOB_ID 
		when 'AD_PRES' then 'A등급'
		when 'ST_MAN' then 'B등급'
		when 'IT_PROG' then 'C등급'
		when 'SA_REP' then 'D등급'
		when 'ST_CLERK' then 'E등급'
		else '0' 
	end 등급
from 
	hr_employees
order by
	3
;

select case '바보' when '바보' then '너는 진짜 바보' else 'ㅋㅋㅋ' end;

-- 위의 문제에서 등급이 A등급, B등급인 사람만 조회
----- 1) 임시테이블을 만든다.
create table temp3
as
select 
	LAST_NAME , JOB_ID ,
	case JOB_ID 
		when 'AD_PRES' then 'A등급'
		when 'ST_MAN' then 'B등급'
		when 'IT_PROG' then 'C등급'
		when 'SA_REP' then 'D등급'
		when 'ST_CLERK' then 'E등급'
		else '0' 
	end grade
from 
	hr_employees;
---- 2) 임시테이블을 이용하여 조회한다.
select * from temp3;
select * from temp3 where grade in('A등급','B등급');

-- 14. 모든 사원들의 LAST_NAME, 부서 이름 및 부서 번호을 조회한다.
--     JOIN : 여러개의 테이블을 이용하여 데이터를 조회한다.
select LAST_NAME , DEPARTMENT_ID from hr_employees; -- 이름, 부서번호만 있다.
select DEPARTMENT_ID , DEPARTMENT_NAME from hr_departments; -- 부서 번호, 부서이름이 있다.
-- 테이블 이름에 별칭을 부여하여 사용
select 
	LAST_NAME , E.DEPARTMENT_ID , D.DEPARTMENT_NAME 
from 
	hr_employees E, hr_departments D 
where 
	E.DEPARTMENT_ID = D.DEPARTMENT_ID 
;
-- 테이블 이름에 별칭을 부여하지 않으면 소속을 밝히기 위하여 필드명 앞에 테이블명을 기술해야 한다. 
select 
	LAST_NAME , hr_departments.DEPARTMENT_ID , hr_departments.DEPARTMENT_NAME 
from 
	hr_employees, hr_departments
where 
	hr_employees.DEPARTMENT_ID = hr_departments.DEPARTMENT_ID 
;
-- 아래는 에러다!!! DEPARTMENT_ID의 소속을 알 수 없다. 두군데 다 있다.
-- 두군데 다 있는 것은 반드시 소속을 밝혀야 한다.
select 
	LAST_NAME , DEPARTMENT_ID , D.DEPARTMENT_NAME 
from 
	hr_employees E, hr_departments D 
where 
	E.DEPARTMENT_ID = D.DEPARTMENT_ID 
;

-- LAST_NAME과 DEPARTMENT_NAME는 한곳에만 있으므로 테이블명 생략 가능
select 
	LAST_NAME , E.DEPARTMENT_ID , DEPARTMENT_NAME 
from 
	hr_employees E, hr_departments D 
where 
	E.DEPARTMENT_ID = D.DEPARTMENT_ID 
;

-- 15. 부서번호 30 내의 모든 직업들을 유일한 포맷으로 조회한다. 90 부서 또한 포함한다.
--     유일한 포맷 : 중복을 제거 해라!!!
--     결국 직업별로 어떤 부서의 사람들이 있는지를 알고 싶다. 
-- 아래는 중복된 데이터가 나온다.
select 
	JOB_ID , DEPARTMENT_ID 
from 
	hr_employees
where 
	DEPARTMENT_ID in (30, 50);

-- 중복을 제거시켜보자!! : distinct
select 
	distinct JOB_ID , DEPARTMENT_ID 
from 
	hr_employees
where 
	DEPARTMENT_ID in (30, 50);

select 
	distinct DEPARTMENT_ID , JOB_ID 
from 
	hr_employees
where 
	DEPARTMENT_ID in (30, 50);

-- ===============================================
-- JOIN은 오라클에서 자세하게 배웁니다.
-- ===============================================
create table emp(
	name varchar(30) not null,
	dept_id int (3)
);
insert into emp values ('홍길동',10);
insert into emp values ('박문수',20);
select * from emp;

create table dept(
	dept_id int (3),
	dept_name varchar(20)
);
insert into dept values (10,'인사과');
insert into dept values (20,'총무과');
select * from dept;

select 	name, dept_name from emp, dept;

insert into emp values ('이순신',20);
select * from emp;

select 	name, dept_name from emp, dept;

select 	
	name, emp.dept_id, dept.dept_id, dept_name 
from 
	emp, dept 
where 
	emp.dept_id =  dept.dept_id ;


-- 16-1. 커미션을 버는 모든 사람들의 LAST_NAME, 부서 명, 지역 ID 및 도시 명을 조회한다.
	
select * from hr_employees he; -- last_name
select * from hr_departments hd; --  부서 명
select * from hr_locations hl; -- 도시 명

select 
	LAST_NAME , hd.DEPARTMENT_NAME , hl.CITY 
from 
	hr_employees he , hr_departments hd , hr_locations hl 
where 
	he.DEPARTMENT_ID = hd.DEPARTMENT_ID 
	and 
	hd.LOCATION_ID = hl.LOCATION_ID 
	and 
	COMMISSION_PCT is not null
;
-- 16-2. 시애틀에 사는 사람 중 커미션을 버는 모든 사람들의 LAST_NAME, 부서 명, 지역 ID 및 도시 명을 조회한다.
select 
	LAST_NAME , hd.DEPARTMENT_NAME , hl.CITY 
from 
	hr_employees he , hr_departments hd , hr_locations hl 
where 
	he.DEPARTMENT_ID = hd.DEPARTMENT_ID 
	and 
	hd.LOCATION_ID = hl.LOCATION_ID 
	and 
	COMMISSION_PCT is not null
	and 
	hl.CITY = 'Seattle'
;
-- 17. LAST_NAME 이 DAVIES 인 사람보다 후에 고용된 사원들의 LAST_NAME 및 HIRE_DATE 을 조회한다.
select HIRE_DATE from hr_employees he where LAST_NAME ='DAVIES';

select 
	LAST_NAME , HIRE_DATE 
from 
	hr_employees
where 
	HIRE_DATE >= '1997-01-29';

-- 위의 두개 명령을 1개의 명령으로 사용하면 된다.
-- 서브쿼리 : 쿼리의 결과를 다른 쿼리에서 사용한다. 내부쿼리는 ()안에 넣어준다.
select 
	LAST_NAME , HIRE_DATE 
from 
	hr_employees
where 
	HIRE_DATE >= (select HIRE_DATE from hr_employees he where LAST_NAME ='DAVIES');


-- 18. 자신의 매니저보다 먼저 고용된 사원들의 LAST_NAME 및 고용일을 조회한다.
--     셀프조인 : 같은 테이블을 여러번 사용한다.
select 
	e1.LAST_NAME , e1.EMPLOYEE_ID , e1.HIRE_DATE 내입사일, e2.HIRE_DATE 메니저입사일 
from 
	hr_employees e1, hr_employees e2
where 
	e1.MANAGER_ID = e2.EMPLOYEE_ID 
	and 
	e1.HIRE_DATE < e2.HIRE_DATE 
;















