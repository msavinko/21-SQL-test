insert into person_visits values (
    (select max(id) from person_visits) + 1,
    (select id from person where name = 'Denis'),
    (select id from pizzeria where name = 'Dominos'),
    '2022-02-24'
    );

insert into person_visits values (
    (select max(id) from person_visits) + 1,
    (select id from person where name = 'Irina'),
    (select id from pizzeria where name = 'Dominos'),
    '2022-02-24'
    );

--delete from person_visits where id = xx;
