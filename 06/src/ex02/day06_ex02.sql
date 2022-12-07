SELECT person.name, menu.pizza_name, menu.price,  menu.price * (100 - person_discounts.discount) / 100 AS discount_price, pizzeria.name AS pizzeria_name
FROM person JOIN person_order ON person.id = person_order.person_id
            JOIN menu ON person_order.menu_id = menu.id
            JOIN person_discounts ON person_order.person_id = person_discounts.person_id AND menu.pizzeria_id = person_discounts.pizzeria_id
            JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
ORDER BY name, pizza_name;