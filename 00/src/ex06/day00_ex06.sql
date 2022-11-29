-- SELECT
--     (SELECT name FROM person WHERE id = person_order.person_id) AS NAME,
--         CASE
--             WHEN (SELECT name FROM person WHERE id = person_order.person_id) = 'Denis' THEN 'true'
--             ELSE 'false'
--         END AS CHECK_NAME
-- FROM person_order
-- WHERE (menu_id = '13' or menu_id = '14' or menu_id = '18') and order_date = '2022-01-07';

SELECT
    (SELECT name FROM person WHERE id = person_order.person_id) AS NAME,
        (SELECT name = 'Denis'
            FROM person
                WHERE id = person_order.person_id) AS check_name
FROM person_order
WHERE (menu_id = '13' or menu_id = '14' or menu_id = '18') and order_date = '2022-01-07';