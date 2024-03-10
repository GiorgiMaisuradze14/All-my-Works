--PAGILA-DB
--Pg Admin


--1 start SQL 

--select
select * from customer;
select first_name , last_name , email from customer;

--order by
select first_name , last_name , email
from customer
order by first_name desc , last_name desc ;

--distinct
select distinct amount
from payment
order by amount desc;

--limit 
select * from rental
order by rental_date desc
limit 10;

--count() 
select count(*)
from customer;

select count(first_name)
from customer;




--2 Basics filtering

--where
select * from customer
where first_name = 'ERICA';

select * from customer
where store_id = 2 and address_id > 10;

--between
select count(*) from payment
where amount between 1.99 and 3.99;

--in
select * from payment
where customer_id in (12,34,56,78,124);

--like 
select count(*) from film
where description like '%Documentary%';



--3 Basics Grouping

--group by 
select
staff_id,
date(payment_date),
sum(amount),
count(*)
from payment
where amount != 0
group by staff_id , date(payment_date)
order by sum(amount) desc;

--where იწერება group by მდე და ფილტრავს მონაცემებს არა agregate fuc ებისთვის 
--ანუ ჩვეულებრივი ველებისთვის , მაგრამ having იწერება group by ის შემდეგ და ფილტრავს 
--მხოლოდ agregate fun ების ველებს როგორებიცაა : count , sum , min , max ...
--ერთ quere ში ორივეს გამოყენება თავისუფლად შეიძლება !!!

select
staff_id,
date(payment_date),
sum(amount),
count(*)
from payment
where amount != 0
group by staff_id , date(payment_date)
having count(*) > 600
order by sum(amount) desc;




-- 4  Inter Functions

--length --> სიგრძნე კონკრეტული ველის
select * from customer
where length(first_name) > 7;

--upper --> ზედა რეგისტრში გადაყვანა , დიდი ასოები
--lower --> ქვედა რეგისტრში გადაყვანა , პატარა ასოები
select lower(first_name) , lower(last_name) from customer;

--left() --> ორი არგუმენტი , მარცხნიდან რაში და რამდენი charapter დავტოვოთ
--right() --> ორი არგუმენტი , მარჯვნიდან რაში და რამდენი charapter დავტოვოთ
select 
email,
left(right(email,4),1)
from customer;

--concatenate --> რამდენიმე ბრძანების გაერთიანება ||
select first_name || ' ' || last_name from customer;

--position('რა' in სად) --> კონკრეტული სიმბოლოს პოზიციის გაგება , მერადმდენეა სიტყვაში
select 
last_name || ', ' || left (email,position('.' in email)-1)
from customer;

--substring(column FROM start [FOR length]) --> left და rigth ყოველთვის მოსახერხებელი არ არის , 
					      --start - შეგიძლია position გამოიყენო და ა.შ
select
'***'
|| substring (email from position('.' in email)-1 for 3)
|| '***'
|| substring (email from position('@' in email))
from customer;

--extract(field FROM column) --> ტოვებს ერთ ველს : დღეებს , თვეებს ან ა.შ გამოიყენება date-ბთან
select
extract(dow from payment_date) as day_of_week,
sum(amount) as total
from payment
group by day_of_week
order by total desc ;

--tochar(column,ფორმატი) --> შეგვიძლია დროის ერთეულის ფორმატის შეცვლა და ტექსტის სახით გადაყვანა
select
sum(amount) as total,
to_char(payment_date , 'Dy,HH:MI') as Day_time
from payment
group by Day_time
order by total desc ;



-- 5 Conditional Expressions

--Case --> საკმაოდ საჭირო და გამოსადეგი , რეალურად if-else ოღონდ SQL ში. ახალ შენით შექმნილ
    --     column-ს ამატებ დამატებითი ინფოემაციისთვის , შეგიძლია დაგჯუფებაც ანუ ინფორმაცის შეჯამება

select 
amount,
case
	when amount < 2 then 'Low Amount'
	when amount < 5 then 'Medium Amount'
	else 'High Amount'
end
from payment;


select 
title,
case
	when rating in ('PG','PG-13') or length > 210  then 'Great rating or long(tier 1)'
	when description like '%Drama%' and length > 90 then 'Long drama (tier 2)'
	when description like '%Drama%' and length <= 90 then 'Short drama (tier 2)'
	when rental_rate < 1 then 'Very cheap(tier 4)'	
end
from film ;



select 
count(*) number_of,
case
	when total_amount < 20000 then 'Low price tickets'
	when total_amount < 150000 then 'Mid price tickets'
	else 'Higt price tickets'
end as amount_of
from bookings
group by amount_of ;




--Coalesce(რაღაც , რაღაც) --> null ები ხშირად პრობლემატურია , ამ დროს ვიყენებთ Coalesce  ფუნქციას .
                            --გვაქვს ორი პარატეტრი აბრუნებს პირველს თუ null ია მაშინ მეორეს. 
                            --მეორე შეიძლება იყოს default.
               

select 
coalesce(actual_arrival - scheduled_arrival,'00:00:00')
from flights;


--Cast(რა AS რაში) --> ხშირად გამოსადეგია ველისთვის data type ის შეცვლა , ამაში გვეხმარება სწორედ Cast.

select 
coalesce(cast(actual_arrival - scheduled_arrival as varchar),'not arrval')
from flights;


--Replace(column , ძველი , ახალი ) --> შეცვლი რასაც გინდა ერთ column ში რითიც გინდა იმით





-- 6 Joins

--1-1 კავშირის დროს შეგიძლია აირჩიო რომელ ცხრილში გქონდეს foreign key როგორც სხვა ცხრილის id
--1-n დროს ამას შენ ვერ ირჩევ 


--1-1
--ერთ users ყავს ერთი organaizers და ერთი organaizers არის ერთი users .
--(foreign key მიდის ნებისმიერში )






--1-N  --> ცხრილისსახელი_ველისსახელი  ველისტიპი references ცხრილისსახელი(p_k სახელი)

--ერთ events ყავს ერთი organaizers , ერთ organaizers შეიძლება ქონდეს ბევრი events , 
--ამიტომ foren key მიდის events ცხრილში . (ბევრში მიდის foreign key)




--ერთი events ერთ location ზეა , მარა ლოკაციაზე შეიძლება იყოს ბევრი events 
--(ბევრში მიდის foreign key)




--ერთი location ერთ cities-შია , მარა ერთ cities ბევრი locations (ბევრში მიდის foreign key)


/*
N-N  --> ცალკე ცხრილი ორივეს სახელის კომბინაციით შიგნით მინიმუმ სამი ველი ორივე ცხრილთან 
         references და pr_k ამ ორი ველის კომბინაციით ან ცალკე როგორც id.

ამ დროს საქმე მარტივად არ არის , გვჭირდება დამატებითი ცხრილი linking table , რომლის
დახმარებითაც დავამყარებთ ბევრი-ბერთან კავშირს !

tags - events


ერთ events ზე შეიძლება დარეგისტრირდეს ბევრი users , ერთი users შეიძლება დარეგისტრირდეს 
ბევრ events
*/




--7 union , subquerie

/*
Union --> კომბინირებული საბოლოო ცხრილი , მაგრამ row ების მიხედვით. მაგალითად ორი select 
          წინადადების გაერთიანება ერთ ცხრილად. union ის დრო დუბლიკადები ერთხელ იწერება 
          საბოლოო ცხრილში , ხოლო თუ გინდა რო იმდენჯერ გქონდეს row რამდენჯერაც შეგხვდება
          მაშინ უბრალოდ გამოიყენებ union all.
*/
select first_name , 'actor' as origin from actor
union
select first_name , 'customer' from customer
union 
select first_name , 'staff' from staff
order by 1;



--Subquerie --> მარტივად რომ ვთქვათ კოდი კოდში. 

--WHERE

select * from payment
where amount > (select avg(amount) from payment);    -- amount > რაღაც რიცხვზე , გამოვიყენე Subquerie .


select first_name , last_name from customer
where customer_id in
(select customer_id from payment
 where date(payment_date) = '2020-01-25'
);


select first_name , email from customer
where customer_id in
(select customer_id from payment
 group by customer_id
 having sum(amount) > 30
)


--FROM

select round(avg(total_amount),2)
from 
(
select customer_id , sum(amount) as total_amount from payment
group by customer_id
) as avg_of

select round(avg(sum_of_all),2)
from 
(
select
sum(amount) as sum_of_all,
date(payment_date)
from payment
group by date(payment_date)
) as avg_of_day


--SELECT --> ბოლო column ამატებს რაღაც საერთო მონაცემს ყველა row სთვის

select 
*,(select round(avg(amount),2) from payment)
from payment;


select 
*,(select max(amount)from payment) - amount as difference
from payment;





--Correlated Subqueries --> ყველა row მოწმდება დამოუკიდებლად , ვადარებთ და თუ აკმაყოფილებს ვტოვებთ.

-- თითოეული customer_id ისთვის გამოიტანს მხოლოდ მაქსიმუმ მნიშვნელობას
select * from payment as p1
where amount = (select max(amount) from payment as p2
	        where p1.customer_id  = p2.customer_id)
order by customer_id;



select title , film_id , replacement_cost , rating from film as f1
where replacement_cost = (select min(replacement_cost) from film as f2
			  where f1.rating = f2.rating);


select 
payment_id , 
customer_id , 
staff_id , 
amount ,
(
select sum(amount) as sum_amount from payment as p2
where p1.customer_id = p2.customer_id
),
(
select count(amount) as count_payment from payment as p2
where p1.customer_id = p2.customer_id
)
from payment as p1
order by customer_id , amount desc




--8 Grouping sets, rollups, self-joins


--GROUPING SETS

--როგორ დავაჯგყფოთ განსხვავებული sets of columns.
--ეს კოდი არ ვარგა , სამი group by არის საშინელება

select
null as month,
staff_id,
sum(amount)
from payment
group by staff_id
union
select 
to_char(payment_date,'Month') as month,
null as staff_id,
sum(amount)
from payment
group by to_char(payment_date,'Month')
union
select 
to_char(payment_date,'Month'),
staff_id,
sum(amount)
from payment
group by to_char(payment_date,'Month') , staff_id;


--აი ეს კი უკეთესია ,მე მინდა staff_id იყოს ერთი დაჯგყუფება , მეორე payment_date , მესამე კომბინაცია

select
to_char(payment_date,'Month') as month,
staff_id,
sum(amount)
from payment
group by
	grouping sets(
	(staff_id),
	(month),
	(staff_id , month)
	)
order by month,staff_id





--ROLLUP

--დაჯგყფებისთვის გამოსადეგი კიდევ ერთი ფუნქცია.

--group by
--Rollup(column1,column2,column3)

--პრიორიტეტი ენიჭება colimn1 მერე column2 და ა.შ

select 
'Q' || to_char(payment_date,'Q') as quater,
extract(month from payment_date) as month,
Date(payment_date),
sum(amount)
from payment
group by
rollup(
	'Q' || to_char(payment_date,'Q'),
	extract(month from payment_date),
	Date(payment_date)
)
order by 1,2,3


--CUBE
--იერარქიას აღარ აქვს მნიშვნელობა ყველა შესაძლო ვაფიანით ლაგდება მნიშვნელობები , როცა ვიყენებთ CUBE-ს

SELECT 
p.customer_id,
DATE(payment_date),
title,
SUM(amount) as total
FROM payment p
LEFT JOIN rental r
ON r.rental_id=p.rental_id
LEFT JOIN inventory i
ON i.inventory_id=r.inventory_id
LEFT JOIN film f
ON f.film_id=i.film_id
GROUP BY 
CUBE(
	p.customer_id,
	DATE(payment_date),
	title
)
ORDER BY 1,2,3




--Self joins
--ერთ ცხრილში რომ გვაქვს ორი id , ერთი მეორეზე დამოკიდებული შეგვიძლია გამოვიყენოთ self join

select 
emp.employee_id,
emp.name as employee_name,
mng.name as manager_name
from employee as emp
left join employee as mng
on emp.manager_id = mng.manager_id;


--Cross join
--გვიბრუნებს ყველა შესაძლო ROW ების კომბინაციას.

select 
staff_id,
store.store_id,
last_name,
first_name
from staff
cross join store 


--Natural join

--საერთო column name თუ აქვს ორ ცხრილს მაშინ ვიყენებთ natural join -ს. 
--თვითონ ნახულობს საეთო column და ჩვენი ზედმეტი წერის გარეშე აერთებს ცხრილებს.

select 
first_name,
last_name,
sum(amount)
from payment
natural inner join customer
group by first_name, last_name;



-- 9 Pro Window Functions

--OVER() with PARTITION BY

--შეგიძლია გამოიყენო agregate functons მაგალითად sum მაგრამ
--ყოველგვარი დაჯგუფების ანუ group by ის გარეშე მაშასადამე window func გამოსადეგია. 
--Agg(...) over (PARTITION BY ...)

select 
*,
sum(amount) over (partition by customer_id)
from payment
order by 1;

select 
*,
count(amount) over (partition by customer_id,staff_id)
from payment
order by 1;



--OVER() with ORDER BY

--თუ გვინდა ზრდის/კლების მიხედვით რომ გვქონდეს კონკრეტული column ის 
--მიხედვით ახალი ველი ვიყენებთ over() ოღონდ order by სთან ერთად.

select
*,
sum(amount) over(order by payment_id)
from payment;


select
*,
sum(amount) over(partition by customer_id order by payment_id)
from payment;



--RANK()

--ხშირად გვჭირდება გადანომრა კონკრეტული ველის მიმართ , რაშიც ვიყენებთ
--rank() ფუნქციას

--აქ პირველ ადგილზე იქნება დავუშვად ოთხი კაცი შემდეგი ნომრით წამოვა 5
select
f.title,
c.name,
f.length,
rank() over (order by length)
from film as f
left join film_category as fc 
on f.film_id = fc.film_id
left join category as c
on c.category_id = fc.category_id


--აქ პირველ ადგილზე იქნება დავუშვად ოთხი კაცი შემდეგი ნომრით წამოვა 2
select
f.title,
c.name,
f.length,
dense_rank() over (order by length)
from film as f
left join film_category as fc 
on f.film_id = fc.film_id
left join category as c
on c.category_id = fc.category_id


--ჯერ სახელების მიხედვით დალაგდება მერე უკვე ფილმის ხანგძლივობის
select
f.title,
c.name,
f.length,
dense_rank() over (partition by name order by length)
from film as f
left join film_category as fc 
on f.film_id = fc.film_id
left join category as c
on c.category_id = fc.category_id


/*
LEAD & LAG

ერთ-ერთი საინტერესო window function

lead გაძლევს დალაგებული შემდეგ ელემენტს , ანუ თუ დგახარ მეორე row ზე 
დასორტილი column ის შემდეგ ანუ მესამე row ზე რაცაა , შენ შემდეგ რაც მოდის იმ
მნიშვნელობას აბრუნებს
lag კი პირიქით წინა მნიშვნელობას აბრუნებს
*/

select
sum(amount),
DATE(payment_date) as day,
LAG(sum(amount)) over(order by DATE(payment_date)) as previous_day,
sum(amount) - lag(sum(amount)) over(order by DATE(payment_date)) as difference
from payment
group by DATE(payment_date)



-- 10 USER-DEFINED FUNCTIONS

--ეს ფუნქცია კომპლექსური დავალებების შესასრულებლად გამოიყებება.
--ორი რიცხვის შეკრება

create or replace function first_func(c1 int ,c2 int)
	returns int
	language plpgsql
as
$$
declare
c3 int;
begin
 select c1 + c2 into c3;
 return c3;
end;
$$
/
select first_func(8,4)


 
--ფილმების რაოდენობა კონკრეტული რეინჯიდან
create or replace function count_of_films (min_rt decimal(4,2) , max_rt decimal(4,2))
	returns int
	language plpgsql
as
$$
declare
total int;
begin

 select count(*) into total 
 from film
 where rental_rate between min_rt and max_rt;
 
 return total;
end;
$$

/

select count_of_films(3,6)


--სახელი გვარი პარამეტრად , ფუნქცია კი გიბრუნებს ამ ადმაინის დახარჯული თანხის ოდენობას
create or replace function f_l_name_amount (f_name varchar(50) , l_name varchar(50))
 returns decimal(6,2)
 language plpgsql
as
$$
declare
total_amount decimal(6,2);
begin
 select 
 sum(amount) into total_amount
 from payment as p
 left join customer as c
 on p.customer_id = c.customer_id
 where first_name = f_name and last_name = l_name
 group by f_name,l_name ;
 
 return total_amount;
end;
$$

/

select 
first_name , 
last_name , 
f_l_name_amount(first_name,last_name) 
from customer



-- 11 Transactions_rollback

/*
Transactions

ტრანზაქციის დაწება და დასრულება ჩვენი ბრძანებით ხდება , მას ვიყენებთ რამდენიმე ოპერაციის 
ერთდროულად შსასულებლად , მაგალითასდ ერთი ანგრიშიდან თანხის მერე ანგარიშზე გადარიცხვისას.
სულმ გვაქს სამი ტრნზაქციის ბრძანება begin , commit და rollback.

begin transaction;
--operation1
--operation2
commit;
*/

--ზემოთ მოყვანილი მაგალითი კოდით.
--სანამ არ დააქომითებ , სხვა window დან გახნილ ქუერში ცვლილებებს არ გიჩვენებს.
begin;

update acc_balance
set amount = amount - 100
where id = 1;

update acc_balance
set amount = amount + 100
where id = 2;

commit;


/*
Rollbacks

თუ დააქომითე იმას ვეღარ შეცვლი , აი rollback გეხმარება ამის თავიდა ასაცილებლად , გადასაზღვევად.
თუ რაღაც წაგვეშაა რაც გვჭირდებოდა იმის უკან დაბრუნება შეგვიძლია.

begin transaction;

--operation1
--operation2

rollback;
commit;
*/


--ხშირად ბევრი ოპერაცია გვაქვს და ყველას დაბრუნება არ გვაყობს ამიტომ ვიყენებთ  savepoints და ვბუნდებით 
--ზუსტად მაგ ადგილას , შეგიძლია ასევე წაშალო savepoint ბრძანებით release savepoint op3;
--rollback ასრულებს ტრანზაქვიას , rollback to savepoint კი არა !!!

--მაგალიოთად სანამ დავაქომითებთ წამეშალა row , გამოვიყენებ rollback და დავიწყებ თავიდან ტრანზაქციას.

begin;

update acc_balance
set amount = amount + 100
where id = 2;

delete from acc_balance
where id = 1;

rollback;
commit;


--თუ თავიდან არ გვინდა გამოვყენოთ savepoint  და წაშლილის არდეგნის მერე update რჩებააა !!!
select * from acc_balance;

begin;

update acc_balance
set amount = amount + 100
where id = 2;

savepoint s1 ;

delete from acc_balance
where id = 1;

rollback to savepoint s1;
commit;



-- 12 stored procedures

/*
STORED PROCEDUERES

ცოტა ხნის წინ ვისწავლე user defined functions მაგრამ ამ ფუნქციებთან ტრანზაქციის
ბრძანებების გამოყენება (begin , commit , rollback ) არ შეგვიძლია. მაგალითად საბანკო
ტრანზაქციების დროს user defined function ებს ვერ გამოვიყენებთ სწორედ ასეთ დროს
უნდა მივმართოდ stored procedures.
*/

--შექმენი თანხის გადარიცხვის პროცედურა გაითვალიწინე საიდან სად და რამდენი .

create or replace procedure sp_tranfer (tr_amount int , sender int , recipient int)
 language plpgsql
as
$$
begin
-- recipient
 update acc_balance
 set amount = amount + tr_amount
 where id = recipient;
 
-- sender
 update acc_balance
 set amount = amount - tr_amount
 where id = sender;

commit;
end;
$$
	
call sp_tranfer(500 ,1 ,2);



--ნებისმიერ ორ თანამშრომელს გაუცვალე ხელფასი და სამუშოს დასახელება
create or replace procedure emp_swap_new(emp1 int , emp2 int)
language plpgsql
as
$$
declare
salary_1 decimal(8,2);
salary_2 decimal(8,2);
position_1 text;
position_2 text;
begin

-- select into variables
select position_title , salary
into position_1 , salary_1
from employees
where emp_id = emp1;

select position_title , salary
into position_2 , salary_2
from employees
where emp_id = emp2;

-- update emp2
update employees
set position_title = position_1
where emp_id = emp2;

update employees
set salary = salary_1
where emp_id = emp2;

-- update emp1
update employees
set position_title = position_2
where emp_id = emp1;

update employees
set salary = salary_2
where emp_id = emp1;

commit;
end;
$$
/
call emp_swap_new(6,7);



-- 13 user management

/*
USER MANAGEMENT

როდესაც მონაცემთა ბაზას ქმნი შენ ხარ ამ ბაზის Superuser , ანუ გაქვს ყველაფრის უფლება.
ხშირად გვჭირდება ახალი იუზერების შექმნა , რომლებსაც შეზღუდული ექნებათ უფლებები ,
ზოგს მხოლოდ ცხრილის კითხვა შეეძლება , ზოგს განახლება და ა.შ.

1. შეგიძლია შექმნა user კონკრეტული რაღაცის შესრულების უნარით
create user <user_name>
with password 'pas123'

2. შეგიძლია შექმნა role და მერე აღჭურვო user ამ როლით   Role = user + login
create role <role_name>
with login password 'pas123'


# ზოგადად თუ შექმნი ახალ იუზერს , დისქონექთ -> რექონექთ მაგალითად alex ით
# დაინახავ public ყველაფერს , არ შეგეძლება select , update და ა.შ 
# მაგრამ შეგეძლება ცხრილების და ობიექტების შექმნა და მასზე მანიპულაცია.

create user sarah
with password 'sarah1234';
/
create role alex
with login password 'alexq1234';


#Priviliges

select --> Table
insert --> Table
update --> Table
delete --> Table
truncate --> Table
usage --> Schema
all


create --> Database , Schema
connect --> Database
*/

--customer ცხრილზე უფლების მინიჭება nikolai სთვის --> GRANT
grant select
on customer
to nikolai

--ყველა უფლების მინიჭება
grant all
on all tables in schema <schema_name>
to nikolai

--ყველა უფლების მინიჭება პლიუს შეეძლება სხვებს მიანიჭოს რაც მოესურვება ის პრივილეგია.
grant all
on all tables in schema <schema_name>
to nikolai with grant option


--რაღა თქმა უნდა უფლების ჩამორთმევის უნარიც აქვს მთავარ იუზერს --> REVOKE
revoke privilege
on database_object
from USER | ROLE | PUBLIC
granted by USER | ROLE

--grant ის უფლების შეწყვეტა 
revoke grant option for privilege
on database_object
from USER | ROLE | PUBLIC
granted by USER | ROLE


-- მაგალითებიი სხვადასვა შემთხვევისთვის !!!
-- create user
create user amar
with password 'amar1234';

-- grant USAGE on schema
grant usage
on schema name
to amar;

-- grant SELECT , UPDATE
grant select , update
on customer
to amar;

-- grant all privileges on schmea
grant all
on all tables in schema public
to amar;

--grant all privileges on database
grant all
on database greencycles
to amar;

-- grant createdb
alter user amar CREATEDB;

-- grant roles to user 
grant analyst to amar;

-- revoke insert
revoke insert on customer from amar;

-- revoke all
revoke all privileges on customer from public;


--კონკრეტული მაგალითი !

-- create users
create user ria
with password 'ria123';

create user mike
with password 'mike123';

--create roles
create role read_only;
create role read_update;

-- grant usage (already granted)
grant usage
on schema public
to read_only;

-- grant SELECT on tabels
grant select
on all tables in schema public
to read_only;

-- grant people to role
-- დისქონექთ , რექონექთ და ნახავთ რომ მაიკს შეუძლია მხოლოდ select ყველა ცხრილის
grant read_only to mike

--assign read_only to read_update role
grant read_only 
to read_update;

-- grant all privileges on all tables in public to role
grant all
on all tables in schema public
to read_update;

-- all is to mach
-- revoke some privileges
revoke delete,insert
on all tables in schema public
from read_update;

-- asign role to users
grant read_update
to ria;

-- drop roles
drop role mike;

-- remove dependancies
drop owned by read_update;
drop role read_update;



-- 14 Indexes

/*
Indexes

მთავარი მიზეზი მაინც ინდექსების გამოყენების დროის მოგება და პერფორმანსის გაზრდაა.
კონკრეტულ ველზე ინდექსით ის ისორტება და ბევრად სწაფად ხდება კითხვა და სელექთი.

ყველა ველზე არ უნდა გამოვიყენოთ დიდ ადგილს იკავებს , ვიყენებთ მაშინ როდესაც აუცილებელია.
გამოიყენე დიდ ცხრილებთან , ველი აარჩიე იმით , რომ გაფილტვრა სჭირდებოდეს.


B-tree indexes

მონაცემები განაწილებულია როგორც ხე . მშობელი რომელასაც ყავს , შვილიები იმას კიდე განშტოებები და ა.შ
ვიყენებთ მაშინ , როდესაც გვაქს ბევრი განსხვავებული მონაცემი , მაგრამ unique . 
default index



Bitmap index

იყენებს ბიტებს და 1 ისა და 0 ის კომბინაციას , ქმნის რუკას და ნიშნავს სად რომელი გვხვდება.
ვიყენებთ მაშინ , როდესაც დიდი მოცულობის მონაცემები გვაქვს + unique ველთან გვიწევს მუშობა.
slow to update,insert
storage efficient
great read performance
*/

--მაგალითები !!!

--ინდექსის გარეშე მთლიან ცხრილის სკანირებას ამ კოდით დასჭრიდე ჩემ კომპიუტრშუ 24 წამი .
--ამ დროის დასაზოგად გვჭირდება სწორედ ინდექსი.

select 
(
select round(avg(amount),2)
from payment as p2
where p2.rental_id = p1.rental_id
)
from payment as p1;

--შევქმნათ ინდექსი

create index index_rental_id_payment
on payment (rental_id)

--იგივე კოდის გაშვებას დასჭირდა 1,5 წამი.







































