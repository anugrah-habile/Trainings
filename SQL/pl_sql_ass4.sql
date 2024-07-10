SET SERVEROUTPUT ON;
SET VERIFY ON;
SET MODIFY OFF;

DECLARE
TYPE nested_table is Table of Integer
Index by ;
nested_table nested_table_type;

BEGIN
nested_table(1) := 10;
nested_table(2) := 20;
nested_table(3) := 30;

dbms_output.put_line('Elements :')
for i in 1..nested_table.count loop
dbms.output_put.line(i || ':' || nested_table(i));
end loop;

END;


SET SERVEROUTPUT ON;
SET VERIFY ON;
SET MODIFY OFF;
DECLARE
Type student_table is Tbale of Integer
index by Varchar(60);
student_table  student_table_type;

BEGIN
student_table('student1') := 50;
student_table('student2') := 60;
student_table('student3') := 70;
student_table('student4') := 80;
student_table('student5') := 90;

dbms_output.put_line('Scores :')
for i in 


END;
