create unique index idx_person_discounts_unique on
    person_discounts (person_id, pizzeria_id) ;

--drop index idx_person_discounts_unique;
set enable_seqscan = off;
EXPLAIN ANALYZE
select person_id, pizzeria_id, discount
from person_discounts where person_id < 5;