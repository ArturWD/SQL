CREATE TABLE AUDIT_EMP
(
  USER_NAME      VARCHAR2(4000 BYTE),
  TIME_STAMP     DATE, /*(с точностью до секунды)*/
  OLD_LAST_NAME  VARCHAR2(25 BYTE),
  NEW_LAST_NAME  VARCHAR2(25 BYTE),
  OLD_JOB_ID     VARCHAR2(10 BYTE),
  NEW_JOB_ID     VARCHAR2(10 BYTE),
  OLD_SALARY     NUMBER(8,2),
  NEW_SALARY     NUMBER(8,2),
  EMPLOYEE_ID    NUMBER(6),
  operation      varchar2(1000)
);
--FIRST
create or replace trigger no_id_100 
before insert or update of manager_id
on departments
for each row
when (new.manager_id = 100)
begin
    raise_application_error(-20600, 'Manager cannot have id 100');
end no_id_100;

--TESTS
insert into departments
    values(1000, 'Boston', 100, 2);
    
update departments
set manager_id = 100
where department_id < 200;

--SECOND
create or replace trigger log_emp
before update or delete or insert
on employees
for each row
declare
    change_type varchar2(30);

begin
    if updating then
        change_type := 'update';
    elsif deleting then
        change_type := 'delete';
    else
        change_type := 'insert';
    end if;
    insert into AUDIT_EMP
        values(user, current_date, :old.last_name, :new.last_name, :old.job_id, :new.job_id,:old.salary, :new.salary, :old.employee_id, change_type );
end log_emp;

--TESTS
insert into employees(employee_id, last_name, email, hire_date, job_id)
    values(10000, 'Ivan', 'gjhgj@gmail.com', current_date, 'AD_VP');
    
update employees
set job_id = 'AD_VP'
where job_id = 'AD_VP';

delete employees
where employee_id = 10000;

--THIRD TASK
create or replace trigger immutable_audit
before update or delete or insert
on AUDIT_EMP
begin
    raise_application_error(-20601, 'You cannot change data in audit_emp table');
end immutable_audit;

--TESTS
delete audit_emp;

insert into audit_emp(new_salary)
values (5);

update audit_emp
set new_salary = 5;


-- DO NOT ALLOW DISABLING THIS TRIGGER
create or replace trigger audit_emp_trg
before ddl on database
begin
    if(ora_dict_obj_name = 'IMMUTABLE_AUDIT' and ora_sysevent = 'ALTER') then
        raise_application_error(-20090, 'IMMUTABLE_AUDIT trigger cannot be disabled');
    end if;
    dbms_output.put_line('ora_dict_obj_name  :'||ora_dict_obj_name||'  ora_sysevent:  '||ora_sysevent);
end audit_emp_trh;

alter trigger immutable_audit enable;


