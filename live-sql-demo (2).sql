Aggregations Functions.

1.Count the number of employees in each department

Select department_id, count(*) As total_employees
from hr.employees
group by department_id;

2. Find the average salary in each department

Select department_id, avg(salary) as avg_salary
from hr.employees
group by department_id;

3. Find the maximum and minimum salary in each department

Select department_id, max(salary) as max_salary, min(salary) as min_salary
from hr.employees
group by department_id;

4. Find the total salary paid in each department

Select department_id, sum(salary) as Total_salary
from hr.employees
group by department_id

5. Count the number of employees in each job role

Select job_id, count(*) as total_employees
from hr.employees
group by job_id;

6. Find the average salary for each job role

Select job_id, avg(salary) as avg_salary
from hr.total_employees
group by job_id;

7. Find the maximum salary for each job role

Select job_id, max(salary) as max_salary
from hr.employees
group by job_id;

8. Find the minimum salary for each job role

Select job_id, Min(salary) as min_salary
from hr.employees
group by job_id;

9. Find the total salary paid for each job role

Select job_id, sum(salary) as total_salary
from hr.total_employees
group by job-id;

10. Count the number of employees hired in each year

Select Extract( year from hire_date) as hire_year, count(*) as total_employyes
from hr.employees
group by Extract(year from hire_date)
order by hire_year;

11. Find the total salary paid in each location

Select d.location_id, sum(e.salary) as total_salary
from hr.employees e
Join departments d ON e.department_id=d.department_id
group by d.location-id;

12. Find the number of employees in each manager team

Select manager_id, count(*) as team_size
from hr.employees
where manager_id is Not Null
group by manager_id;

13. Find the highest slary for each manager

Select manager_id, max(salary) as max_salary
from hr.employees
where manager_id is Not Null
group by manager_id;

14. Find the average salary for each manager team

Select manager_id, avg(salary) as avg_salary
from hr.employees
where manager_id is Not Null
group by manager_id;

15.  Count the number of employees hired in each month of the year

Select Extract(month from hire_date) as hire_month, count(*) as total_hired
from hr.employees
group by extract(month from hire_date)
order by hire_month;

16. Find the department with the highest total salary

Select department_id, sum(salary) as total_salary
from hr.employees
group by department_id
order by total_salary DESC;

17.Find the job role with the highest average salary

Select job_id, avg(salary) as avg_salary
from hr.employees
group by job_id
order by avg_salary DESC;

18. Find the number of employees in each city

Select l.city,count(*) as total_employees
from hr.employees e
Join departments d ON e.department_id= d.department_id
Join locations l ON d.location_id= l.location_id
group by l.city;

19. Find the number of employees who have a commission, group by department.

Select department_id, count(*), as employees_with_commission
from employees
where commission_pct is Not Null
group by department_id;

20. Find the sum of salaries for employees who have a commission, grouped by department.

Select department_id, sum(salary) as total_salary_with_commission
from hr. employees
where commission_pct is Not Null
group by department_id; 

Select * from SH.Products;
Select * from SH.costs;

## Oracle SQL Aggregation Questions for Sales History table

1. Count the number of Sales transactions for each product.

Select prod_id, count(*) as total_sales
from sh.Products
group by prod_id;

2. Find the average sale amount for each product.

Select prod_id, avg(sale) as avg_sale
from sh.Products
group by prod_id;

3. Find the maximum and minimum sale amount for each product.

Select pro_id, max(sale) as max_sale, min(sale) as min_sale
from sh.products
group by prod_id;

4. Find the total revenue generated by each product.

Select prod_id,




 
Analytical Functions.

1. Find the total number of employees in department.

Select department_id, count(*) as total_employees
from employees
group by department_id;


2. Calculate the average salary in each department.

select department_id, avg(salary), as avg(salary)
from employees
group by department_id;

3. Find the department with the highest total salary

Select department_id, sum(salary) as total_salary
from employees
group by department_id
order by total_salary desc;

4.Determine the highest and lowest slaries for each job role

Select job_id, max(salary) as max_salary, min(salary) as min_salary
from employees
group by job_id;

5. Find the number of employees hired in each year.

Select Extract(year from hire_date) as hire_year, count(*) from employees
Group by Extract(year from hire_date)
Order by hire_year;

6. Assign a rank to employees based on their salary within each department

Select department_id, emp_id, salary
RANK() over( partition by department_id order by salary desc) as salary_rank
from employees;


7. Find the top 3 highest_paid employees in each department

Select department_id, employee_id, salary
from(
     Select department_id, employee_id, salary, rank() over(partition by department_id order by salary desc) as salary_rank)
from employees
) where salary<=3;


8. Identify the second highest salary in each department using dense() rank.

Select department_id, employee_id, salary
from( Select department_id, employee-id, salary, 
dense_rank() over (partition by department_id order by salary desc) as salary_rank
from employees
) where salary_rank=2;


9. Compute the cumulative total salary of employees order by hire hire_date

Select employee_id, hire_date, salary,
sum(salary) over (order by hire_date) as cumulative_salary
from employees;

10. Assign a row number to each employee in each department

Select department_id, employee_id,
row_number() over (partition by department_id order by employee_id) as row_number
from employees;

11. Find the salary difference between each employee and the next highest paid employee.

SELECT employee_id, salary, 
LEAD(salary) OVER (ORDER BY salary DESC) - salary AS salary_diff
FROM employees;

12. Calculate the previous month salary for each employee using LAG().

SELECT employee_id, salary, hire_date, 
LAG(salary) OVER (PARTITION BY employee_id ORDER BY hire_date) AS prev_salary
FROM employees;

13. Identify employees whose salaries increased over time.

SELECT employee_id, hire_date, salary, 
       LAG(salary) OVER (PARTITION BY employee_id ORDER BY hire_date) AS prev_salary,
       CASE WHEN salary > LAG(salary) OVER (PARTITION BY employee_id ORDER BY hire_date) 
            THEN 'Increased' ELSE 'Decreased' END AS salary_trend
FROM employees;

14. Find the average salary of employees who joined in each year.

SELECT EXTRACT(YEAR FROM hire_date) AS hire_year, AVG(salary) AS avg_salary
FROM employees
GROUP BY EXTRACT(YEAR FROM hire_date)
ORDER BY hire_year;

15. Count the number of employees in each job role.

SELECT job_id, COUNT(*) AS total_employees
FROM employees
GROUP BY job_id;

16. Find the total salary expenditure for each managers team.

SELECT manager_id, SUM(salary) AS total_team_salary
FROM employees
GROUP BY manager_id;

17. Find the highest-paid employee in each department.

SELECT department_id, employee_id, salary
FROM (
    SELECT department_id, employee_id, salary,
 RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS salary_rank
    FROM employees
) WHERE salary_rank = 1;

18. Calculate the running total of salaries for employees hired in each department.

SELECT department_id, employee_id, salary, 
SUM(salary) OVER (PARTITION BY department_id ORDER BY hire_date) AS running_total
FROM employees;

19. Find the employees who earn above the average salary of their department.

SELECT employee_id, department_id, salary
FROM employees e
WHERE salary > (SELECT AVG(salary) FROM employees WHERE department_id = e.department_id);

20. Rank employees within their department based on experience.

SELECT employee_id, department_id, hire_date, 
RANK() OVER (PARTITION BY department_id ORDER BY hire_date ASC) AS experience_rank
FROM employees;

21. Find the difference between each employee’s salary and the department average.

SELECT employee_id, department_id, salary, 
salary - AVG(salary) OVER (PARTITION BY department_id) AS salary_diff
FROM employees;

22. Find the department where the most employees have been hired.

SELECT department_id, COUNT(*) AS total_hired
FROM employees
GROUP BY department_id
ORDER BY total_hired DESC
FETCH FIRST 1 ROW ONLY;

23. Identify employees who were hired in the same month and year as someone else.

SELECT employee_id, hire_date, 
COUNT(*) OVER (PARTITION BY EXTRACT(MONTH FROM hire_date), EXTRACT(YEAR FROM hire_date)) AS same_month_hires
FROM employees;

24. Calculate the moving average salary over the last 3 employees ordered by hire date.

SELECT employee_id, hire_date, salary, 
AVG(salary) OVER (ORDER BY hire_date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS moving_avg_salary
FROM employees;

25. Find employees whose salary is greater than that of the average of their manager’s team.

SELECT e.employee_id, e.manager_id, e.salary
FROM employees e
WHERE e.salary > (SELECT AVG(salary) FROM employees WHERE manager_id = e.manager_id);



Different types of Joins.

1. Retrieve employee names and their department names using Inner Join

Select e.employee_id, e.employee_name, d.department_name
from employees e
Inner Join departments d ON e.department_id= d.department-id;

2. Retrieve all employees and their respective department names (including those without department) Left Join

Select e.employee_id, e.employee_name, d.department_name
from employees e
Left Join departments d On e.department_id= d.department_id;

3.Retreive all departments and employees( including departments without employees) using Right Join

Select e.employee_id, e.employee_name, d. department_name
from employees e
Right Join departments d ON e.department_id= d.department_id;

4. Retrieve all employees and their department names using using Full Outer Join

Select e.employee_id,e.employee_name, d.department_name
from employees.e
Full Outer Join departments

5. Retrieve employees who do not belong to any department using Left Join with Null check

SELECT e.employee_id, e.employee_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id
WHERE d.department_id IS NULL;

6. Retrieve departments that have no employees using RIGHT JOIN with NULL check

SELECT d.department_id, d.department_name
FROM employees e
RIGHT JOIN departments d ON e.department_id = d.department_id
WHERE e.employee_id IS NULL;

7. Retrieve employees along with their manager names using SELF JOIN

SELECT e.employee_id, e.employee_name, m.employee_name AS manager_name
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.employee_id;

8. Retrieve employees along with their job title using INNER JOIN

SELECT e.employee_id, e.employee_name, j.job_title
FROM employees e
INNER JOIN jobs j ON e.job_id = j.job_id;

9. Retrieve employees along with the location of their department using INNER JOIN

SELECT e.employee_id, e.employee_name, d.department_name, l.city
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id
INNER JOIN locations l ON d.location_id = l.location_id;

10. Retrieve employees and the projects they are assigned to using INNER JOIN

SELECT e.employee_id, e.employee_name, p.project_name
FROM employees e
INNER JOIN projects p ON e.employee_id = p.employee_id;

11. Retrieve employees who have not been assigned to any project using LEFT JOIN

SELECT e.employee_id, e.employee_name
FROM employees e
LEFT JOIN projects p ON e.employee_id = p.employee_id
WHERE p.project_id IS NULL;

12. Retrieve project names along with the department handling them using INNER JOIN

SELECT p.project_name, d.department_name
FROM projects p
INNER JOIN departments d ON p.department_id = d.department_id;

13. Retrieve employees along with the names of their training programs using INNER JOIN

SELECT e.employee_id, e.employee_name, t.training_name
FROM employees e
INNER JOIN training_programs t ON e.training_id = t.training_id;

14. Retrieve employees who have not attended any training programs using LEFT JOIN

SELECT e.employee_id, e.employee_name
FROM employees e
LEFT JOIN training_programs t ON e.training_id = t.training_id
WHERE t.training_id IS NULL;

15. Retrieve employee names and their assigned shifts using INNER JOIN

SELECT e.employee_id, e.employee_name, s.shift_timing
FROM employees e
INNER JOIN shifts s ON e.shift_id = s.shift_id;

16. Retrieve employees who do not have an assigned shift using LEFT JOIN

SELECT e.employee_id, e.employee_name
FROM employees e
LEFT JOIN shifts s ON e.shift_id = s.shift_id
WHERE s.shift_id IS NULL;

17. Retrieve employees, their department names, and their assigned project names using multiple INNER JOINs

SELECT e.employee_id, e.employee_name, d.department_name, p.project_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id
INNER JOIN projects p ON e.employee_id = p.employee_id;

18. Retrieve employees who have worked on more than one project using INNER JOIN and GROUP BY

SELECT e.employee_id, e.employee_name, COUNT(p.project_id) AS project_count
FROM employees e
INNER JOIN projects p ON e.employee_id = p.employee_id
GROUP BY e.employee_id, e.employee_name
HAVING COUNT(p.project_id) > 1;

19. Retrieve employees along with their salaries and their department budget using INNER JOIN

SELECT e.employee_id, e.employee_name, e.salary, d.budget
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id;

20. Retrieve employees who earn more than their department’s average salary using INNER JOIN and a subquery

SELECT e.employee_id, e.employee_name, e.salary
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id
WHERE e.salary > (SELECT AVG(salary) FROM employees WHERE department_id = e.department_id);

21. Retrieve employees who have the same job role as another employee using SELF JOIN

SELECT e1.employee_id, e1.employee_name, e2.employee_name AS coworker_name, e1.job_id
FROM employees e1
INNER JOIN employees e2 ON e1.job_id = e2.job_id AND e1.employee_id <> e2.employee_id;

22. Retrieve employees and their department names, but show "Not Assigned" if an employee has no department using LEFT JOIN and COALESCE

SELECT e.employee_id, e.employee_name, COALESCE(d.department_name, 'Not Assigned') AS department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id;

23. Retrieve employees and their assigned projects, including employees who are not assigned to any project using FULL OUTER JOIN

SELECT e.employee_id, e.employee_name, p.project_name
FROM employees e
FULL OUTER JOIN projects p ON e.employee_id = p.employee_id;

24. Retrieve employees who work in a city where their department is located using INNER JOIN

SELECT e.employee_id, e.employee_name, l.city
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id
INNER JOIN locations l ON d.location_id = l.location_id;

25. Retrieve employees and their total bonus amount using INNER JOIN with a bonus table

SELECT e.employee_id, e.employee_name, SUM(b.bonus_amount) AS total_bonus
FROM employees e
INNER JOIN bonuses b ON e.employee_id = b.employee_id
GROUP BY e.employee_id, e.employee_name;

26. Retrieve employees who do not have any recorded bonuses using LEFT JOIN

SELECT e.employee_id, e.employee_name
FROM employees e
LEFT JOIN bonuses b ON e.employee_id = b.employee_id
WHERE b.bonus_amount IS NULL;

27. Retrieve employees and their department names where employees belong to a specific region using INNER JOIN

SELECT e.employee_id, e.employee_name, d.department_name, r.region_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id
INNER JOIN locations l ON d.location_id = l.location_id
INNER JOIN regions r ON l.region_id = r.region_id;

28. Retrieve employees and their project details, even if they are not assigned to a project using LEFT JOIN

SELECT e.employee_id, e.employee_name, p.project_name
FROM employees e
LEFT JOIN projects p ON e.employee_id = p.employee_id;

29. Retrieve departments and the count of employees in each department using INNER JOIN and GROUP BY

SELECT d.department_id, d.department_name, COUNT(e.employee_id) AS employee_count
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;

30. Retrieve employees who work on projects located in a different city than their department using INNER JOIN

SELECT e.employee_id, e.employee_name, d.department_name, p.project_name, l.city AS project_city
FROM employees e
INNER JOIN projects p ON e.employee_id = p.employee_id
INNER JOIN departments d ON e.department_id = d.department_id
INNER JOIN locations l ON p.location_id = l.location_id
WHERE d.location_id <> p.location_id;