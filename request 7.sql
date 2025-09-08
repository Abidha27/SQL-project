/* Get the complete report of the Gross sales amount for the customer  “Atliq 
Exclusive”  for each month  .  This analysis helps to  get an idea of low and 
high-performing months and take strategic decisions. 
The final report contains these columns: 
Month 
Year 
Gross sales Amount */

SELECT
      MONTHNAME(date) as months,s.fiscal_year, ROUND(SUM(sold_quantity*gross_price),2) AS gross_sales_amount
FROM 
     fact_sales_monthly s
JOIN 
     fact_gross_price gp
USING 
     (product_code,fiscal_year)
JOIN 
    dim_customer   
USING(customer_code)
WHERE customer = "atliq exclusive"
GROUP BY months,s.fiscal_year
ORDER BY s.fiscal_year;    