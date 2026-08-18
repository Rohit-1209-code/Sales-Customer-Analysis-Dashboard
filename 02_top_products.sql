-- Top Products Analysis
-- Business question: Which product categories drive the most revenue
-- and volume?

-- Revenue and units sold by product category
SELECT
    p.category_name,
    SUM(t.total_amt) AS revenue,
    SUM(t.qty)        AS units_sold
FROM transactions AS t
JOIN product_category AS p
  ON t.prod_cat_code = p.prod_cat_code
 AND t.prod_subcat_code = p.prod_subcat_code
GROUP BY p.category_name
ORDER BY revenue DESC;

-- Top 5 categories by revenue
SELECT
    p.category_name,
    SUM(t.total_amt) AS revenue
FROM transactions AS t
JOIN product_category AS p
  ON t.prod_cat_code = p.prod_cat_code
 AND t.prod_subcat_code = p.prod_subcat_code
GROUP BY p.category_name
ORDER BY revenue DESC
LIMIT 5;
