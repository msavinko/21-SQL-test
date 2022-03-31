select pizzeria.name,
       count(pizzeria_id) as count_of_orders,
       round(avg(price), 2) as average_price,
       max(price) as max_price,
       min(price) as min_price
from pizzeria
join menu on menu.pizzeria_id = pizzeria.id
join person_order on person_order.menu_id = menu.id
group by pizzeria.name
order by name;