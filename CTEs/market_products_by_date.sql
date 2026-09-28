WITH D AS(
    SELECT
    distinct 
    sell_date,
    product 
    from
    activities
)
,

C AS (
    SELECT
        sell_date,
        COUNT(DISTINCT product) AS num_sold,
        STRING_AGG( product, ',') WITHIN GROUP (ORDER BY product) AS products
    FROM D
    GROUP BY sell_date
)

SELECT
    sell_date,
    num_sold,
    products
FROM C
ORDER BY sell_date;
