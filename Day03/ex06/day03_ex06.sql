with unique1 as (select pizza_name, name as pizzeria_name, pizzeria_id, price
            from menu join pizzeria
    on pizzeria.id = menu.pizzeria_id)

select u1.pizza_name, u1.pizzeria_name as pizzeria_name_1,
       u2.pizzeria_name as pizzeria_name_2, u1.price
from unique1 u1
join unique1 u2 on u1.pizzeria_id > u2.pizzeria_id
    and u1.price = u2.price and u1.pizza_name = u2.pizza_name
order by 1;

