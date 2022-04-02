create or replace function fnc_person_visits_and_eats_on_date(pperson varchar = 'Dmitriy', pprice numeric = 500,
pdate date = '2022-01-01')
returns table (pizzeria varchar) as $table3$
begin
    RETURN QUERY
    select DISTINCT pizzeria.name from person
    join person_visits on person.id = person_visits.person_id
    join pizzeria on pizzeria.id = person_visits.person_id
    join menu on menu.pizzeria_id = pizzeria.id
    where price < pprice AND visit_date = pdate AND person.name = pperson;
end;
$table3$ language plpgsql;

--drop function fnc_person_visits_and_eats_on_date;

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');