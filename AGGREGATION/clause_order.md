DECLARE @start_date DATE = '2020-02-01'
DECLARE @end_date DATE = '2020-02-29'

select 
p.product_name,sum(o.unit) as unit
from
products p
inner join
orders o on p.product_id=o.product_id
WHERE o.order_date BETWEEN @start_date AND @end_date
GROUP BY p.product_name
HAVING sum(o.unit) >=100
