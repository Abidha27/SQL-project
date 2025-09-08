/* Generate a report which contains the top 5 customers who received an 
average high  pre_invoice_discount_pct  for the  fiscal  year 2021  and in the 
Indian  market. The final output contains these fields, 
customer_code 
customer 
average_discount_percentage */

SELECT pre.customer_code,c.customer,ROUND(AVG( pre_invoice_discount_pct),4) as average_discount_percentage
FROM fact_pre_invoice_deductions pre
JOIN dim_customer c
ON pre.customer_code = c.customer_code
WHERE fiscal_year = 2021
AND market="india"
GROUP BY pre.customer_code,c.customer
ORDER BY average_discount_percentage DESC
LIMIT 5;