USE finproject7401;
/* 
Query #1
Purpose: List merchants with their region and KYC status.
*/
SELECT 
    m.Merchant_ID,
    m.Merchant_Name,
    m.KYC_Status,
    r.Region_Name,
    r.State
FROM Merchant m
JOIN Region r ON m.Region_ID = r.Region_ID;

/* 
Query #2
Purpose: Show total transaction count and revenue per merchant.
*/
SELECT 
    m.Merchant_Name,
    COUNT(t.Transaction_ID) AS Total_Transactions,
    SUM(t.Amount) AS Total_Revenue
FROM Merchant m
JOIN TransactionTable t ON m.Merchant_ID = t.Merchant_ID
GROUP BY m.Merchant_ID;

/* 
Query #3
Purpose: Show how many transactions each agent handled.
*/
SELECT 
    a.Agent_ID,
    CONCAT(a.First_Name, ' ', a.Last_Name) AS Agent_Name,
    COUNT(t.Transaction_ID) AS Transactions_Handled
FROM Agent a
LEFT JOIN TransactionTable t ON a.Agent_ID = t.Agent_ID
GROUP BY a.Agent_ID;

/*
Query #4
Purpose: Show top 10 customers based on total amount spent.
*/
SELECT 
    c.Customer_ID,
    CONCAT(c.First_Name, ' ', c.Last_Name) AS Customer_Name,
    SUM(t.Amount) AS Total_Spent
FROM Customer c
JOIN TransactionTable t ON c.Customer_ID = t.Customer_ID
GROUP BY c.Customer_ID
ORDER BY Total_Spent DESC
LIMIT 10;

/*
Query #5
Purpose: List all active merchant–product pricing relationships.
*/
SELECT 
    mp.Merchant_ID,
    mp.Product_ID,
    mp.Pricing_Model,
    mp.MDR_Rate,
    mp.Start_Date
FROM MerchantProduct mp
WHERE mp.Is_Active = 1;

/*
Query #6
Purpose: Count how many times each product was used in transactions.
*/
SELECT 
    p.Product_Name,
    COUNT(t.Transaction_ID) AS Usage_Count
FROM Product p
LEFT JOIN TransactionTable t ON p.Product_ID = t.Product_ID
GROUP BY p.Product_ID;

/*
Query #7
Purpose: Show settlement total amounts per merchant.
*/
SELECT 
    m.Merchant_Name,
    SUM(s.Total_Amount) AS Total_Settlement
FROM Settlement s
JOIN Merchant m ON s.Merchant_ID = m.Merchant_ID
GROUP BY m.Merchant_ID;

/*
Query #8
Purpose: Display number of loans by status category.
*/
SELECT 
    Status,
    COUNT(*) AS Loan_Count
FROM Loan
GROUP BY Status;

/*
Query #9
Purpose: Show total repayments made for each loan.
*/
SELECT 
    l.Loan_ID,
    SUM(r.Amount_Paid) AS Total_Repaid
FROM Loan l
LEFT JOIN LoanRepayment r ON l.Loan_ID = r.Loan_ID
GROUP BY l.Loan_ID;

/*
Query #10
Purpose: Count support tickets grouped by issue type and priority.
*/
SELECT 
    Issue_Type,
    Priority,
    COUNT(*) AS Ticket_Count
FROM SupportTicket
GROUP BY Issue_Type, Priority;

/*
Query #11
Purpose: Display each merchant’s transactions along with product names.
*/
SELECT 
    m.Merchant_Name,
    t.Transaction_ID,
    t.Transaction_Timestamp,
    p.Product_Name,
    t.Amount
FROM Merchant m
JOIN TransactionTable t ON m.Merchant_ID = t.Merchant_ID
JOIN Product p ON t.Product_ID = p.Product_ID;

/*
Query #12
Purpose: Show transactions linked to settlements.
*/
SELECT 
    st.Settlement_ID,
    st.Transaction_ID,
    t.Amount,
    t.Transaction_Timestamp
FROM SettlementTransaction st
JOIN TransactionTable t ON st.Transaction_ID = t.Transaction_ID;