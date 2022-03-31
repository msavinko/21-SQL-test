(select pizzeria.name, count(person_order.person_id) as count, 'order' as action_type
from pizzeria
join menu on menu.pizzeria_id = pizzeria.id
join person_order on person_order.menu_id = menu.id
group by pizzeria.name order by count desc limit 3)

union all

(select pizzeria.name, count(person_visits.person_id) as count, 'visit' as action_type
from pizzeria
join person_visits on pizzeria.id = person_visits.pizzeria_id
group by pizzeria.name order by count desc limit 3)

order by action_type asc, count desc;

