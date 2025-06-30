-- Total number of users
SELECT COUNT(*) AS total_users
FROM users;

-- Total revenue from paid transactions
SELECT SUM(ti.quantity * ti.unit_price) AS total_sales
FROM transactions t
JOIN transaction_items ti ON t.transaction_id = ti.transaction_id
WHERE t.payment_status = "paid";

-- Number of transactions per day
SELECT 
  DATE(t.transaction_date) AS transaction_day,  -- Extracts only the date part
  COUNT(*) AS number_of_transactions
FROM transactions t
GROUP BY DATE(t.transaction_date)
ORDER BY transaction_day;

-- Best-selling product (by quantity), product ID only
SELECT 
  ti.product_id,
  SUM(ti.quantity) AS total_quantity_sold
FROM transaction_items ti
GROUP BY ti.product_id
ORDER BY total_quantity_sold DESC
LIMIT 1;

-- Best-selling product with product name
-- Best-selling product with product name
SELECT 
  p.product_name,
  SUM(ti.quantity) AS total_quantity_sold
FROM transaction_items ti
JOIN products p ON ti.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_quantity_sold DESC
LIMIT 1;


-- Top customers by number of transactions
SELECT 
  u.full_name AS customer_name,
  COUNT(t.transaction_id) AS number_of_transactions
FROM transactions t
JOIN users u ON t.user_id = u.user_id
GROUP BY u.user_id, u.full_name
ORDER BY number_of_transactions DESC
LIMIT 5;

-- Top 5 Customers by Revenue
select users.full_name,users.user_id , 
sum(transaction_items.quantity*transaction_items.unit_price) as total_paid
from users
join transactions on users.user_id=transactions.user_id
join transaction_items on transactions.transaction_id=transaction_items.transaction_id
where transactions.payment_status='paid'
group by users.user_id,users.full_name
order by total_paid desc 
limit 5

-- Average number of products per transaction
SELECT AVG(product_count) AS average_product_per_transaction
FROM (
    SELECT
        transaction_id,
        SUM(quantity) AS product_count
    FROM transaction_items
    GROUP BY transaction_id
) AS sub;

-- Number of transactions per payment status (e.g., paid, pending, failed)
SELECT 
  payment_status, 
  COUNT(*) AS transaction_count
FROM transactions
GROUP BY payment_status;




