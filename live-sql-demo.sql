select * from hr.employees;
select employee_id emp from hr.employees;
select EMPLOYEE_ID,FIRST_NAME,salary from
hr.employees where salary>10000;
select count(*) from hr.EMPLOYEES;
select * from hr.employees;
select 'data' from DUAL

## arithmatic operators##
select 10+10 as addition,
10-10 as substraction,
 10*10 as multiplication,
10/10 as division from dual;


##comparision operators##
select * from hr.employees where salary>10000;
select * from hr.employees where salary<10000;
select * from hr.employees where salary>=10000;
select * from hr.employees where salary<=10000;
select * from hr.employees where salary<>10000;
select * from hr.employees where salary=10000;


### logical operators ## ( and or not)

select * from hr.employees where salary>15000 and department_id=90;
select * from hr.employees where salary>15000 or department_id=90;
select * from hr.employees where not department_id=90 
select * from hr.employees

## concatenation##

select first_name || ' '|| last_name full name from hr.employees ( not getting)

## is, like, between operators##

select * from hr.employees where salary between 10000 and 
30000
select 10 between 5 and 15 as output from dual(true and false are boolean operators)


select * from hr.employees where department_id in(90,100,110)

select * from hr.employees where first_name like 'S%'
select * from hr.employees where first_name like '%n'
select * from hr.employees where first_name like '%am%'
select * from hr.employees where first_name like '__e__'







select * from dual
select first_name from hr.employees;
## string functions##

select upper('data'),lower('data'),
length('data'),initcap('data enginnering'),
ltrim('  data'), rtrim(' data')
from dual;

select lpad('1234',5,0) from dual
select rpad('1234',6,1) from dual
select trim('    data') from dual
select replace ('data science','science','engineering') from dual

select