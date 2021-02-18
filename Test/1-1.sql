-- 1-1
SELECT LOWER(email) as email, mobile, names, addr
  FROM membertbl
order by names desc