-- Exception
declare
  v_name varchar2(6);
begin
  select first_name into v_name from employees where employee_id = 50;
  dbms_output.put_line('Hello');
exception
  when no_data_found then
    dbms_output.put_line('There is no employee with the selected id');
end;

/

declare
  v_name varchar2(6);
  v_department_name varchar2(100);
begin
  select first_name into v_name from employees where employee_id = 103;
  select department_id into v_department_name from employees where first_name = v_name;
  dbms_output.put_line('Hello '|| v_name || '. Your department id is : '|| v_department_name );
exception
  when no_data_found then
    dbms_output.put_line('There is no employee with the selected id');
  when too_many_rows then
    dbms_output.put_line('There are more than one employees with the name '|| v_name);
    dbms_output.put_line('Try with a different employee');
  when others then
    dbms_output.put_line('An unexpected error happened. Connect with the programmer..');
    dbms_output.put_line(sqlcode || ' ---> '|| sqlerrm);
end;

/

declare
  too_high_salary exception;
  v_salary_check pls_integer;
begin
  select salary into v_salary_check from employees where employee_id = 100;
  if v_salary_check > 20000 then
   raise too_high_salary;
  end if;
  
  dbms_output.put_line('The salary is in an acceptable range');  
exception 
 when too_high_salary then 
    dbms_output.put_line('The salary is not in an acceptable range !!!');
end;

/


declare
  too_high_salary exception;
  v_salary_check pls_integer;
begin
  select salary into v_salary_check from employees where employee_id = 100;
  if v_salary_check > 20000 then
   raise_application_error(-20243,'Salary is too high !');
  end if;
  dbms_output.put_line('The salary is in an acceptable range');  
end;

/

declare
  too_high_salary exception;
  v_salary_check pls_integer;
begin
  select salary into v_salary_check from employees where employee_id = 100;
  if v_salary_check > 20000 then
   raise too_high_salary;
  end if;
  dbms_output.put_line('The salary is in an acceptable range');  
exception 
 when too_high_salary then 
    dbms_output.put_line('The salary is not in an acceptable range !!!');
    raise_application_error(-20243,'Salary is too high !');   
end;

