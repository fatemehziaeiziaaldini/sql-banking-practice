-- Day 1 (T-SQL, SQL Server, BankPractice)

-- Task 1: top 10 card payments
SELECT TOP 10 txn_id, txn_date, amount AS [Card Amount], merchant_category
FROM transactions
WHERE txn_type = 'card_payment'
ORDER BY [Card Amount] DESC, txn_id;

-- Task 2: savings or card accounts opened in 2024
SELECT account_id, product_type, opened_date
FROM accounts
WHERE product_type IN ('savings', 'card')
  AND opened_date BETWEEN '2024-01-01' AND '2024-12-31'
ORDER BY opened_date;

SELECT COUNT(*) AS n_accounts
FROM accounts
WHERE product_type IN ('savings', 'card')
  AND opened_date BETWEEN '2024-01-01' AND '2024-12-31';

-- Task 3: withdrawals or transfers between 500 and 1500, with 1% fee
SELECT TOP 5 txn_id, txn_type, amount, ROUND(amount * 1.01, 2) AS amount_with_fee
FROM transactions
WHERE txn_type IN ('withdrawal', 'transfer')
  AND amount BETWEEN 500 AND 1500
ORDER BY amount DESC, txn_id;
