select person.name, count(person_visits.person_id) as count_of_visits
from person
join person_visits on person.id = person_visits.person_id
group by person.name
having count(person_visits.person_id) > 3;