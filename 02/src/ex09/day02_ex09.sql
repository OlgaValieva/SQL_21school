SELECT person.name
    FROM person_order
        JOIN person
            ON person.id = person_order.person_id
        JOIN menu
            ON menu.id = person_order.menu_id
WHERE gender = 'female' AND menu.pizza_name = 'pepperoni pizza'
AND person_order.person_id 	IN (SELECT person_order.person_id
	FROM person_order
		JOIN person
			ON person.id = person_order.person_id
		JOIN menu
			ON menu.id = person_order.menu_id
WHERE gender = 'female' AND menu.pizza_name = 'cheese pizza')
ORDER BY name;