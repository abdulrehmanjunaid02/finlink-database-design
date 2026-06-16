CREATE DATABASE IF NOT EXISTS finproject7401;
USE finproject7401;

-----------------------------------------------------------
-- TABLE 1: Region
-----------------------------------------------------------
CREATE TABLE Region (
    Region_ID INT PRIMARY KEY,
    Region_Name VARCHAR(100) NOT NULL,
    State VARCHAR(50) NOT NULL,
    Tier VARCHAR(50),
    Created_Date DATE NOT NULL
);

-----------------------------------------------------------
-- TABLE 2: Merchant
-----------------------------------------------------------
CREATE TABLE Merchant (
    Merchant_ID INT PRIMARY KEY,
    Merchant_Name VARCHAR(150) NOT NULL,
    Legal_Name VARCHAR(150),
    Tax_ID VARCHAR(20) UNIQUE,
    Address VARCHAR(255),
    City VARCHAR(100),
    State VARCHAR(50),
    Zip_Code VARCHAR(20),
    Category VARCHAR(50),
    KYC_Status VARCHAR(50),
    Onboard_Date DATE,
    Region_ID INT,
    FOREIGN KEY (Region_ID) REFERENCES Region(Region_ID)
);

-----------------------------------------------------------
-- TABLE 3: Customer
-----------------------------------------------------------
CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    City VARCHAR(100),
    State VARCHAR(50),
    Created_Date DATE,
    UNIQUE (Email, Phone)
);

-----------------------------------------------------------
-- TABLE 4: Product
-----------------------------------------------------------
CREATE TABLE Product (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(150),
    Product_Type VARCHAR(100),
    Description VARCHAR(255),
    Is_Active TINYINT(1)
);

-----------------------------------------------------------
-- TABLE 5: MerchantProduct (intersection)
-----------------------------------------------------------
CREATE TABLE MerchantProduct (
    Merchant_ID INT,
    Product_ID INT,
    Pricing_Model VARCHAR(50),
    MDR_Rate DECIMAL(5,2),
    Start_Date DATE,
    Is_Active TINYINT(1),
    PRIMARY KEY (Merchant_ID, Product_ID),
    FOREIGN KEY (Merchant_ID) REFERENCES Merchant(Merchant_ID),
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
);

-----------------------------------------------------------
-- TABLE 6: Agent
-----------------------------------------------------------
CREATE TABLE Agent (
    Agent_ID INT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Assigned_Region_ID INT,
    Status VARCHAR(50),
    FOREIGN KEY (Assigned_Region_ID) REFERENCES Region(Region_ID)
);

-----------------------------------------------------------
-- TABLE 7: Transaction
-----------------------------------------------------------
CREATE TABLE TransactionTable (
    Transaction_ID INT PRIMARY KEY,
    Transaction_Timestamp DATETIME NOT NULL,
    Amount DECIMAL(12,2),
    Payment_Method VARCHAR(50),
    Status VARCHAR(50),
    Merchant_ID INT,
    Customer_ID INT,
    Product_ID INT,
    Agent_ID INT NULL,
    Reference_No VARCHAR(100),
    FOREIGN KEY (Merchant_ID) REFERENCES Merchant(Merchant_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID),
    FOREIGN KEY (Agent_ID) REFERENCES Agent(Agent_ID)
);

-----------------------------------------------------------
-- TABLE 8: Settlement
-----------------------------------------------------------
CREATE TABLE Settlement (
    Settlement_ID INT PRIMARY KEY,
    Settlement_Date DATE,
    Total_Amount DECIMAL(12,2),
    Merchant_ID INT,
    Status VARCHAR(50),
    FOREIGN KEY (Merchant_ID) REFERENCES Merchant(Merchant_ID)
);

-----------------------------------------------------------
-- TABLE 9: SettlementTransaction (intersection)
-----------------------------------------------------------
CREATE TABLE SettlementTransaction (
    Settlement_ID INT,
    Transaction_ID INT,
    PRIMARY KEY (Settlement_ID, Transaction_ID),
    FOREIGN KEY (Settlement_ID) REFERENCES Settlement(Settlement_ID),
    FOREIGN KEY (Transaction_ID) REFERENCES TransactionTable(Transaction_ID)
);

-----------------------------------------------------------
-- TABLE 10: Loan
-----------------------------------------------------------
CREATE TABLE Loan (
    Loan_ID INT PRIMARY KEY,
    Merchant_ID INT,
    Approved_Amount DECIMAL(12,2),
    Disbursed_Amount DECIMAL(12,2),
    Interest_Rate DECIMAL(5,2),
    Start_Date DATE,
    End_Date DATE,
    Risk_Grade VARCHAR(10),
    Status VARCHAR(50),
    FOREIGN KEY (Merchant_ID) REFERENCES Merchant(Merchant_ID)
);

-----------------------------------------------------------
-- TABLE 11: LoanRepayment
-----------------------------------------------------------
CREATE TABLE LoanRepayment (
    Repayment_ID INT PRIMARY KEY,
    Loan_ID INT,
    Repayment_Date DATE,
    Amount_Paid DECIMAL(12,2),
    Method VARCHAR(50),
    Status VARCHAR(50),
    FOREIGN KEY (Loan_ID) REFERENCES Loan(Loan_ID)
);

-----------------------------------------------------------
-- TABLE 12: SupportTicket
-----------------------------------------------------------
CREATE TABLE SupportTicket (
    Ticket_ID INT PRIMARY KEY,
    Created_Date DATETIME,
    Issue_Type VARCHAR(100),
    Description VARCHAR(255),
    Status VARCHAR(50),
    Priority VARCHAR(50),
    Merchant_ID INT NULL,
    Customer_ID INT NULL,
    Transaction_ID INT NULL,
    Assigned_Agent_ID INT NULL,
    FOREIGN KEY (Merchant_ID) REFERENCES Merchant(Merchant_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Transaction_ID) REFERENCES TransactionTable(Transaction_ID),
    FOREIGN KEY (Assigned_Agent_ID) REFERENCES Agent(Agent_ID)
);





