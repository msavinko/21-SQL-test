--Session #1
show transaction_isolation;
begin isolation level read committed;
update pizzeria set rating = 5 where name = 'Pizza Hut';
commit;
show transaction_isolation;

--Session #2 comments
show transaction_isolation;
select * from pizzeria where name = 'Pizza Hut';
select * from pizzeria where name = 'Pizza Hut';
