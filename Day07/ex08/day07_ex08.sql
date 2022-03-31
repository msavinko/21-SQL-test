select person.address, pizzeria.name, count(person_order.person_id) as count_of_orders
from person
join person_order on person.id = person_order.person_id
join menu on menu.id = person_order.menu_id
join pizzeria on pizzeria.id = menu.pizzeria_id
group by person.address, pizzeria.name
order by address, name;