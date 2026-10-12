# Sales & Customer Analysis Dashboard

SQL-driven analysis of sales trends, top-performing products, and customer segmentation on a retail transactions dataset, paired with Power BI for visualization.

## Business Questions

- How is revenue trending month over month, and what does the cumulative picture look like?
- Which product categories drive the most revenue and volume?
- How does the customer base break down by age, and who are the highest-value customers?

## Schema

- `customer` — customer_id, cust_name, dob, gender, city
- `transactions` — transaction_id, cust_id, tran_date, total_amt, store_type, prod_cat_code, prod_subcat_code, qty
- `product_category` — prod_cat_code, prod_subcat_code, category_name

## Files

| File | What it answers |
| ---- | --------------- |
| `01_sales_trends.sql` | Monthly revenue, cumulative revenue, revenue by sales channel |
| `02_top_products.sql` | Revenue and units sold by product category, top 5 products |
| `03_customer_segmentation.sql` | Age-based segments, spend-decile (Pareto) analysis |

## Tools

SQL (MySQL) for analysis · Power BI for the dashboard

## Author

Rohit Rajput — [GitHub](https://github.com/Rohit-1209-code) · [LinkedIn](www.linkedin.com/in/rohit-rajput-701641417)
