show transaction_isolation;--Session #1
show transaction_isolation;--Session #2

begin isolation level read committed;--Session #1
select * from pizzeria where name = 'Pizza Hut';--Session #2

update pizzeria set rating = 5 where name = 'Pizza Hut';--Session #1
select * from pizzeria where name = 'Pizza Hut';--Session #2

commit;--Session #1






