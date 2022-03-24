SELECT object_id, object_name
FROM (SELECT id AS object_id, name AS object_name FROM person
UNION
    SELECT id AS object_id, pizza_name AS object_name FROM menu
) AS t1
ORDER BY lower(object_name);