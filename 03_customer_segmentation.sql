-- Customer Segmentation
-- Business question: How does the customer base break down by age, and
-- who are the highest-value customers?

-- Age-based segmentation: count and % of base in each bucket
SELECT
    CASE
        WHEN TIMESTAMPDIFF(YEAR, dob, CURDATE()) < 30 THEN 'Young'
        WHEN TIMESTAMPDIFF(YEAR, dob, CURDATE()) BETWEEN 30 AND 50 THEN 'Mid'
        ELSE 'Senior'
    END AS age_segment,
    COUNT(*) AS customer_count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM customer), 2) AS pct_of_base
FROM customer
GROUP BY age_segment;

-- Spend-based segmentation: split customers into 10 equal-sized groups
-- (deciles) by total spend. Decile 1 = lowest spenders, 10 = highest.
SELECT
    cust_id,
    total_spend,
    NTILE(10) OVER (ORDER BY total_spend) AS spend_decile
FROM (
    SELECT cust_id, SUM(total_amt) AS total_spend
    FROM transactions
    GROUP BY cust_id
) AS customer_spend;

-- Pareto check: % of total revenue coming from each decile
SELECT
    spend_decile,
    SUM(total_spend) AS decile_revenue,
    ROUND(SUM(total_spend) * 100.0 / SUM(SUM(total_spend)) OVER (), 2) AS pct_of_total_revenue
FROM (
    SELECT
        cust_id,
        total_spend,
        NTILE(10) OVER (ORDER BY total_spend) AS spend_decile
    FROM (
        SELECT cust_id, SUM(total_amt) AS total_spend
        FROM transactions
        GROUP BY cust_id
    ) AS customer_spend
) AS deciles
GROUP BY spend_decile
ORDER BY spend_decile DESC;
