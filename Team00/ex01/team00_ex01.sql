select * from v_final_tours where
v_final_tours.total_cost = (select min(v_final_tours.total_cost) from v_final_tours)

union all

select * from v_final_tours where
v_final_tours.total_cost = (select max(v_final_tours.total_cost) from v_final_tours)

order by 1, 2;