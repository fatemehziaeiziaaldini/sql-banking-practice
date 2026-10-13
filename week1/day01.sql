-- Day 1: SELECT, WHERE, ORDER BY, LIMIT, DISTINCT, NULL
-- Dataset: synthetic banking practice data (customers, accounts, transactions, campaigns, campaign_contacts)

-- Task 1: savings accounts, newest first
SELECT account_id, product_type, opened_date
FROM accounts
WHERE product_type = 'savings'
ORDER BY opened_date DESC;

-- Task 2: top 5 card payments by amount
SELECT txn_id, txn_date, amount, merchant_category
FROM transactions
WHERE txn_type = 'card_payment'
ORDER BY amount DESC
LIMIT 5;

-- Task 3: open current accounts (closed_date is NULL means still open)
SELECT COUNT(*)
FROM accounts
WHERE product_type = 'current' AND closed_date IS NULL;
-- Result: 301

-- Note: "= NULL" never matches; use IS NULL / IS NOT NULL.
-- Note: WHERE closed_date <> '2024-01-01' also drops rows where closed_date is NULL.
