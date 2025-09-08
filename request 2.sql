/* What is the percentage of unique product increase in 2021 vs. 2020? The 
final output contains these fields, 
unique_products_2020 
unique_products_2021 
percentage_chg */


WITH unique_products AS(
SELECT 
       COUNT(distinct(product_code)) AS unique_products_2020,
       (SELECT count(distinct(product_code)) 
       FROM fact_sales_monthly s
		WHERE fiscal_year = 2021) AS unique_products_2021 
FROM 
     fact_sales_monthly s
WHERE
     fiscal_year = 2020    
)
     
     SELECT *, ROUND((unique_products_2021/unique_products_2020-1)*100,2) AS percentage_change
     FROM unique_products;
     