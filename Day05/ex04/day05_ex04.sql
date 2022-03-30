create unique index idx_menu_unique on menu (pizzeria_id, pizza_name);

--drop index idx_menu_unique;

set enable_seqscan = off;
EXPLAIN ANALYZE
SELECT pizzeria_id, pizza_name
FROM menu;