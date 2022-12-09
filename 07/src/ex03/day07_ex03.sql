SELECT name, SUM(total_count) AS total_count
    FROM ((SELECT pizzeria.name, COUNT(*) AS total_count FROM person_visits
        JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
        GROUP BY name)
    UNION ALL
        (SELECT pizzeria.name, COUNT(*) AS total_count FROM person_order
        JOIN menu ON menu.id = person_order.menu_id
        JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
        GROUP BY name)) AS all_statistics
GROUP BY name
ORDER BY total_count DESC, name ASC;