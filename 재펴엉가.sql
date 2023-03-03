-- �����޽��� ��� ON
SET SERVEROUTPUT ON;

-- ���̺� ����
DROP TABLE BUYS;
DROP TABLE USERS;

-- ����� ���̺�
-- Į�� : ����ڹ�ȣ, ���̵�, �̸�, �¾�⵵, �ּ�, ����ó1, ����ó2, ������
-- �⺻Ű : ����ڹ�ȣ
CREATE TABLE USERS (
    USER_NO NUMBER NOT NULL CONSTRAINT PK_USERS PRIMARY KEY,
    USER_ID VARCHAR2(20 BYTE) NOT NULL UNIQUE,
    USER_NAME VARCHAR2(20 BYTE),
    USER_YEAR NUMBER(4),
    USER_ADDR VARCHAR2(100 BYTE),
    USER_MOBILE1 VARCHAR2(3 BYTE),  -- 010, 011 ��
    USER_MOBILE2 VARCHAR2(8 BYTE),  -- 12345678, 11111111 ��
    USER_REGDATE DATE
);

-- ���� ���̺�
-- Į�� : ���Ź�ȣ, ���̵�, ��ǰ��, ��ǰī�װ�, ��ǰ����, ���Ű���
-- �⺻Ű : ���Ź�ȣ
-- �ܷ�Ű : ���̵� (����� ���̺��� ���̵� Į���� �����ϴ� Ű)
CREATE TABLE BUYS (
    BUY_NO NUMBER NOT NULL CONSTRAINT PK_BUYS PRIMARY KEY,
    USER_ID VARCHAR2(20 BYTE) CONSTRAINT FK_BUYS_USERS REFERENCES USERS(USER_ID),
    PROD_NAME VARCHAR2(20 BYTE),
    PROD_CATEGORY VARCHAR2(20 BYTE),
    PROD_PRICE NUMBER,
    BUY_AMOUNT NUMBER
);

-- USERS ���̺� ���ڵ�(��, ROW) �����ϱ�
INSERT INTO USERS VALUES (1, 'YJS', '���缮', 1972, '����', '010', '11111111', '08/08/08');
INSERT INTO USERS VALUES (2, 'KHD', '��ȣ��', 1970, '���', '011', '22222222', '07/07/07');
INSERT INTO USERS VALUES (3, 'KKJ', '�豹��', 1965, '����', '019', '33333333', '09/09/09');
INSERT INTO USERS VALUES (4, 'KYM', '��븸', 1967, '����', '010', '44444444', '15/05/05');
INSERT INTO USERS VALUES (5, 'KJD', '������', 1974, '�泲', NULL, NULL, '13/03/03');
INSERT INTO USERS VALUES (6, 'NHS', '����', 1971, '�泲', '016', '55555555', '14/04/04');
INSERT INTO USERS VALUES (7, 'SDY', '�ŵ���', 1971, '���', NULL, NULL, '08/10/10');
INSERT INTO USERS VALUES (8, 'LHJ', '������', 1972, '���', '011', '66666666', '06/04/04');
INSERT INTO USERS VALUES (9, 'LKK', '�̰��', 1960, '�泲', '018', '77777777', '04/12/12');
INSERT INTO USERS VALUES (10, 'PSH', '�ڼ�ȫ', 1970, '����', '010', '88888888', '12/05/05');

-- BUYS ���̺� ���ڵ�(��, ROW) �����ϱ�
INSERT INTO BUYS VALUES (1001, 'KHD', '�ȭ', NULL, 30, 2);
INSERT INTO BUYS VALUES (1002, 'KHD', '��Ʈ��', '����', 1000, 1);
INSERT INTO BUYS VALUES (1003, 'KYM', '�����', '����', 200, 1);
INSERT INTO BUYS VALUES (1004, 'PSH', '�����', '����', 200, 5);
INSERT INTO BUYS VALUES (1005, 'KHD', 'û����', '�Ƿ�', 50, 3);
INSERT INTO BUYS VALUES (1006, 'PSH', '�޸�', '����', 80, 10);
INSERT INTO BUYS VALUES (1007, 'KJD', 'å', '����', 15, 5);
INSERT INTO BUYS VALUES (1008, 'LHJ', 'å', '����', 15, 2);
INSERT INTO BUYS VALUES (1009, 'LHJ', 'û����', '�Ƿ�', 50, 1);
INSERT INTO BUYS VALUES (1010, 'PSH', '�ȭ', NULL, 30, 2);

COMMIT;



-- 1. ����(BUYS) ���̺��� ���Ű���(BUY_AMOUNT)�� ����� ������ ���� ó���ؼ� ��ȸ�ϴ� �������� �ۼ��Ͻÿ�. (5��)
SELECT FLOOR(AVG(BUY_AMOUNT))
  FROM BUYS;


-- 2. �����(USERS) ���̺��� ������(USER_REGDATE)�κ��� ������� ����� �ϼ��� ��ȸ�ϴ� �������� �ۼ��Ͻÿ�. ����� �Ҽ����� ������ �ݿø��ؼ� ��ȸ�Ͻÿ�. (5��)
SELECT ROUND(SYSDATE - USER_REGDATE) AS ������
  FROM USERS;

-- 3. �����(USERS) ���̺��� �¾�⵵(USER_YEAR) Į���� �̿��Ͽ� ���� ���̰� ���� ����ڰ� �¾�⵵�� ��ȸ�ϴ� �������� �ۼ��Ͻÿ�. (5��)
SELECT MIN(USER_YEAR) AS �¾�⵵
  FROM USERS;

-- 4. �����(USERS) ���̺��� �¾�⵵(USER_YEAR) Į���� �̿��Ͽ� ���� ���̰� ���� ������� �̸�(USER_NAME)�� ��ȸ�ϴ� �������� �ۼ��Ͻÿ�. (5��)
SELECT MAX(USER_YEAR) AS �¾�⵵
  FROM USERS;


-- 5. Ư�� ���̺��� ������ �ִ� SCOTT ����� ������ �����ϴ� �������� �ۼ��Ͻÿ�.
-- SCOTT ����� ������ ���ŵǸ鼭 ���̺� �Բ� ������ �� �ֵ��� �ɼ��� ����Ͻÿ�.
-- ��, ������ SCOTT ����� ������ ���������� ���� �������� �ۼ��Ͻÿ�. (5��)

DROP USER SCOTT CASCADE;


-- 6. ���� ����ڸ� �����ϴ� �������� ������ ����ڿ��� ������ �ο��ϴ� �������� ���� ��� �ۼ��Ͻÿ�. (5��)
--    1) ����ڸ� : ADMIN
--    2) ��й�ȣ : 1234
--    3) ������ : DBA

CREATE USER ADMIN IDENTIFIED BY 1234;
GRANT DBA TO ADMIN;

-- 7. ��� ���� �����̵�, ����, ����Ƚ���� ��ȸ�Ͻÿ�. �ܺ������� ����Ͻÿ�. (10��)
SELECT U.USER_ID AS �����̵� ,U.USER_NAME AS ����,COUNT(B.BUY_NO) AS ����Ƚ��
  FROM USERS U LEFT OUTER JOIN BUYS B
    ON U.USER_ID = B.USER_ID
 GROUP BY U.USER_ID,U.USER_NAME; 
  
   
-- 8. ī�װ��� '����'�� ��ǰ�� ������ �����̵�, ����, �ѱ��ž��� ��ȸ�Ͻÿ�. (10��)

SELECT U.USER_ID AS �����̵� , U.USER_NAME AS ���� , SUM(B.PROD_PRICE) AS �ѱ��ž� 
  FROM USERS U INNER JOIN BUYS B
    ON U.USER_ID = B.USER_ID
 WHERE B.PROD_PRICE = '����';  
 


-- 9. ����Ƚ���� 2ȸ �̻��� �����̵�, ����, ����Ƚ���� ��ȸ�Ͻÿ�. ���������� ����Ͻÿ�. (10��)

SELECT U.USER_ID AS �����̵�, U.USER_NAME AS ����, COUNT(B.BUY_NO) AS ����Ƚ��
  FROM USERS U INNER JOIN BUYS B
    ON U.USER_ID = B.USER_ID
 WHERE U.USER_ID , U.USER_NAME , COUNT; 

-- 10. �¾�⵵(USER_YEAR)�� 1960���� ������� �̸��� �����޽����� ����� �� �ִ� USER_PROC ���ν����� �ۼ��Ͻÿ�.
-- �ۼ��� USER_PROC ���ν����� ȣ���ϱ� ���� �ڵ嵵 �Բ� �ۼ��Ͻÿ�.
-- (����. 1960�⿡ �¾ ����� 1���̰�, �̸��� �̰���̴�.) (���ν��� �ۼ� 8��, ���ν��� ȣ�� 2��)

-- �ۼ�
CREATE OR REPLACE PROCEDURE USER_PROC
IS
    NAME USERS.USER_NAME%TYPE;
BEGIN
    SELECT USER_NAME
      INTO NAME
      FROM USERS
     WHERE USER_YEAR = 1960;
    DBMS_OUTPUT.PUT_LINE(NAME);
END;

-- ȣ��
EXECUTE USER_PROC();


-- 11. ������� ���̵�(USER_ID)�� �����ϸ� �ش� ���̵� ���� ������� �����Ѿ�(PROD_PRICE * BUY_AMOUNT)�� �հ踦 ����� �� �հ谡 1000 �̻��̸� 'A', 1000 �̸� 500 �̻��̸� 'B', 500 �̸��̸� 'C'�� ��ȯ�ϴ� GET_GRADE() ����� �Լ��� �ۼ��Ͻÿ�.
--     ���̵� 'KHD'�� ������� �̸�(USER_NAME)�� GET_GRADE() �Լ��� ����� ��ȸ�ϴ� �������� �ۼ��Ͻÿ�. (�Լ� �ۼ� 8��, �Լ� ��� ��ȸ 2��)
CREATE OR REPLACE FUNCTION GET_GRADE(USERID USERS.USER_ID%TYPE)
RETURN VARCHAR2
IS
    BUY_TOTAL NUMBER;
BEGIN
    SELECT SUM(PROD_PRICE * BUY_AMOUNT)
      INTO BUY_TOTAL
      FROM BUYS
     WHERE USER_ID = USERID;
    IF BUY_TOTAL >= 1000 THEN
        RETURN 'A';
    ELSIF BUY_TOTAL >= 500 THEN
        RETURN 'B';
    ELSE
        RETURN 'C';
    END IF;
END;

SELECT USER_NAME AS ����, GET_GRADE('KHD') AS ���
  FROM USERS
 WHERE USER_ID = 'KHD';

-- ��. ��� ���� ��� Ȯ����?
SELECT USER_NAME AS ����, GET_GRADE(USER_ID) AS ���
  FROM USERS;


-- 12. ����(BUYS) ���̺��� �� ��(Row)�� ����(UPDATE)�ǰų� �߰�(INSERT)�� ���Ŀ� '���ų����� �����Ǿ����ϴ�.'��� �����޽����� ����ϴ� BUYS_TRIG Ʈ���Ÿ� �ۼ��Ͻÿ�. (10��)
CREATE OR REPLACE TRIGGER BUYS_TRIG
    AFTER
    UPDATE OR INSERT
    ON BUYS
    FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('���ų����� �����Ǿ����ϴ�.');
END;

-- ��. Ʈ���� ���� Ȯ��
UPDATE BUYS
   SET USER_ID = 'KHD'
 WHERE BUY_NO = 1001;
 