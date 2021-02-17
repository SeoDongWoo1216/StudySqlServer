use BookRentalShopDB
go

-- ���� ȸ������ �ҷ����� �����Ųٷ�, �̸���
SELECT memberName, memberID, password, levels, mobile, email
  FROM membertbl
 where levels <> 's'
order by levels asc, memberName;

---------------------------------------------------------------------------

-- å ���� ��� ������ ���� 
SELECT cateidx, bookName, author, interpreter, company, price 
  FROM BooksTBL
  order by price desc;


select * from cateTBL

-- �ý��� �Լ� ��� ����
SELECT concat(right(memberName, 2), ', ', left(memberName, 1)) as 'Name', 
	   memberID, 
	   password, 
	   case levels
			when 'A' then '���ȸ��'
			when 'B' then '�ǹ�ȸ��'
			when 'C' then '�����ȸ��'
			when 'D' then 'öȸ��'
			when 'S' then '������'
			else '��ȸ��'
	   end as 'ȸ�����', 
	   mobile, 
	   upper(email) as '�̸���'
  FROM membertbl
 where levels <> 's'
order by levels asc, memberName;

---------------------------------------------------------------------------

-- ����� ���� ���� �Լ�
create or alter function dbo.ufn_getlevel(@levels char(1))
	returns nvarchar(5)
as
begin
declare @result nvarchar(5); -- ���ȸ��, �ǹ�ȸ��, �����ȸ��, öȸ�� �� ����
		set @result = case @levels
			when 'A' then '���ȸ��'
			when 'B' then '�ǹ�ȸ��'
			when 'C' then '�����ȸ��'
			when 'D' then 'öȸ��'
			when 'S' then '������'
			else '��ȸ��'
			
	   end;
	 return @result;
	END
	go

---------------------------------------------------------------------------

-- ����� ���� �Լ��� ����ؼ� SELECT �� ������ ���̸� ���� �� �ִ�.
-- case���� �Լ��� �����, �� �ڸ��� �Լ����� ���ָ��.

SELECT concat(right(memberName, 2), ', ', left(memberName, 1)) as 'Name', 
	   memberID,
	   dbo.ufn_getlevel(levels) as 'ȸ������', 
	   mobile, 
	   upper(email) as '�̸���'
  FROM membertbl
 where levels <> 's'
order by levels asc, memberName;

---------------------------------------------------------------------------

-- å ����, �ý��� �Լ�, ���� �Լ� ����
SELECT bookidx
     , cateidx
     , concat(N'å ���� > ', bookName) as 'BookName'
     , author
     , isnull(interpreter, '(���ھ���)') as '������'  -- �ڡڡ� isnull : null�϶� �� ���� �ڡڡ�
     , company
     , format(releaseDate, 'yyyy�� MM�� dd��') as '������'
     , format(price, '#,#��')as '����'
  FROM BooksTBL

---------------------------------------------------------------------------

-- å ���� ����
SELECT b.bookidx
     --, b.cateidx
	 , c.cateName   -- �ڵ�� ��ȯ�� ������ ����ϴ� ���� ������ �ٽ�
     , b.bookName
     , b.author
     , b.interpreter
     , b.company
  FROM dbo.BooksTBL as b
 inner join cateTBL as c
  on b.cateidx = c.cateidx

---------------------------------------------------------------------------

-- �뿩�� å�� ���� ���� ����
-- �ڵ�ȭ�Ǿ��ִ� RentalTBL�� �������� ����ϴ� ���� ��ǥ.
SELECT r.RentalIdx
     , r.memberIdx
     , r.bookIdx
     , r.rentalDt
     , r.returnDt
     , r.rentalState
  FROM dbo.RentalTBL as r


-- ��Ż���� �Լ� ����
CREATE or ALTER function ufn_getState(@rentalState char(1))
returns nvarchar(5) 
as 
begin
	declare @result nvarchar(5);  -- �뿩��, �ݳ�, ��ü��, �н� �� ��� ����
	set @result = case @rentalState
				when '1' then '�뿩��'
				when '2' then '�ݳ�'
				when '3' then '��ü��'
				when '4' then '�н�'
				else '����'
			      end;
	return @result;
end
go

---------------------------------------------------------------------------

-- memberidx, bookidx, rentalstate �ڵ�ȭ�Ȱ��� �����ͷ� ���
-- �̳����������� �ڵ�ȭ�� ������ ���, �Լ��� ���� ������ ���
SELECT r.RentalIdx
   --, r.memberIdx
     , m.memberName
   --, r.bookIdx
     , b.bookName 
	 , b.author
     , format(r.rentalDt, 'yyyy-MM-dd') as '�뿩��'
	 , format(r.returnDt, 'yyyy-MM-dd') as '�ݳ���'
     , dbo.ufn_getState(r.rentalState) as '�뿩����'
  FROM dbo.RentalTBL as r
inner join bookstbl as b
	on r.bookIdx = b.bookidx
inner join memberTBL as m
	on r.memberidx = m.memberidx

---------------------------------------------------------------------------

-- �̳������� �뿩�� ȸ����
-- �ƿ��������� �ƹ��͵� ���� ȸ���� (�ݵ����ڸ� ã�� ����)
-- å�� �����縻�� ��� ȸ�� ��ȸ(������ ���TBL�� ����غ���)
SELECT r.RentalIdx
   --, r.memberIdx
     , m.memberName
   --, r.bookIdx
     , b.bookName 
	 , b.author
     , format(r.rentalDt, 'yyyy-MM-dd') as '�뿩��'
	 , format(r.returnDt, 'yyyy-MM-dd') as '�ݳ���'
     , dbo.ufn_getState(r.rentalState) as '�뿩����'
  FROM dbo.RentalTBL as r
left outer join bookstbl as b
	on r.bookIdx = b.bookidx
right outer join memberTBL as m
	on r.memberidx = m.memberidx

---------------------------------------------------------------------------

-- å �Ⱥ������ ��ȸ
SELECT r.RentalIdx
   --, r.memberIdx
     , m.memberName
   --, r.bookIdx
     , b.bookName 
	 , b.author
     , format(r.rentalDt, 'yyyy-MM-dd') as '�뿩��'
	 , format(r.returnDt, 'yyyy-MM-dd') as '�ݳ���'
     , dbo.ufn_getState(r.rentalState)  as '�뿩����'
  FROM dbo.RentalTBL as r
left outer join bookstbl as b
	on r.bookIdx = b.bookidx
right outer join memberTBL as m
	on r.memberidx = m.memberidx
 WHERE r.RentalIdx is null

 ---------------------------------------------------------------------------
 -- �츮 å �뿩���� ���� �Ҽ� �帣(�ӽ÷� ������ ���� N0005 -> N0001�� �ٲ�)

 select c.cateIdx
	  , c.cateName
	  , b.bookName
   from cateTBL as c
   left outer join booksTbl as b
     on c.cateidx = b.cateidx

