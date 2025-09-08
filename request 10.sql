/* Get the Top 3 products in each division that have a high 
total_sold_quantity in the fiscal_year 2021? The final output contains these 
fields, 
division 
product_code
product 
total_sold_quantity 
rank_order */


WITH cte1 AS (
SELECT division, product_code, product,
SUM(sold_quantity) AS total_sold_quantity
FROM dim_product 
JOIN fact_sales_monthly 
USING(product_code)
WHERE fiscal_year = 2021 
GROUP BY division,product_code,product ),
 
cte2 AS (
SELECT *, RANK() OVER (PARTITION BY division ORDER BY total_sold_quantity DESC) AS rank_order
FROM cte1 )

SELECT *
FROM cte2 
WHERE rank_order IN (1,2,3);



