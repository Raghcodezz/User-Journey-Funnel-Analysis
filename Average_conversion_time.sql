with cte as(select 
sessionid,
max(purchased)
as purchased,
min(timestamp) as entry_time,
max(timestamp) as exit_time,
case 
    when count(*)=1 then max(timeonpage_seconds)
    else DATEDIFF(second,min(timestamp),max(timestamp)) end
as time_spent
from ecommerce_journey
group by sessionid)

select 
case 
    when purchased=1 then '1 (Purchased)' 
    else '0 (Not_purchased)'
end as Purchased,
avg(time_spent) as Session_duration_secs
from cte 
group by purchased
