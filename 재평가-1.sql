/*
1.
PRODUCT 테이블을 조회하는 특정 쿼리문이 인덱스(INDEX)를 타면서 동작하는지 확인하기 위해서 아래와 같이 쿼리문을 작성하고 실행하였다.

EXPLAIN PLAN FOR
SELECT * FROM PRODUCT WHERE NAME = 'MICROWAVE';

위와 같이 쿼리문에 설명을 추가한 뒤 실행한 다음 인덱스 사용 여부를 확인할 수 있는 쿼리문을 작성하시오. (10점)
쿼리문의 결과 예시 화면은 아래와 같다.

***** 예시 화면은 웹 화면을 확인하세요 *****

*/


/*
2.
현재 접속한 사용자(USER)가 소유한 인덱스를 확인할 수 있는 테이블 이름은 무엇인가? (5점)
*/
USER_INDEXES
/*
3.
다음 지시사항을 만족하는 인덱스(INDEX)를 생성하는 쿼리문을 작성하시오. (10점)
    1) 인덱스를 설정할 테이블 : ORD_TBL
    2) 인덱스를 설정할 칼럼 : ORD_NO
    3) 생성할 인덱스의 이름 : IND_ORD_NO
    4) 고유/비고유 유무 : 비고유 인덱스
*/
CREATE INDEX IND_ORD_NO
    ON ORD_TBL(ORD_NO);
/*
4.
ORD_TBL 테이블과 동일한 칼럼(Column)과 동일한 행(Row)를 가지는 ORD_COPY_TBL 테이블을 생성하는 쿼리문을 작성하시오.
ORL_TBL 테이블의 제약조건은 신경쓰지 마시오. (10점)
*/

CREATE TABLE ORD_COPY_TBL
    AS (SELECT *
  FROM ORD_TBL);

/*
5.
다음 지시사항을 만족하는 뷰(VIEW)를 생성하는 쿼리문을 작성하시오. (10점)
    1) 뷰를 생성할 원본 테이블 : ORD_TBL
    2) 뷰에 포함할 칼럼 : ORD_NO, ORD_DATE
    3) 뷰의 이름 : V_ORD
    4) 조건 : ORD_DATE가 '2020-12-31'인 주문만 조회하시오. (ORD_DATE 칼럼은 YY/MM/DD 형식의 DATE 타입으로 입력된 값을 가지고 있음)
*/
CREATE VIEW V_ORD
    AS (SELECT O.ORD_NO, O.ORD_DATE
  FROM ORD_TBL O
 WHERE ORD_DATE = '2020-12-21');

/*
6.
현재 접속한 사용자(USER)가 소유한 제약조건들의 목록을 조회할 수 있는 쿼리문을 작성하시오. 모든 칼럼(*)을 조회하시오. (5점)
*/
SELECT *
  FROM USER_CONSTRAINTS;
/*
7.
현재 접속한 사용자(USER)가 소유한 테이블의 목록을 조회할 수 있는 쿼리문을 작성하시오. 모든 칼럼(*)을 조회하시오. (5점)
*/
SELECT *
  FROM USER_TABLES;

/*
8. 다음 데이터베이스 구조를 가지고 있는 테이블이 있다고 가정하고 문제에서 요구하는 올바른 쿼리문 2개를 모두 작성하시오. (20점)

<< 데이터베이스 구조 >>

    1) 회원테이블
        MEMBER (MEMID, NAME, ADDRESS)

    2) 로그인테이블
        LOGIN (MEMID, LOGIN_DATE)

    3) MEMBER 테이블의 MEMID 칼럼은 기본키(PRIMARY KEY)이다.

    4) LOGIN 테이블의 MEMID 칼럼은 MEMBER 테이블의 MEMID 를 참조하는 외래키(FOREIGN KEY)이다.

    <<< 문제1 >>>
        로그인 한 이력은 LOGIN 테이블에 남는다. 로그인 한 이력이 남은 회원들의 "이름(NAME)"과 "로그인일시(LOGIN_DATE)"를 조회하는 내부 조인 쿼리문을 작성하시오.


    <<< 문제2 >>>
        "이름(NAME)"과 "로그인일시(LOGIN_DATE)"를 조회하는 쿼리문을 작성하시오. 로그인 이력이 없는 회원들의 정보도 함께 조회할 수 있도록 외부 조인을 이용하시오.
*/
-- 문제1
SELECT M.NAME, L.LOGIN_DATE
  FROM MEMBER_TBL M INNER JOIN LOGIN_TBL L
    ON M.MEM_ID = L.MEM_ID;
-- 문제2
SELECT M.NAME, L.LOGIN_DATE
  FROM MEMBER_TBL M LEFT OUTER JOIN LOGIN_TBL L
    ON M.MEM_ID = L.MEM_ID;
/*
9.
다음 칼럼 정보를 참고하여 BOOK_TBL 테이블을 생성하는 쿼리문을 작성하시오. (10점)

<< 칼럼 정보 >>
    1) BOOK_ID : 책아이디, 숫자 최대 4자리, 필수, 기본키(제약조건 이름 : PK_BOOK)
    2) BOOK_NAME : 책이름, 가변길이문자열 최대 20바이트, 필수
    3) BOOK_ISBN : 책ISBN, 가변길이문자열 최대 20바이트, 중복 불가
    4) BOOK_PRICE : 책가격, 숫자
    5) PUB_DATE : 출판일, 날짜
*/
CREATE TABLE BOOK_TBL (
	BOOK ID       NUMBER(4) NOT NULL,
	BOOK NAME     VARCHAR2(20 BYTE) NOT NULL,
	BOOK ISBN     VARCHAR2(20 BYTE) UNIQUE,
	BOOK PRICE    NUMBER,
	PUB_DATE      DATE,
	CONSTRAINT PK_BOOK PRIMARY KEY(BOOK_ID)
);   


/*
10.
어떤 테이블에 삽입/수정/삭제한 데이터를 취소할 때 사용하는 쿼리문을 작성하시오. (5점)
*/
ROLLBACK
