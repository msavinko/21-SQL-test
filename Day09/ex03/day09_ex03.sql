drop trigger if exists trg_person_insert_audit on person_audit;
drop trigger if exists trg_person_update_audit on person_audit;
drop trigger if exists trg_person_delete_audit on person_audit;

drop function if exists fnc_trg_person_insert_audit cascade ;
drop function if exists fnc_trg_person_update_audit cascade ;
drop function if exists fnc_trg_person_delete_audit cascade ;

DELETE FROM person_audit where type_event in ('D', 'I', 'U');

CREATE OR REPLACE FUNCTION fnc_trg_person_audit() RETURNS TRIGGER AS $trg_person_audit$
    BEGIN
        IF (TG_OP = 'INSERT') THEN
            INSERT INTO person_audit SELECT now(), 'I', NEW.*;
        ELSIF (TG_OP = 'UPDATE') THEN
            INSERT INTO person_audit SELECT now(), 'U', OLD.*;
        ELSIF (TG_OP = 'DELETE') THEN
            INSERT INTO person_audit SELECT now(), 'D', OLD.*;
        END IF;
        RETURN NEW;
    END;
$trg_person_audit$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_audit AFTER INSERT OR UPDATE OR DELETE ON person
    FOR EACH ROW EXECUTE PROCEDURE fnc_trg_person_audit();

INSERT INTO person(id, name, age, gender, address)
VALUES (10,'Damir', 22, 'male', 'Irkutsk');
UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;
DELETE FROM person WHERE id = 10;