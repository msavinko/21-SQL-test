CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop integer = 10) RETURNS SETOF INT  AS $table5$
BEGIN
RETURN QUERY WITH RECURSIVE t(a, b) AS (
    VALUES(0,1)
    UNION ALL
        SELECT GREATEST(a, b), a + b AS a from t
        WHERE b < pstop
)
SELECT a FROM t;
END;
$table5$ LANGUAGE plpgsql;

select * from fnc_fibonacci(100);
select * from fnc_fibonacci();

--DROP FUNCTION fnc_fibonacci;