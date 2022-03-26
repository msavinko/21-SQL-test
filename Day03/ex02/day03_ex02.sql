WITH t1 AS (SELECT menu.id AS menu_id FROM menu
EXCEPT
SELECT menu_id FROM person_order)

SELECT menu.pizza_name, menu.price, pizzeria.name
FROM menu
JOIN t1 on t1.menu_id = menu.id
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
ORDER BY 1, 2;