# Codebasic-Resume-Project-Challange-4
In this repository contains Ad_Hoc Analysis - Solutions to the resume project challenge 4 conducted by CodeBasics

![image](https://user-images.githubusercontent.com/125566876/221815493-4f8c8117-e21e-4931-a863-4f4ff9cd43ae.png)

Consumer Goods | Function: Executive Management

**INTRODUCTION** 

Atliq Hardwares (imaginary company) is one of the leading computer hardware producers in India and well expanded in other countries too.
However, the management noticed that they do not get enough insights to make quick and smart data-informed decisions. They want to expand their data analytics team by adding several junior data analysts. Tony Sharma, their data analytics director wanted to hire someone who is good at both tech and soft skills. Hence, he decided to conduct a SQL challenge which will help him understand both the skills.

**Task:**  

**Imagine yourself as the applicant for this role and perform the following task**

1.    Check ‘ad-hoc-requests.pdf’ - there are 10 ad hoc requests for which the business needs insights.
2.    You need to run a SQL query to answer these requests. 
3.    The target audience of this dashboard is top-level management - hence you need to create a presentation to show the insights.
4.    Be creative with your presentation, audio/video presentation will have more weightage.


**Tools used in this project:-**
1) MySQL
2) Power BI
3) PowerPoint

**Ad_Hoc_Request  This file provides a comprehensive overview of the tables found in the 'gdb023' (atliq_hardware_db) database.It includes information for six main tables:**

**Column Description for dim_customer table:**
1. customer_code: The 'customer_code' column features unique identification codes for every customer in the dataset. These codes can be used to track a customer's sales 		history, demographic information, and other relevant details. For example, the codes could look like '70002017', '90005160', and '80007195' respectively.

2. customer: The 'customer' column lists the names of customers, for example 'Atliq Exclusive', 'Flipkart', and 'Surface Stores' etc.

3. platform: The 'platform' column identifies the means by which a company's products or services are sold. "Brick & Mortar" represents the physical store/location, and 			"E-Commerce" represents online platforms.

4. channel: The 'channel' column reflects the distribution methods used to sell a product. These methods include "Retailers", "Direct", and "Distributors". Retailers 				refer to physical or online stores that sell products to consumers. Direct sales refer to sales made directly to consumers through a company's website or other direct means, and distributors refer to intermediaries or middlemen between the manufacturer and retailer or end consumers.

5. market: The 'market' column lists the countries in which the customer is located.

6. region: The 'region' column categorizes countries according to their geographic location, including "APAC" (Asia Pacific), "EU" (Europe), "NA" (North America), and 			    "LATAM" (Latin America).

7. sub_zone: "The 'sub_zone' column further breaks down the regions into sub-regions, such as "India", "ROA" (Rest of Asia), "ANZ" (Australia and New Zealand), "SE" 				  Southeast Asia), "NE" (Northeast Asia), "NA" (North America), and "LATAM" (Latin America)."



**select * from dim_customer;**

 
 ![image](https://user-images.githubusercontent.com/125566876/221821178-33f8ddb7-1b47-4ea7-9e9a-a23958978a73.png)


**Column Description for dim_product table:**
1. product_code: The 'product_code' column features unique identification codes for each product, serving as a means to track and distinguish individual products within a 		database or system.

2. division: The 'division' column categorizes products into groups such as "P & A" (Peripherals and Accessories), "N & S" (Network and Storage) and "PC" (Personal 				 Computer).

3. segment: The 'segment' column categorizes products further within the division, such as "Peripherals" (keyboard, mouse, monitor, etc.), "Accessories" (cases, cooling 			solutions, power supplies), "Notebook" (laptops), "Desktop" (desktops, all-in-one PCs, etc), "Storage" (hard disks, SSDs, external storage), and "Networking" (routers, switches, modems, etc.).

4. category: The 'category' column classifies products into specific subcategories within the segment.

5. product: The 'product' column lists the names of individual products, corresponding to the unique identification codes found in the 'product_code' column.

6. variant: The "variant" column classifies products according to their features, prices, and other characteristics. The column includes variants such as "Standard", 				"Plus", "Premium" that represent different versions of the same product.

**select* from dim_product;**


 ![image](https://user-images.githubusercontent.com/125566876/221822057-ba975612-785f-4c29-82e0-423e6858e4d7.png)


**Column Description for fact_gross_price table:**
1. product_code: The 'product_code' column features unique identification codes for each product.

2. fiscal_year: The 'fiscal_year' column contains the fiscal period in which the product sale was recorded. A fiscal year is a 12-month period that is used for accounting 			purposes and often differs from the calendar year. For Atliq Hardware, the fiscal year starts in September. The data available in this column covers the 				fiscal years 2020 and 2021.

3. gross_price: The 'gross_price' column holds the initial price of a product, prior to any reductions or taxes. It is the original selling price of the product.


**select* from fact_gross_price;**


![image](https://user-images.githubusercontent.com/125566876/221822544-9de9d092-26ec-4790-8347-7347a66439fd.png)

**Column Description for fact_manufacturing_cost:**
1. product_code: The 'product_code' column features unique identification codes for each product

2. cost_year: The "cost_year" column contains the fiscal year in which the product was manufactured.

3. manufacturing_cost: The "manufacturing_cost" column contains the total cost incurred for the production of a product. This cost includes direct costs like
raw materials, labor, and overhead expenses that are directly associated with the production process.


**select* from fact_manufacturing_cost;**

![image](https://user-images.githubusercontent.com/125566876/221823218-1e980270-f821-4489-aa6f-860d077db30d.png)


**Column Description for fact_pre_invoice_deductions:**
1. customer_code: The 'customer_code' column features unique identification codes for every customer in the dataset. These codes can be used to track a customer's sales 			history, demographic information, and other relevant details. For example, the codes could look like '70002017', '90005160', and '80007195' respectively.

2. fiscal_year: The "fiscal_year" column holds the fiscal period when the sale of a product occurred.

3. pre_invoice_discount_pct: The "pre_invoice_discount_pct" column contains the percentage of pre-invoice deductions for each product. Pre-invoice deductions are 
discounts that are applied to the gross price of a product before the invoice is generated, and typically applied to large orders or 							     long-term contracts.

**select* from fact_pre_invoice_deductions;**

![image](https://user-images.githubusercontent.com/125566876/221823782-2399ef92-d3d8-4cb8-847a-89b87166409e.png)


**Column Description for fact_sales_monthly:**
1. date: The "date" column contains the date when the sale of a product was made, in a monthly format for 2020 and 2021 fiscal years. This information can be used
to understand the sales performance of products over time.

2. product_code: The "product_code" column contains a unique identification code for each product. This code is used to track and differentiate individual 
products within a database or system.

3. customer_code: The 'customer_code' column features unique identification codes for every customer in the dataset. These codes can be used to track a customer's sales 			history, demographic information, and other relevant details. For example, the codes could look like '70002017', '90005160', and '80007195' respectively.

4. sold_quantity: The "sold_quantity" column contains the number of units of a product that were sold. This information can be used to understand the sales volume ofproducts and to compare the sales volume of different products or variants.

5. fiscal_year: The "fiscal_year" column holds the fiscal period when the sale of a product occurred.


**select* from fact_sales_monthly;**

![image](https://user-images.githubusercontent.com/125566876/221827113-045ac1f1-bd95-48f4-af0a-d96cdd2df848.png)



**NOW LETS GO FOR THE 10 AD_HOC REQUEST QUESTION AND THEIR SOLUTIONS**


**1. Provide the list of markets in which customer "Atliq Exclusive" operates its
business in the APAC region.**


   (select distinct (market)
	from dim_customer 
		where customer = "Atliq Exclusive" and region = "APAC");

**OUTPUT :**



![Screenshot_20230226_073246](https://user-images.githubusercontent.com/125566876/221830426-77ad10ee-2303-4170-96a1-87f79878ad51.png)


**Conversion of Output to visual**

![Screenshot_20230226_082449](https://user-images.githubusercontent.com/125566876/221830459-5b5272ac-c1af-43f2-9a43-cfa49465d34d.png)


**2. What is the percentage of unique product increase in 2021 vs. 2020? The
final output contains these fields,
unique_products_2020
unique_products_2021
percentage_chg**

					(with CTE1 as (select count(distinct product_code) AS unique_product_2020
										from fact_sales_monthly
											where fiscal_year = 2020 ),
									CTE2 as (select count(distinct product_code) AS  unique_product_2021
										from fact_sales_monthly
											where fiscal_year = 2021)
									select unique_product_2020 , unique_product_2021,
									round(((unique_product_2021-unique_product_2020)/(unique_product_2020)*100),2) as 												percentage_chg
										from CTE1, CTE2);



**OUTPUT :**


![Screenshot_20230226_085059](https://user-images.githubusercontent.com/125566876/221833500-78633343-2a88-4aa7-9b62-cd9b1b79dac9.png)


**Conversion of Output to visual**

![Screenshot_20230226_124437](https://user-images.githubusercontent.com/125566876/221833558-8de9fef9-0ba4-4145-840a-307e0f78456c.png)


**3. Provide a report with all the unique product counts for each segment and
sort them in descending order of product counts. The final output contains
2 fields,
segment
product_count**


						(SELECT Segment , count(distinct product_code) as Product_count
											from dim_product
												group by segment
												order by product_count desc);


**OUTPUT :**

![Screenshot_20230227_122417](https://user-images.githubusercontent.com/125566876/221838709-e8f682ee-e22b-41dc-81a0-cb73dfa30c47.png)


**Conversion of Output to visual**

![Screenshot_20230227_122833](https://user-images.githubusercontent.com/125566876/221838825-642fe5da-184e-4503-8de6-ed008ca11435.png)


**4. Follow-up: Which segment had the most increase in unique products in
2021 vs 2020? The final output contains these fields,
segment
product_count_2020
product_count_2021
difference**

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
             
             
  **OUTPUT :**           

 ![Screenshot_20230227_125020](https://user-images.githubusercontent.com/125566876/221839098-568e0fab-6d23-4718-b523-ab903be00315.png)



**Conversion of Output to visual**

![Screenshot_20230227_125122](https://user-images.githubusercontent.com/125566876/221839177-43afbadd-7158-45ee-9a85-293388f2e364.png)



**5. Get the products that have the highest and lowest manufacturing costs.
The final output should contain these fields,
product_code
product
manufacturing_cost**


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
            
            
 **OUTPUT :**               
    
 ![Screenshot_20230227_012050](https://user-images.githubusercontent.com/125566876/221834649-1c4d35f0-6b98-4476-8e16-f5104fb55995.png)   

            
**Conversion of Output to visual**            
            

![Screenshot_20230227_012707](https://user-images.githubusercontent.com/125566876/221834710-04afb214-11fa-4f94-a556-c2a11e3bd799.png)


**6. Generate a report which contains the top 5 customers who received an
average high pre_invoice_discount_pct for the fiscal year 2021 and in the
Indian market. The final output contains these fields,
customer_code
customer
average_discount_percentage**


(select c.customer_code, customer, ROUND((AVG(pre_invoice_discount_pct)*100),2) as Average_discount_Percentage
										from dim_customer AS c
											inner join fact_pre_invoice_deductions AS i
											on c.customer_code = i.customer_code
											where fiscal_year = 2021 and market = "India"
											group by customer
											order by average_discount_percentage DESC
											LIMIT 5) ;
           
 **OUTPUT :**        
  ![Screenshot_20230227_013846](https://user-images.githubusercontent.com/125566876/221836451-83c63000-a161-4ee8-9024-99c6b870ec43.png)         
  
       
           
**Conversion of Output to visual**            
           


![Screenshot_20230227_013948](https://user-images.githubusercontent.com/125566876/221836614-b50e5eea-b33b-40a8-b5e4-ae534650365f.png)


**7. Get the complete report of the Gross sales amount for the customer “Atliq
Exclusive” for each month. This analysis helps to get an idea of low and
high-performing months and take strategic decisions.
The final report contains these columns:
Month
Year
Gross sales Amount**


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

**OUTPUT:**
![Screenshot_20230227_015307](https://user-images.githubusercontent.com/125566876/221836805-8a481002-a090-44e4-b18c-35c41b591716.png)



**CONVERSION OF OUTPUT TO VISUAL**


![Screenshot_20230227_023315](https://user-images.githubusercontent.com/125566876/221837568-7a07eeac-921a-4c4e-96f1-aeb38c2bfc65.png)

**8. In which quarter of 2020, got the maximum total_sold_quantity? The final
output contains these fields sorted by the total_sold_quantity,
Quarter
total_sold_quantity**


(select case quarter(date)
														when 1 then 'Q1'
														when 2 then 'Q2'
														when 3 then 'Q3'
														when 4 then 'Q4'
														end as Quarter ,

														order by total_sold_quantity asc);

**OUTPUT:**
  ![Screenshot_20230227_022303](https://user-images.githubusercontent.com/125566876/221837152-26dcf183-6a5d-4adc-94b1-26d3d9892860.png)


**CONVERSION OF OUTPUT YO VISUALS**
![Screenshot_20230227_022355](https://user-images.githubusercontent.com/125566876/221837200-3420b82a-917a-4592-ade6-7d8cc5e33d2d.png)

**9. Which channel helped to bring more gross sales in the fiscal year 2021
and the percentage of contribution? The final output contains these fields,
channel
gross_sales_mln
percentage**

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
              
**OUTPUT:** 
![Screenshot_20230227_023206](https://user-images.githubusercontent.com/125566876/221837462-d62f09c9-8320-4058-a267-6c4f66b19fd7.png)


**CONVERSION OF OUTPUT**


![Screenshot_20230227_021531](https://user-images.githubusercontent.com/125566876/221836891-4dbfe94f-380b-43de-9c70-68e63c643367.png)


**10. Get the Top 3 products in each division that have a high
total_sold_quantity in the fiscal_year 2021? The final output contains these
fields,
division
product_code
codebasics.io
product
total_sold_quantity
rank_order**

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
           
  **OUTPUT:**
  ![Screenshot_20230227_024111](https://user-images.githubusercontent.com/125566876/221837756-82ea00cf-31a4-4d3c-a71f-37d08d487c26.png)
 
**CONVERSION OF OUTPUT OF VISUALS**


![Screenshot_20230227_024202](https://user-images.githubusercontent.com/125566876/221837816-9d1ccf0b-7f4a-4269-836d-043d65f46ad2.png)




           
           
              











