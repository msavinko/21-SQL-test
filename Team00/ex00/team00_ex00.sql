create table tours
(id bigint primary key , node1 varchar not null , node2 varchar not null , cost bigint not null);

INSERT INTO tours VALUES (1, 'A', 'B', 10);
INSERT INTO tours VALUES (2, 'B', 'A', 10);
INSERT INTO tours VALUES (3, 'A', 'D', 20);
INSERT INTO tours VALUES (4, 'D', 'A', 20);
INSERT INTO tours VALUES (5, 'A', 'C', 15);
INSERT INTO tours VALUES (6, 'C', 'A', 15);
INSERT INTO tours VALUES (7, 'B', 'C', 35);
INSERT INTO tours VALUES (8, 'C', 'B', 35);
INSERT INTO tours VALUES (9, 'D', 'B', 25);
INSERT INTO tours VALUES (10, 'B', 'D', 25);
INSERT INTO tours VALUES (11, 'D', 'C', 30);
INSERT INTO tours VALUES (12, 'C', 'D', 30);

create view v_final_tours as (
    with recursive rec_tours as (
        (select id, node1 as trip, node1, node2, cost, cost as sum
               from tours
               where node1 = 'A')
        union all
        (select child.id,
                parrent.trip || ',' || child.node1 as trip,
                child.node1,
                child.node2,
                child.cost,
                parrent.sum + child.cost as sum
         from tours as child
                  join rec_tours as parrent on parrent.node2 = child.node1
         where trip not like '%' || child.node1 || '%'
        )
)

select rec_tours.sum as total_cost, '{'||rec_tours.trip||','||rec_tours.node2||'}' as tour
from rec_tours where length(trip) = 7 and node2 = 'A');

select * from v_final_tours where
v_final_tours.total_cost = (select min(v_final_tours.total_cost) from v_final_tours)

order by 1, 2;
