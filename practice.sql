CREATE TABLE DEPT(
    DEPTNO NUMBER(2,0) PRIMARY KEY,
    DNAME VARCHAR(14),
    LOC VARCHAR(13)
);

CREATE TABLE EMP(
    EMPNO NUMBER(4,0) PRIMARY KEY,
    ENAME VARCHAR(10),
    JOB VARCHAR(9),
    MGR NUMBER(4,0),
    HIREDATE DATE,
    SAL NUMBER(7,2),
    COMM NUMBER(7,2),
    DEPTNO NUMBER(2,0),
    FOREIGN KEY (DEPTNO) REFERENCES DEPT(DEPTNO)
);

CREATE TABLE BONUS(
    ENAME VARCHAR(10),
    JOB VARCHAR(9),
    SAL NUMBER,
    COMM NUMBER
);

CREATE TABLE SALGRADE(
    GRADE NUMBER,
    LOSAL NUMBER,
    HISAL NUMBER
);

INSERT INTO DEPT VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO DEPT VALUES (20, 'RESEARCH', 'DALLAS');
INSERT INTO DEPT VALUES (30, 'SALES', 'CHICAGO');
INSERT INTO DEPT VALUES (40, 'OPERATIONS', 'BOSTON');

SELECT * FROM DEPT;

INSERT INTO EMP VALUES (7839, 'KING', 'PRESIDENT', NULL, TO_DATE('17-11-1981','DD-MM-YYYY'), 5000, NULL, 10);
INSERT INTO EMP VALUES (7566, 'JONES', 'MANAGER', 7839, TO_DATE('02-04-1981','DD-MM-YYYY'), 2975, NULL, 20);
INSERT INTO EMP VALUES (7698, 'BLAKE', 'MANAGER', 7839, TO_DATE('01-05-1981','DD-MM-YYYY'), 2850, NULL, 30);
INSERT INTO EMP VALUES (7782, 'CLARK', 'MANAGER', 7839, TO_DATE('09-06-1981','DD-MM-YYYY'), 2450, NULL, 10);
INSERT INTO EMP VALUES (7788, 'SCOTT', 'ANALYST', 7566, TO_DATE('13-07-1987','DD-MM-YYYY'), 3000, NULL, 20);
INSERT INTO EMP VALUES (7902, 'FORD', 'ANALYST', 7566, TO_DATE('03-12-1981','DD-MM-YYYY'), 3000, NULL, 20);
INSERT INTO EMP VALUES (7844, 'TURNER', 'SALESMAN', 7698, TO_DATE('08-09-1981','DD-MM-YYYY'), 1500, 0, 30);
INSERT INTO EMP VALUES (7900, 'JAMES', 'CLERK', 7698, TO_DATE('03-12-1981','DD-MM-YYYY'), 950, NULL, 30);
INSERT INTO EMP VALUES (7654, 'MARTIN', 'SALESMAN', 7698, TO_DATE('28-09-1981','DD-MM-YYYY'), 1250, 1400, 30);
INSERT INTO EMP VALUES (7499, 'ALLEN', 'SALESMAN', 7698, TO_DATE('20-02-1981','DD-MM-YYYY'), 1600, 300, 30);
INSERT INTO EMP VALUES (7521, 'WARD', 'SALESMAN', 7698, TO_DATE('22-02-1981','DD-MM-YYYY'), 1250, 500, 30);
INSERT INTO EMP VALUES (7934, 'MILLER', 'CLERK', 7782, TO_DATE('23-01-1982','DD-MM-YYYY'), 1300, NULL, 10);
INSERT INTO EMP VALUES (7876, 'ADAMS', 'CLERK', 7788, TO_DATE('13-07-1987','DD-MM-YYYY'), 1100, NULL, 20);
INSERT INTO EMP VALUES (7369, 'SMITH', 'CLERK', 7902, TO_DATE('17-12-1980','DD-MM-YYYY'), 800, NULL, 20);


INSERT INTO SALGRADE VALUES (1, 700, 1200);
INSERT INTO SALGRADE VALUES (2, 1201, 1400);
INSERT INTO SALGRADE VALUES (3, 1401, 2000);
INSERT INTO SALGRADE VALUES (4, 2001, 3000);
INSERT INTO SALGRADE VALUES (5, 3001, 9999);

SELECT * FROM SALGRADE;

INSERT INTO BONUS VALUES ('ALLEN', 'SALESMAN', 1600, 300);
INSERT INTO BONUS VALUES ('WARD', 'SALESMAN', 1250, 500);
INSERT INTO BONUS VALUES ('MARTIN', 'SALESMAN', 1250, 1400);
INSERT INTO BONUS VALUES ('TURNER', 'SALESMAN', 1500, 0);
INSERT INTO BONUS VALUES ('JAMES', 'CLERK', 950, NULL);

SELECT * FROM BONUS;

-- QUERIES-CLAUSES-DISTINCT, ORDER BY, WHERE, OR, AND, IN
SELECT * FROM EMP;
SELECT DISTINCT JOB FROM EMP;

SELECT * FROM EMP
ORDER BY SAL DESC;

SELECT * FROM EMP
WHERE JOB = 'MANAGER' AND DEPTNO = 20;

SELECT * FROM EMP
WHERE JOB = 'MANAGER' OR DEPTNO = 20;

SELECT * FROM EMP
WHERE SAL BETWEEN 3000 AND 5000;

SELECT * FROM EMP
WHERE ENAME LIKE '%I%';


-- QUERIES - CHARACTER FUNCTIONS

SELECT EMPNO, ENAME, INITCAP(ENAME) AS CAMEL_CASE_NAME FROM EMP;
SELECT EMPNO, ENAME, LTRIM(ENAME) FROM EMP;
SELECT EMPNO, ENAME, RTRIM(ENAME) FROM EMP;
SELECT EMPNO, ENAME, RTRIM(LTRIM(ENAME)) FROM EMP;
SELECT EMPNO, ENAME, TRIM(ENAME) FROM EMP;
SELECT EMPNO, ENAME, LOWER(ENAME) FROM EMP;
SELECT EMPNO, ENAME, COMM, NVL(COMM, 0) AS COMMISION FROM EMP; --ASSIGN VALUE IN NULL
SELECT EMPNO, ENAME, COMM, NVL2(COMM, 1000, 100) AS COMMISION FROM EMP; --ASSIGN 100 IN NULL AND 1000 WHERE COMM IS PRESENT

SELECT 'SOHINI', LENGTH('SOHINI') FROM DUAL;

SELECT EMPNO, ENAME, LENGTH(ENAME) AS LENGTH_ENAME FROM EMP;

SELECT INSTR('SOHINI', 'I') FROM DUAL;
SELECT SUBSTR('SOHINI', 2, 3) FROM DUAL;

SELECT ENAME, JOB, DECODE(JOB, 'MANAGER', 'MGR', 'ANALYST', 'ANA', JOB) AS JOB_TITLE
FROM EMP;

-- DATE FUNCTION
SELECT SYSDATE FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'DD/MM/YY') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'DD/MON/YYYY') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'DD/MONTH/YYYY') FROM DUAL;
SELECT ADD_MONTHS(SYSDATE, 10) FROM DUAL;
SELECT MONTHS_BETWEEN('15-JUN-2025', '22-OCT-2003') FROM DUAL;


-- AGGREGATE FUNCTIONS
SELECT COUNT(EMPNO) FROM EMP;
SELECT SUM(SAL) FROM EMP;
SELECT MAX(SAL) FROM EMP;
SELECT MIN(SAL) FROM EMP;
SELECT ROUND(AVG(SAL)) FROM EMP;
SELECT AVG(ROUND(SAL)) FROM EMP;

-- GROUP BY HAVING
SELECT JOB, SUM(SAL), MAX(SAL), MIN(SAL) FROM EMP
WHERE JOB IN ('MANAGER', 'CLERK')
GROUP BY JOB
HAVING MAX(SAL) < 3000
ORDER BY JOB;

-- SET OPERATION
CREATE TABLE X(A NUMBER);
CREATE TABLE Y(A NUMBER);

INSERT INTO X VALUES (1);
INSERT INTO X VALUES (2);
INSERT INTO X VALUES (3);
INSERT INTO X VALUES (4);
INSERT INTO X VALUES (5);

INSERT INTO Y VALUES (1);
INSERT INTO Y VALUES (2);
INSERT INTO Y VALUES (5);
INSERT INTO Y VALUES (7);

SELECT * FROM X;
SELECT * FROM Y;

SELECT A FROM X
UNION
SELECT A FROM Y;

SELECT A FROM X
UNION ALL
SELECT A FROM Y;

SELECT A FROM X
INTERSECT
SELECT A FROM Y;

SELECT A FROM X
MINUS
SELECT A FROM Y;

-- CONSTRAINTS (NOT NULL, PRIMARY KEY, UNIQUE, FOREIGN KEY, CHECK)

-- JOINS
-- 1. INNER OR EQUI JOIN
-- 2. NON-EQUI JOIN
-- 3. OUTER JOIN - LEFT, RIGHT, FULL
-- 4. SELF JOIN
-- 5. CROSS JOIN

-- INNER JOIN OR EQUI JOIN
SELECT E.EMPNO, E.ENAME, E.DEPTNO, D.DNAME
FROM EMP E INNER JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;

SELECT E.EMPNO, E.ENAME, E.DEPTNO, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;

-- NON-EQUI JOIN
SELECT E.EMPNO, E.ENAME, E.DEPTNO, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO <> D.DEPTNO;

SELECT E.EMPNO, E.ENAME, E.DEPTNO, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO != D.DEPTNO;

-- LEFT OUTER JOIN
SELECT X.A AS X, Y.A AS Y
FROM X LEFT OUTER JOIN Y
ON X.A = Y.A;

-- RIGHT OUTER JOIN
SELECT X.A AS X, Y.A AS Y
FROM X RIGHT OUTER JOIN Y
ON X.A = Y.A;

-- SELF JOIN
SELECT E.EMPNO, E.ENAME, E.MGR, E.ENAME FROM EMP E, EMP M
WHERE E.MGR = M.EMPNO;