-- 뷰 생성

create or alter view uv_notrentalMember
as
	select r.rentalidx
  -- , r.memberidx
	 , m.memberName
  -- , r.bookidx
     , c.cateName
	 , b.bookName
	 , b.author
     , format(r.rentaldt, 'yyyy-MM-dd') as 렌탈DT
     , format(r.returndt, 'yyyy-MM-dd') as 리턴DT
	 , dbo.ufn_getState(r.rentalState) as 대여상태
  from rentaltbl as r
 right outer join memberTBL as m
    on r.memberIdx = m.memberidx
  left outer join BooksTBL as b
    on r.bookIdx = b.bookidx
  left outer join cateTBL as c
  on b.cateidx = c.cateidx
 where r.RentalIdx is null
go


-- 뷰 실행
select *
  from uv_notrentalMember as n
 where n.memberName like '최%'
 order by n.memberName 

----------------------------------------------------------------------------------------------------

 SELECT * FROM BooksTBL

 -- 데이터 입력 연습
 -- INSERT문

 insert into BooksTBL
 (
	cateidx,
	bookName,
	author,
	company,
	releaseDate,
	ISBN,
	price
 )
 values
 (
	'N0002',
	'순수하지 않은 감각',
	'요안나',
	'로코코',
	'2019-10-02',
	'9791135445705',
	12500
 )

 -- UPDATE문 연습
 -- 책 테이블 위 책 정보중, 설명, 등록 일자 수정 

 -- update문은 조심해야하므로 롤백으로 보험을 미리 들여놓자.
 -- 1. Begin tran 실행  2. UPDATE문 실행   3-1. 안됬으면 롤백실행하고 다시 1번으로   3-2.  잘 됬으면 커밋 실행
 Begin tran

 update BooksTBL
	set descriptions = '부명그룹의 브레인이자 핵심 TF팀 리더, 강태욱 수석.' 
	  , regDate = '2021-02-18'
  where bookidx = 13

  rollback
  commit

----------------------------------------------------------------------------------------------------

-- 카테고리 입력
SELECT * FROM cateTBL

begin tran;

insert into cateTBL   -- 열이 2개밖에없으니까 그냥 생략하고 values에만 채워넣어도됨
values  ('I0001','대화/협상'),
		('I0002','성공/처세'),
		('I0003','시간관리');

rollback;
commit;

----------------------------------------------------------------------------------------------------

-- 카테고리 삭제(DELETE문)
SELECT * FROM cateTBL

begin tran;

delete from cateTBL where cateIdx = 'I0003';

rollback;
commit;

----------------------------------------------------------------------------------------------------

-- 카테고리 두개 이상 삭제(DELETE문)
SELECT * FROM cateTBL

begin tran;

delete from cateTBL where cateIdx in('I0001', 'I0002');  -- in은 나열한거 해당되는 모든 조건을 부합하게함. 

rollback;
commit;

----------------------------------------------------------------------------------------------------