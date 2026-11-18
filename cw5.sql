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
 --------------------
 select distinct first_name from Employee1;
 select concat(First_name, '-',last_name)as dane
 from Employee1 where last_name LIKE 'Ko%';
 select last_name,pensja from Employee1 where year(DATE_OF_EMPLOYMENT) between 2010 and 2014;
 --------------------
 Select 
 pensja * 0.75 AS netto,
 pensja * 0.25 as podatek
 from Employee1;
 select * from Klient where TAX_IDENTIFIER is null;
 select short_name from Klient
 where short_name Like 'K%'
 or short_name like '%ski'
 order by short_name desc;