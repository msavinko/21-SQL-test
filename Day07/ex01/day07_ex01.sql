select person.name, count_of_visits
    from person
        join (select person_id, count(*) as count_of_visits
from person_visits
group by person_id) as t1 on person.id = t1.person_id
order by 2 desc
limit 5;