SELECT t.*
    FROM public.person_order t
        WHERE id % 2 = 0
ORDER BY id ASC;