-- �ݺ��� while

declare @i   int	= 0;
declare @hap bigint = 0;

while(@i <= 100)
  BEGIN
	 if(@i % 10 = 0) -- 7�� ��� ���� �߰�
	   begin
	      print concat('10�� ���', @i);
		  set @i += 1;
		  continue;
	   end
     set @hap += @i;
	 if(@hap > 1000) break;
	 set @i   += 1;
  END

print @hap;