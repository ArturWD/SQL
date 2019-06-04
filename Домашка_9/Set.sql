create table clients(
    client_id integer primary key,
    client_name varchar2(50) not null
);
create table phones(
    client_id integer not null,
    phone_number integer not null,
    active_from date not null,
    active_to date,
    constraint phones_fk foreign key (client_id) references clients(client_id)
);

create table mobiles(
    client_id integer not null,
    mobile_number integer not null,
    active_from date not null,
    active_to date,
    constraint mobiles_fk foreign key (client_id) references clients(client_id)
);

create table emails(
    client_id integer not null,
    email varchar2(50) not null,
    constraint emails_fk foreign key (client_id) references clients(client_id)
);


insert into clients
    values(1, 'Ivan');
insert into clients
    values(2, 'Artur');
insert into clients
    values(3, 'Boris');
insert into clients
    values(4, 'Egor');
insert into clients
    values(5, 'Pavel');
insert into clients
    values(6, 'Fedor');
insert into clients
    values(7, 'Ann');
insert into clients
    values(8, 'Liza');
insert into clients
    values(9, 'Elena');
insert into clients
    values(10, 'Anjelica');
insert into clients
    values(11, 'Oleg');
insert into clients
    values(12, 'Stepan');
insert into clients
    values(13, 'Artym');
    
insert into mobiles
    values(1, 123456789, to_date('25.04.2018', 'DD.MM.YYYY'), to_date('25.04.2019', 'DD.MM.YYYY'));
insert into mobiles
    values(2, 123456789, to_date('25.06.2018', 'DD.MM.YYYY'), null);
insert into mobiles
    values(3, 123456789, to_date('25.09.2018', 'DD.MM.YYYY'), to_date('25.04.2019', 'DD.MM.YYYY'));
insert into mobiles
    values(4, 123456789, to_date('25.04.2018', 'DD.MM.YYYY'), to_date('25.04.2019', 'DD.MM.YYYY'));
insert into mobiles
    values(5, 123456789, to_date('25.07.2018', 'DD.MM.YYYY'), to_date('25.04.2019', 'DD.MM.YYYY'));
insert into mobiles
    values(6, 123456789, to_date('25.04.2018', 'DD.MM.YYYY'), null);
insert into mobiles
    values(7, 123456789, to_date('22.02.2018', 'DD.MM.YYYY'), to_date('25.04.2019', 'DD.MM.YYYY'));
insert into mobiles
    values(8, 123456789, to_date('05.11.2018', 'DD.MM.YYYY'), to_date('25.04.2019', 'DD.MM.YYYY'));
insert into mobiles
    values(9, 123456789, to_date('15.04.2018', 'DD.MM.YYYY'), null);
insert into mobiles
    values(10, 123456789, to_date('29.08.2018', 'DD.MM.YYYY'), to_date('25.04.2019', 'DD.MM.YYYY'));
insert into mobiles
    values(12, 222222229, to_date('15.04.2018', 'DD.MM.YYYY'), null);
insert into mobiles
    values(13, 999999999, to_date('29.08.2018', 'DD.MM.YYYY'), null);
insert into mobiles
    values(1, 222222229, to_date('15.04.2018', 'DD.MM.YYYY'), null);
insert into mobiles
    values(2, 999999999, to_date('29.08.2018', 'DD.MM.YYYY'), null);
    
    
insert into phones
    values(1, 1234, to_date('25.04.2018', 'DD.MM.YYYY'), to_date('25.04.2019', 'DD.MM.YYYY'));
insert into phones
    values(2, 6789, to_date('25.06.2018', 'DD.MM.YYYY'), null);
insert into phones
    values(3, 6789, to_date('25.09.2018', 'DD.MM.YYYY'), to_date('25.04.2019', 'DD.MM.YYYY'));
insert into phones
    values(4, 6789, to_date('25.04.2018', 'DD.MM.YYYY'), to_date('25.04.2019', 'DD.MM.YYYY'));
insert into phones
    values(5, 3456, to_date('25.07.2018', 'DD.MM.YYYY'), to_date('25.04.2019', 'DD.MM.YYYY'));
insert into phones
    values(6, 4567, to_date('25.04.2018', 'DD.MM.YYYY'), null);
insert into phones
    values(7, 6789, to_date('22.02.2018', 'DD.MM.YYYY'), to_date('25.04.2019', 'DD.MM.YYYY'));
insert into phones
    values(8, 6789, to_date('05.11.2018', 'DD.MM.YYYY'), to_date('25.04.2019', 'DD.MM.YYYY'));
insert into phones
    values(9, 2345, to_date('15.04.2018', 'DD.MM.YYYY'), null);
insert into phones
    values(10, 4567, to_date('29.08.2018', 'DD.MM.YYYY'), to_date('25.04.2019', 'DD.MM.YYYY'));
insert into phones
    values(11, 4567, to_date('29.08.2018', 'DD.MM.YYYY'), to_date('25.04.2019', 'DD.MM.YYYY'));
insert into phones
    values(9, 2229, to_date('15.04.2018', 'DD.MM.YYYY'), null);
insert into phones
    values(5, 9999, to_date('29.08.2018', 'DD.MM.YYYY'), null);
insert into phones
    values(12, 2229, to_date('15.04.2018', 'DD.MM.YYYY'), null);
insert into phones
    values(13, 9999, to_date('29.08.2018', 'DD.MM.YYYY'), null);


insert into emails
    values(1, 'Ivan@gmail.com');
insert into emails
    values(2, 'Artur@gmail.com');
insert into emails
    values(3, 'Boris@gmail.com');
insert into emails
    values(4, 'Egor@gmail.com');
insert into emails
    values(5, 'Pavel@gmail.com');
insert into emails
    values(6, 'Fedor@gmail.com');
insert into emails
    values(7, 'Ann@gmail.com');
insert into emails
    values(8, 'Liza@gmail.com');
insert into emails
    values(9, 'Elena@gmail.com');
insert into emails
    values(10, 'Anjelica@gmail.com');
    
--TASK 1
select client_name, 'Phone', to_char(phone_number), active_from, active_to
from clients inner join phones
    on clients.client_id = phones.client_id
union all
select client_name, 'Mobile', to_char(mobile_number), active_from, active_to
from clients inner join mobiles
    on clients.client_id = mobiles.client_id
union all
select client_name, 'Email', email, to_date(null), to_date(null)
from clients inner join emails
    on clients.client_id = emails.client_id
order by client_name, 2;

--TASK 2
select client_name
from clients inner join phones
    on clients.client_id = phones.client_id
minus
select client_name
from clients inner join mobiles
    on clients.client_id = mobiles.client_id
minus
select client_name
from clients inner join emails
    on clients.client_id = emails.client_id
order by client_name;


--TASK 3
select client_name
from clients inner join phones
    on clients.client_id = phones.client_id
intersect
select client_name
from clients inner join mobiles
    on clients.client_id = mobiles.client_id
minus
select client_name
from clients inner join emails
    on clients.client_id = emails.client_id
order by client_name desc;

 
drop table phones;
drop table mobiles;
drop table emails;
drop table clients;
