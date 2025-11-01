Select *
from dairy_dataset

--Which farm locations have the largest total land area and number of cows?
--What is the average production (liters/kg) per cow across different farm sizes?
--Which product type (milk, cheese, ghee, etc.) has the highest production volume?
--What is the average shelf life of products by product category and brand?
--Which products are most frequently running out of stock?
--What is the average time a product stays in stock before being sold?
--Which storage condition (e.g., refrigerated, frozen) has the highest wastage risk (products near expiration but unsold)?
--Which products generate the highest total revenue across all farms?
--Which sales channel (retail, wholesale, direct-to-consumer, online) contributes the most to total revenue?
--What is the average price per unit sold compared to the listed price per unit — i.e., is there discounting?
--Which customer locations contribute the most to dairy product sales?
--What is the monthly/quarterly revenue trend for different product categories?
--Which farm has the highest revenue per acre of land?
--Which product has the highest profit margin (sold price vs listed price)?
--Which farms are the most efficient (highest revenue per cow)?

--Which farm locations have the largest total land area and number of cows?
select location, round(SUM(total_land_area_acres),2) as Total_land_area, sum(number_of_cows) as total_cows
from dairy_dataset
group by Location
order by Total_land_area desc

--What is the average production (liters/kg) per cow across different farm sizes?
select farm_size, round(AVG(quantity_liters_kg),2) as average_production
from dairy_dataset
group by Farm_Size
order by average_production desc

--Which product type (milk, cheese, ghee, etc.) has the highest production volume?
select product_name, round(max(Quantity_liters_kg),2) as highest_volume
from dairy_dataset
group by Product_Name
order by highest_volume

--What is the average shelf life of products by product category and brand?
select product_name, AVG(shelf_life_days) as average_shelf_life
from dairy_dataset
group by product_name
order by average_shelf_life desc

--Which products are most frequently running out of stock?
select product_name, location, sales_channel, count(*) as stockout_frequency
from dairy_dataset
where Quantity_in_Stock_liters_kg <= 0
group by Product_Name, Location,Sales_Channel
order by stockout_frequency desc

--What is the average time a product stays in stock before being sold?
select product_name, AVG(datediff(day,production_date,date)) as avg_days_in_stock
from dairy_dataset
where Quantity_Sold_liters_kg >0
group by Product_Name
order by avg_days_in_stock desc 

--Which storage condition (e.g., refrigerated, frozen) has the highest wastage risk (products near expiration but unsold)?
select storage_condition, sum(Quantity_in_Stock_liters_kg) as at_risk_quantity, count(*) as at_risk_products
from dairy_dataset
where Quantity_in_Stock_liters_kg > 0
and DATEDIFF(day,getdate(), expiration_date) <= 7
group by Storage_Condition
order by at_risk_quantity desc

--Which products generate the highest total revenue across all farms?
select Product_Name, ROUND(sum(approx_total_revenue_inr),2) as total_revenue
from dairy_dataset
group by Product_Name
order by total_revenue desc

--Which sales channel (retail, wholesale, direct-to-consumer, online) contributes the most to total revenue?
select Sales_Channel, ROUND(sum(approx_total_revenue_inr),2) as total_revenue
from dairy_dataset
group by Sales_Channel
order by total_revenue desc

--What is the average price per unit sold compared to the listed price per unit — i.e., is there discounting?
select Product_Name, round(avg(price_per_unit),2) as avg_listed_price , round(AVG(price_per_unit_sold),2)  as avg_sold_price,  round(avg(price_per_unit)- AVG(price_per_unit_sold),2) as avg_discount
from dairy_dataset
where Quantity_Sold_liters_kg > 0 
group by Product_Name
order by avg_discount desc

--Which customer locations contribute the most to dairy product sales?
select Customer_Location, max(quantity_sold_liters_kg) as highest_sales
from dairy_dataset
group by Customer_Location
order by highest_sales desc

--What is the monthly/quarterly revenue trend for different product categories?
select 
	FORMAT(date, 'yyyy-MM') as YearMonth,
	product_name,
	round(sum([quantity_sold_liters_kg] * [price_per_unit_sold]),2) as Total_revenue
from dairy_dataset
where Quantity_Sold_liters_kg > 0
group by FORMAT(date, 'yyyy-MM') , Product_Name
order by YearMonth, Total_revenue desc

--Which farm has the highest revenue per acre of land?
select Location, round(sum([quantity_sold_liters_kg] * [price_per_unit_sold]) / SUM([total_land_area_acres]),2) as revenue_per_acre
from dairy_dataset
group by Location
order by revenue_per_acre desc

--Which product has the highest profit margin (sold price vs listed price)?
select Product_Name, round(avg(([price_per_unit_sold] - [price_per_unit]) / [Price_per_Unit] * 100),2) as  avg_profit_margin_percent
from dairy_dataset
where Quantity_Sold_liters_kg >0
group by Product_Name
order by avg_profit_margin_percent desc

--Which farms are the most efficient (highest revenue per cow)?
select location, round(sum([quantity_sold_liters_kg] * [price_per_unit_sold]) / sum([number_of_cows]),2) as revenue_per_cows
from dairy_dataset
where Quantity_Sold_liters_kg > 0
group by Location
order by revenue_per_cows desc