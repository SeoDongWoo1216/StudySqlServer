-- 조인은 교집합
-- Union은 합집합(전혀 관계없는 테이블을 합침)
SELECT clubName as bName, bulidingNum as bLocation FROM ClubTbl
union
SELECT StdName, region FROM StdTbl


-- UNION all
-- 그냥 UNION은 중복이 제거되서 출력된다.
SELECT StdName, region FROM StdTbl  
union
SELECT StdName, region FROM StdTbl

-- UNION all은 중복까지 출력된다.
SELECT StdName, region FROM StdTbl  
union all
SELECT StdName, region FROM StdTbl

-------------------------------------------------------------------
-- EXCEPT : 차집합(두 번째 쿼리에 해당하는 것을 제외함)

-- 같은거니까 아무것도 안나옴
SELECT StdName, region FROM StdTbl  
EXCEPT
SELECT StdName, region FROM StdTbl


-- 겹치는게없으면 위에꺼가 출력됨
SELECT clubName as bName, bulidingNum as bLocation FROM ClubTbl 
EXCEPT
SELECT StdName, region FROM StdTbl

-------------------------------------------------------------------

-- INTERSECT : EXCEPT와 반대로 두번째 쿼리에 해당되는 것만 조회한다.
SELECT clubName as bName, bulidingNum as bLocation FROM ClubTbl  
INTERSECT
SELECT StdName, region FROM StdTbl

-------------------------------------------------------------------

