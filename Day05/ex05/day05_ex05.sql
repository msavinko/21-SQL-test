create unique index idx_person_order_order_date on person_order (id, person_id, menu_id) where order_date = '2022-01-01';

--drop index idx_person_order_order_date;

set enable_seqscan = off;
EXPLAIN ANALYZE
SELECT person_id, menu_id
FROM person_order where order_date = '2022-01-01';