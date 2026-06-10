-- =====================================================
-- Superstore Customer Retention and Profitability Analysis
-- Objective: Investigate how effectively the company retains customers and identify which customers provide the greatest value.
-- =====================================================


-- =====================================================
-- 1. Company-Level Analysis
-- =====================================================

-- Count of unique customers per year.

SELECT 
    YEAR(order_date) AS order_year,
    COUNT(DISTINCT customer_id) AS customer_count
FROM superstore
GROUP BY order_year
ORDER BY order_year;


-- How much is the customer base growing each year?

WITH customer_base AS (

SELECT 
    YEAR(order_date) AS order_year,
    COUNT(DISTINCT customer_id) AS customer_count
FROM superstore
GROUP BY order_year)

SELECT
    order_year,
    customer_count,
    customer_count - LAG(customer_count) OVER(ORDER BY order_year) AS customer_count_change,
    ROUND(
        (customer_count - LAG(customer_count) OVER(ORDER BY order_year))
        * 100.0
        / LAG(customer_count) OVER(ORDER BY order_year),
        2
    ) AS customer_growth_pct
FROM customer_base;


-- Who are the top 10 customers by revenue?

SELECT
    customer_name,
    ROUND(SUM(sales), 2) AS customer_revenue
FROM superstore
GROUP BY customer_name
ORDER BY customer_revenue DESC
LIMIT 10;


-- What percentage of total revenue do the top ten customers account for?

WITH customer_revenue AS (

SELECT
    customer_name,
    ROUND(SUM(sales), 2) AS customer_total
FROM superstore
GROUP BY customer_name
ORDER BY customer_total DESC
LIMIT 10)

SELECT
    ROUND(
        SUM(customer_total) * 100.0 /
        (SELECT SUM(sales) FROM superstore),
        2
    ) AS top_10_customer_pct
FROM customer_revenue;


-- =====================================================
-- 2. Customer-Level Analysis
-- =====================================================

-- How many customers are repeat purchasers?

WITH customer_order_count AS (

SELECT
    customer_id,
    COUNT(DISTINCT order_id) AS order_count
FROM superstore
GROUP BY customer_id)

SELECT
    COUNT(*) AS repeat_purchasers
FROM customer_order_count
WHERE order_count > 1;


-- What percentage of customers are repeat purchasers?

WITH customer_order_count AS (

SELECT
    customer_id,
    COUNT(DISTINCT order_id) AS order_count
FROM superstore
GROUP BY customer_id)

SELECT
    ROUND(
        COUNT(CASE WHEN order_count > 1 THEN 1 END)
        / COUNT(*) * 100,
        2
    ) AS repeat_purchase_rate
FROM customer_order_count;


-- What is the average number of orders per customer?

WITH customer_order_count AS (

SELECT
    customer_id,
    COUNT(DISTINCT order_id) AS order_count
FROM superstore
GROUP BY customer_id)

SELECT
    ROUND(AVG(order_count), 2) AS avg_order_count
FROM customer_order_count;


-- How are customers distributed by order frequency?

WITH customer_order_count AS (

SELECT
    customer_id,
    COUNT(DISTINCT order_id) AS order_count
FROM superstore
GROUP BY customer_id)

SELECT
    order_count,
    COUNT(*) AS customer_count
FROM customer_order_count
GROUP BY order_count
ORDER BY order_count;


-- Which customers generated the most profit?

SELECT
    customer_name,
    ROUND(SUM(profit), 2) AS customer_profit
FROM superstore
GROUP BY customer_name
ORDER BY customer_profit DESC
LIMIT 10;


-- Why are some of the highest-revenue customers not among the most profitable customers?

SELECT
    customer_name,
    ROUND(SUM(profit), 2) AS customer_profit,
    ROUND(SUM(sales), 2) AS customer_revenue,
    ROUND(SUM(profit) / SUM(sales) * 100, 2) AS customer_profit_margin
FROM superstore
WHERE customer_name IN (
    'Sean Miller',
    'Ken Lonsdale',
    'Sanjit Engle',
    'Christopher Conant'
)
GROUP BY customer_name
ORDER BY customer_profit DESC;


-- =====================================================
-- 3. Segment Analysis
-- =====================================================

-- Which segment has the highest profit margin?

SELECT
    segment,
    ROUND(SUM(sales), 2) AS segment_revenue,
    ROUND(SUM(profit), 2) AS segment_profit,
    ROUND(SUM(profit) / SUM(sales) * 100, 2) AS segment_profit_margin
FROM superstore
GROUP BY segment
ORDER BY segment_profit_margin DESC;


