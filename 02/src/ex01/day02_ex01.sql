SELECT missing_date ::date FROM generate_series('2022-01-01', '2022-01-10', interval '1 day') AS missing_date
    LEFT JOIN (SELECT * FROM person_visits WHERE (person_id = 1 OR person_id = 2)
                                             AND visit_date BETWEEN '2022-01-01' AND '2022-01-10') AS t1
                           ON visit_date = missing_date WHERE visit_date IS NULL;












