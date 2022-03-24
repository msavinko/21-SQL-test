SELECT order_date, CONCAT(name, ' (age:', age, ')') AS personal_information
FROM person_order
JOIN person ON person_order.id = person.id
ORDER BY 1, 2;