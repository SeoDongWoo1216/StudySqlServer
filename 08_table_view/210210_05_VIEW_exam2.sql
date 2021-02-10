-- 뷰 예제

use sqlDB
go

-- 뷰 생성
create view uv_buytbl
as
	select * from buytbl where groupName = '전자';
go


-- 만든 뷰 조회
select * from uv_buytbl;


-- 뷰에서 delete로 지워보자. '0개 행이 영향을 받음.' 이 뜨면서 지워지지 않는다.
delete from uv_buytbl


-- 트랜잭션을 통해 데이터를 지울 수 있다. 그러나 이 상황은
-- 데이터를 잘못지우는 상황이므로 rollback을 해줘야함.(삭제된 후에 복구해주는 쿼리)
begin tran; -- 트랜잭션

delete from uv_buytbl

rollback;   -- 원상태 복귀



-- 데이터도 넣을 수 있다.
insert into uv_buytbl values('kkh', '기타', '악기', '4000', 1);



-- 하지만 열의 개수가 안맞게 넣을 수 없다.(뷰를 지웠다가 아래 쿼리로 다시 생성해보자)
create view uv_buytbl
as
	select num, prodName, groupName from buytbl where groupName = '전자';
go

-- 열의 개수가 다르기때문에 값을 넣을 수 없다.
insert into uv_buytbl values('kkh', '기타', '악기', '4000', 1);


