# FinLink Midwest Solutions — FinTech Database Design

> **Course:** MIS 7401 Database Development | Governors State University  
> **Tools:** MySQL · SQL · ERD Design · Data Normalization

---

## 📌 Project Overview

Designed and implemented a fully normalized relational database for a fictional FinTech company, FinLink Midwest Solutions, simulating real-world financial data infrastructure for merchants, customers, loans, and transactions.

---

## 🗄️ Database Schema

The database consists of 12 normalized MySQL tables:

| Table | Description |
|---|---|
| `Region` | Geographic region and tier classification |
| `Merchant` | Merchant profile, KYC status, and onboarding info |
| `Customer` | Customer demographics and contact data |
| `Product` | Financial products offered by FinLink |
| `MerchantProduct` | Merchant-product pricing relationships |
| `Agent` | Sales agents and their assigned regions |
| `TransactionTable` | Payment and transaction records |
| `Settlement` | Settlement totals per merchant |
| `SettlementTransaction` | Links settlements to individual transactions |
| `Loan` | Loan details, risk grade, and status |
| `LoanRepayment` | Repayment history per loan |
| `SupportTicket` | Customer and merchant support cases |

**Design principles applied:**
- 3rd Normal Form (3NF) normalization
- Composite primary keys where appropriate
- Foreign key constraints with referential integrity

---

## 🔍 Analytical SQL Queries

12 analytical queries covering:

- Merchant revenue totals and transaction counts
- Top 10 customers by total spend
- Agent performance by transactions handled
- Active merchant-product pricing relationships
- Product usage frequency
- Settlement totals per merchant
- Loan status breakdown
- Loan repayment totals
- Support ticket analysis by issue type and priority
- Transactions linked to settlements

---

## 🚀 How to Run

1. Install MySQL (v8.0+)
2. Open MySQL Workbench or CLI
3. Run `schema.sql` to create the database and tables
4. Run `data_dump.sql` to load sample data
5. Run `queries.sql` to execute the analytical queries

---

## 📊 Key Findings

- Identified top merchants by transaction volume using revenue aggregation
- Flagged high-risk loan accounts using repayment ratio analysis
- Segmented customers into spending tiers based on average transaction value
