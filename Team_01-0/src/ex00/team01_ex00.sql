SELECT balance_norm.name,
		 lastname,
		 type,
		 volume,
		 coalesce(currency_norm.name,'not defined') AS currency_name,
         coalesce(rate_to_usd, 1.0) AS last_rate_to_usd,
         volume * coalesce(rate_to_usd, 1.0) AS total_volume_in_usd
FROM
	(SELECT coalesce("user".name, 'not defined') AS name,
	        coalesce("user".lastname, 'not defined') AS lastname,
	        type,
	        bal1.sum AS volume,
	        bal1.currency_id
	FROM
		(SELECT user_id,
		 sum(money) AS sum,
		 type,
		 currency_id
		FROM balance
		GROUP BY  user_id, type, currency_id
		ORDER BY  1) AS bal1 FULL
		JOIN "user"
			ON id = bal1.user_id) AS balance_norm
	    FULL JOIN
            (SELECT DISTINCT *
            FROM currency
            WHERE updated =
                (SELECT MAX(updated)
                FROM currency)) AS currency_norm
            ON currency_id = currency_norm.id
ORDER BY  name DESC, lastname, type ASC;