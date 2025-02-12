--exploring dataset

select *
from salestransactions

--we see unique transaction numbers, dates, unique product numbers and names, prices of these items, 
--quantity bought, customer numbers and their country

--TransactionNo (categorical): a six-digit unique number that defines each transaction. The letter “C” in the code indicates a cancellation.
--Date (numeric): the date when each transaction was generated.
--ProductNo (categorical): a five or six-digit unique character used to identify a specific product.
--Product (categorical): product/item name.
--Price (numeric): the price of each product per unit in pound sterling (£).
--Quantity (numeric): the quantity of each product per transaction. Negative values related to cancelled transactions.
--CustomerNo (categorical): a five-digit unique number that defines each customer.
--Country (categorical): name of the country where the customer resides.

--making a copy of dataset, changed transactionno and productno into strings as they contain letters, otherwise there will be nulls

select *
into salestransactions1
from salestransactions

--calculating total sales per item purchased

select *, (price * quantity) as sales
from salestransactions1

alter table salestransactions1
add sales float

update salestransactions1
set sales = (price * quantity)

--finding unique transactions

select count(distinct transactionno) as unique_transactions
from salestransactions1

--finding unique customers

select count(distinct customerno) as unique_customers
from salestransactions1

--finding unique products

select count(distinct productno) as unique_products
from salestransactions1

--exploring different countries in dataset

select count(distinct country) as unique_countries
from salestransactions1

--finding the total number of products sold

select productno, productname, sum(quantity) as total_quantity
from salestransactions1
group by productno, productname
order by total_quantity desc

--# of customers per country

select country, count(distinct customerno) as customers
from salestransactions1
group by country
order by customers desc

--showing top 10 products with most sales

select top 10 productno, productname, round(sum(sales),0) as total_sales
from salestransactions1	
group by productno, productname
order by total_sales desc

--showing top 10 countries with most sales

select top 10 country, round(sum(sales),0) as total_sales
from salestransactions1
group by country
order by total_sales desc

--how was the sales trends per month?

select month(date) as month, year(date) as year, round(sum(sales),0) as total_sales
from salestransactions1
group by month(date), year(date)
order by year(date) asc, month(date) asc

--how many products does the customer purchase in each transaction?

select customerno, transactionno, count(*) as products_count, round(sum(sales),0) as total_sales
from salestransactions1
group by customerno, transactionno
order by products_count desc

--top 5 customers from any country with most sales and least sales

select top 5 customerno, country, top_sales, 'TOP5' as customers
from (
select customerno, country, round(SUM(sales),0) as top_sales, rank() over (partition by country order by SUM(sales) desc) as ranking
from salestransactions1
group by customerno, country) as x
where ranking = 1
order by top_sales desc

select top 5 customerno, country, bottom_sales,'BOTTOM5' as customers
from(
select customerno, country, round(SUM(sales),0) as bottom_sales, rank() over (partition by country order by SUM(sales) asc) as ranking
from salestransactions1
group by CustomerNo, country) as y
where ranking = 1 and bottom_sales > 0
order by bottom_sales asc

--how many cancelled orders were there? and how much sales were lost because of cancelled orders?
--(about 3,414 cancelled orders, and ~2.6 million lbs in lost sales)

select country, count(distinct TransactionNo) as cancelled_orders, round(sum(sales),0) as cancelled_sales
from salestransactions1
where TransactionNo like '%C%'
group by country
order by cancelled_orders desc

--average sales per customer

select customerno, round(avg(sales),0) as avg_sales
from salestransactions1
where CustomerNo is not null and sales > 0
group by CustomerNo
order by avg_sales desc

--CASE statement to categorize high paying customers, medium paying customers, low paying customers

select customerno, round(sum(sales),0) as total_sales,
CASE WHEN sum(sales) > 500000 THEN 'high_customer'
	 WHEN sum(sales) BETWEEN 100000 AND 500000 THEN 'medium_customer'
	 WHEN sum(sales) < 100000 THEN 'low_customer'
	 END as customer_category
from salestransactions1
where CustomerNo is not null and sales > 0
group by CustomerNo
order by total_sales desc

select customerno, sum(sales) as total_sales
from salestransactions1
where customerno is not null and sales > 0
group by CustomerNo
having sum(sales) > 500000
order by total_sales desc