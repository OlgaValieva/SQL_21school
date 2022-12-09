--Session#1
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;

--Session#2
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;

--Session#1
select SUM(rating) FROM pizzeria;

--Session#2
UPDATE pizzeria SET rating = 1 WHERE name = 'Pizza Hut';
COMMIT;

--Session#1
select SUM(rating) FROM pizzeria;
COMMIT;
select SUM(rating) FROM pizzeria;

--Session#2
select SUM(rating) FROM pizzeria;