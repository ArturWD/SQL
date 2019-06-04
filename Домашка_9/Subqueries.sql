create table holidays(
    holiday date
);

create table sales(
    item_name varchar2(50),
    sell_date date,
    total_price integer,
    salesman_name varchar2(30),
    salesman_surname varchar2(30)
);

insert into holidays
    values(to_date('01.05.2015','DD.MM.YYYY'));
insert into holidays
    values(to_date('09.05.2015','DD.MM.YYYY'));
insert into holidays
    values(to_date('16.05.2015','DD.MM.YYYY'));
insert into holidays
    values(to_date('23.05.2015','DD.MM.YYYY'));
insert into holidays
    values(to_date('27.05.2015','DD.MM.YYYY'));

insert into sales
    values('toy', to_date('23.05.2015','DD.MM.YYYY'), 15, 'Ivan' ,'Ivanov' );
insert into sales
    values('ship', to_date('09.05.2015','DD.MM.YYYY'), 45, 'John' ,'Simens' );
insert into sales
    values('ship', to_date('09.05.2015','DD.MM.YYYY'), 30, 'Ann' ,'Lorret' );
insert into sales
    values('knife', to_date('16.05.2015','DD.MM.YYYY'), 25, 'Ivan' ,'Ivanov' );
insert into sales
    values('knife', to_date('12.05.2015','DD.MM.YYYY'), 34, 'Bob' ,'Simens' );
insert into sales
    values('gun', to_date('23.05.2015','DD.MM.YYYY'), 65, 'Ann' ,'Ivanov' );
insert into sales
    values('gun', to_date('09.05.2015','DD.MM.YYYY'), 10, 'John' ,'Lorret' );
insert into sales
    values('toy', to_date('16.05.2015','DD.MM.YYYY'), 15, 'Ivan' ,'Ivanov' );
insert into sales
    values('plate', to_date('13.05.2015','DD.MM.YYYY'), 73, 'Bob' ,'Ivanov' );
insert into sales
    values('plate', to_date('09.05.2015','DD.MM.YYYY'), 24, 'Ivan' ,'Ivanov' );
insert into sales
    values('plate', to_date('23.05.2015','DD.MM.YYYY'), 38, 'Bob' ,'Simens' );
insert into sales
    values('robot', to_date('11.05.2015','DD.MM.YYYY'), 94, 'Bob' ,'Simens' );
insert into sales
    values('robot', to_date('27.05.2015','DD.MM.YYYY'), 63, 'Ann' ,'Lorret' );
insert into sales
    values('robot', to_date('09.05.2015','DD.MM.YYYY'), 11, 'Ann' ,'Simens' );
insert into sales
    values('book', to_date('16.05.2015','DD.MM.YYYY'), 3, 'Ivan' ,'Ivanov' );
insert into sales
    values('book', to_date('07.05.2015','DD.MM.YYYY'), 12, 'Ann' ,'Simens' );
insert into sales
    values('tablet', to_date('09.05.2015','DD.MM.YYYY'), 19, 'Bob' ,'Ivanov' );
insert into sales
    values('tablet', to_date('23.05.2015','DD.MM.YYYY'), 18, 'Ivan' ,'Lorret' );
insert into sales
    values('toy', to_date('27.05.2015','DD.MM.YYYY'), 35, 'John' ,'Lorret' );
insert into sales
    values('toy', to_date('09.05.2015','DD.MM.YYYY'), 27, 'Ann' ,'Simens' );
insert into sales
    values('toy', to_date('23.05.2015','DD.MM.YYYY'), 36, 'Bob' ,'Ivanov' );




--TASK 1
select *
from sales
where sell_date in (select holiday from holidays);

--TASK 2
select salesman_surname,salesman_name , sum(total_price)
from sales
where trunc(sell_date, 'MM') = trunc(to_date( '24.05.2015', 'DD.MM.YYYY') , 'MM')
group by salesman_surname, salesman_name
having sum(total_price) > (select sum(total_price)
                            from sales
                            where salesman_name = 'Ivan'
                            and salesman_surname = 'Ivanov');
                            
--TASK 3
select to_char( trunc(sell_date, 'DD'), 'DD') day , min(total_price) min_price
from sales
where total_price > (select min(total_price) 
                    from sales 
                    where salesman_name = 'Ivan' 
                    and salesman_surname = 'Ivanov')
group by trunc(sell_date, 'DD')
order by day;


drop table holidays;
drop table sales;