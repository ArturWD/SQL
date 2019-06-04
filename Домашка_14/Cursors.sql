create table films(
    film_id integer not null,
    film_name varchar2(50) not null,
    film_rating integer not null
)

insert into films
    values(1, 'Movie', 10);
insert into films
    values(2, 'Matrix', 0);
insert into films
    values(3, 'Boss', 1);
insert into films
    values(4, 'Kid', 3);
insert into films
    values(5, 'Karate', 5);
insert into films
    values(6, 'Kid Boss', 9);
insert into films
    values(7, 'Movie 2', 4);
insert into films
    values(8, 'Fast', 8);
insert into films
    values(9, 'NFS', 9);
insert into films
    values(10, 'Play', 10);
    
   
--FIRST
set serveroutput on;
declare
    cursor movies is select film_rating from films where rownum <10;
    rating_total integer := 0;
    rating integer;
begin
    open movies;
    loop
        fetch movies into rating;
        exit when movies%notfound;
        rating_total := rating_total + rating;
    end loop;
    dbms_output.put_line(rating_total/movies%rowcount);
    close movies;
end;

--SECOND
begin
    for r in (select * from films) loop
        dbms_output.put_line(r.film_name||'  '||r.film_rating);
    end loop;
end;


--THIRD
declare
    cursor movies(rating integer) is select * from films where film_rating = rating;
begin
    dbms_output.put_line('Rating 7');
    for r in movies(7) loop
        dbms_output.put_line(r.film_name||'  '||r.film_rating);
    end loop;
    dbms_output.put_line('Rating 9');
    for r in movies(9) loop
        dbms_output.put_line(r.film_name||'  '||r.film_rating);
    end loop;
end;
