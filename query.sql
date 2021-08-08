select department,first_name,salary,
case when salary=max_salary then'HIGEST' 
when salary=min_salary then 'lowest' end as total
from(
SELECT department ,first_name,salary,
(select max(salary) from employees e1 where e1.department=e2.department) as max_salary,
(select min(salary) from employees e3 where e3.department=e2.department) as min_salary
 FROM employees e2 order by department) a
where salary=max_salary or salary=min_salary;