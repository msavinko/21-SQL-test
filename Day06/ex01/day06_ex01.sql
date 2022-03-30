create view amount as (with t1 as (select person_id, pizzeria_id
from person_order join menu on menu.id = person_order.menu_id order by 1)

select person_id, pizzeria_id, count(*) as amount_of_orders
from t1 group by person_id, pizzeria_id order by 1);

insert into person_discounts(id, person_id, pizzeria_id, discount)
select row_number() over(order by 1) as id, person_id, pizzeria_id,
    case
        when amount_of_orders = 1 then 10.5
        when amount_of_orders = 2 then 22
        else 30
    end as discount
from amount;



