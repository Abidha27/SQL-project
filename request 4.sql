/*Follow-up: Which segment had the most increase in unique products in 
2021 vs 2020? The final output contains these fields, 
segment 
product_count_2020 
product_count_2021 
difference */

WITH pc_2020 AS (
SELECT segment,COUNT(DISTINCT(p.product_code)) AS product_count_2020
FROM dim_product p
JOIN fact_sales_monthly s
ON p.product_code = s.product_code
WHERE s.fiscal_year=2020
GROUP BY p.segment),

 pc_2021 AS(
SELECT segment,COUNT(DISTINCT(p.product_code)) AS product_count_2021
FROM dim_product p
JOIN fact_sales_monthly s
ON p.product_code = s.product_code
WHERE s.fiscal_year=2021
GROUP BY p.segment)

SELECT a.segment,a.product_count_2020,b.product_count_2021, b.product_count_2021 - a.product_count_2020 as difference
FROM pc_2020 a
join pc_2021 b
ON a.segment = b.segment
ORDER BY difference DESC;
