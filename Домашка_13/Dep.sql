--SECOND TASK
set serveroutput on;
create table dep_table(
    dep_field varchar2(50)
);

create or replace view dep_view
as select dep_field from dep_table;

--add column
alter table dep_table add (dep_fi integer);

--modify column in view
alter table dep_table modify (dep_field integer);

--make view valid again
--just rerun create view command

--modify nonview column
alter table dep_table modify (dep_fi varchar2(100));




select object_name, status
from user_objects
where object_name = 'DEP_VIEW';

drop view dep_view;
drop table dep_table;

--THIRD TASK
execute deptree_fill('TABLE', 'SYSTEM','EMPLOYEES');
select *
from deptree;