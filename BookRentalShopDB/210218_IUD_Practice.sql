-- �� ����

create or alter view uv_notrentalMember
as
	select r.rentalidx
  -- , r.memberidx
	 , m.memberName
  -- , r.bookidx
     , c.cateName
	 , b.bookName
	 , b.author
     , format(r.rentaldt, 'yyyy-MM-dd') as ��ŻDT
     , format(r.returndt, 'yyyy-MM-dd') as ����DT
	 , dbo.ufn_getState(r.rentalState) as �뿩����
  from rentaltbl as r
 right outer join memberTBL as m
    on r.memberIdx = m.memberidx
  left outer join BooksTBL as b
    on r.bookIdx = b.bookidx
  left outer join cateTBL as c
  on b.cateidx = c.cateidx
 where r.RentalIdx is null
go


-- �� ����
select *
  from uv_notrentalMember as n
 where n.memberName like '��%'
 order by n.memberName 

----------------------------------------------------------------------------------------------------

 SELECT * FROM BooksTBL

 -- ������ �Է� ����
 -- INSERT��

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
	'�������� ���� ����',
	'��ȳ�',
	'������',
	'2019-10-02',
	'9791135445705',
	12500
 )

 -- UPDATE�� ����
 -- å ���̺� �� å ������, ����, ��� ���� ���� 

 -- update���� �����ؾ��ϹǷ� �ѹ����� ������ �̸� �鿩����.
 -- 1. Begin tran ����  2. UPDATE�� ����   3-1. �ȉ����� �ѹ�����ϰ� �ٽ� 1������   3-2.  �� ������ Ŀ�� ����
 Begin tran

 update BooksTBL
	set descriptions = '�θ�׷��� �극������ �ٽ� TF�� ����, ���¿� ����.' 
	  , regDate = '2021-02-18'
  where bookidx = 13

  rollback
  commit

----------------------------------------------------------------------------------------------------

-- ī�װ� �Է�
SELECT * FROM cateTBL

begin tran;

insert into cateTBL   -- ���� 2���ۿ������ϱ� �׳� �����ϰ� values���� ä���־��
values  ('I0001','��ȭ/����'),
		('I0002','����/ó��'),
		('I0003','�ð�����');

rollback;
commit;

----------------------------------------------------------------------------------------------------

-- ī�װ� ����(DELETE��)
SELECT * FROM cateTBL

begin tran;

delete from cateTBL where cateIdx = 'I0003';

rollback;
commit;

----------------------------------------------------------------------------------------------------

-- ī�װ� �ΰ� �̻� ����(DELETE��)
SELECT * FROM cateTBL

begin tran;

delete from cateTBL where cateIdx in('I0001', 'I0002');  -- in�� �����Ѱ� �ش�Ǵ� ��� ������ �����ϰ���. 

rollback;
commit;

----------------------------------------------------------------------------------------------------