declare
 cursor c_emps is select first_name , last_name from employees;
 v_first_name employees.first_name%type;
 v_last_name employees.last_name%type;
begin
 open c_emps;
 fetch c_emps into v_first_name,v_last_name ;
 dbms_output.put_line(v_first_name || ' ' || v_last_name);
 close c_emps;
end;

/

declare
 cursor c_emps is select first_name , last_name , department_name from employees 
                            join departments using(department_id)
                            where department_id between 30 and 60;
 
 v_first_name employees.first_name%type;
 v_last_name employees.last_name%type;
 v_department_name departments.department_name%type;
begin
 open c_emps;
 fetch c_emps into v_first_name,v_last_name,v_department_name ;
 dbms_output.put_line(v_first_name || ' ' || v_last_name || ' ' || v_department_name);

 close c_emps;
end;

/


-- Do not use
declare
 cursor c_emps is select first_name , last_name from employees;
 type t_emps is record (
                         v_first_name employees.first_name%type,
                         v_last_name employees.last_name%type
                       );
 r_emps t_emps;
begin
 open c_emps;
 fetch c_emps into r_emps ;
 dbms_output.put_line(r_emps.v_first_name || ' ' || r_emps.v_last_name);
 close c_emps;
end;
/

-- აქ ისაა პრობლემა რო row-ს ბევრი ელემენტი გვაქს გამოუყენებელი და მხოლოდ ორს ვიყენებთ
declare
 cursor c_emps is select first_name , last_name from employees;
 r_emps employees%rowtype;
begin
 open c_emps;
 fetch c_emps into r_emps.first_name , r_emps.last_name;
 dbms_output.put_line(r_emps.first_name || ' ' || r_emps.last_name);
 close c_emps;
end;

/


-- ყველაზეგამოსადეგი და მარტივია record ის შექმნა cursor ის rowtype ით
declare
 cursor c_emps is select * from employees;
 r_emps c_emps%rowtype;
begin
 open c_emps;
 fetch c_emps into r_emps ;
 dbms_output.put_line(r_emps.first_name || ' ' || r_emps.last_name);
 close c_emps;
end;

/

-- Not Good solution
declare
 cursor c_emps is select * from employees where department_id = 30;
 r_emps c_emps%rowtype;
begin
 open c_emps;
  loop
   fetch c_emps into r_emps;
   exit when c_emps%notfound;
    dbms_output.put_line(r_emps.employee_id || ' ' || r_emps.first_name || ' ' || r_emps.last_name);
  end loop;
 close c_emps;
end;

/


-- Not Good solution
declare
 cursor c_emps is select * from employees where department_id = 30;
 r_emps c_emps%rowtype;
begin
 open c_emps;
 fetch c_emps into r_emps;
  while c_emps%found loop
    dbms_output.put_line(r_emps.employee_id || ' ' || r_emps.first_name || ' ' || r_emps.last_name);
    fetch c_emps into r_emps;
  end loop;
 close c_emps;
end;


/
-- worst to the best one by one
declare
 cursor c_emps is select * from employees where department_id = 30;
 r_emps c_emps%rowtype;
begin
 open c_emps;
  for i in 1..6 loop
    fetch c_emps into r_emps;
    dbms_output.put_line(r_emps.employee_id || ' ' || r_emps.first_name || ' ' || r_emps.last_name);   
  end loop;
 close c_emps;
end;

/

declare
 cursor c_emps is select * from employees where department_id = 30;
begin
  for i in c_emps loop
    dbms_output.put_line(i.employee_id || ' ' || i.first_name || ' ' || i.last_name);   
  end loop;
end;

/

-- ყველაზე ლამაზიიიი
begin
  for i in (select * from employees where department_id = 30) loop
    dbms_output.put_line(i.employee_id || ' ' || i.first_name || ' ' || i.last_name);   
  end loop;
end;


/


declare
 cursor c_emps(p_dept_id number) is select first_name , last_name , department_name from employees
                                join departments using (department_id)
                                where department_id = p_dept_id;
 r_emps c_emps%rowtype;
begin
 open c_emps(20);
     fetch c_emps into r_emps;
     dbms_output.put_line( ' The Name of Department : ' || r_emps.department_name );
 close c_emps;
 
 open c_emps(20);
     loop
      fetch c_emps into r_emps;
      exit when c_emps%notfound;
      dbms_output.put_line(r_emps.first_name || ' ' || r_emps.last_name );
     end loop;
 close c_emps;
end;

/

declare
  cursor c_emps (p_dept_id number) is select first_name,last_name,department_name 
                    from employees join departments using (department_id)
                    where department_id = p_dept_id;
  v_emps c_emps%rowtype;
begin
  open c_emps(:b_emp);
  fetch c_emps into v_emps;
    dbms_output.put_line('The employees in department of '|| v_emps.department_name|| ' are :');
    close c_emps;
 
 open c_emps(:b_emp);
     loop
      fetch c_emps into v_emps;
      exit when c_emps%notfound;
      dbms_output.put_line(v_emps.first_name || ' ' || v_emps.last_name );
     end loop;
 close c_emps;
end;

/

declare
  cursor c_emps (p_dept_id number) is select first_name,last_name,department_name 
                    from employees join departments using (department_id)
                    where department_id = p_dept_id;
  v_emps c_emps%rowtype;
begin
  open c_emps(:b_dept_id2);
  fetch c_emps into v_emps;
    dbms_output.put_line('The employees in department of '|| v_emps.department_name|| ' are :');
    close c_emps;
    
    for i in c_emps(:b_dept_id2) loop
      dbms_output.put_line(i.first_name|| ' ' ||i.last_name);
    end loop;
end;


/


declare
  cursor c_emps (p_dept_id number , job_id varchar2) is select first_name,last_name,job_id,department_name 
                    from employees join departments using (department_id)
                    where department_id = p_dept_id
                    and job_id = job_id;
  v_emps c_emps%rowtype;
begin
    for i in c_emps(50,'ST_MAN') loop
      dbms_output.put_line(i.first_name|| ' ' ||i.last_name|| ' - ' || i.job_id);
    end loop;
    
    dbms_output.put_line(' - - - - -');
    
    for i in c_emps(80,'SA_MAN') loop
      dbms_output.put_line(i.first_name|| ' ' ||i.last_name|| ' - ' || i.job_id);
    end loop;
end;


/

-- " Where currrent of " clause

select rowid,employees.* from employees where department_id = 30 ;
/
declare
 cursor c_emps is select * from employees where department_id = 30 for update;
begin
 for r_emps in c_emps loop
  update employees set salary = salary + 60 where employee_id = r_emps.employee_id;
 end loop;
end;
/
-- mode fast method
-- არ უნდა გქონდეს group function ები ან join ები
declare
 cursor c_emps is select * from employees where department_id = 30 for update;
begin
 for r_emps in c_emps loop
  update employees set salary = salary + 60 where current of c_emps;
 end loop;
end;




-- Ref Cursor

declare
 type t_emps is ref cursor return employees%rowtype;
 rc_emps t_emps;
 
 r_emps employees%rowtype;
begin
 open rc_emps for select * from employees;
 loop
  fetch rc_emps into r_emps ;
  exit when rc_emps%notfound;
  dbms_output.put_line(r_emps.first_name|| ' ' || r_emps.last_name);
 end loop;
 close rc_emps;
 
 dbms_output.put_line('-- -- -- -- -- -- -- -- --');
 
 open rc_emps for select * from employees where job_id = 'IT_PROG';
 loop
  fetch rc_emps into r_emps ;
  exit when rc_emps%notfound;
  dbms_output.put_line(r_emps.first_name|| ' ' || r_emps.last_name);
 end loop;
 close rc_emps;
end;

/


declare
 type ty_emps is record(
                        emp_id number,
                        first_name employees.first_name%type,
                        last_name employees.last_name%type,
                        department_name departments.department_name%type
                        );
 r_emps ty_emps;    
 
 type t_emps is ref cursor return ty_emps;
 rc_emps t_emps;
begin

 open rc_emps for select employee_id , first_name , last_name , department_name
                 from employees join departments using(department_id);
  loop
   fetch rc_emps into r_emps;
   exit when rc_emps%notfound;
   dbms_output.put_line(r_emps.first_name || ' ' || r_emps.last_name || ' '
                            || ' is department of ' || r_emps.department_name);
  end loop;
  close rc_emps;
end;