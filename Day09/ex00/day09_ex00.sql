create table person_audit
(created timestamp with time zone not null default now(), type_event char(1) not null default 'I',
row_id bigint, name varchar, age integer, gender varchar, address varchar,
constraint ch_type_event check (type_event in ('I', 'U', 'D' )));

CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit() RETURNS TRIGGER AS $trg_person_insert_audit$
    BEGIN
        INSERT INTO person_audit SELECT now(), 'I' ,NEW.*;
        RETURN NEW;
    END;
$trg_person_insert_audit$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_insert_audit AFTER INSERT ON person
    FOR EACH ROW EXECUTE PROCEDURE fnc_trg_person_insert_audit();

--drop table person_audit;
insert into person values (10, 'Damir', 22, 'male', 'Irkutsk');
--delete from person where name = 'Damir';