-- RECORDS

declare 
 r_emp employees%rowtype;
begin
 select * into r_emp from employees where employee_id = 120;
 dbms_output.put_line(r_emp.first_name||' '||r_emp.last_name || ' earns ' || r_emp.salary || '$');
end;
/

declare
 type t_emp is record (
                        f_name employees.first_name%type,
                        l_name employees.last_name%type,
                        v_salary employees.salary%type
                        
 );
 r_emp t_emp;
begin
 r_emp.f_name := 'Lewis';
 r_emp.l_name := 'Hamilton';
 r_emp.v_salary := 2;
 
 dbms_output.put_line(r_emp.f_name||' '||r_emp.l_name || ' earns ' || r_emp.v_salary || 'M $');
end;
 
/
 
declare
 type t_emp is record (
                        f_name employees.first_name%type,
                        l_name employees.last_name%type,
                        v_salary employees.salary%type
                        
 );
 r_emp t_emp;
begin
 select first_name , last_name , salary into r_emp from employees where employee_id = 130;
 dbms_output.put_line(r_emp.f_name||' '||r_emp.l_name || ' earns ' || r_emp.v_salary || '$');
end;

/

-- t_edu არის type ანუ შიგნით მაქვს ველები და შემიძლია გავუტოლო რაღაც სახელს და ის ავტომატურად იქნება record.
-- education t_edu , ანუ მე მაქვს უკვე ახალი record რომელიც შევქმენი record ში, სადაც ჩვეულებრივი row ების გარდა მქონდა
-- სტანდარტულად შექმნილი record სახელით department.
declare 
 type t_edu is record (
                        primary_shcool varchar2(100),
                        high_school varchar2(100),
                        university varchar2(100),
                        uni_graduate_date date
 );
 
 type t_emp is record (
                        first_name varchar2(50),
                        last_name employees.last_name%type,
                        salary employees.salary%type not null default 1000,
                        hire_date date,
                        dept_id employees.department_id%type,
                        department departments%rowtype,
                        education t_edu
 );
 
 r_emp t_emp;
 
begin
-- Select scalar variables
 select first_name , last_name , salary , hire_date , department_id 
 into r_emp.first_name , r_emp.last_name , r_emp.salary , r_emp.hire_date , r_emp.dept_id
 from employees where employee_id = 146;
 
-- Select department
 select * into r_emp.department from departments where department_id = r_emp.dept_id;
 
-- select education record
 r_emp.education.primary_shcool := '107' ;
 r_emp.education.high_school := 'Beverly Hills' ;
 r_emp.education.university := 'Oxford';
 r_emp.education.uni_graduate_date := '01-JAN-23';
 
 dbms_output.put_line(r_emp.first_name || ' ' || r_emp.last_name || ' earns ' || r_emp.salary);
 dbms_output.put_line('She graduated from ' || r_emp.education.university || ' at ' || r_emp.education.uni_graduate_date );
 dbms_output.put_line('Her department name is : ' || r_emp.department.department_name);
end;


/


-- record ის გამოყენებით ცრილში მონაცემების შეტანა და update

create table retierd_employees as select * from employees where 1=2;

/

select * from retierd_employees;

/

declare 
 r_emp employees%rowtype;
begin
 select * into r_emp from employees where employee_id  = 143 ;
 insert into retierd_employees values r_emp;
end;

/

declare 
 r_emp employees%rowtype;
begin
 select * into r_emp from employees where employee_id  = 143 ;
 r_emp.salary := 10;
 r_emp.commission_pct := 0;
 
 update retierd_employees set row = r_emp where employee_id = 143;
end;

/

declare 
   type books is record 
                        (
                          title varchar(50), 
                          author varchar(50), 
                          subject varchar(100), 
                          book_id number    
                         ); 
   book1 books; 
   book2 books; 
begin 
   -- Book 1 specification 
   book1.title  := 'C Programming'; 
   book1.author := 'Nuha Ali ';  
   book1.subject := 'C Programming Tutorial'; 
   book1.book_id := 6495407; 
   
   -- Book 2 specification 
   book2.title := 'Telecom Billing'; 
   book2.author := 'Zara Ali'; 
   book2.subject := 'Telecom Billing Tutorial'; 
   book2.book_id := 6495700;  
  
  -- Print book 1 record 
   dbms_output.put_line('Book 1 title : '|| book1.title); 
   dbms_output.put_line('Book 1 author : '|| book1.author); 
   dbms_output.put_line('Book 1 subject : '|| book1.subject); 
   dbms_output.put_line('Book 1 book_id : ' || book1.book_id); 
   
   -- Print book 2 record 
   dbms_output.put_line('Book 2 title : '|| book2.title); 
   dbms_output.put_line('Book 2 author : '|| book2.author); 
   dbms_output.put_line('Book 2 subject : '|| book2.subject); 
   dbms_output.put_line('Book 2 book_id : '|| book2.book_id); 
end; 
/


-- Varrays
-- უმარტივესი varaay ის მაგალითი
declare 
 type e_list is varray(5) of varchar2(50);
 employees e_list;
begin
 employees := e_list('Mariami','Giorgi','Tengo','Nika','Kote');
 
 for i in 1..employees.count() loop
  dbms_output.put_line(employees(i));
 end loop;
end;

/

-- inicialization შეგვიძლია შექმნის მომენტშივე
declare 
 type e_list is varray(5) of varchar2(50);
 employees e_list := e_list('Mariami','Giorgi','Tengo','Nika','Kote');
begin
 for i in 1..employees.count() loop
  dbms_output.put_line(employees(i));
 end loop;
end;

/

--
declare 
 type e_list is varray(15) of varchar(50);
 employees e_list := e_list();
 idx number := 1;
begin
 for i in 100..110 loop
  employees.extend;
  select first_name into employees(idx) from employees where employee_id =  i;
  idx := idx + 1;
 end loop;
 
 for x in 1..employees.count() loop
  dbms_output.put_line(employees(x));
 end loop;
end;


-- Nested Table
--
declare
 type e_list is table of varchar2(50);
 emp e_list;
begin
 emp := e_list('Mariami','Giorgi');
 
 for i in 1..emp.count() loop
  dbms_output.put_line(emp(i));
 end loop;
end;

/

declare
 type e_list is table of varchar2(50);
 emp e_list;
begin
 emp := e_list('Mariami','Giorgi');
 emp.extend;
 emp(3) := 'Tengizi';
 
 for i in 1..emp.count() loop
  dbms_output.put_line(emp(i));
 end loop;
end;

/

declare
 type e_list is table of varchar2(50);
 emp e_list := e_list();
 idx number := 1;
begin
 for x in 100..110 loop
   emp.extend;
   select first_name into emp(idx) from employees where employee_id = x;
   idx := idx + 1 ;
 end loop;
 
 for i in 1..emp.count() loop
  dbms_output.put_line(emp(i));
 end loop;
end;

/

declare
 type e_list is table of varchar2(50);
 emp e_list := e_list();
 idx number := 1;
begin
 for x in 100..110 loop
   emp.extend;
   select first_name into emp(idx) from employees where employee_id = x;
   idx := idx + 1 ;
 end loop;
 
 emp.delete(3);
 
 for i in 1..emp.count() loop
  if emp.exists(i) then
   dbms_output.put_line(emp(i));
  end if;
 end loop;
end;



-- Asosiative Arrays
declare
 type e_list is table of varchar(50) index by pls_integer;
 emps e_list;
begin
 for x in 100..110 loop
  select first_name into emps(x) from employees where employee_id = x;
 end loop;
 
 for i in emps.first..emps.last loop
  dbms_output.put_line(emps(i));
 end loop;
end;

/


-- 100,101,102..120 მდე რადგანაა რიცხვები error ის თავიდან ასაცილებლად 
--while loop -ს ვიყენებთ ლოგიკური პირობით
declare
 type e_list is table of varchar(50) index by pls_integer;
 emps e_list;
 
 idx pls_integer;
begin
 emps(100) := 'Mariami';
 emps(120) := 'Giorgi';
 idx := emps.first;
 
 while idx is not null loop
  dbms_output.put_line(emps(idx));
  idx := emps.next(idx);
 end loop;
end;

/
declare
 type e_list is table of employees.first_name%type index by pls_integer;
 emps e_list;
 
 idx pls_integer;
begin
 for x in 100..110 loop
  select first_name into emps(x) from employees where employee_id = x ;
 end loop;
 
 idx := emps.first;
 
 while idx is not null loop
  dbms_output.put_line(emps(idx));
  idx := emps.next(idx);
 end loop;
end;


/

declare
 type e_list is table of employees.first_name%type index by varchar2(50);
 emps e_list;
 
 idx employees.email%type;
 v_email employees.email%type;
 v_first_name employees.first_name%type;
begin
 for x in 100..110 loop
  select first_name , email into v_first_name , v_email from employees where employee_id = x ;
  emps(v_email) := v_first_name;
 end loop;
 
 idx := emps.first;
 
 while idx is not null loop
  dbms_output.put_line('The email of ' || emps(idx) || ' is : ' || idx );
  idx := emps.next(idx);
 end loop;
end;

/

-- record in assosiative array
declare
 type e_list is table of employees%rowtype index by varchar2(60);
 emps e_list;
 
 idx number;
begin
 for x in 100..110 loop
  select * into emps(x) from employees where employee_id = x ;
 end loop;
 
 idx := emps.first;
 
 while idx is not null loop
  dbms_output.put_line('The email of ' || emps(idx).first_name || '' || emps(idx).last_name || ' is : ' || emps(idx).email );
  idx := emps.next(idx);
 end loop;
end;

/

declare
 type e_list is table of employees%rowtype index by varchar2(50);
 emps e_list;
 
 idx number;
begin
 for x in 100..110 loop
  select * into emps(x) from employees where employee_id = x ;
 end loop;
 
 idx := emps.first;
 
 while idx is not null loop
  dbms_output.put_line('The email of ' || emps(idx).first_name || '' || emps(idx).last_name || ' is : ' || emps(idx).email );
  idx := emps.next(idx);
 end loop;

end;

/

-- შევქმენი record ის ტიპი და შემდეგ შექმნილ assosiative arrays გადავეცი როგორც მისი ტიპი 
-- გამომივიდა assosiative arrays with record type
declare
 type e_type is record (
                         first_name employees.first_name%type,
                         last_name employees.last_name%type,
                         email employees.email%type
                        );
 type e_list is table of e_type index by varchar2(50);
 emps e_list;
 
 idx number;
begin
 for x in 100..110 loop
  select first_name , last_name , email into emps(x) from employees where employee_id = x ;
 end loop;
 
 idx := emps.first;
 
 while idx is not null loop
  dbms_output.put_line('The email of ' || emps(idx).first_name || '' || emps(idx).last_name || ' is : ' || emps(idx).email );
  idx := emps.next(idx);
 end loop;

end;

/

declare
 type e_type is record (
                         first_name employees.first_name%type,
                         last_name employees.last_name%type,
                         email employees.email%type
                        );
 type e_list is table of e_type index by varchar2(50);
 emps e_list;
 
 idx number;
begin
 for x in 100..110 loop
  select first_name , last_name , email into emps(x) from employees where employee_id = x ;
 end loop;
 
 emps.delete(100);
 idx := emps.first;
 
 while idx is not null loop
  dbms_output.put_line('The email of ' || emps(idx).first_name || '' || emps(idx).last_name || ' is : ' || emps(idx).email );
  idx := emps.next(idx);
 end loop;

end;

/

-- უკნიდან რომ გვინდოდეს დაბეჭდვა ვიყენებთ prior()
declare
 type e_type is record (
                         first_name employees.first_name%type,
                         last_name employees.last_name%type,
                         email employees.email%type
                        );
 type e_list is table of e_type index by varchar2(50);
 emps e_list;
 
 idx number;
begin
 for x in 100..110 loop
  select first_name , last_name , email into emps(x) from employees where employee_id = x ;
 end loop;
 
 idx := emps.last;
 
 while idx is not null loop
  dbms_output.put_line('The email of ' || emps(idx).first_name || '' || emps(idx).last_name || ' is : ' || emps(idx).email );
  idx := emps.prior(idx);
 end loop;

end;


/

---------------An example of inserting with associative arrays
create table employees_salary_history as select * from employees where 1=2;
select * from employees_salary_history;

/

declare
 type e_list is table of employees_salary_history%rowtype index by pls_integer;
 emps e_list;
 
 idx pls_integer;

begin
 for x in 100..110 loop
  select * into emps(x) from employees where employee_id = x; 
 end loop;
 
 idx := emps.first;
 
 while idx is not null loop
  emps(idx).salary := emps(idx).salary + emps(idx).salary*0.2;
  dbms_output.put_line(emps(idx).first_name || ' ' || emps(idx).last_name || 
                                        ' increase salary , and now salary is ' || emps(idx).salary );
  idx := emps.next(idx);
 end loop;
end;
/
drop table employees_salary_history;


/

-- object მერე ვისწავლით მაგრამ ახლა გავიაზროთ ერთი რაღაც record არ იქმნება shcema level ზე
-- ამიტომ უბრალოდ ვიხმართ სიტყვა objects რაც იგივე აზრის მატარებელი იქნება რაც არის record .

create or replace type t_phone_number as object (p_type varchar2(20), p_number varchar2(50));
/
create or replace type v_phone_numbers as varray(3) of t_phone_number;
/
-- ახლა colums ექნება კიდევ 3 colums შიგნით რადგან გამოვიყენეთ v_phone_numbers type.
create table emps_with_phones ( employee_id number,
                                first_name varchar2(50),
                                last_name varchar2(50),
                                phone_number v_phone_numbers
                              );
                              
/
select * from emps_with_phones;
/

insert into emps_with_phones values(10,'Mariam','kikacheishvili', v_phone_numbers(
                                                                        t_phone_number('Personal','595-40-92-27'),
                                                                        t_phone_number('Home','032-2-74-24'),
                                                                        t_phone_number('Work','111.111.1111')
                                                                                  )
                                                                        );
/
insert into emps_with_phones values(11,'Giorgi','Maisuradze', v_phone_numbers(
                                                                        t_phone_number('Personal','595-40-92-27'),
                                                                        t_phone_number('Home','032-2-74-24')
                                                                            )
                                                                        ); 


-- Nessted Tabel

create or replace type t_phone_number as object (p_type varchar2(20), p_number varchar2(50));
/
create or replace type n_phone_numbers as table of t_phone_number;
/
-- ახლა colums ექნება კიდევ 3 colums შიგნით რადგან გამოვიყენეთ v_phone_numbers type.
create table emps_with_phones_2 ( employee_id number,
                                first_name varchar2(50),
                                last_name varchar2(50),
                                phone_number n_phone_numbers
                              )
                              nested table phone_number store as phone_numbers_table ;
                              
/
select * from emps_with_phones_2;
/

insert into emps_with_phones_2 values(10,'Kote','Kldiashvili', n_phone_numbers(
                                                                        t_phone_number('Personal','595-40-92-27'),
                                                                        t_phone_number('Home','032-2-74-24'),
                                                                        t_phone_number('Work','111.111.1111')
                                                                                  )
                                                                        );
/
insert into emps_with_phones_2 values(11,'Tengiz','Batdavelidze', n_phone_numbers(
                                                                        t_phone_number('Personal','595-40-92-27'),
                                                                        t_phone_number('Home','032-2-74-24')
                                                                            )
                                                                        ); 
                                                                        
/

insert into emps_with_phones_2 values(11,'Nika','Varamashvili', n_phone_numbers(
                                                                        t_phone_number('Personal','595-40-92-27'),
                                                                        t_phone_number('Home','032-2-74-24'),
                                                                        t_phone_number('Home','032-2-74-24'),
                                                                        t_phone_number('Home','032-2-74-24'),
                                                                        t_phone_number('Home','032-2-74-24')
                                                                            )
                                                                        );








