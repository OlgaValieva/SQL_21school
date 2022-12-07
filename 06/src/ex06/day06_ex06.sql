CREATE SEQUENCE seq_person_discounts START 1;
SELECT nextval('seq_person_discounts');
ALTER TABLE person_discounts ALTER COLUMN id SET DEFAULT nextval('seq_person_discounts');
SELECT setval('seq_person_discounts', max(id) + 1) FROM person_discounts;