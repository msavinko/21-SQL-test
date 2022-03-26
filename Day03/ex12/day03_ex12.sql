insert into person_order
select


-- insert into person_order values (
--     (select max(id) from person_order) + 1,
--     (select id from person where name = 'Denis'),
--     (select id from menu where pizza_name = 'sicilian pizza'),
--     '2022-02-24'
--     );