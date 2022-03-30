select person.name, menu.pizza_name, menu.price,
       menu.price - ((menu.price * person_discounts.discount)/100) as discount_price
from person_order
join person on person_order.person_id = person.id
join menu on menu.id = person_order.menu_id
join person_discounts on person_discounts.person_id = person.id and person_discounts.pizzeria_id = menu.pizzeria_id
order by 1, 2;
