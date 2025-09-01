create database Chinook;
use chinook;

# Top-selling products
SELECT Product,
       SUM(Quantity) AS Total_Sold,
       RANK() OVER (ORDER BY SUM(Quantity) DESC) AS Sales_Rank
FROM `product-sales-region`
GROUP BY Product
ORDER BY Sales_Rank;


# Revenue per region
SELECT Region, SUM(TotalPrice) AS Revenue
FROM `product-sales-region`
GROUP BY Region
ORDER BY Revenue DESC;

# Monthly performance
SELECT 
    YEAR(STR_TO_DATE(LEFT(`Date`, 10), '%d/%m/%Y')) AS year,
    MONTH(STR_TO_DATE(LEFT(`Date`, 10), '%d/%m/%Y')) AS month,
    SUM(Totalprice) AS monthly_revenue,
    SUM(Quantity) AS monthly_units_sold
FROM `product-sales-region`
WHERE `Date` IS NOT NULL 
    AND `Date` != ''
    AND LENGTH(`Date`) >= 10
GROUP BY YEAR(STR_TO_DATE(LEFT(`Date`, 10), '%d/%m/%Y')), 
         MONTH(STR_TO_DATE(LEFT(`Date`, 10), '%d/%m/%Y'))
ORDER BY year, month;



