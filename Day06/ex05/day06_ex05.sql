comment on table person_discounts is 'This is a table with person discount for each pizzeria';
comment on column person_discounts.id is 'this is the primary key of the table';
comment on column person_discounts.person_id is 'this is the person id';
comment on column person_discounts.pizzeria_id is 'this is the pizzeria id';
comment on column person_discounts.discount is 'this is the discount for every person in every pizzeria, where he ordered';

--\d+ person_discounts
