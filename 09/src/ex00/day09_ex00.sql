CREATE TABLE person_audit
(
	created timestamp with time zone not null default now(),
 	type_event char(1) not null default 'I',
 	row_id bigint not null,
 	name varchar,
 	age integer,
 	gender varchar,
	address varchar,
	constraint ch_type_event CHECK(type_event = 'I' OR type_event = 'U' OR type_event = 'D')
);

CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit()
    RETURNS TRIGGER AS $$
    BEGIN
        INSERT INTO person_audit(created, type_event, row_id, name, age, gender, address)
        SELECT now(), 'I', NEW.*;
        RETURN NEW;
    END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_insert_audit
    AFTER INSERT ON person
    FOR EACH ROW
    EXECUTE FUNCTION fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');

-- select * from person_audit