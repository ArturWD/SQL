--1 A
select first_name ||' '||last_name name, phone_number, job_id job, department_id department
from employees
where hire_date >= add_months(current_date, -12*15)
    and department_id not in(80, 30, 10)
    and job_id != 'IT_PROG';
    
--1 B
select first_name ||' '||last_name name, phone_number, job_id job, department_id department
from employees
where (hire_date >= add_months(current_date, -12*15)
    and department_id in(80, 30, 10) )
    or job_id = 'IT_PROG';
    
--2 MAIN QUERY
select first_name ||' '||last_name ||'ÇÏ- $'||salary "SALARY RATING" 
from employees
order by salary desc;

--2 BONUS 1 QUERY
select first_name ||' '||last_name ||'ÇÏ- $'||salary "SALARY RATING" 
from employees
where rownum<=10
order by salary desc;

--2 BONUS 2 QUERY
select first_name ||' '||last_name ||'ÇÏ- $'||salary "SALARY RATING" 
from employees
where employee_id not in (select employee_id from employees where manager_id is null)
order by salary desc;

--2 BONUS 3 QUERY
select first_name ||' '||last_name ||'ÇÏ- $'||salary  ||'  Äàòà íàéìà '||to_char(hire_date, 'MONTH YYYY')  "SALARY RATING"
from employees
order by salary desc;


--3 
select last_name, job_id, commission_pct
from employees
where job_id in('ST_CLERK','SA_MAN')
    and commission_pct != 0.2;