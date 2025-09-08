/*  In which quarter of 2020, got the maximum total_sold_quantity? The final 
output contains these fields sorted by the total_sold_quantity, 
Quarter 
total_sold_quantity */

SELECT 
      get_fiscal_quarter(date) AS Quarters,
      SUM(sold_quantity) as total_sold_quantity
FROM 
	 fact_sales_monthly
WHERE
      fiscal_year = 2020
GROUP BY 
       get_fiscal_quarter(date)
ORDER BY 
        total_sold_quantity DESC;
