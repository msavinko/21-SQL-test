SELECT DISTINCT person.name
FROM person
    JOIN person_visits ON person_visits.person_id = person.id
    JOIN menu ON menu.pizzeria_id = person_visits.pizzeria_id
WHERE gender = 'male' AND (address = 'Moscow' OR address = 'Samara')
AND (menu.pizza_name = 'pepperoni pizza' OR menu.pizza_name = 'mushroom pizza')
ORDER BY 1 DESC;