(SELECT pizzeria.name, COUNT(*) AS count, 'visit' AS action_type FROM person_visits
    JOIN pizzeria on person_visits.pizzeria_id = pizzeria.id
    GROUP BY pizzeria.name ORDER BY count DESC
    LIMIT 3)
UNION
(SELECT pizzeria.name, COUNT(*) AS count, 'order' AS action_type FROM person_order
    JOIN menu on menu.id = person_order.menu_id
    JOIN pizzeria on pizzeria.id = menu.pizzeria_id
    GROUP BY pizzeria.name ORDER BY count DESC
    LIMIT 3)
ORDER BY action_type, count DESC;