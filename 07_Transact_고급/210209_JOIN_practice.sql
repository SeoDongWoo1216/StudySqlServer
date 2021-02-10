/* 
���̺� ����, ������ ���� ����
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

-- ���� ����


-- ���̺� A�� ���̺� B �� �� �����ϴ� �ڵ带 ��ȸ
SELECT *
  FROM Join_A as A 
  INNER JOIN Join_B as B 
    ON A.CODE = B.CODE


-- ���̺� A���� �����ϴ� �ڵ� ��ȸ
SELECT *
  FROM Join_A as A
  LEFT OUTER JOIN Join_B as B 
    ON A.CODE = B.CODE
 WHERE B.CODE IS NULL

 
-- ���̺� B���� �����ϴ� �ڵ� ��ȸ
SELECT *
  FROM Join_A as A
  RIGHT OUTER JOIN Join_B as B 
    ON A.CODE = B.CODE
 WHERE A.CODE IS NULL


-- ���̺� A�� ��� �ڵ���ȸ.
SELECT *
  FROM Join_A as A 
  LEFT OUTER JOIN Join_B as B 
    ON A.CODE = B.CODE


-- ���̺� B�� ��� �ڵ���ȸ.
SELECT *
  FROM Join_A as A 
  RIGHT OUTER JOIN Join_B as B 
    ON A.CODE = B.CODE
 

-- A���̺�� B���̺� ��Ī�� �ȵǴ� �������� ��� ��ȸ�Ѵ�. (A, B ��ġġ�ʴ� ������ ���)
SELECT *
  FROM Join_A as A 
  FULL OUTER JOIN Join_B as B  
    ON A.CODE = B.CODE
 WHERE A.CODE IS NULL OR B.CODE IS NULL
