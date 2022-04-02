create or replace function fnc_persons_female() returns table (id bigint, name varchar,
age integer, gender varchar, address varchar) as $table$
    select * from person where gender = 'female';
$table$ language sql;

select * from fnc_persons_female();

create or replace function fnc_persons_male() returns table (id bigint, name varchar,
age integer, gender varchar, address varchar) as $table$
    select * from person where gender = 'male';
$table$ language sql;

select * from fnc_persons_male();
--drop function fnc_persons_male;
--fnc_persons_male