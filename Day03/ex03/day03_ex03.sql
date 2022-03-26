WITH visiter AS (SELECT pizzeria.name, person.gender
    FROM pizzeria
    JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
    JOIN person ON person.id = person_visits.person_id)

(SELECT name AS pizzeria_name FROM visiter WHERE gender = 'female'
EXCEPT ALL SELECT name FROM visiter WHERE gender = 'male')
UNION ALL
(SELECT name AS pizzeria_name FROM visiter WHERE gender = 'male'
EXCEPT ALL SELECT name FROM visiter WHERE gender = 'female')
ORDER BY 1;