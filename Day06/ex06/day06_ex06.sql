create sequence seq_person_discounts minvalue 1 increment by 1;
select setval('seq_person_discounts', (select max(id) from person_discounts));

alter table person_discounts
    alter column id set default nextval('seq_person_discounts');

--insert into person_discounts (person_id, pizzeria_id, discount) values (9,4, 10.5);
--delete from person_discounts where id = 14;