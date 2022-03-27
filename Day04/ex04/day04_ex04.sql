create view v_symmetric_union as

(with r as (select * from person_visits where visit_date = '2022-01-02'),
     s as (select * from person_visits where visit_date = '2022-01-06')


(select * from r where person_id not in (select person_id from s))
union all
(select * from s where person_id not in (select person_id from r))
order by person_id);
