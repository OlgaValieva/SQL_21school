--Session#1
BEGIN TRANSACTION;
select * from pizzeria where name  = 'Pizza Hut';

--Session#2
select * from pizzeria where name  = 'Pizza Hut';

--Session#1
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
select * from pizzeria where name  = 'Pizza Hut';

--Session#2
select * from pizzeria where name  = 'Pizza Hut';

--Session#1
COMMIT;

--Session#2
select * from pizzeria where name  = 'Pizza Hut';