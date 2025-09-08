/* Get the products that have the highest and lowest manufacturing costs. 
The final output should contain these fields, 
product_code 
product 
manufacturing_cost */


(SELECT 
      mc.product_code,p.product,mc.manufacturing_cost
FROM 
     fact_manufacturing_cost mc
JOIN 
     dim_product p
ON 
   mc.product_code=p.product_code
ORDER BY
        manufacturing_cost DESC
        LIMIT 1)
UNION        
(SELECT 
      mc.product_code,p.product,mc.manufacturing_cost
FROM 
     fact_manufacturing_cost mc
JOIN 
     dim_product p
ON 
   mc.product_code=p.product_code
ORDER BY
        manufacturing_cost
LIMIT 1 );
        

   