SELECT 
  p.id AS plan_id,
  p.owner_id,
  CASE 
    WHEN p.is_regular_savings = 1 THEN 'Savings'
    WHEN p.is_a_fund = 1 THEN 'Investment'
    ELSE 'Other'
  END AS type,
  MAX(s.transaction_date) AS last_transaction_date,
  DATEDIFF(CURDATE(), MAX(s.transaction_date)) AS inactivity_days
FROM plans_plan p
LEFT JOIN savings_savingsaccount s ON s.plan_id = p.id
WHERE p.status_id = 1
GROUP BY p.id, p.owner_id, p.is_regular_savings, p.is_a_fund
HAVING last_transaction_date IS NULL OR inactivity_days > 365;
