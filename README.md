# DataAnalytics-Assessment

## 1. High-Value Customers with Multiple Products

**Goal**: Find users with both savings and investment plans, and sum their deposits.

**Approach**:  
Filtered `plans_plan` using `is_regular_savings` and `is_a_fund`. Joined with `savings_savingsaccount` to count funded plans and total deposits. Returned only customers with both plan types.

---

## 2. Transaction Frequency Analysis

**Goal**: Categorize users by average monthly transaction volume.

**Approach**:  
Grouped transactions by `owner_id` and month, computed per-user monthly averages, then bucketed users into High (≥10), Medium (3–9), or Low (≤2) frequency.

---

## 3. Account Inactivity Alert

**Goal**: Identify active plans with no transactions in the past year.

**Approach**:  
Filtered active plans (`status_id = 1`), joined with transactions, calculated the last inflow date, and flagged those with over 365 days of inactivity or none.

---

## 4. Customer Lifetime Value (CLV)

**Goal**: Estimate user value using tenure and transaction data.

**Approach**:  
Used `date_joined` for tenure, counted transactions, and calculated CLV using the formula  
`(transactions / tenure) * 12 * avg_profit`. Adjusted for kobo and handled divide-by-zero safely.

---

## Challenges

- Interpreting product types required careful use of flags (`is_regular_savings`, `is_a_fund`).
- Transaction values were stored in kobo; normalized all financial outputs to naira.
- Handled edge cases like zero-month tenure and missing transaction data cleanly.

