WITH anna_pizza AS (SELECT menu.pizza_name AS pizza_name,
           pizzeria.name AS pizzeria_name
        FROM menu
        JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
        JOIN person_order ON person_order.menu_id = menu.id
        JOIN person ON person.id = person_order.person_id
        WHERE person.name = 'Anna'),

    denis_pizza AS (SELECT menu.pizza_name AS pizza_name,
           pizzeria.name AS pizzeria_name
        FROM menu
        JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
        JOIN person_order ON person_order.menu_id = menu.id
        JOIN person ON person.id = person_order.person_id
        WHERE person.name = 'Denis')

SELECT anna_pizza.pizza_name, anna_pizza.pizzeria_name
FROM anna_pizza WHERE anna_pizza.pizza_name IN (SELECT denis_pizza.pizza_name FROM denis_pizza)

UNION

SELECT denis_pizza.pizza_name, denis_pizza.pizzeria_name
FROM denis_pizza WHERE denis_pizza.pizza_name IN (SELECT anna_pizza.pizza_name FROM anna_pizza)

ORDER BY 1, 2;
