SELECT AVG(pensja) as srednia_pensja 
from Employee1;
Select job_position_id, AVG(pensja) as srednia_pesnja, count(*) as liczba_pracownikow
FROM Employee1
group by JOB_POSITION_ID;
select department_id, avg(year(curdate()) - year(birth_date)) as sredni_wiek
from Employee1
where DEPARTMENT_ID is not null
group by DEPARTMENT_ID;
---------
select department_id, sum(pensja) as laczna_pensja
from Employee1
group by DEPARTMENT_ID
order by laczna_pensja desc;
select job_position_id, avg(pensja)
from Employee1
group by JOB_POSITION_ID
having count(*) >= 3 and avg(pensja)>3000;
select department_id, count(distinct pensja) as roczne_pensje
from Employee1
group by DEPARTMENT_ID
having count(*) >= 3
order by roczne_pensje asc;
---------------------------------
create table Department  as select * from company_2025.DEPARTMENT;
create table Job_position  as select * from company_2025.JOB_POSITION;
Select d.Department_name, count(e.Employee_name) as liczba_pracownikow
from Department d
left join Employee1 e on d.department_id = e.department_id
group by d.department_name;
Select d.Department_name,
group_concat(concat(e.first_name, ' ', e.last_name) separator',') as pracownicy 
from Department d 
join Employee1 e On d.Department_id= e.DEPARTMENT_ID
group by d.department_name;
-------------------------------
Select e.last_name, j.position_name
from Employee1 e
join Job_position j On e.JOB_POSITION_ID = j.JOB_POSITION_ID
where year(e.birth_date) between 1990 and 1999;
select e.first_name, e.last_name 
from Employee1 e 
join Job_position j on e.JOB_POSITION_ID = j.job_position_id
where j.position_name = "magazynier"
order by e.BIRTH_DATE desc
limit 5;
SELECT concat(k1.SHORT_NAME, '-',k2.SHORT_NAME) as para_klientow
from Klient k1
join Klient k2 on k2.client_id + k1.client_id = 5;
--------------------------------
select j.position_name , Round(avg(e.pensja),2) as srednie_zarobki
from Employee1 e
join Job_position j on e.JOB_POSITION_ID = j.JOB_POSITION_ID
left join Department d on e.DEPARTMENT_ID = d.DEPARTMENT_ID
where d.DEPARTMENT_name not in ('IT','HR')
group by j.position_name
Having count(*) > 3;

select j.position_name,
e.first_name,
e.last_name,
e.birth_date,
d.department_name
from Employee1 e
join Job_position j On e.job_position_id = j.job_position_id
left join Department d On e.DEPARTMENT_ID = d.DEPARTMENT_ID
where e.BIRTH_DATE = ( 
select min(e2.Birth_date)
from Employee1 e2
where e2.JOB_POSITION_ID = e.JOB_POSITION_ID
)
or e.BIRTH_DATE = (
select max(e2.birth_date)
from Employee1 e2
where e2.JOB_POSITION_ID = e.JOB_POSITION_ID
)
order by  j.position_name, e.birth_date;

