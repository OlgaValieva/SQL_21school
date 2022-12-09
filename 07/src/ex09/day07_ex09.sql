SELECT person.address,
       ROUND((MAX(age::numeric) - (MIN(age::numeric) / MAX(age::numeric))), 2) AS formula,
       ROUND(AVG(age), 2) AS average,
--     (SELECT ('formula' > 'average')) AS comparison FROM person
       (MAX(age::numeric) - (MIN(age::numeric) / MAX(age::numeric))) > ROUND(AVG(age), 2)  AS comparison FROM person
GROUP BY address
ORDER BY address;

-- WITH data AS (
--     SELECT
--         address,
--         ROUND(MAX(age) - (MIN(age) :: numeric / MAX(age)), 2) :: real AS formula,
--         ROUND(AVG(age), 2) :: real AS average
--     FROM
--         person
--     GROUP BY
--         address
-- )
-- SELECT
--     address,
--     formula,
--     average,
--     formula > average AS comparison
-- FROM
--     data
-- ORDER BY
--     address;
