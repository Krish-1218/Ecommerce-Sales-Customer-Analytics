-- 1. OVERALL BUSINESS PERFORMANCE

SELECT 
    SUM(`Sales`) AS total_sales,
    SUM(`Profit`) AS total_profit,
    COUNT(DISTINCT `Order ID`) AS total_orders
FROM ecommerce;


-- 2. SALES & PROFIT BY REGION

SELECT 
    `Region`,
    SUM(`Sales`) AS total_sales,
    SUM(`Profit`) AS total_profit
FROM ecommerce
GROUP BY `Region`
ORDER BY total_sales DESC;


-- 3. TOP 10 CUSTOMERS BY SALES

SELECT 
    `Customer Name`,
    SUM(`Sales`) AS total_spent
FROM ecommerce
GROUP BY `Customer Name`
ORDER BY total_spent DESC
LIMIT 10;


-- 4. CATEGORY-WISE PERFORMANCE

SELECT 
    `Category`,
    SUM(`Sales`) AS total_sales,
    SUM(`Profit`) AS total_profit
FROM ecommerce
GROUP BY `Category`
ORDER BY total_sales DESC;


-- 5. SUB-CATEGORY PERFORMANCE

SELECT 
    `Sub-Category`,
    SUM(`Sales`) AS total_sales,
    SUM(`Profit`) AS total_profit
FROM ecommerce
GROUP BY `Sub-Category`
ORDER BY total_profit DESC;


-- 6. MONTHLY SALES TREND

SELECT 
    DATE_FORMAT(`Order Date`, '%Y-%m') AS month,
    SUM(`Sales`) AS monthly_sales
FROM ecommerce
GROUP BY month
ORDER BY month;


-- 7. DISCOUNT IMPACT ON PROFIT

SELECT 
    `Discount`,
    AVG(`Profit`) AS avg_profit
FROM ecommerce
GROUP BY `Discount`
ORDER BY `Discount`;


-- 8. SEGMENT-WISE SALES ANALYSIS

SELECT 
    `Segment`,
    SUM(`Sales`) AS total_sales,
    SUM(`Profit`) AS total_profit
FROM ecommerce
GROUP BY `Segment`
ORDER BY total_sales DESC;


-- 9. TOP PROFITABLE PRODUCTS

SELECT 
    `Product Name`,
    SUM(`Profit`) AS total_profit
FROM ecommerce
GROUP BY `Product Name`
ORDER BY total_profit DESC
LIMIT 10;


-- 10. LOSS-MAKING PRODUCTS (IMPORTANT)

SELECT 
    `Product Name`,
    SUM(`Profit`) AS total_loss
FROM ecommerce
GROUP BY `Product Name`
HAVING total_loss < 0
ORDER BY total_loss ASC;