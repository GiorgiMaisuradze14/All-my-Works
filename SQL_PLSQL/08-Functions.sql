--First Function
create or replace function get_avg_sal(p_dep_id departments.department_id%type) return number as
 v_avg_sal number;
begin
 select avg(salary) into v_avg_sal from employees where department_id = p_dep_id;
 return v_avg_sal;
end get_avg_sal;
/
declare
 v_avg_salary number;
begin
 v_avg_salary := get_avg_sal(90);
 dbms_output.put_line(round((v_avg_salary),0));
end;
/
select first_name , last_name , salary , round((get_avg_sal(90)),0) from employees;

/

-- Local Subprogram
create table emps_hide_paid as select * from employees where 1=2;
/
declare
 function get_emp (emp_num employees.employee_id%type) return employees%rowtype is
  emp employees%rowtype;
 begin
  select * into emp from employees where employee_id = emp_num;
  return emp;
 end get_emp;
 
 procedure insert_hide_paid_emp(emp_id employees.employee_id%type) is
  emp employees%rowtype;
 begin
  emp := get_emp(emp_id);
  insert into emps_hide_paid values emp;
 end;

begin
 for r_emp in (select * from employees) loop
  if r_emp.salary > 15000 then
   insert_hide_paid_emp(r_emp.employee_id);
  end if;
 end loop;
end;
/
select * from emps_hide_paid;

-- we can use function inside a procedure

/
declare
 procedure insert_hide_paid_emp(emp_id employees.employee_id%type) is
  emp employees%rowtype;
  function get_emp (emp_num employees.employee_id%type) return employees%rowtype is
   begin
    select * into emp from employees where employee_id = emp_num;
    return emp;
   end get_emp;
 begin
  emp := get_emp(emp_id);
  insert into emps_hide_paid values emp;
 end;

begin
 for r_emp in (select * from employees) loop
  if r_emp.salary > 15000 then
   insert_hide_paid_emp(r_emp.employee_id);
  end if;
 end loop;
end;







-- Overloading the Subprogram
declare
 procedure insert_hide_paid_emp(p_emp employees%rowtype) is
  emp employees%rowtype;
  function get_emp (emp_num employees.employee_id%type) return employees%rowtype is
   begin
    select * into emp from employees where employee_id = emp_num;
    return emp;
   end get_emp;
 begin
  emp := get_emp(p_emp.employee_id);
  insert into emps_hide_paid values emp;
 end;

begin
 for r_emp in (select * from employees) loop
  if r_emp.salary > 15000 then
   insert_hide_paid_emp(r_emp);
  end if;
 end loop;
end;


/

-- add function with email
declare
 procedure insert_hide_paid_emp(p_emp employees%rowtype) is
  emp employees%rowtype;
  function get_emp (emp_num employees.employee_id%type) return employees%rowtype is
   begin
    select * into emp from employees where employee_id = emp_num;
    return emp;
   end get_emp;
  function get_emp (emp_email employees.email%type) return employees%rowtype is
   begin
    select * into emp from employees where email = emp_email;
    return emp;
   end get_emp; 
 begin
  emp := get_emp(p_emp.email);
  insert into emps_hide_paid values emp;
 end;

begin
 for r_emp in (select * from employees) loop
  if r_emp.salary > 15000 then
   insert_hide_paid_emp(r_emp);
  end if;
 end loop;
end;
/

-- უფრო გასაგები რომ იყოს სახელი და გვარი დავამატოთ
-- ერთი და იგივე სახელით ვიძახებ ფუნქციას შედეგი იგივეა
declare
 procedure insert_hide_paid_emp(p_emp employees%rowtype) is
  emp employees%rowtype;
  function get_emp (emp_num employees.employee_id%type) return employees%rowtype is
   begin
    select * into emp from employees where employee_id = emp_num;
    return emp;
   end get_emp;
  function get_emp (emp_email employees.email%type) return employees%rowtype is
   begin
    select * into emp from employees where email = emp_email;
    return emp;
   end get_emp; 
  function get_emp (f_name employees.first_name%type , l_name varchar2) return employees%rowtype is
   begin
    select * into emp from employees where first_name = f_name and last_name = l_name;
    return emp;
   end get_emp; 
 begin
  emp := get_emp(p_emp.first_name , p_emp.last_name);
  insert into emps_hide_paid values emp;
 end;

begin
 for r_emp in (select * from employees) loop
  if r_emp.salary > 15000 then
   insert_hide_paid_emp(r_emp);
  end if;
 end loop;
end;
/

declare
 procedure insert_hide_paid_emp(p_emp employees%rowtype) is
  emp employees%rowtype;
  function get_emp (emp_num employees.employee_id%type) return employees%rowtype is
   begin
    select * into emp from employees where employee_id = emp_num;
    return emp;
   end get_emp;
  function get_emp (emp_email employees.email%type) return employees%rowtype is
   begin
    select * into emp from employees where email = emp_email;
    return emp;
   end get_emp; 
  function get_emp (f_name employees.first_name%type , l_name varchar2) return employees%rowtype is
   begin
    select * into emp from employees where first_name = f_name and last_name = l_name;
    return emp;
   end get_emp; 
 begin
  emp := get_emp(p_emp.employee_id);
  insert into emps_hide_paid values emp; 
  emp := get_emp(p_emp.email);
  insert into emps_hide_paid values emp;
  emp := get_emp(p_emp.first_name , p_emp.last_name);
  insert into emps_hide_paid values emp;
 end;
begin
 for r_emp in (select * from employees) loop
  if r_emp.salary > 15000 then
   insert_hide_paid_emp(r_emp);
  end if;
 end loop;
end;
/
delete emps_hide_paid;
/
select * from emps_hide_paid;