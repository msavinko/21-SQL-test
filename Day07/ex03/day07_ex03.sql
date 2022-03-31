select pizzeria.name, sum (order1.count + visit1.count) as total_count
from pizzeria
full join (
    select pizzeria.name, count(person_order.person_id) as count
    from pizzeria
    full join menu on menu.pizzeria_id = pizzeria.id
    full join person_order on person_order.menu_id = menu.id
    group by pizzeria.name ) as order1 on pizzeria.name = order1.name
full join (
    select pizzeria.name, count(person_visits.person_id) as count
    from pizzeria
    full join person_visits on pizzeria.id = person_visits.pizzeria_id
    group by pizzeria.name ) as visit1 on order1.name = visit1.name
group by pizzeria.name
order by total_count desc;