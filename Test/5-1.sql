-- 집계쿼리, 통계쿼리

-- 5-1
select d.names, sum(price) as '총합계'
  from bookstbl     as b
 inner join divtbl  as d
    on b.Division = d.Division
 group by rollup(d.Names);