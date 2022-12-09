--Session#1
BEGIN TRANSACTION;

--Session#2
BEGIN TRANSACTION;

--Session#1
UPDATE person SET address = 'Tashkent' WHERE id = 1;

--Session#2
UPDATE person SET address = 'Tashkent' WHERE id = 2;

--Session#1
UPDATE person SET address = 'Tashkent' WHERE id = 2;

--Session#2
UPDATE person SET address = 'Tashkent' WHERE id = 1;

--Session#1
COMMIT;

--Session#2
COMMIT;