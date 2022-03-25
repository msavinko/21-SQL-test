WITH cheese AS (SELECT person.name FROM person
    JOIN person_order ON person_order.person_id = person.id
    JOIN menu ON menu.id = person_order.menu_id
    WHERE person.gender = 'female' AND menu.pizza_name = 'cheese pizza'),

pepperoni AS (SELECT person.name FROM person
    JOIN person_order ON person_order.person_id = person.id
    JOIN menu ON menu.id = person_order.menu_id
    WHERE person.gender = 'female' AND menu.pizza_name = 'pepperoni pizza')

SELECT cheese.name
FROM cheese
JOIN pepperoni ON cheese.name = pepperoni.name
ORDER BY 1;