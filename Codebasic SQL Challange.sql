use gdb023;
-- Created View For Import In Power Bi For Visualization.
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Request 1. Provide the list of markets in which customer "Atliq Exclusive" operates its business in the APAC region.

CREATE view request_1 As 
								(select distinct (market)
									from dim_customer 
										where customer = "Atliq Exclusive" and region = "APAC");
                        
SELECT * FROM request_1;
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Request 2. What is the percentage of unique product increase in 2021 vs. 2020? The final output contains these fields,
-- unique_products_2020
-- unique_products_2021
-- percentage_chg

select * from fact_sales_monthly;
-- USING CTE MEHTHOD


CREATE view request_2 As 

									(with CTE1 as (select count(distinct product_code) AS unique_product_2020
										from fact_sales_monthly
											where fiscal_year = 2020 ),
									CTE2 as (select count(distinct product_code) AS  unique_product_2021
										from fact_sales_monthly
											where fiscal_year = 2021)
									select unique_product_2020 , unique_product_2021,
									round(((unique_product_2021-unique_product_2020)/(unique_product_2020)*100),2) as percentage_chg
										from CTE1, CTE2);
    
    SELECT * FROM request_2;
  
  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  
-- Request 3.Provide a report with all the unique product counts for each segment and sort them in descending order of product counts. The final output contain 2 fields,
-- segment
-- product_count

select * from dim_product;

CREATE VIEW request_3 As 

										(SELECT Segment , count(distinct product_code) as Product_count
											from dim_product
												group by segment
												order by product_count desc);

SELECT * FROM request_3;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--  Request 4.Follow-up: Which segment had the most increase in unique products in 2021 vs 2020? The final output contains these fields,
-- segment
-- product_count_2020
-- product_count_2021
-- difference

-- USING CTE METHOD 
CREATE VIEW request_4 As 

											(with CTE1 AS
											(select  dp.segment,count(distinct dp.product_code) as product_count_2020
												from dim_product as dp
													inner join fact_sales_monthly as ms
													on dp.product_code = ms.product_code
													where fiscal_year = 2020
													group by dp.segment 
													order by  product_count_2020 DESC),
											CTE2 AS 
											(select dp.segment,count(distinct dp.product_code) as product_count_2021
												from dim_product as dp
													inner join fact_sales_monthly as ms
													on dp.product_code = ms.product_code
													where fiscal_year = 2021 
													group by dp.segment
													order by product_count_2021 DESC)	
											select CTE1.segment, product_count_2020, product_count_2021 , 
											(product_count_2021-product_count_2020) as Difference
												from CTE1 INNER join CTE2
													ON CTE1.SEGMENT = CTE2.SEGMENT
													ORDER BY Difference  DESC);
                                
SELECT * FROM request_4;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------                                
    
-- Request 5.Get the products that have the highest and lowest manufacturing costs.The final output should contain these fields,
-- product_code
-- product
-- manufacturing_cost


CREATE VIEW request_5 As 

										((SELECT p.product_code, product , manufacturing_cost
											from dim_product as p 
												INNER JOIN fact_manufacturing_cost as mc
												ON p.product_code = mc.product_code
												ORDER BY manufacturing_cost DESC  limit 1)
										UNION
										(SELECT p.product_code, product , manufacturing_cost
											from dim_product as p 
												INNER JOIN fact_manufacturing_cost as mc
												ON p.product_code = mc.product_code
												ORDER BY mc.manufacturing_cost ASC limit 1));
                            
SELECT * FROM request_5;  

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------                          
  
--  REequest 6.Generate a report which contains the top 5 customers who received an average high pre_invoice_discount_pct for the fiscal year 2021 and in the
-- Indian market. The final output contains these fields,
-- customer_code
-- customer
-- average_discount_percentage

select * from fact_pre_invoice_deductions;

CREATE VIEW request_6 As 
									(select c.customer_code, customer, ROUND((AVG(pre_invoice_discount_pct)*100),2) as Average_discount_Percentage
										from dim_customer AS c
											inner join fact_pre_invoice_deductions AS i
											on c.customer_code = i.customer_code
											where fiscal_year = 2021 and market = "India"
											group by customer
											order by average_discount_percentage DESC
											LIMIT 5) ;
SELECT * FROM request_6;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------                                            

-- Request 7.Get the complete report of the Gross sales amount for the customer “Atliq Exclusive” for each month. This analysis helps to get an idea of low and
-- high-performing months and take strategic decisions.The final report contains these columns:
-- Month
-- Year
-- Gross sales Amount

select * from fact_sales_monthly;

CREATE VIEW 	request_7 As
												(select date_format(date, '%M') AS MONTH , year(DATE) AS YEAR, 
                                                ROUND(SUM(gross_price * sold_quantity),2) AS Gross_sales_amount
												from (select c.customer_code, customer ,date , product_code , sold_quantity
														From dim_customer as c
															inner join fact_sales_monthly as s
															on  c.customer_code = s.customer_code) as h
															inner join fact_gross_price as g
															on h.product_code = g.product_code
															WHERE customer = 'Atliq Exclusive'
															group by MONTH,YEAR
															ORDER BY YEAR );
SELECT * FROM request_7;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

 -- Request 8.In which quarter of 2020, got the maximum total_sold_quantity? The final output contains these fields sorted by the total_sold_quantity,
-- Quarter
-- total_sold_quantity

CREATE VIEW request_8 As 
													(select case quarter(date)
														when 1 then 'Q1'
														when 2 then 'Q2'
														when 3 then 'Q3'
														when 4 then 'Q4'
														end as Quarter ,
												sum(sold_quantity) as Total_sold_quantity
														from fact_sales_monthly 
														where fiscal_year = 2020
														group by Quarter 
														order by total_sold_quantity asc);
SELECT* FROM request_8;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

 -- Request 9.Which channel helped to bring more gross sales in the fiscal year 2021 and the percentage of contribution? The final output contains these fields,
-- channel
-- gross_sales_mln
-- percentage

CREATE VIEW request_9 As 
												(with CTE As ( select channel , round(sum(gross_price * sold_quantity)/1000000,2) as Gross_sales_mln
														from dim_customer as c
															inner join fact_sales_monthly as s
															on c.customer_code = s. customer_code
															inner join fact_gross_price as g
															on g.product_code = s.product_code
															where s.fiscal_year = 2021 and g.fiscal_year = 2021
															group by channel
															order by Gross_sales_mln desc)
												select channel , Gross_sales_mln, 
                                                round(((Gross_sales_mln /(select Sum(Gross_sales_mln)from CTE ))*100),2) as Percentage
														from CTE );
SELECT * FROM request_9;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Request 10.Get the Top 3 products in each division that have a high total_sold_quantity in the fiscal_year 2021? The final output contains these fields,
-- division
-- product_code
-- product
-- total_sold_quantity
-- rank_order

CREATE VIEW request_10 As 
										(with CTE  as (select Division, p.product_code, product,sum(sold_quantity) as Total_sold_quantity
												from dim_product as p
													inner join fact_sales_monthly as s
													on p.product_code = s.product_code
													where fiscal_year = 2021 
													group by product),

										CTE2 AS (select Division , product_code , Product, Total_sold_quantity , 
										dense_rank () over (partition by Division order by Total_sold_quantity desc) Rank_order
										from CTE)

										select * from CTE2
											where Rank_order <3);
											
SELECT * FROM request_10;                                            
