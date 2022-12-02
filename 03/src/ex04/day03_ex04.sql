WITH
male (pizzeria_name) AS
(
	SELECT pizzeria.name AS pizzeria_name
	FROM person
	JOIN person_order
	ON person_order.person_id = person.id
	JOIN menu
	ON person_order.menu_id = menu.id
	JOIN pizzeria
	ON menu.pizzeria_id = pizzeria.id
	WHERE person.gender = 'male'
),
female (pizzeria_name) AS
(
	SELECT pizzeria.name AS pizzeria_name
	FROM person
	JOIN person_order
	ON person_order.person_id = person.id
	JOIN menu
	ON person_order.menu_id = menu.id
	JOIN pizzeria
	ON menu.pizzeria_id = pizzeria.id
	WHERE person.gender = 'female'
)
SELECT pizzeria_name FROM
((SELECT pizzeria_name FROM male EXCEPT (SELECT pizzeria_name FROM female))
UNION
(SELECT pizzeria_name FROM female EXCEPT (SELECT pizzeria_name FROM male)))
AS le
ORDER BY pizzeria_name;
