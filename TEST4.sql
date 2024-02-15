--1--
--top 3
SELECT * 
FROM (SELECT EMPLOYEE_ID, FIRST_NAME,LAST_NAME,DEPARTMENT_ID,SALARY,
                    DENSE_RANK() OVER(PARTITION BY DEPARTMENT_ID ORDER BY SALARY DESC)AS RANKING1,
                    DENSE_RANK() OVER(PARTITION BY DEPARTMENT_ID ORDER BY SALARY)AS RANKING
                    FROM EMPLOYEES) TOPRANK
WHERE TOPRANK.RANKING1<=3 OR TOPRANK.RANKING<=3;
--BOTTOM 3--
SELECT * 
FROM (SELECT EMPLOYEE_ID, FIRST_NAME,LAST_NAME,DEPARTMENT_ID,SALARY,
                    DENSE_RANK() OVER(PARTITION BY DEPARTMENT_ID ORDER BY SALARY)AS RANKING
                    FROM EMPLOYEES) BOTTOMRANK
WHERE BOTTOMRANK.RANKING<=3;

---2---
SELECT * FROM JOB_HISTORY;
SELECT *
FROM(SELECT EMPLOYEE_ID, END_DATE,
    DENSE_RANK() OVER(ORDER BY END_DATE DESC)AS RANKING
    FROM JOB_HISTORY) RECENT_LEAVE
WHERE RECENT_LEAVE.RANKING<=1;

----3------
SELECT * FROM EMPLOYEES WHERE (0.3*SALARY)+SALARY = (2*SALARY);

-----4-----


-----5------
SELECT TO_CHAR(HIRE_DATE,'YYYY'), COUNT(*)AS TOT_CNT 
FROM EMPLOYEES
GROUP BY TO_CHAR(HIRE_DATE,'YYYY')
HAVING COUNT(*) = (SELECT MAX(COUNT(*))
                   FROM EMPLOYEES
                   GROUP BY TO_CHAR(HIRE_DATE,'YYYY'));
