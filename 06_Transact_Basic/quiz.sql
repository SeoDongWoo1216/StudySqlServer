/*
 last_name�� s�� �����ϰ�, 
state�� NY�� 
phone��ȣ�� null�� �ƴ� 
������� first_name�� ���������� ���·� ��ȸ
*/

select * from sales.customers

select * from sales.customers
WHERE state = 'NY' 
	and last_name like 'S%' 
	and phone is not Null
order BY first_name;


