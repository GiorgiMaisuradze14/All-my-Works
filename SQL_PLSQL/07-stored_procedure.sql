-- first procedure
create or replace procedure increase_salary_no_parametre as
 cursor c_emps is select * from employees_copy for update;
 v_increase_salary number := 1.10;
 v_old_salary pls_integer;
begin
 for r_emp in c_emps loop
  v_old_salary := r_emp.salary;
  r_emp.salary := r_emp.salary*v_increase_salary ;
  
  update employees_copy set row = r_emp where current of c_emps;
  dbms_output.put_line(r_emp.employee_id || ' ' || ' old salary : ' || v_old_salary ||
                                                    ' new salary '|| r_emp.salary);
 end loop;
end;

/

create or replace procedure only_line as
begin
 dbms_output.put_line('-------------------');
end;

/

begin
 only_line;
 increase_salary_no_parametre;
 only_line;
end;

/

-- Second procedure
create or replace procedure increase_salary_with_parametre(
                                                            v_salary_increase in number ,
                                                            v_dep_id number
                                                            ) as
    cursor c_emps is select * from employees_copy where department_id = v_dep_id for update;
    v_old_salary number;
begin
    for r_emp in c_emps loop
      v_old_salary := r_emp.salary;
      r_emp.salary := r_emp.salary * v_salary_increase + r_emp.salary * nvl(r_emp.commission_pct,0);
      update employees_copy set row = r_emp where current of c_emps;
      dbms_output.put_line('The salary of : '|| r_emp.employee_id 
             || ' is increased from '||v_old_salary||' to '||r_emp.salary || ', department id :' || r_emp.department_id);
    end loop;
end;
/
begin
 only_line;
 increase_salary_with_parametre(1.20,90);
 only_line;
end;
/



-- third procedure
create or replace procedure increase_salary_with_parametre(
                                                            v_salary_increase in number ,
                                                            v_dep_id number,
                                                            v_affected_employee_count out number
                                                            ) as
    cursor c_emps is select * from employees_copy where department_id = v_dep_id for update;
    v_old_salary number;
    v_sal_inc number :=0;
    v_avg_sal number;
begin
 v_affected_employee_count := 0;
    for r_emp in c_emps loop
      v_old_salary := r_emp.salary;
      r_emp.salary := r_emp.salary * v_salary_increase + r_emp.salary * nvl(r_emp.commission_pct,0);
      update employees_copy set row = r_emp where current of c_emps;
      dbms_output.put_line('The salary of : '|| r_emp.employee_id 
             || ' is increased from '||v_old_salary||' to '||r_emp.salary || ', department id :' || r_emp.department_id);
             
      v_affected_employee_count := v_affected_employee_count + 1;       
      v_sal_inc := v_sal_inc + r_emp.salary;
    end loop;
    v_avg_sal := v_sal_inc / v_affected_employee_count;
    dbms_output.put_line('Avg salary : '|| v_avg_sal);
end;
/
declare
 v_affected_count number;
begin
 increase_salary_with_parametre(1.20,90,v_affected_count);
end;

/

select * from jobs;
/
create or replace procedure add_job(job_id varchar2, job_title varchar2, 
                                    min_salary number default 1000, max_salary number default null) is
begin
  insert into jobs values (job_id,job_title,min_salary,max_salary);
  print_text('The job : '|| job_title || ' is inserted!..');
end;
/
exec add_job('IT_DIR','Programer',3000,5000);