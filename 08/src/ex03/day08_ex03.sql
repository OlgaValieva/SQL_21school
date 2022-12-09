--Session#1
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;

--Session#2
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;

--Session#1
select * from pizzeria where name  = 'Pizza Hut';

--Session#2
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
COMMIT;

--Session#1
select * from pizzeria where name  = 'Pizza Hut';
COMMIT;
select * from pizzeria where name  = 'Pizza Hut';

--Session#2
select * from pizzeria where name  = 'Pizza Hut';