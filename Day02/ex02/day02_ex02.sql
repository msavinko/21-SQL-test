SELECT COALESCE(person.name, '-') AS person_name,
       visits1.visit_date, COALESCE(pizzeria.name, '-') AS pizzeria_name
FROM person

FULL JOIN( SELECT * FROM person_visits
    WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03') AS visits1
ON person.id = visits1.person_id

FULL JOIN pizzeria
ON pizzeria.id = visits1.pizzeria_id

ORDER BY 1, 2, 3;

