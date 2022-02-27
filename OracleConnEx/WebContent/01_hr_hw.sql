-- 1. 연봉이 12000 이상되는 직원들의 LAST_NAME 및 연봉을 조회한다.
SELECT 
	LAST_NAME , SALARY 
FROM 
	EMPLOYEES 
WHERE 
	SALARY >=12000;
	
-- 2. 사원번호가 176 인 사람의 LAST_NAME 과 부서 번호를 조회한다.
SELECT 
	EMPLOYEE_ID , LAST_NAME , DEPARTMENT_ID 
FROM 
	EMPLOYEES 
WHERE 
	EMPLOYEE_ID = 176;

-- 3. 연봉이 5000 에서 12000의 범위 이외인 사람들의 LAST_NAME 및 연봉을 조회힌다.
SELECT 
	LAST_NAME , SALARY 
FROM 
	EMPLOYEES
WHERE 
	SALARY BETWEEN 5000 AND 12000;

-- 4. 1998/02/20 일부터 1998/05/01 사이에 고용된 사원들의 LAST_NAME 사번, 고용일자를 조회한다.
--    고용일자 순으로 정렬한다.
SELECT * FROM EMPLOYEES e ;
SELECT 
	LAST_NAME , EMPLOYEE_ID , HIRE_DATE 
FROM 
	EMPLOYEES
WHERE 
	-- HIRE_DATE BETWEEN '1998/02/20' AND '1998/05/01'
	HIRE_DATE BETWEEN '2002/02/20' AND '2005/05/01'
ORDER BY HIRE_DATE;

-- 5. 20 번 및 50 번 부서에서 근무하는 모든 사원들의 LAST_NAME 및 부서 번호를 알파벳순으로 조회한다.
SELECT 
	LAST_NAME , DEPARTMENT_ID 
FROM 
	EMPLOYEES
WHERE 
	DEPARTMENT_ID IN (20, 50)
ORDER BY LAST_NAME ASC;

-- 6. 20 번 및 50 번 부서에 근무하며, 연봉이 5000 ~ 12,000 사이인 사원들의 LAST_NAME 및 연봉을 조회한다.
SELECT 
	LAST_NAME , SALARY 
FROM 
	EMPLOYEES
WHERE 
	DEPARTMENT_ID IN (20, 50) AND SALARY BETWEEN 5000 AND 12000;

-- 7. 1994년도에 고용된 모든 사람들의 LAST_NAME 및 고용일을 조회한다.
SELECT 
	LAST_NAME , HIRE_DATE 
FROM 
	EMPLOYEES
WHERE 
	HIRE_DATE LIKE '1994%';

-- 8-1. 매니저가 없는 사람들의 LAST_NAME 및 JOB_ID 를 조회한다.
SELECT 
	LAST_NAME , JOB_ID 
FROM 
	EMPLOYEES
WHERE 
	MANAGER_ID IS NULL;

-- 8-2. 매니저가 있는 사람들의 LAST_NAME 및 JOB_ID 를 조회한다.
SELECT 
	LAST_NAME , JOB_ID 
FROM 
	EMPLOYEES
WHERE 
	MANAGER_ID IS NOT NULL;

-- 9. 커미션을 버는 모든 사원들의 LAST_ANME, 연봉 및 커미션을 조회한다.
--    연봉 역순, 커미션 역순차로 정렬한다.
SELECT 
	LAST_NAME , SALARY , COMMISSION_PCT 
FROM 
	EMPLOYEES
WHERE 
	COMMISSION_PCT IS NOT NULL 
ORDER BY SALARY , COMMISSION_PCT DESC;

-- 10. LAST_NAME 의 네번째 글자가 a 인 사원들의 LAST_NAME 을 조회한다.
SELECT 
	LAST_NAME 
FROM 
	EMPLOYEES
WHERE 
	LAST_NAME LIKE '___a%';

-- 11. LAST_NAME 에 a 및(OR) e 글자가 있는 사원들의 LAST_NAME 을 조회한다.
SELECT 
	LAST_NAME 
FROM 
	EMPLOYEES
WHERE 
	LAST_NAME LIKE '___a%' OR LAST_NAME LIKE '___e%';

-- 12. 연봉이 2,500, 3,500, 7000 이 아니며 직업이 SA_REP 이나 ST_CLERK 인 사람들을 조회한다.
SELECT 
	LAST_NAME , JOB_ID , SALARY 
FROM 
	EMPLOYEES
WHERE 
	SALARY NOT IN (2500, 3500, 7000 ) AND JOB_ID IN ('SA_REP', 'ST_CLERK');

-- 13-1.  직업이 AD_PRESS 인 사람은 A 등급을, ST_MAN 인 사람은 B 등급을, IT_PROG 인 사람은 C 등급을,
--          SA_REP 인 사람은 D 등급을, ST_CLERK 인 사람은 E 등급을 기타는 0 을 부여하여 조회한다.


-- 14. 모든 사원들의 LAST_NAME, 부서 이름 및 부서 번호을 조회한다.
SELECT 
	LAST_NAME , d.DEPARTMENT_NAME , DEPARTMENT_ID 
FROM 
	EMPLOYEES e , DEPARTMENTS d 
WHERE 
	e.DEPARTMENT_ID = d.DEPARTMENT_ID 

-- 15. 부서번호 30 내의 모든 직업들을 유일한 포맷으로 조회한다. 90 부서 또한 포함한다.
SELECT 
	DISTINCT JOB_ID , d.DEPARTMENT_ID 
FROM 
	EMPLOYEES e , DEPARTMENTS d 
WHERE 
	e.DEPARTMENT_ID = d.DEPARTMENT_ID AND d.DEPARTMENT_ID IN (30, 90);

-- 16-1. 커미션을 버는 모든 사람들의 LAST_NAME, 부서 명, 지역 ID 및 도시 명을 조회한다.
SELECT 
	LAST_NAME , d.DEPARTMENT_NAME , COMMISSION_PCT , l.LOCATION_ID , l.CITY 
FROM 
	EMPLOYEES e , DEPARTMENTS d , LOCATIONS l 
WHERE 
	e.DEPARTMENT_ID = d.DEPARTMENT_ID AND COMMISSION_PCT IS NOT NULL;

-- 16-2. 시애틀에 사는 사람 중 커미션을 버는 모든 사람들의 LAST_NAME, 부서 명, 지역 ID 및 도시 명을 조회한다.
SELECT 
	LAST_NAME , d.DEPARTMENT_NAME , COMMISSION_PCT , l.LOCATION_ID , l.CITY 
FROM 
	EMPLOYEES e , DEPARTMENTS d , LOCATIONS l 
WHERE 
	e.DEPARTMENT_ID = d.DEPARTMENT_ID AND l.CITY = 'Seattle' AND COMMISSION_PCT IS NOT NULL;


-- 17. LAST_NAME 이 DAVIES 인 사람보다 후에 고용된 사원들의 LAST_NAME 및 HIRE_DATE 을 조회한다.
SELECT LAST_NAME , HIRE_DATE FROM EMPLOYEES ORDER BY LAST_NAME;
SELECT LAST_NAME , HIRE_DATE FROM EMPLOYEES WHERE LAST_NAME = 'Davies';
SELECT 
	LAST_NAME , HIRE_DATE 
FROM 
	EMPLOYEES e
WHERE 
	HIRE_DATE >= (SELECT HIRE_DATE FROM EMPLOYEES WHERE LAST_NAME = 'Davies')
ORDER BY 
	HIRE_DATE;

-- 18. 자신의 매니저보다 먼저 고용된 사원들의 LAST_NAME 및 고용일을 조회한다.
SELECT 
	e.LAST_NAME , e.HIRE_DATE 
FROM 
	EMPLOYEES e , EMPLOYEES m
WHERE 
	e.MANAGER_ID = m.EMPLOYEE_ID AND e.HIRE_DATE < m.HIRE_DATE 
ORDER BY 
	e.LAST_NAME ;

-- 19. 회사 전체의 최대 연봉, 최소 연봉, 연봉 총 합 및 평균 연봉을 자연수로 포맷하여 조회한다.
SELECT 
	MAX(SALARY), MIN(SALARY), SUM(SALARY), ROUND(AVG(SALARY)) 
FROM 
	EMPLOYEES e ;

-- 20. 각 JOB_ID 별, 최대 연봉, 최소 연봉, 연봉 총 합 및 평균 연봉을 자연수로 포맷하여 조회한다.
SELECT 
	MAX(SALARY), MIN(SALARY), SUM(SALARY), ROUND(AVG(SALARY)) 
FROM 
	EMPLOYEES e 
GROUP BY JOB_ID 
ORDER BY JOB_ID ;

-- 21. 동일한 직업을 가진 사원들의 총 수를 조회한다.
SELECT 
	JOB_ID , COUNT(EMPLOYEE_ID) 
FROM 
	EMPLOYEES e 
GROUP BY JOB_ID ;

-- 22-1. 매니저로 근무하는 사원들의 총 수를 조회한다.
SELECT DISTINCT MANAGER_ID FROM EMPLOYEES e ;
SELECT COUNT(DISTINCT MANAGER_ID) FROM EMPLOYEES e ;
SELECT 
	COUNT(EMPLOYEE_ID) 
FROM 
	EMPLOYEES
WHERE 
	EMPLOYEE_ID IN (
		SELECT DISTINCT MANAGER_ID 
		FROM EMPLOYEES
		WHERE MANAGER_ID IS NOT NULL 
		);

-- 23. 사내의 최대 연봉 및 최소 연봉의 차이를 조회한다.
SELECT MAX(SALARY) - MIN(SALARY) FROM EMPLOYEES e; 
	
-- 24. 매니저의 사번 및 그 매니저 밑 사원들 중 최소 연봉을 받는 사원의 연봉을 조회한다.
--     매니저가 없는 사람들은 제외한다.
--     최소 연봉이 6000 미만인 경우는 제외한다.
--     연봉 기준 역순으로 조회한다.
SELECT 
	MANAGER_ID , MIN(SALARY) 
FROM 
	EMPLOYEES e 
WHERE 
	MANAGER_ID IS NOT NULL 
GROUP BY MANAGER_ID 
HAVING MIN(SALARY) >= 6000
ORDER BY MIN(SALARY) DESC ;

-- 25. 부서 명, 위치 ID, 각 부서 별 사원 총 수, 각 부서 별 평균 연봉을 조회한다.
--     평균 연봉은 소수점 2 자리까지만 표현한다.
SELECT 
	DEPARTMENT_NAME , LOCATION_ID , COUNT(EMPLOYEE_ID),
	ROUND(AVG(SALARY), 2) 
FROM 
	EMPLOYEES e , DEPARTMENTS d 
WHERE 
	e.DEPARTMENT_ID = d.DEPARTMENT_ID 
GROUP BY 
	DEPARTMENT_NAME, LOCATION_ID ;

-- 26-1. 총 사원 수 및 1995, 1996, 1997, 1998 년도 별 고용된 사원들의 총 수를 다음과 같이 조회한다.


-- 27-1.  각 부서별 각 직업 별 연봉 총 합 및 각 부서별 연봉 총 합을 조회한다.


-- 27-2.  다음과 같은 포멧으로 각 부서별 각 직업 별 연봉 총 합 및
--        각 부서별 연봉 총 합을 조회한다.


-- 27-3.  다음과 같은 포멧으로 각 부서별 각 직업 별 연봉 총 합 및
--        각 부서별 연봉 총 합을 조회한다.


-- 28. LAST_NAME 이 Zlotkey 와 동일한 부서에 근무하는 모든 사원들의 사번 및 고용날짜를 조회한다.
--     결과값에서 Zlotkey 는 제외한다.


-- 29. 회사 전체 평균 연봉보다 더 받는 사원들의 사번 및 LAST_NAME 을 조회한다.


-- 30-1. LAST_NAME 에 u 가 포함되는 사원들과 동일 부서에 근무하는 사원들의 사번 및 LAST_NAME 을 조회한다.


-- 30-2. (VIEW 이용) LAST_NAME 에 u 가 포함되는 사원들과 동일 부서에 근무하는 사원들의 사번 및 LAST_NAME 을 조회한다.


-- 31-1. 위치 ID 가 1700 인 부서에서 근무하는 사원들의 LAST_NAME, 부서 번호 및 JOB_ID 를 조회한다.


-- 31-2. (VIEW 이용)위치 ID 가 1700 인 부서에서 근무하는 사원들의 LAST_NAME, 부서 번호 및 JOB_ID 를 조회한다.


-- 32. King 을 매니저로 두고 있는 모든 사원들의 LAST_NAME 및 연봉을 조회한다.


-- 33. EXECUTIVE 부서에 근무하는 모든 사원들의 부서 번호, LAST_NAME, JOB_ID 를 조회한다.


-- 34-1. 회사 전체 평균 연봉 보다 더 버는 사원들 중 LAST_NAME 에 u 가 있는 사원들이
--       근무하는 부서에서 근무하는 사원들의 사번, LAST_NAME 및 연봉을 조회한다.


-- 34-2. (VIEW 이용)회사 전체 평균 연봉 보다 더 버는 사원들 중 LAST_NAME 에 u 가 있는 사원들이
--       근무하는 부서에서 근무하는 사원들의 사번, LAST_NAME 및 연봉을 조회한다.


-- 35-1. ST_CLERK 인 직업 ID 를 가진 사원이 없는 부서 ID 를 조회한다.
--       NULL 값은 제외한다. (NOT EXISTS 사용)


-- 35-2. ST_CLERK 인 직업 ID 를 가진 사원이 있는 부서 ID 를 조회한다.
--       NULL 값은 제외한다. (NOT EXISTS 사용)


-- 36-1. 위치한 부서가 없는 국가 ID 및 국가 이름을 조회힌다.(NOT EXISTS 사용)


-- 37. 기존의 직업을 여전히 가지고 있는 사원들의 사번 및 JOB_ID 를 조회한다.


-- 41. 커미션을 버는 사원들의 부서와 연봉이 동일한 사원들의 LAST_NAME, 부서 번호 및 연봉을 조회한다.


-- 42. 위치 ID 가 1700 인 사원들의 연봉과 커미션이 동일한 사원들의 LAST_NAME, 부서 번호 및 연봉을 조회한다.


-- 42-2. (VIEW)위치 ID 가 1700 인 사원들의 연봉과 커미션이 동일한 사원들의 LAST_NAME, 부서 번호 및 연봉을 조회한다.


-- 42-2. (VIEW 강사님)위치 ID 가 1700 인 사원들의 연봉과 커미션이 동일한 사원들의 LAST_NAME, 부서 번호 및 연봉을 조회한다.


-- 43. LAST_NAME 이 'Kochhar' 인 사원과 동일한 연봉 및 커미션을 버는 사원들의 LAST_NAME, 부서 번호 및 연봉을 조회한다.


-- 44-1. 직업 ID 가 SA_MAN 인 사원들이 받을 수 있는 최대 연봉 보다 높게 받는 사원들의 LAST_NAME, JOB_ID 및 연봉을 조회한다.


-- 44-2. 직업 ID 가 SA_MAN 인 사원들의 최대 연봉 보다 높게 받는 사원들의 LAST_NAME, JOB_ID 및 연봉을 조회한다.


-- 45. 도시 이름이 T 로 시작하는 지역에 사는 사원들의 사번, LAST_NAME 및 부서 번호를 조회한다.


-- 46.  각 부서별 평균 연봉보다 더 받는 동일부서 근무사원들의
--      LAST_NAME, 연봉, 부서번호 및 해당 부서의 평균 연봉을 조회한다.
--      결과는 부서별 연봉을 기준으로 정렬한다.



-- 47. NOT EXISTS 연산자를 사용하여 매니저가 아닌 사원 이름을 조회한다.


-- 48. 소속부서의 평균 연봉보다 적게 버는 사원들의 last_name 을 조회한다.


-- 49. 각 사원 별 소속부서에서 자신보다 늦게 고용되었으나 보다 많은 연봉을 받는 사원이 존재하는 모든 사원들의 last_name 을 조회한다.
/* LASTNAME 출력 */










