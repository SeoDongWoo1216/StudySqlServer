/*
 last_name이 s로 시작하고, 
state가 NY인 
phone번호가 null이 아닌 
사람들을 first_name이 오름차순인 형태로 조회
*/

select * from sales.customers

select * from sales.customers
WHERE state = 'NY' 
	and last_name like 'S%' 
	and phone is not Null
order BY first_name;


