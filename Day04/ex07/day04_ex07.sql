insert into person_visits values (

    (select max(id) from person_visits) + 1,
    (select id from person where name = 'Dmitriy'),
    (select pizzeria_id from menu where price < 800 and menu.pizzeria_id not in
            (select id from mv_dmitriy_visits_and_eats
            join pizzeria on pizzeria.name = mv_dmitriy_visits_and_eats.pizzeria_name)
        limit 1),
    '2022-01-08');

refresh materialized view mv_dmitriy_visits_and_eats;

--delete from person_visits where id = xx;
-- (select max(id) from person_order);