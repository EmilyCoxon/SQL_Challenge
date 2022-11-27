# 1. List emp_no, last_name, first_name, sex, salary for each employee	
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees e
left join salaries s
on e.emp_no = s.emp_no;

# 2. list first_name last_name, hire_date for employees hired in 1986
SELECT first_name, last_name, hire_date
from employees
WHERE hire_date BETWEEN '1986-01-01' and '1986-12-31';

# 3. list manager of each department along with dept_no, dept_name, emp_no, last_name, first_name
SELECT m.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
from dept_manager m
left join employees e
on m.emp_no = e.emp_no
left join department d 
on m.dept_no = d.dept_no;

# 4. list dept_no for each employee with emp_no, last_name, first_name, dept_name
select i.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
from dept_emp i
left join employees e
on i.emp_no = e.emp_no
left join department d
on d.dept_no = i.dept_no;

# 5. list first_name, last_name, sex for each employee with 
#     first name hercules and last name begins with B
select first_name, last_name, sex
from employees
where first_name = 'Hercules' and last_name like 'B%';

# 6. list each employee in the sales dept with emp_no, last_name, first_name
select d.emp_no, e.last_name, e.first_name, i.dept_name
from employees e
left join dept_emp d
on d.emp_no = e.emp_no
where dept_no = 'd007';

# 7. list each employee in Sales and Development depts include: emp_no, last_name, 
#   first_name, dept_name
select d.emp_no, e.last_name, e.first_name, i.dept_name
from employees e
left join dept_emp d
on d.emp_no = e.emp_no
left join department i
on d.dept_no = i.dept_no
where dept_name = 'Sales' or dept_name = 'Development';

# 8. list the frequency of each name in descending order of all the employee last names
select last_name, count(last_name) as frequency
from employees
group by last_name
order by 
count (last_name) desc;