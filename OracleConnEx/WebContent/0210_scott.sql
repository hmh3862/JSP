-- scott 계정에서 하세요

SELECT * FROM emp;
SELECT * FROM dept;

CREATE OR REPLACE PROCEDURE ExpCursor_Test
	(v_deptno dept.deptno%TYPE)
	IS
	-- 커서를 선언한다.
	CURSOR dept_avg IS
		SELECT b.dname, COUNT(a.empno) cnt, ROUND(AVG(a.sal),3) salary
		FROM emp a, dept b
		WHERE a.deptno = b.deptno
		AND b.deptno = v_deptno
		GROUP BY b.dname ;

	-- 커서를 패치하기 위한 변수 선언
	v_dname dept.dname%TYPE;
	emp_cnt NUMBER;
	sal_avg NUMBER;

BEGIN
	-- 커서의 오픈
	OPEN dept_avg;

	-- 커서의 패치
	FETCH dept_avg INTO v_dname, emp_cnt, sal_avg;
	DBMS_OUTPUT.PUT_LINE('부서명 : ' || v_dname);
	DBMS_OUTPUT.PUT_LINE('사원수 : ' || emp_cnt);
	DBMS_OUTPUT.PUT_LINE('평균급여 : ' || sal_avg);
	-- 커서의 CLOSE
	CLOSE dept_avg;

	EXCEPTION
		WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE(SQLERRM||'에러 발생 ');
END;

CALL ExpCursor_Test(10);
CALL ExpCursor_Test(20);
CALL ExpCursor_Test(30);
CALL ExpCursor_Test(50);

-- 커서의 반복 : for 변수명 IN 커서 Loop ~ end LOOP
CREATE OR REPLACE PROCEDURE ForCursor_Test
IS
	CURSOR dept_sum IS
	SELECT b.dname, COUNT(a.empno) cnt, SUM(a.sal) salary
	FROM emp a, dept b
	WHERE a.deptno = b.deptno
	GROUP BY b.dname;
BEGIN
	-- Cursor 를 FOR 문에서 실행시킨다
	FOR emp_list IN dept_sum LOOP
		DBMS_OUTPUT.PUT_LINE('부서명 : ' || emp_list.dname);
		DBMS_OUTPUT.PUT_LINE('사원수 : ' || emp_list.cnt);
		DBMS_OUTPUT.PUT_LINE('급여합계 : ' || emp_list.salary);
	END LOOP;
	EXCEPTION
		WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE(SQLERRM||'에러 발생 ');
END;

CALL ForCursor_Test();

-- 파라메터가 있는 커서 예제
CREATE OR REPLACE PROCEDURE ParamCursor_Test(param_deptno emp.deptno%TYPE)
IS
	v_ename emp.ename%TYPE;
	-- Parameter가 있는 커서의 선언
	CURSOR emp_list(v_deptno emp.deptno%TYPE) IS
	SELECT ename FROM emp WHERE deptno = v_deptno;
BEGIN
	DBMS_OUTPUT.ENABLE;
	DBMS_OUTPUT.PUT_LINE(' ****** 입력한 부서에 해당하는 사람들 ****** ');
	-- Parameter변수의 값을 전달(OPEN될 때 값을 전달한다)
	FOR emplst IN emp_list(param_deptno) LOOP
		DBMS_OUTPUT.PUT_LINE('이름 : ' || emplst.ename);
	END LOOP;
	EXCEPTION
		WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('ERR MESSAGE : ' || SQLERRM);
END;


CALL ParamCursor_Test(10);
CALL ParamCursor_Test(30);


-- =================================
-- JOIN 실습문제(scott 계정)
-- =================================

-- 1. 부서 테이블과 사원테이블에서 사번, 사원명, 부서코드, 부서명을 검색하시오. ( 사원명 오름차순 정렬할 것 )
SELECT 
	e.EMPNO , e.ENAME , e.DEPTNO , d.DNAME 
FROM 
	EMP e , DEPT d 
WHERE 
	e.DEPTNO  = d.DEPTNO 
ORDER BY 2;

SELECT
	e.EMPNO , e.ENAME , d.DEPTNO , d.DNAME 
FROM
	DEPT d , EMP e 
WHERE
	d.DEPTNO = e.DEPTNO
ORDER BY
	2;

-- 2. 부서 테이블과 사원테이블에서 사번, 사원명 , 급여 , 부서명을 검색하시오. 
--    단, 급여가 2000 이상인 사원에 대하여 급여기준으로 내림차순 정렬할 것.
SELECT * FROM EMP e2 ;

SELECT 
	e.EMPNO , e.ENAME , e.SAL , d.DNAME 
FROM 
	EMP e , DEPT d 
WHERE 
	e.DEPTNO  = d.DEPTNO AND e.SAL >= 2000
ORDER BY 3 desc;

SELECT
	e.EMPNO , e.ENAME , e.SAL , d.DNAME 
FROM
	DEPT d , EMP e 
WHERE
	d.DEPTNO = e.DEPTNO AND e.SAL >= 2000
ORDER BY
	3 DESC ;

-- 3. 부서 테이블과 사원 테이블에서 사번, 사원명, 업무, 급여 , 부서명을 검색하시오. 
--    단, 업무가 Manager이며 급여가 2500 이상인 사원에 대하여 사번을 기준으로 오름차순 정렬할 것.
SELECT 
	e.EMPNO , e.ENAME , e.JOB , e.SAL , d.DNAME 
FROM 
	EMP e , DEPT d 
WHERE 
	e.DEPTNO  = d.DEPTNO AND e.SAL >= 2500 AND UPPER(JOB) = UPPER('Manager')
ORDER BY 3 desc;

SELECT
	e.EMPNO , e.ENAME , e.JOB , e.SAL , d.DNAME 
FROM
	DEPT d , EMP e 
WHERE
	d.DEPTNO = e.DEPTNO AND e.JOB = UPPER('Manager') AND e.SAL >= 2500
ORDER BY
	1 ;

-- 4. 사원 테이블과 급여 등급 테이블에서 사번, 사원명, 급여, 등급을 검색하시오. 
--    단, 등급은 급여가 하한값과 상한값 범위에 포함되고 등급이 4이며 급여를 기준으로 내림차순정렬할 것.
SELECT * FROM SALGRADE s2 ;
SELECT * FROM EMP e ;

SELECT 
	EMPNO, ENAME, SAL, GRADE 
FROM 
	EMP E, SALGRADE S 
WHERE 
	SAL BETWEEN LOSAL AND HISAL 
	AND 
	GRADE = 4 
ORDER BY SAL DESC;

SELECT
	e.EMPNO , e.ENAME , e.SAL , s.GRADE 
FROM
	EMP e , SALGRADE s
WHERE
	-- e.SAL >= s.LOSAL AND e.SAL <= s.HISAL AND s.GRADE = 4
	e.SAL BETWEEN s.LOSAL AND s.HISAL AND s.GRADE = 4
ORDER BY
	3 DESC ;


-- 5. 부서 테이블, 사원 테이블, 급여등급 테이블에서 사번, 사원명, 부서명, 급여 , 등급을 검색하시오. 
--    단, 등급은 급여가 하한값과 상한값 범위에 포함되며 등급을 기준으로 내림차순 정렬할 것.
SELECT 
	EMPNO, ENAME, SAL, GRADE 
FROM 
	EMP E, SALGRADE S , DEPT d 
WHERE 
	E.DEPTNO  = d.DEPTNO 
	AND 
	SAL BETWEEN LOSAL AND HISAL 
ORDER BY GRADE DESC;

SELECT
	e.EMPNO , e.ENAME , d.DNAME , e.SAL , s.GRADE 
FROM
	DEPT d , EMP e , SALGRADE s
WHERE
	E.DEPTNO  = d.DEPTNO 
	AND 
	--e.SAL >= s.LOSAL AND e.SAL <= s.HISAL
	e.SAL BETWEEN s.LOSAL AND s.HISAL
ORDER BY
	5 DESC ;

-- 6. 사원 테이블에서 사원명과 해당 사원의 관리자명을 검색하시오
SELECT * FROM EMP e2 ;

SELECT 
	E.ENAME 사원명, M.ENAME 관리자명 
FROM 
	EMP E, EMP M 
WHERE 
	E.MGR = M.EMPNO;

SELECT
	e.ENAME "사원명" , m.ENAME "관리자명"
FROM
	EMP e , EMP m
WHERE
	e.MGR = m.EMPNO ;

-- 7. 사원 테이블에서 사원명, 해당 사원의 관리자명, 해당 사원의 관리자의 관리자명을 검색하시오
SELECT 
	E.ENAME 사원명, M.ENAME 관리자명 , M2.ENAME "관리자의 관리자명"
FROM 
	EMP E, EMP M , EMP M2
WHERE 
	E.MGR = M.EMPNO AND M.MGR  = M2.EMPNO;

SELECT
	DISTINCT e.ENAME "사원명" , m.ENAME "관리자명" , e2.ENAME "관리자의 관리자명"
FROM
	EMP e , EMP m , EMP e2 
WHERE
	e.MGR = m.EMPNO AND m.MGR = e2.EMPNO ;











