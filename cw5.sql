Create table Klient as select  * from company_2025.CLIENT;
Create table Order1 as select  * from company_2025.ORDER;
Create table Employee1 as select  * from company_2025.EMPLOYEE;
Select * from Order1;
Select * from Order1 where ORDER_STATUS =5;
Select ORDER_ID, ORDER_STATUS from Order1 where client_id in(1,3,5);
-------------
select * from Employee1 where FIRST_NAME = 'Agnieszka'
and pensja = 3900;
select * from Employee1 where pensja between 5000 and 7000;
select * from Klient where short_name Like '%eco%' and is_company = 1;
-----------------
select * from Order1 where month(order_date) in (6,7);
select * from Klient where tax_identifier is not null order by short_name asc;
select * from Employee1 order by birth_date asc limit 5;