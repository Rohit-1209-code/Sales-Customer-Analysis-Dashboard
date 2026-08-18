-- Sales Trends Analysis
-- Business question: How is revenue trending month over month, and how
-- are we tracking toward cumulative targets?

-- Monthly revenue
SELECT
    YEAR(tran_date)  AS yr,
    MONTH(tran_date) AS mth,
    SUM(total_amt)   AS monthly_revenue
FROM transactions
GROUP BY YEAR(tran_date), MONTH(tran_date)
ORDER BY yr, mth;

-- Monthly revenue plus a running (cumulative) total across the year
SELECT *,
       SUM(monthly_revenue) OVER (PARTITION BY yr ORDER BY mth) AS cumulative_revenue
FROM (
    SELECT
        YEAR(tran_date)  AS yr,
        MONTH(tran_date) AS mth,
        SUM(total_amt)   AS monthly_revenue
    FROM transactions
    GROUP BY YEAR(tran_date), MONTH(tran_date)
) AS monthly;

-- Revenue by sales channel
SELECT store_type, SUM(total_amt) AS total_revenue
FROM transactions
GROUP BY store_type
ORDER BY total_revenue DESC;
