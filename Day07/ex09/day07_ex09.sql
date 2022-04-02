select person.address,
    round(max(age::numeric) - (min(age::numeric)/max(age::numeric)), 2) as formula,
    round(avg(age::numeric), 2) as average,
    round(max(age::numeric) - min(age::numeric)/max(age::numeric), 2) > round(avg(age::numeric), 2) as comparison
from person
group by person.address
order by address;
