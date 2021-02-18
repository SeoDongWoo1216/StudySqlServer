-- 4-1 (INSERT 넣기)
 SELECT * FROM divtbl

 begin tran

 INSERT into divtbl
 values('I002', '자기개발서')

 rollback
 commit