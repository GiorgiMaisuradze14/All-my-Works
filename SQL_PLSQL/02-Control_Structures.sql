--Easy Level:
/*
Task: Simple IF-THEN-ELSE
Write a PL/SQL block that checks if a given number is even or odd. Display an appropriate message.
*/

declare
 v_number number := 16;
begin

 if mod(v_number,2) = 0 then
  dbms_output.put_line(v_number || ' is even');
 else 
  dbms_output.put_line(v_number || ' is odd');
 end if;
end;

/

/*
Task: FOR LOOP
Create a PL/SQL block that uses a FOR loop to display numbers from 1 to 10.
*/

begin
 for i in 1..10 loop
  dbms_output.put_line('Number - ' || i );
 end loop;
end;

/

/*
Task: WHILE LOOP
Write a PL/SQL block that uses a WHILE loop to print the Fibonacci series up to the 10th element.
*/

-- PL/SQL block to print Fibonacci series up to the 10th element

declare
 a number := 1;
 b number := 0;
 fib number;
 i number := 1;
begin
 dbms_output.put_line('Fibonachi series: ');
 dbms_output.put_line(b);
 dbms_output.put_line(a);
 
 while i < 10 loop
  fib := a + b; 
  dbms_output.put_line(fib);
  b := a;
  a := fib;
  i := i + 1;
 end loop;
end;

/

/*
Develop a PL/SQL block to determine the grade of a student based on their exam score. 
Consider grades A, B, C, D, and F
*/

declare
 v_mark number := 50 ;
begin
 if v_mark > 90 then
  dbms_output.put_line('Your grade is A');
 elsif v_mark > 80 then
  dbms_output.put_line('Your grade is B');
 elsif v_mark > 70 then
  dbms_output.put_line('Your grade is C');
 elsif v_mark > 60 then
  dbms_output.put_line('Your grade is D');
 elsif v_mark > 50 then
  dbms_output.put_line('Yout grade is E');
 else 
  dbms_output.put_line('Failed');
 end if;
end;

/


-- 1 დან 100 მდე ლუწი რიცხვების ჯამი

declare
 v_sum number := 0;
begin
 for i in 1..100 loop
  if mod(i,2) = 0 then
   v_sum := v_sum + i ;
  end if;
 end loop;
 dbms_output.put_line(v_sum);
end;

