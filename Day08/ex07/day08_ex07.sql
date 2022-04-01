begin isolation level read committed;--Session #1
begin isolation level read committed;--Session #2

update person set name = 'Maria' where id = 1;--Session #1
update person set name = 'Maria' where id = 2;--Session #2

update person set name = 'Maria' where id = 2;--Session #1
update person set name = 'Maria' where id = 1;--Session #2

commit;--Session #1
commit;--Session #2

