--사원번호를 전달하면 해당 사원의 이름을 반환하는 함수 만들기

CREATE OR REPLACE FUNCTION GET_NAME(EMPNO EMPLOYEE_TBL.EMP_NO%TYPE)
RETURN VARCHAR2  --리턴은 사이즈 값 설정 X --
IS
    EMPNAME EMPLOYEE_TBL.NAME%TYPE;
BEGIN
    SELECT NAME
      INTO EMPNAME
      FROM EMPLOYEE_TBL
     WHERE EMP_NO = EMPNO;
    RETURN EMPNAME;
END;    
  
-- 사원명
-- 구창민
-- 번호로 조회하기
SELECT DISTINCT GET_NAME(1001) AS 사원명
  FROM EMPLOYEE_TBL
 WHERE EMP_NO = 1001; 

-- 전체 조회하기  
SELECT GET_NAME(EMP_NO) AS 사원명
  FROM EMPLOYEE_TBL;
  
  