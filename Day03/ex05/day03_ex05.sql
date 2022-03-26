WITH visited AS (SELECT DISTINCT pizzeria.name
    FROM pizzeria
    JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
    JOIN person ON person.id = person_visits.person_id
        WHERE person.name = 'Andrey'),

     ordered AS (SELECT DISTINCT pizzeria.name, person.gender
    FROM pizzeria
    JOIN menu ON menu.pizzeria_id = pizzeria.id
    JOIN person_order ON person_order.menu_id = menu.id
    JOIN person ON person.id = person_order.person_id
         WHERE person.name = 'Andrey')

SELECT visited.name AS pizzeria_name FROM visited
WHERE visited.name NOT IN (SELECT ordered.name FROM ordered)
ORDER BY 1;