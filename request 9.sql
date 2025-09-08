/* Which channel helped to bring more gross sales in the fiscal year 2021 
and the percentage of contribution?  The final output  contains these fields, 
channel 
gross_sales_mln 
percentage */

WITH cte1 AS(
SELECT channel, ROUND( SUM(sold_quantity*gross_price)/100000,2) AS gross_sales_mln
FROM dim_customer 
JOIN fact_sales_monthly
USING(customer_code)
JOIN fact_gross_price
USING(product_code,fiscal_year)
WHERE fiscal_year=2021
GROUP BY channel
ORDER BY gross_sales_mln DESC )

SELECT *, ROUND(gross_sales_mln*100/SUM(gross_sales_mln) OVER(),2) AS contribution_pct
FROM cte1;