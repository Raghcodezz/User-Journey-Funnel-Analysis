
-- Monthly Conversion Rate =  number_of_purchase_sessions/total_numnber_of_sessions

with cte as (select 
month(timestamp) as mn,
DATENAME(month, timestamp) as month,
count(*) as total_visits,
sum(purchased) as total_purchases,
cast(round((sum(purchased)*100.0/count(*)),2)
as decimal(10,2)) as conversion_rate
from ecommerce_journey
group by month(timestamp),DATENAME(month, timestamp))

select 
mn,
month,
conversion_rate
from cte 
order by mn
