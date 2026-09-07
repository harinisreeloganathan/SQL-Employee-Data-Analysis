create database  employee;
use employee;
/*
3.	Write a query to fetch EMP_ID, FIRST_NAME, LAST_NAME, 
GENDER, and DEPARTMENT from the employee record table, 
and make a list of employees and details of their department. 

*/
select emp_id, first_name, last_name, gender,dept 
from emp_record_table;

/*
4.	Write a query to fetch EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPARTMENT, and EMP_RATING if the EMP_RATING is: 
●	less than two
●	greater than four 
●	between two and four


*/
select emp_id, first_name, last_name, gender,dept ,EMP_RATING
from emp_record_table
where emp_rating <2;

select emp_id, first_name, last_name, gender,dept ,EMP_RATING
from emp_record_table
where emp_rating >4;

select emp_id, first_name, last_name, gender,dept ,EMP_RATING
from emp_record_table
where emp_rating between 2 and 4;

/*

5.	Write a query to concatenate the FIRST_NAME and the LAST_NAME
 of employees in the Finance department from the employee table 
 and then give the resultant column alias as NAME.
*/
select first_name,last_name, concat(first_name,' ',last_name) as full_name
from emp_record_table
where dept = 'finance';

/*6.	Write a query to list
 only those employees who have someone reporting to them. 
 Also, show the number of reporters (including the President).
 */
 
 select * from emp_record_table;

select manager_id, count(emp_id) as employee_id
from emp_record_table
group by manager_id;

/*
7.	Write a query to list down all
 the employees from the healthcare and finance departments 
 using union. Take data from the employee record table.

*/
select * from emp_record_table
where dept = 'healthcare'
union
select * from emp_record_table
where dept = 'finance';

/*8.	Write a query to list down employee details such as 
EMP_ID, FIRST_NAME, LAST_NAME, ROLE, DEPARTMENT, and EMP_RATING grouped by dept.
 Also include the respective employee rating along with the 
 max emp rating for the department*/
 
 select emp_id,first_name,last_name,role,dept, emp_rating,
 max(emp_rating) over(partition by dept) as max_emp_rating
 from emp_record_table;

/*
9.	Write a query to calculate
 the minimum and the maximum salary of the employees
 in each role. Take data from the employee record table
 */
 select role,max(salary)as Maximum_salary,min(salary) as Minimum_salary
 from emp_record_table
 group by role;
 
 /*
10.	Write a query to assign ranks to each employee 
based on their experience. Take data from the employee record table.
*/
select * ,rank() over(order by exp desc) as Rnk
 from emp_record_table;
 
 /*
11.	Write a query to create a view that displays 
employees in various countries whose salary is more than six thousand. 
Take data from the employee record table.*/

create view employee._country as (
select * from emp_record_table
where salary >6000);

select * from employee_country;

/*

12.	Write a nested query to find employees with experience 
of more than ten years. Take data from the employee record table.*/

select * from emp_record_table
where emp_id in  (select emp_id from emp_record_table
where exp > 10);

/*
13.	Write a query to create a stored procedure to retrieve the details 
of the employees whose experience is more than three years. 
Take data from the employee record table.*/


/*14.	Write a query using stored functions in the project table to check whether the job profile assigned to each employee in the data science team matches the organization’s set standard.

The standard being:
For an employee with experience less than or equal to 2 years assign 'JUNIOR DATA SCIENTIST',
For an employee with the experience of 2 to 5 years assign 'ASSOCIATE DATA SCIENTIST',
For an employee with the experience of 5 to 10 years assign 'SENIOR DATA SCIENTIST',
For an employee with the experience of 10 to 12 years assign 'LEAD DATA SCIENTIST',
For an employee with the experience of 12 to 16 years assign 'MANAGER'.*/

select * from data_science_team;

/* 
15.	Create an index to improve the cost and performance
 of the query to find the employee whose FIRST_NAME is ‘Eric’ 
 in the employee table after checking the execution plan.
*/
alter table emp_record_table
modify  first_name varchar (50);
create index index_f_name 
on emp_record_table (first_name);
show indexes from emp_record_table;

/*
16.	Write a query to calculate the bonus for all the employees,
 based on their ratings and salaries
 (Use the formula: 5% of salary * employee rating).*/
 
 select EMP_ID,salary, (salary * 5/100) * emp_rating as bonus
 from emp_record_table;
 
 /*17.	Write a query to calculate the average salary distribution
 based on the continent and country. 
 Take data from the employee record table.*/
 
select avg (salary) as avg_salary ,continent ,country 
from emp_record_table
group by CONTINENT,country ;