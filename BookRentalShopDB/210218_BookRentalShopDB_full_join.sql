-- outer join ����
--��Ʈ�� ����Ʈ U : ��� �빮�ڷ�
--��Ʈ�� ����Ʈ L : ��� �ҹ��ڷ�

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

