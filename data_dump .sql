-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: finproject7401
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `agent`
--

DROP TABLE IF EXISTS `agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent` (
  `Agent_ID` int NOT NULL,
  `First_Name` varchar(50) DEFAULT NULL,
  `Last_Name` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Assigned_Region_ID` int DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Agent_ID`),
  KEY `Assigned_Region_ID` (`Assigned_Region_ID`),
  CONSTRAINT `agent_ibfk_1` FOREIGN KEY (`Assigned_Region_ID`) REFERENCES `region` (`Region_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agent`
--

LOCK TABLES `agent` WRITE;
/*!40000 ALTER TABLE `agent` DISABLE KEYS */;
INSERT INTO `agent` VALUES (401,'Nina','Brown','nina@finlink.com','312-555-5001',1,'Active'),(402,'David','Kim','david@finlink.com','312-555-5002',1,'Active'),(403,'Ravi','Singh','ravi@finlink.com','313-555-5003',3,'Active'),(404,'Lisa','Miller','lisa@finlink.com','515-555-5004',4,'Inactive'),(405,'Hannah','Clark','hannah@finlink.com','614-555-5005',5,'Active');
/*!40000 ALTER TABLE `agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `Customer_ID` int NOT NULL,
  `First_Name` varchar(50) DEFAULT NULL,
  `Last_Name` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `State` varchar(50) DEFAULT NULL,
  `Created_Date` date DEFAULT NULL,
  PRIMARY KEY (`Customer_ID`),
  UNIQUE KEY `Email` (`Email`,`Phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (201,'Alex','Johnson','alex.j@mail.com','312-555-1001','Chicago','Illinois','2023-02-01'),(202,'Priya','Patel','priya.p@mail.com','312-555-1002','Chicago','Illinois','2023-02-15'),(203,'Michael','Green','m.green@mail.com','313-555-2001','Detroit','Michigan','2023-03-01'),(204,'Sara','Lopez','sara.lopez@mail.com','515-555-3001','Des Moines','Iowa','2023-03-22'),(205,'Omar','Ali','omar.ali@mail.com','614-555-4001','Columbus','Ohio','2023-04-05');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan`
--

DROP TABLE IF EXISTS `loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan` (
  `Loan_ID` int NOT NULL,
  `Merchant_ID` int DEFAULT NULL,
  `Approved_Amount` decimal(12,2) DEFAULT NULL,
  `Disbursed_Amount` decimal(12,2) DEFAULT NULL,
  `Interest_Rate` decimal(5,2) DEFAULT NULL,
  `Start_Date` date DEFAULT NULL,
  `End_Date` date DEFAULT NULL,
  `Risk_Grade` varchar(10) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Loan_ID`),
  KEY `Merchant_ID` (`Merchant_ID`),
  CONSTRAINT `loan_ibfk_1` FOREIGN KEY (`Merchant_ID`) REFERENCES `merchant` (`Merchant_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan`
--

LOCK TABLES `loan` WRITE;
/*!40000 ALTER TABLE `loan` DISABLE KEYS */;
INSERT INTO `loan` VALUES (7001,101,20000.00,20000.00,12.50,'2023-06-01','2024-05-31','A','Active'),(7002,103,15000.00,12000.00,14.00,'2023-07-01','2024-06-30','B','Active'),(7003,104,10000.00,8000.00,15.00,'2023-05-15','2024-05-14','B','Closed'),(7004,105,30000.00,25000.00,13.50,'2023-08-01','2024-07-31','A','Approved'),(7005,102,12000.00,9000.00,16.00,'2023-09-01','2024-08-31','C','Active');
/*!40000 ALTER TABLE `loan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loanrepayment`
--

DROP TABLE IF EXISTS `loanrepayment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loanrepayment` (
  `Repayment_ID` int NOT NULL,
  `Loan_ID` int DEFAULT NULL,
  `Repayment_Date` date DEFAULT NULL,
  `Amount_Paid` decimal(12,2) DEFAULT NULL,
  `Method` varchar(50) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Repayment_ID`),
  KEY `Loan_ID` (`Loan_ID`),
  CONSTRAINT `loanrepayment_ibfk_1` FOREIGN KEY (`Loan_ID`) REFERENCES `loan` (`Loan_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loanrepayment`
--

LOCK TABLES `loanrepayment` WRITE;
/*!40000 ALTER TABLE `loanrepayment` DISABLE KEYS */;
INSERT INTO `loanrepayment` VALUES (8001,7001,'2023-07-05',1500.00,'ACH','Posted'),(8002,7001,'2023-08-05',1500.00,'ACH','Posted'),(8003,7002,'2023-08-10',1000.00,'AutoDebit','Posted'),(8004,7003,'2023-06-01',800.00,'ACH','Posted'),(8005,7003,'2023-07-01',800.00,'ACH','Posted');
/*!40000 ALTER TABLE `loanrepayment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchant`
--

DROP TABLE IF EXISTS `merchant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `merchant` (
  `Merchant_ID` int NOT NULL,
  `Merchant_Name` varchar(150) NOT NULL,
  `Legal_Name` varchar(150) DEFAULT NULL,
  `Tax_ID` varchar(20) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `State` varchar(50) DEFAULT NULL,
  `Zip_Code` varchar(20) DEFAULT NULL,
  `Category` varchar(50) DEFAULT NULL,
  `KYC_Status` varchar(50) DEFAULT NULL,
  `Onboard_Date` date DEFAULT NULL,
  `Region_ID` int DEFAULT NULL,
  PRIMARY KEY (`Merchant_ID`),
  UNIQUE KEY `Tax_ID` (`Tax_ID`),
  KEY `Region_ID` (`Region_ID`),
  CONSTRAINT `merchant_ibfk_1` FOREIGN KEY (`Region_ID`) REFERENCES `region` (`Region_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchant`
--

LOCK TABLES `merchant` WRITE;
/*!40000 ALTER TABLE `merchant` DISABLE KEYS */;
INSERT INTO `merchant` VALUES (101,'Windy City Grocers','Windy City Grocers LLC','IL-TAX-001','123 Main St','Chicago','Illinois','60601','Grocery','Approved','2023-02-10',1),(102,'Midwest Fashion Hub','Midwest Fashion Hub Inc','IL-TAX-002','45 State St','Chicago','Illinois','60602','Retail','Pending','2023-03-05',1),(103,'Detroit Deli','Detroit Deli Co.','MI-TAX-003','789 Woodward','Detroit','Michigan','48201','Restaurant','Approved','2023-04-18',3),(104,'Cornfield Hardware','Cornfield Hardware LLC','IA-TAX-004','22 Farm Rd','Des Moines','Iowa','50309','Hardware','Approved','2023-05-01',4),(105,'Buckeye Electronics','Buckeye Electronics LLC','OH-TAX-005','950 High St','Columbus','Ohio','43004','Electronics','Review','2023-06-12',5);
/*!40000 ALTER TABLE `merchant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchantproduct`
--

DROP TABLE IF EXISTS `merchantproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `merchantproduct` (
  `Merchant_ID` int NOT NULL,
  `Product_ID` int NOT NULL,
  `Pricing_Model` varchar(50) DEFAULT NULL,
  `MDR_Rate` decimal(5,2) DEFAULT NULL,
  `Start_Date` date DEFAULT NULL,
  `Is_Active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Merchant_ID`,`Product_ID`),
  KEY `Product_ID` (`Product_ID`),
  CONSTRAINT `merchantproduct_ibfk_1` FOREIGN KEY (`Merchant_ID`) REFERENCES `merchant` (`Merchant_ID`),
  CONSTRAINT `merchantproduct_ibfk_2` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchantproduct`
--

LOCK TABLES `merchantproduct` WRITE;
/*!40000 ALTER TABLE `merchantproduct` DISABLE KEYS */;
INSERT INTO `merchantproduct` VALUES (101,301,'Flat',1.80,'2023-02-15',1),(101,302,'Flat',2.10,'2023-02-20',1),(102,302,'Slab',2.50,'2023-03-10',1),(103,301,'Flat',1.70,'2023-04-20',1),(103,303,'Flat',2.00,'2023-04-25',1);
/*!40000 ALTER TABLE `merchantproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `Product_ID` int NOT NULL,
  `Product_Name` varchar(150) DEFAULT NULL,
  `Product_Type` varchar(100) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Is_Active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Product_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (301,'FinLink UPI Pay','UPI','Instant account-to-account payments',1),(302,'Card Gateway','Card','Credit/Debit card processing',1),(303,'FinLink Wallet','Wallet','Customer wallet',1),(304,'FinLink BNPL','BNPL','Buy Now Pay Later',1),(305,'ACH Payout','ACH','Bank payouts',1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `region` (
  `Region_ID` int NOT NULL,
  `Region_Name` varchar(100) NOT NULL,
  `State` varchar(50) NOT NULL,
  `Tier` varchar(50) DEFAULT NULL,
  `Created_Date` date NOT NULL,
  PRIMARY KEY (`Region_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` VALUES (1,'Chicago Metro','Illinois','Urban','2023-01-15'),(2,'Chicagoland Suburb','Illinois','Urban','2023-02-01'),(3,'Detroit Metro','Michigan','Urban','2023-03-10'),(4,'Des Moines Rural','Iowa','Rural','2023-04-05'),(5,'Columbus Metro','Ohio','Urban','2023-05-20');
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settlement`
--

DROP TABLE IF EXISTS `settlement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settlement` (
  `Settlement_ID` int NOT NULL,
  `Settlement_Date` date DEFAULT NULL,
  `Total_Amount` decimal(12,2) DEFAULT NULL,
  `Merchant_ID` int DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Settlement_ID`),
  KEY `Merchant_ID` (`Merchant_ID`),
  CONSTRAINT `settlement_ibfk_1` FOREIGN KEY (`Merchant_ID`) REFERENCES `merchant` (`Merchant_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settlement`
--

LOCK TABLES `settlement` WRITE;
/*!40000 ALTER TABLE `settlement` DISABLE KEYS */;
INSERT INTO `settlement` VALUES (6001,'2023-07-02',165.50,101,'Completed'),(6002,'2023-07-03',32.00,103,'Completed'),(6003,'2023-07-04',330.00,105,'Pending'),(6004,'2023-07-05',80.00,104,'Completed'),(6005,'2023-07-05',45.50,101,'Pending');
/*!40000 ALTER TABLE `settlement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settlementtransaction`
--

DROP TABLE IF EXISTS `settlementtransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settlementtransaction` (
  `Settlement_ID` int NOT NULL,
  `Transaction_ID` int NOT NULL,
  PRIMARY KEY (`Settlement_ID`,`Transaction_ID`),
  KEY `Transaction_ID` (`Transaction_ID`),
  CONSTRAINT `settlementtransaction_ibfk_1` FOREIGN KEY (`Settlement_ID`) REFERENCES `settlement` (`Settlement_ID`),
  CONSTRAINT `settlementtransaction_ibfk_2` FOREIGN KEY (`Transaction_ID`) REFERENCES `transactiontable` (`Transaction_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settlementtransaction`
--

LOCK TABLES `settlementtransaction` WRITE;
/*!40000 ALTER TABLE `settlementtransaction` DISABLE KEYS */;
INSERT INTO `settlementtransaction` VALUES (6001,5001),(6001,5002),(6004,5003),(6002,5004),(6003,5005);
/*!40000 ALTER TABLE `settlementtransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supportticket`
--

DROP TABLE IF EXISTS `supportticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supportticket` (
  `Ticket_ID` int NOT NULL,
  `Created_Date` datetime DEFAULT NULL,
  `Issue_Type` varchar(100) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `Priority` varchar(50) DEFAULT NULL,
  `Merchant_ID` int DEFAULT NULL,
  `Customer_ID` int DEFAULT NULL,
  `Transaction_ID` int DEFAULT NULL,
  `Assigned_Agent_ID` int DEFAULT NULL,
  PRIMARY KEY (`Ticket_ID`),
  KEY `Merchant_ID` (`Merchant_ID`),
  KEY `Customer_ID` (`Customer_ID`),
  KEY `Transaction_ID` (`Transaction_ID`),
  KEY `Assigned_Agent_ID` (`Assigned_Agent_ID`),
  CONSTRAINT `supportticket_ibfk_1` FOREIGN KEY (`Merchant_ID`) REFERENCES `merchant` (`Merchant_ID`),
  CONSTRAINT `supportticket_ibfk_2` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`),
  CONSTRAINT `supportticket_ibfk_3` FOREIGN KEY (`Transaction_ID`) REFERENCES `transactiontable` (`Transaction_ID`),
  CONSTRAINT `supportticket_ibfk_4` FOREIGN KEY (`Assigned_Agent_ID`) REFERENCES `agent` (`Agent_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supportticket`
--

LOCK TABLES `supportticket` WRITE;
/*!40000 ALTER TABLE `supportticket` DISABLE KEYS */;
INSERT INTO `supportticket` VALUES (9001,'2023-07-02 09:00:00','Payment Failure',NULL,'Open','High',101,201,5003,401);
/*!40000 ALTER TABLE `supportticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactiontable`
--

DROP TABLE IF EXISTS `transactiontable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactiontable` (
  `Transaction_ID` int NOT NULL,
  `Transaction_Timestamp` datetime NOT NULL,
  `Amount` decimal(12,2) DEFAULT NULL,
  `Payment_Method` varchar(50) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `Merchant_ID` int DEFAULT NULL,
  `Customer_ID` int DEFAULT NULL,
  `Product_ID` int DEFAULT NULL,
  `Agent_ID` int DEFAULT NULL,
  `Reference_No` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Transaction_ID`),
  KEY `Merchant_ID` (`Merchant_ID`),
  KEY `Customer_ID` (`Customer_ID`),
  KEY `Product_ID` (`Product_ID`),
  KEY `Agent_ID` (`Agent_ID`),
  CONSTRAINT `transactiontable_ibfk_1` FOREIGN KEY (`Merchant_ID`) REFERENCES `merchant` (`Merchant_ID`),
  CONSTRAINT `transactiontable_ibfk_2` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`),
  CONSTRAINT `transactiontable_ibfk_3` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`),
  CONSTRAINT `transactiontable_ibfk_4` FOREIGN KEY (`Agent_ID`) REFERENCES `agent` (`Agent_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactiontable`
--

LOCK TABLES `transactiontable` WRITE;
/*!40000 ALTER TABLE `transactiontable` DISABLE KEYS */;
INSERT INTO `transactiontable` VALUES (5001,'2023-07-01 10:15:00',45.50,'UPI','Success',101,201,301,401,'TXN001'),(5002,'2023-07-01 11:05:00',120.00,'Card','Success',101,202,302,402,'TXN002'),(5003,'2023-07-02 09:30:00',15.75,'UPI','Failed',103,203,301,403,'TXN003'),(5004,'2023-07-02 12:10:00',32.00,'Wallet','Success',103,203,303,403,'TXN004'),(5005,'2023-07-03 14:45:00',250.00,'Card','Success',105,205,302,405,'TXN005');
/*!40000 ALTER TABLE `transactiontable` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-05  1:33:55
