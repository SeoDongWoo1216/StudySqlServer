-- 4-2 (UPDATE문)
-- 성명건 주소 부산시 사하구 -> 부산시 해운대구
-- 성명건 전화번호 010-9999-9999 -> 010-6683-7732

begin tran

UPDATE membertbl
set mobile = '010-6683-7732', Addr = '부산시 해운대구'
where Names = '성명건'

rollback
commit