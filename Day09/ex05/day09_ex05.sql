drop function fnc_persons_female;
drop function fnc_persons_male;

--drop function fnc_persons cascade ;

create or replace function fnc_persons(pgender varchar = 'female') returns table (id bigint, name varchar,
age integer, gender varchar, address varchar) as $table2$
    select * from person where gender = pgender;
$table2$ language sql;

select *
from fnc_persons(pgender := 'male');

select *
from fnc_persons();