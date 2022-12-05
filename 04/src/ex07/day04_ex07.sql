INSERT INTO person_visits VALUES (
	(SELECT max(id) + 1 FROM person_visits),
	(SELECT person.id FROM person WHERE name = 'Dmitriy'),
	(SELECT pizzeria.id FROM pizzeria
	 JOIN menu ON pizzeria.id = menu.pizzeria_id
	 WHERE name = 'DoDo Pizza' AND menu.price < 800),'2022-01-08');
REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;