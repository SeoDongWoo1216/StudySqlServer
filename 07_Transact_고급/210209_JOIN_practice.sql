/* 
테이블 생성, 데이터 생성 쿼리
CREATE TABLE Join_A(
	CODE INT NOT NULL,
	CODE_NAME NCHAR(100) NOT NULL
	CONSTRAINT PK_A PRIMARY KEY(CODE)
);

CREATE TABLE Join_B(
	CODE INT NOT NULL,
	CODE_NAME NCHAR(100) NOT NULL
	CONSTRAINT PK_B PRIMARY KEY(CODE)
);

INSERT INTO Join_A(CODE, CODE_NAME) VALUES(1, 'ALPHA')
INSERT INTO Join_A(CODE, CODE_NAME) VALUES(2, 'BETA')

INSERT INTO Join_B(CODE, CODE_NAME) VALUES(2, 'BETA')
INSERT INTO Join_B(CODE, CODE_NAME) VALUES(3, 'GAMMA')
*/


SELECT * FROM Join_A
SELECT * FROM Join_B

-- 조인 연습


-- 테이블 A와 테이블 B 둘 다 존재하는 코드를 조회
SELECT *
  FROM Join_A as A 
  INNER JOIN Join_B as B 
    ON A.CODE = B.CODE


-- 테이블 A에만 존재하는 코드 조회
SELECT *
  FROM Join_A as A
  LEFT OUTER JOIN Join_B as B 
    ON A.CODE = B.CODE
 WHERE B.CODE IS NULL

 
-- 테이블 B에만 존재하는 코드 조회
SELECT *
  FROM Join_A as A
  RIGHT OUTER JOIN Join_B as B 
    ON A.CODE = B.CODE
 WHERE A.CODE IS NULL


-- 테이블 A의 모든 코드조회.
SELECT *
  FROM Join_A as A 
  LEFT OUTER JOIN Join_B as B 
    ON A.CODE = B.CODE


-- 테이블 B의 모든 코드조회.
SELECT *
  FROM Join_A as A 
  RIGHT OUTER JOIN Join_B as B 
    ON A.CODE = B.CODE
 

-- A테이블과 B테이블 매칭이 안되는 나머지를 모두 조회한다. (A, B 겹치치않는 데이터 출력)
SELECT *
  FROM Join_A as A 
  FULL OUTER JOIN Join_B as B  
    ON A.CODE = B.CODE
 WHERE A.CODE IS NULL OR B.CODE IS NULL
