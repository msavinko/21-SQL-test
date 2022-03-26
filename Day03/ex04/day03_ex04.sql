WITH visiter1 AS (SELECT DISTINCT pizzeria.name, person.gender
    FROM pizzeria
    JOIN menu ON menu.pizzeria_id = pizzeria.id
    JOIN person_order ON person_order.menu_id = menu.id
    JOIN person ON person.id = person_order.person_id)

(SELECT visiter1.name AS pizzeria_name FROM visiter1 WHERE visiter1.gender = 'male'
EXCEPT SELECT visiter1.name FROM visiter1 WHERE visiter1.gender = 'female')
UNION
(SELECT visiter1.name AS pizzeria_name FROM visiter1 WHERE visiter1.gender = 'female'
EXCEPT SELECT visiter1.name FROM visiter1 WHERE visiter1.gender = 'male')
ORDER BY 1;