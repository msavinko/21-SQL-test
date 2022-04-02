CREATE FUNCTION fnc_mleast(VARIADIC arr numeric[]) RETURNS numeric AS $table4$
    SELECT min(arr) FROM generate_subscripts($1, 1) g(i);
$table4$ LANGUAGE SQL;

SELECT fnc_mleast(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);