/*
    테이블
    1. 데이터베이스의 가장 대표적인 객체이다.
    2. 데이터를 보관하는 객체이다.
    3. 표 형식으로 데이터를 보관한다.
    4. 테이블 기본 용어
        1) 열 : column, 속성(attribute), 필드(field)
        2) 행 : row,    개체(entity),    레코드(record)
*/

/*
    오라클의 데이터 타입
    1. CHAR(size)     : 고정 길이 문자 타입(size : 1 ~ 2000바이트)
    2. VARCHAR2(size) : 가변 길이 문자 타입(size : 1 ~ 4000바이트)
    3. DATE           : 날짜/시간 타입
    4. TIMESTAMP      : 날짜/시간 타입(좀 더 정밀)
    5. NUMBER(p,s)    : 정밀도(p) 스케일(s)로 표현하는 숫자 타입
        1) 정밀도 : 정수부와 소수부를 모두 포함하는 전체 유효 숫자가 몇 개인가?
        2) 스케일 : 소수부의 전체 유효 숫자가 몇 개인가?
        예시)
            (1) NUMBER      : 최대 38자리 숫자(22바이트)
            (2) NUMBER(3)   : 정수부가 최대 3자리인 숫자(최대 999)
            (3) NUMBER(5,2) : 최대 전체 5자리, 소수수 2자리인 숫자(123.45)
            (4) NUMBER(2,2) : 1 미만의 소수부 2자리인 실수(0.15) - 정수부의 0은 유효 자리가 아니다
*/
/*
    제약조건(Constraint)
    1. 널 
        1) NULL 또는 생략
        2) NOT NULL
    2. 중복 데이터 방지
        UNIQUE
    3. 값의 제한
        CHECK
    4. primary key(pk)  개체무결성
        not null + unique (널 값 , 중복된 값을 가질수 없다)
    
    5. foreign key(fk)  참조무결성
        참조하는 값만 가질수 있다
*/


--예시 테이블
drop table product; 
create table product(
    code          varchar2(2 byte) not null unique , 
    model         varchar2(10 byte),
    category      varchar2(5 byte)check(category = 'main' or category = 'sub'), -- CHECK(CATEGORY IN('MAIN', 'SUB')) 
    price         number          check(price >= 0),
    amount        number(2)       check(amount >= 0 and amount <= 100),         -- CHECK(AMOUNT BETWEEN 0 AND 100)
    manufactured  date
);






