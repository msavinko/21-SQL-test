show transaction isolation level;
begin;--Session #1
begin;--Session #2

select * from pizzeria where name = 'Pizza Hut';--Session #1
select * from pizzeria where name = 'Pizza Hut';--Session #2

update pizzeria set rating = 4 where name = 'Pizza Hut';--Session #1
update pizzeria set rating = 3.6 where name = 'Pizza Hut';--Session #2
--Session #2 unable to load the data until session #1 is finished.
commit;--Session #1
commit;--Session #2

select * from pizzeria where name = 'Pizza Hut';--Session #1
select * from pizzeria where name = 'Pizza Hut';--Session #2