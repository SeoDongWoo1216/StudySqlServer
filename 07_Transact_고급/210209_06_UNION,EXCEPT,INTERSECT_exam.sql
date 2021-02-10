-- ������ ������
-- Union�� ������(���� ������� ���̺��� ��ħ)
SELECT clubName as bName, bulidingNum as bLocation FROM ClubTbl
union
SELECT StdName, region FROM StdTbl


-- UNION all
-- �׳� UNION�� �ߺ��� ���ŵǼ� ��µȴ�.
SELECT StdName, region FROM StdTbl  
union
SELECT StdName, region FROM StdTbl

-- UNION all�� �ߺ����� ��µȴ�.
SELECT StdName, region FROM StdTbl  
union all
SELECT StdName, region FROM StdTbl

-------------------------------------------------------------------
-- EXCEPT : ������(�� ��° ������ �ش��ϴ� ���� ������)

-- �����Ŵϱ� �ƹ��͵� �ȳ���
SELECT StdName, region FROM StdTbl  
EXCEPT
SELECT StdName, region FROM StdTbl


-- ��ġ�°Ծ����� �������� ��µ�
SELECT clubName as bName, bulidingNum as bLocation FROM ClubTbl 
EXCEPT
SELECT StdName, region FROM StdTbl

-------------------------------------------------------------------

-- INTERSECT : EXCEPT�� �ݴ�� �ι�° ������ �ش�Ǵ� �͸� ��ȸ�Ѵ�.
SELECT clubName as bName, bulidingNum as bLocation FROM ClubTbl  
INTERSECT
SELECT StdName, region FROM StdTbl

-------------------------------------------------------------------

