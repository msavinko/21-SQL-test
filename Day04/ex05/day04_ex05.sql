create view v_price_with_discount as
    (
         select person.name, menu.pizza_name,
                menu.price, menu.price * 0.9 as discount_price
        from person
        join person_order on person_order.person_id = person.id
        join menu on menu.id = person_order.menu_id
        order by name, pizza_name
    );