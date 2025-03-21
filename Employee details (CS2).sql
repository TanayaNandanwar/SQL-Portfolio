create table Locations (
location_id int not null primary key,
city varchar(50));

insert into locations values 
(122, 'New York'),
(123,'Dallas'),
(124, 'Chicago'),
(167,'Boston');

Create table Department 
(Department_id int primary key,
Name varchar(50),
Location_id int);

Alter table Department 
add FOREIGN KEY (Location_id) REFERENCES Locations(Location_id);

insert into Department values 
(10, 'Accounting',122),
(20, 'Sales', 124),
(30, 'Research', 123),
(40, 'Operations', 167);

create table job 
(job_id int primary key,
designation varchar(50));

insert into job values 
(667, 'clerk'),
(668, 'staff'),
(669, 'analyst'),
(670, 'sales person'),
(671, 'manager'),
(672, 'president');

create table employee (
employee_id int,
last_name varchar(50),
first_name varchar(50),
middle_name varchar(50),
job_id int,
hire_date varchar(50),
salary int,
Comm varchar(30),
department_id int);

alter table employee 
add FOREIGN KEY(job_id) REFERENCES JOB(job_id);

Alter table employee
add FOREIGN KEY (DEPARTMENT_ID) REFERENCES DEPARTMENT(DEPARTMENT_ID);

INSERT INTO EMPLOYEE (employee_id,last_name,first_name,middle_name,Job_id,Hire_date,Salary,Department_id) VALUES 
(7369,'Smith','John','Q',667, '17-dec-84',800,20);

INSERT INTO EMPLOYEE (employee_id,last_name,first_name,middle_name,Job_id,Hire_date,Salary,comm,Department_id) VALUES 
(7499,'Allen','Kevin','J',670, '20-feb-85',1600,300,30);


INSERT INTO EMPLOYEE (employee_id,last_name,first_name,middle_name,Job_id,Hire_date,Salary,Department_id) VALUES 
(755,'Doyle','Jean','K',671, '04-apr-85',2850,30),
(756,'Dennis','Lynn','S',671, '15-may-85',2750,30),
(757,'Baker','Lesile','D',671, '10-june-85',2200,40);

INSERT INTO EMPLOYEE (employee_id,last_name,first_name,middle_name,Job_id,Hire_date,Salary,comm,Department_id) VALUES
(7521,'Wark','Cynthia','D',670, '22-feb-85',1250,50,30);

select * from employee;

----------simple queries--------------
1. List all the employee details.

select * from employee;

2. List all the department details.

select * from department;

3. List all job details

select * from job;

4. List all the locations.

select * from locations;

5. List out the First Name, Last Name, Salary, Commission for all Employees

select first_name,last_name,salary,comm from employee;

6. List out the Employee ID, Last Name, Department ID for all employees and
alias
Employee ID as "ID of the Employee", Last Name as "Name of the Employee", Department ID as "Dep_id".

select employee_id as 'Id of the employee', last_name as 'name of the employee',department_id as 'dep_id' from employee;

7. List out the annual salary of the employees with their names only.

select concat(first_name,' ',last_name) as names , salary as annual_salary from employee;

-----------where condition----------------

1. List the details about "Smith"

select * from employee 
where last_name = 'smith';

2. List out the employees who are working in department 20

select * from employee
where department_id = 20;

3. List out the employees who are earning salary between 2000 and 3000.

select * from employee 
where salary between 2000 and 3000;       

4. List out the employees who are working in department 10 or 20.

select * from employee 
where department_id in (10,20);

5. Find out the employees who are not working in department 10 or 30

select * from employee 
where department_id not in (10,20);

6. List out the employees whose name starts with 'L'.

select * from employee 
where first_name like 'L%';

7. List out the employees whose name starts with 'L' and ends with 'E'.

select * from employee 
where first_name like 'L%' and first_name like '%e';

8. List out the employees whose name length is 4 and start with 'J'

select * from employee 
where len(first_name)=4 and first_name like 'J%';

9. List out the employees who are working in department 30 and draw the salaries more than 2500.

select * from employee 
where department_id = 30 and salary > 2500;

10. List out the employees who are not receiving commission.

select * from employee 
where comm is null;

---------order by clause-----------------

1. List out the Employee ID and Last Name in ascending order based on the Employee ID.

select employee_id, last_name from employee
order by employee_id;

2. List out the Employee ID and Name in descending order based on salary

select employee_id,concat(first_name,' ',last_name) as name, salary from employee
order by salary desc;

3. List out the employee details according to their Last Name in ascending-order.

select * from employee
order by last_name;

4. List out the employee details according to their Last Name in ascending order and then Department ID in descending order.

select * from employee
order by last_name asc,department_id desc;

---------group by and having clause------------

1. List out the department wise maximum salary, minimum salary and average salary of the employees

select max(salary) as maximum_salary, min(salary) as minimum_salary, avg(salary) as average_salary, department_id from employee
group by department_id;

2. List out the job wise maximum salary, minimum salary and average salary of the employees.

select max(salary) as maximum_salary, min(salary) as minimum_salary, avg(salary) as average_salary, job_id from employee
group by job_id;

3. List out the number of employees who joined each month in ascending order.

select count(*) as counts , month(hire_date) as joined_month from employee
group by month(hire_date) 
order by joined_month; 

4. List out the number of employees for each month and year in ascending order based on the year and month.

select count(*) as counts, month(hire_date) as months , year(hire_date) as years from employee
group by month(hire_date),year(hire_date)
order by years,months;

5. List out the Department ID having at least four employees.

select * from employee;

select department_id, count(*) as id_count from employee
group by department_id
having count(*)>=4;

6. How many employees joined in February month.

select count(*) as counts_of_employee, month(hire_date) as months from employee
group by month(hire_date)
having month(hire_date)=2;

7. How many employees joined in May or June month.

select count(*)as emp_count, month(hire_date) as months from employee
group by month(hire_date)
having month(hire_date) in (5,6);

8. How many employees joined in 1985?  

select count(*) as emp_count, year(hire_date) as years from employee
group by year(hire_date)
having year(hire_date) = 1985;

9. How many employees joined each month in 1985?

select count(*) as emp_count, year(hire_date) as years, month(hire_date) as months from employee
group by month(hire_date), year(hire_date)
having year(hire_date) = 1985;

10. How many employees were joined in April 1985?

select count(*) as emp_count, month(hire_date) as joined_month, year(hire_date) as joined_year from employee 
group by month(hire_date), year(hire_date)
having month(hire_date) = 4;

11. Which is the Department ID having greater than or equal to 3 employees joining in April 1985?

select department_id, count(*) as emp_count, month(hire_date) as hired_month, year(hire_date) as hired_year
from employee
where month(hire_date) = 4 and year(hire_date) = 1985
group by department_id,month(hire_date),year(hire_date)
having count(*)>=3;

----------joins----------------

1. List out employees with their department names

select d.name,concat(e.first_name, ' ', e.last_name) as emp_name from employee e
join department d 
on e.department_id=d.department_id;

select d.name,e.*  from employee e
join department d 
on e.department_id=d.department_id;

2. Display employees with their designations.

select e.*, j.designation from employee e 
join job j
on e.job_id = j.job_id;

3. Display the employees with their department names and city

select e.*,d.name,l.city from employee e
join department d
on e.department_id=d.department_id
join locations l 
on d.location_id=l.location_id;

select * from employee;
select * from locations;
select * from department;

4. How many employees are working in different departments? Display with department names.

select count(*) as emp_count, d.name from employee e
join department d
on e.department_id=d.department_id
group by d.name;

5. How many employees are working in the sales department?

select count(*) as emp_count , d.name from employee e
join department d
on e.department_id=d.department_id
group by d.name
having d.name = 'sales';

select * from employee;
select * from department;

6. Which is the department having greater than or equal to 3 employees and display the department names in ascending order.

select d.name, count(*) as emp_count from employee e
join department d 
on e.department_id = d.department_id 
group by d.name 
having count(*)>=3
order by d.name;

7. How many employees are working in 'Dallas'?

select count(*) as emp_count from employee e
join department d
on e.department_id = d.department_id
join locations l 
on d.location_id=l.location_id
where l.city='dallas';

8. Display all employees in sales or operation departments.

select e.*, d.name from employee e 
join department d 
on e.department_id=d.department_id 
where d.name in ('sales','operations');

------------conditional statement-----------------

1. Display the employee details with salary grades. Use conditional statement to create a grade column.


select *,
case 
when salary >=2500 then 'A'
when salary >=1500 then 'B'
else 'C'
end as grade
from employee;

2. List out the number of employees grade wise. Use conditional statement to create a grade column.

SELECT Salary, COUNT(*) AS Employee_Count
FROM (
    SELECT e.*, 
           CASE
             WHEN Salary >= 5000 THEN 'A'
             WHEN Salary >= 3000 AND Salary < 5000 THEN 'B'
             ELSE 'C'
           END AS Salary_Grade
    FROM employee e
) AS SalaryGrades
GROUP BY Salary;


3. Display the employee salary grades and the number of employees between 2000 to 5000 range of salary.

SELECT Salary, COUNT(*) AS Employee_Count
FROM (
    SELECT e.*, 
           CASE
             WHEN Salary >= 5000 THEN 'A'
             WHEN Salary >= 3000 AND Salary < 5000 THEN 'B'
             ELSE 'C'
           END AS Salary_Grade
    FROM employee e
    WHERE Salary BETWEEN 2000 AND 5000
) AS SalaryGrades
GROUP BY Salary;


--------------Subqueries----------------------

1. Display the employees list who got the maximum salary.

select * from employee where salary= (select max(salary) from employee);

2. Display the employees who are working in the sales department.

select * from employee where department_id =
(select department_id from department where name ='sales');

3. Display the employees who are working as 'Clerk'.

select * from employee where job_id =
(select job_id from job where designation = 'clerk');

4. Display the list of employees who are living in 'Boston'

select * from employee where department_id =
(select department_id from department where location_id =
(select location_id from locations where city = 'Boston'));

5. Find out the number of employees working in the sales department

select count(*) as emp_sales from employee where department_id =
(select department_id from department where name = 'sales');

6. Update the salaries of employees who are working as clerks on the basis of 10%.

update employee
set salary = salary * 1.1 
where job_id = (select job_id from job where designation = 'clerk');

7. Display the second highest salary drawing employee details

select * from employee where salary =
(select max(salary) from employee where salary < 
(select max(salary) from employee));

8. List out the employees who earn more than every employee in department 30.

select * from employee where salary =
(select max(salary) from employee where department_id = 30);

9. Find out which department has no employees.

select name from department where department_id not in 
(select distinct department_id from employee);

10. Find out the employees who earn greater than the average salary for their department.

select * from employee e where salary >
(select avg(salary) from employee where department_id = e.department_id);






















