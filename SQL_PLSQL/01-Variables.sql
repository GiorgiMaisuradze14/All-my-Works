/*
Easy Level:

Declare a variable of type NUMBER.
Assign a value to the variable.
Print the value of the variable.
Declare two variables of type VARCHAR2.
Assign values to both variables.
Concatenate the values and print the result.
*/

declare
 v_num number := 20 ;
 v_text_1 varchar2(30) := 'GOT';
 v_text_2 varchar2(30):= 'Breaking Bad';
begin
 dbms_output.put_line('This number is : ' || v_num);
 dbms_output.put_line('My favourite series: first ' || v_text_1 || ' , second ' || v_text_2);
end;

/

/*
Medium Level:
Conditional Assignment:

Declare a variable to store a person's age.
Write a PL/SQL block that checks if the age is greater than or equal to 18.
If true, print 'Adult', otherwise print 'Minor'.
Looping with Variables:

Declare a variable of type NUMBER and initialize it to 1.
Use a loop to print the variable's value multiplied by 2 in each iteration, up to 5 iterations.
*/

declare
 v_age number := 22;
begin
 if v_age >= 18 then 
  dbms_output.put_line('Adult');
 else 
  dbms_output.put_line('Minor');
 end if;
end;

/

declare
 v_number number := 5;
 v_iterator number := 1;
begin
 for v_iterator in 1..5 loop
  dbms_output.put_line('value of number: ' || v_number * v_iterator );
 end loop;
end;

/

/*
Array-like Behavior:

Declare a collection type variable (like a PL/SQL table) to store the names of your favorite books.
Add at least three book names to the collection.
Write a loop to iterate through the collection and print each book name.
*/

DECLARE
   TYPE book_list IS TABLE OF VARCHAR2(100) INDEX BY PLS_INTEGER;
   my_books book_list;
BEGIN
   -- Add book names to the collection
   my_books(1) := 'The Great Gatsby';
   my_books(2) := 'To Kill a Mockingbird';
   my_books(3) := '1984';

   -- Write a loop to iterate through the collection and print each book name
   FOR i IN 1..my_books.COUNT LOOP
      DBMS_OUTPUT.PUT_LINE('Book ' || i || ': ' || my_books(i));
   END LOOP;
END;