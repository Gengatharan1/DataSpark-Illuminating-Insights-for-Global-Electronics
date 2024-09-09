-- Display all rows from each table
SELECT * FROM customer_details;
SELECT * FROM exchange_details;
SELECT * FROM product_details;
SELECT * FROM sales_details;
SELECT * FROM stores_details;


-- Describe table structures
DESCRIBE sales_details;
DESCRIBE customer_details;


-- Change dtypes to DATE format

-- Customer table
UPDATE customer_details SET Birthday = STR_TO_DATE(Birthday, '%m/%d/%Y');
ALTER TABLE customer_details MODIFY COLUMN Birthday DATE;

-- Sales table
UPDATE sales_details SET Order_Date = STR_TO_DATE(Order_Date, '%m/%d/%Y');
ALTER TABLE sales_details MODIFY COLUMN Order_Date DATE;

-- Stores table
UPDATE stores_details SET Open_Date = STR_TO_DATE(Open_Date, '%m/%d/%Y');
ALTER TABLE stores_details MODIFY COLUMN Open_Date DATE;

-- Exchange rate table
UPDATE exchange_details SET Date = STR_TO_DATE(Date, '%Y-%m-%d');
ALTER TABLE exchange_details MODIFY COLUMN Date DATE;


-- Queries to get insights from 5 tables

-- 1. Overall female count
SELECT COUNT(Gender) AS Female_count 
FROM customer_details 
WHERE Gender = 'Female';

-- 2. Overall male count
SELECT COUNT(Gender) AS Male_count 
FROM customer_details 
WHERE Gender = 'Male';

-- 3. Count of customers by country
SELECT sd.Country, COUNT(DISTINCT c.CustomerKey) AS customer_count 
FROM sales_details c 
JOIN stores_details sd ON c.StoreKey = sd.StoreKey
GROUP BY sd.Country 
ORDER BY customer_count DESC;

-- 4. Overall count of customers
SELECT COUNT(DISTINCT s.CustomerKey) AS customer_count 
FROM sales_details s;

-- 5. Count of stores by country
SELECT Country, COUNT(StoreKey) 
FROM stores_details
GROUP BY Country 
ORDER BY COUNT(StoreKey) DESC;

-- 6. Store-wise sales
SELECT s.StoreKey, sd.Country, SUM(Unit_Price_USD * s.Quantity) AS total_sales_amount 
FROM product_details pd
JOIN sales_details s ON pd.ProductKey = s.ProductKey 
JOIN stores_details sd ON s.StoreKey = sd.StoreKey 
GROUP BY s.StoreKey, sd.Country;

-- 7. Overall selling amount
SELECT SUM(Unit_Price_USD * sd.Quantity) AS total_sales_amount 
FROM product_details pd
JOIN sales_details sd ON pd.ProductKey = sd.ProductKey;

-- 8. Brand count
SELECT Brand, COUNT(Brand) AS brand_count 
FROM product_details 
GROUP BY Brand;

-- 9. CP and SP difference and profit
SELECT Unit_Price_USD, Unit_Cost_USD,
       ROUND((Unit_Price_USD - Unit_Cost_USD), 2) AS diff,
       ROUND(((Unit_Price_USD - Unit_Cost_USD) / Unit_Cost_USD) * 100, 2) AS profit_percent
FROM product_details;

-- 10. Brand-wise selling amount
SELECT Brand, ROUND(SUM(Unit_Price_USD * sd.Quantity), 2) AS sales_amount
FROM product_details pd 
JOIN sales_details sd ON pd.ProductKey = sd.ProductKey 
GROUP BY Brand;

-- 11. Subcategory-wise selling amount
SELECT Subcategory, COUNT(Subcategory) 
FROM product_details 
GROUP BY Subcategory;

SELECT Subcategory, ROUND(SUM(Unit_Price_USD * sd.Quantity), 2) AS TOTAL_SALES_AMOUNT
FROM product_details pd 
JOIN sales_details sd ON pd.ProductKey = sd.ProductKey
GROUP BY Subcategory 
ORDER BY TOTAL_SALES_AMOUNT DESC;

-- 12. Country-wise overall sales
SELECT s.Country, SUM(pd.Unit_Price_USD * sd.Quantity) AS total_sales 
FROM product_details pd
JOIN sales_details sd ON pd.ProductKey = sd.ProductKey 
JOIN stores_details s ON sd.StoreKey = s.StoreKey 
GROUP BY s.Country;

-- 13. Year-wise brand sales
SELECT YEAR(Order_Date), pd.Brand, ROUND(SUM(Unit_Price_USD * sd.Quantity), 2) AS year_sales 
FROM sales_details sd
JOIN product_details pd ON sd.ProductKey = pd.ProductKey 
GROUP BY YEAR(Order_Date), pd.Brand;

-- 14. Overall sales with quantity
SELECT Brand, 
       SUM(Unit_Price_USD * sd.Quantity) AS sp,
       SUM(Unit_Cost_USD * sd.Quantity) AS cp,
       (SUM(Unit_Price_USD * sd.Quantity) - SUM(Unit_Cost_USD * sd.Quantity)) / SUM(Unit_Cost_USD * sd.Quantity) * 100 AS profit 
FROM product_details pd 
JOIN sales_details sd ON sd.ProductKey = pd.ProductKey
GROUP BY Brand;

-- 15. Month-wise sales with quantity
SELECT MONTH(Order_Date), 
       SUM(Unit_Price_USD * sd.Quantity) AS sp_month 
FROM sales_details sd 
JOIN product_details pd ON sd.ProductKey = pd.ProductKey
GROUP BY MONTH(Order_Date);

-- 16. Month and year-wise sales with quantity
SELECT MONTH(Order_Date), YEAR(Order_Date), Brand, 
       SUM(Unit_Price_USD * sd.Quantity) AS sp_month 
FROM sales_details sd 
JOIN product_details pd ON sd.ProductKey = pd.ProductKey
GROUP BY MONTH(Order_Date), YEAR(Order_Date), Brand;

-- 17. Year-wise sales
SELECT YEAR(Order_Date), 
       SUM(Unit_Price_USD * sd.Quantity) AS sp_year 
FROM sales_details sd 
JOIN product_details pd ON sd.ProductKey = pd.ProductKey
GROUP BY YEAR(Order_Date);

-- 18. Comparing current month and previous month
SELECT YEAR(Order_Date), MONTH(Order_Date),
       ROUND(SUM(Unit_Price_USD * sd.Quantity), 2) AS sales, 
       LAG(SUM(Unit_Price_USD * sd.Quantity)) OVER (ORDER BY YEAR(Order_Date), MONTH(Order_Date)) AS Previous_Month_Sales 
FROM sales_details sd 
JOIN product_details pd ON sd.ProductKey = pd.ProductKey 
GROUP BY YEAR(Order_Date), MONTH(Order_Date);

-- 19. Comparing current year and previous year sales
SELECT YEAR(Order_Date) AS year,
       ROUND(SUM(Unit_Price_USD * sd.Quantity), 2) AS sales, 
       LAG(SUM(Unit_Price_USD * sd.Quantity)) OVER (ORDER BY YEAR(Order_Date)) AS Previous_Year_Sales 
FROM sales_details sd 
JOIN product_details pd ON sd.ProductKey = pd.ProductKey 
GROUP BY YEAR(Order_Date);

-- 20. Month-wise profit
SELECT YEAR(Order_Date) AS year, 
       MONTH(Order_Date) AS month,
       (SUM(Unit_Price_USD * sd.Quantity) - SUM(Unit_Cost_USD * sd.Quantity)) AS sales, 
       LAG(SUM(Unit_Price_USD * sd.Quantity) - SUM(Unit_Cost_USD * sd.Quantity)) OVER (ORDER BY YEAR(Order_Date), MONTH(Order_Date)) AS Previous_Month_Sales,
       ROUND(((SUM(Unit_Price_USD * sd.Quantity) - SUM(Unit_Cost_USD * sd.Quantity)) - 
              LAG(SUM(Unit_Price_USD * sd.Quantity) - SUM(Unit_Cost_USD * sd.Quantity)) OVER (ORDER BY YEAR(Order_Date), MONTH(Order_Date))) / 
             LAG(SUM(Unit_Price_USD * sd.Quantity) - SUM(Unit_Cost_USD * sd.Quantity)) OVER (ORDER BY YEAR(Order_Date), MONTH(Order_Date)) * 100, 2) AS profit_percent
FROM sales_details sd 
JOIN product_details pd ON sd.ProductKey = pd.ProductKey 
GROUP BY YEAR(Order_Date), MONTH(Order_Date);

-- 21. Year-wise profit
SELECT YEAR(Order_Date) AS Year, 
       (SUM(Unit_Price_USD * sd.Quantity) - SUM(Unit_Cost_USD * sd.Quantity)) AS sales, 
       LAG(SUM(Unit_Price_USD * sd.Quantity) - SUM(Unit_Cost_USD * sd.Quantity)) OVER (ORDER BY YEAR(Order_Date)) AS Previous_Year_Sales,
       ROUND(((SUM(Unit_Price_USD * sd.Quantity) - SUM(Unit_Cost_USD * sd.Quantity)) - 
              LAG(SUM(Unit_Price_USD * sd.Quantity) - SUM(Unit_Cost_USD * sd.Quantity)) OVER (ORDER BY YEAR(Order_Date))) / 
             LAG(SUM(Unit_Price_USD * sd.Quantity) - SUM(Unit_Cost_USD * sd.Quantity)) OVER (ORDER BY YEAR(Order_Date)) * 100, 2) AS profit_percent
FROM sales_details sd 
JOIN product_details pd ON sd.ProductKey = pd.ProductKey 
GROUP BY YEAR(Order_Date);