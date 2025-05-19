SELECT 
  CASE 
    WHEN AVG(txns_per_month) >= 10 THEN 'High Frequency'
    WHEN AVG(txns_per_month) BETWEEN 3 AND 9 THEN 'Medium Frequency'
    ELSE 'Low Frequency'
  END AS frequency_category,
  COUNT(*) AS customer_count,
  ROUND(AVG(txns_per_month), 1) AS avg_transactions_per_month
FROM (
  SELECT 
    owner_id,
    COUNT(*) / COUNT(DISTINCT DATE_FORMAT(transaction_date, '%Y-%m')) AS txns_per_month
  FROM savings_savingsaccount
  GROUP BY owner_id
) AS monthly_stats
GROUP BY frequency_category
ORDER BY FIELD(frequency_category, 'High Frequency', 'Medium Frequency', 'Low Frequency');
