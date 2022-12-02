WITH t3 (id1, person_name1, address1, id2, person_name2, address2) AS (
    SELECT * FROM
        (SELECT id, name, address FROM person) AS t1
        FULL JOIN
            (SELECT id, name, address FROM person) AS t2
                ON t1.address = t2.address WHERE t1.name != t2.name)
SELECT person_name1, person_name2, address1 AS common_address FROM t3 WHERE id1 > id2
ORDER BY person_name1, person_name2;

-- SELECT person.name AS person_name1, st.name AS person_name2, person.address AS common_address
-- FROM person
-- JOIN (SELECT name, address, id
-- 	  FROM person) AS st ON person.address = st.address
-- WHERE (person.name != st.name) AND (person.id > st.id)
-- ORDER BY 1, 2, 3;









