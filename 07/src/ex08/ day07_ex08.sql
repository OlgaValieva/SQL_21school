SELECT person.address, pizzeria.name, COUNT(*) AS count_of_orders  FROM person_order
    JOIN person ON person.id =person_order.person_id
    JOIN menu on person_order.menu_id = menu.id
    JOIN pizzeria on pizzeria.id = menu.pizzeria_id
GROUP BY person.address, pizzeria.name
ORDER BY person.address, pizzeria.name;