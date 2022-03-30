create index idx_person_order_multi on person_order (person_id desc, menu_id desc)
    INCLUDE (order_date) WHERE person_id = 8 AND menu_id = 19;

--drop index idx_person_order_multi;

set enable_seqscan = off;
EXPLAIN ANALYZE
SELECT person_id, menu_id, order_date
FROM person_order
WHERE person_id = 8 AND menu_id = 19;