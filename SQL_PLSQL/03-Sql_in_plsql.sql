select * from employees_copy;
/

--easy code

declare
 v_name varchar2(50);
 v_salary employees.salary%type;
begin

 select first_name || ' ' || last_name , salary into v_name , v_salary
 from employees where employee_id = 120;
 
 dbms_output.put_line(v_name||' ' ||v_salary);
end;

-- Insert
begin
 for i in 207..215 loop
    insert into employees_copy (employee_id,first_name,last_name,email,hire_date,job_id,salary)
    values (i,'test_first_name' || i,'test_last_names','abs@gmail.com',sysdate,'IT_PROG' , 1000);
 end loop;
end;

/

--Update
declare
 v_salary_increase number := 400;
begin
 for i in 207..215 loop
    update employees_copy set salary = salary + v_salary_increase
    where employee_id = i;
 end loop;
end;

/
--Delete
begin
 for i in 207..215 loop
    delete from employees_copy where employee_id = i;
 end loop;
end;


-- Sequence

select * from employees_copy;
/
create sequence employee_id_seq
start with 207
increment by 1;
/
begin
 for i in 1..10 loop
    insert into employees_copy (employee_id,first_name,last_name,email,hire_date,job_id,salary)
    values (employee_id_seq.nextval,'test_first_name' || i,'test_last_names','abs@gmail.com',sysdate,'IT_PROG' , 1000);
 end loop;
end;
