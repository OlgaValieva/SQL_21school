CREATE OR REPLACE FUNCTION fnc_trg_person_delete_audit()
    RETURNS TRIGGER AS $$
    BEGIN
        INSERT INTO person_audit(created, type_event ,row_id, name, age, gender, address)
        SELECT now(), 'D' , OLD.*;
        RETURN NULL;
    END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER trg_person_delete_audit AFTER DELETE ON person
    FOR EACH ROW
    EXECUTE FUNCTION fnc_trg_person_delete_audit();

DELETE FROM person WHERE id = 10;

select * from person_audit order by created;