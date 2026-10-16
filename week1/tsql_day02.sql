-- Day 2 (T-SQL, BankPractice) - notes pages 5-10
-- My own queries, run in SSMS 22 on SQL Server (localhost\MSSQLSERVER01)
USE BankPractice;
GO

-- Q1: distinct merchant categories, without groceries and without NULL
SELECT DISTINCT merchant_category
FROM transactions
WHERE merchant_category IS NOT NULL
  AND merchant_category != 'groceries'
ORDER BY merchant_category;

-- Q2: categories starting with h or t, clean name and length
SELECT DISTINCT merchant_category,
       REPLACE(merchant_category, '_', ' ') AS CleanName,
       LEN(merchant_category)               AS NameLength
FROM transactions
WHERE merchant_category LIKE 'h%' OR merchant_category LIKE 't%'
ORDER BY merchant_category;

-- Q3: card payments with label, amount band and amount + 10%
SELECT TOP 10 txn_id,
       CONCAT(txn_type, ' #', txn_id) AS Label,
       CASE WHEN amount < 100 THEN 'Low'
            WHEN amount BETWEEN 100 AND 1000 THEN 'Mid'
            ELSE 'High'
       END AS Band,
       ROUND(amount * 1.1, 2) AS amount_plus_10pct
FROM transactions
WHERE txn_type = 'card_payment'
ORDER BY txn_id;

-- Q4: open accounts, plus cards opened from 2025-01-01 (result: 620)
SELECT COUNT(*) AS N_Accounts
FROM accounts
WHERE (closed_date IS NULL AND product_type != 'card')
   OR (product_type = 'card' AND opened_date >= '2025-01-01');

-- Q5: status label, first 3 letters of segment, join year
SELECT TOP 10 customer_id,
       IIF(status = 'active', 'Active Customer', 'Closed Customer') AS Status_Label,
       LEFT(segment, 3)                                              AS Seg3,
       SUBSTRING(CAST(joined_date AS varchar), 1, 4)                 AS Join_Year
FROM customers
ORDER BY customer_id;
