CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date
    (pperson varchar default 'Dmitriy', pprice int default  500, pdate date default '2022-01-08')
    RETURNS TABLE (name varchar) AS $$
        BEGIN
            RETURN QUERY
            SELECT DISTINCT pizzeria.name:: varchar from person_visits
                INNER JOIN person on person_id = person.id
                INNER JOIN pizzeria on pizzeria_id = pizzeria.id
                INNER JOIN menu m on pizzeria.id = m.pizzeria_id
                WHERE person.name = pperson AND price < pprice AND visit_date = pdate;
        END;
$$ LANGUAGE plpgsql;

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');
