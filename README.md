# Banking Customer & Transaction Management System

## Project Overview

The **Banking Customer & Transaction Management System** is an SQL-based database project developed using **MySQL**.

The project manages banking-related information such as customers, accounts, branches, transactions, loans, beneficiaries, and cards. It also performs business-oriented analysis using SQL queries to identify customer behavior, account activity, transaction patterns, branch performance, and loan insights.

---

## Project Objective

The main objective of this project is to design and analyze a relational banking database using MySQL and demonstrate practical SQL skills through business-focused analysis.

### Objectives

* Design a structured relational banking database
* Manage customer and account information
* Track banking transactions
* Analyze branch performance
* Analyze customer account activity
* Analyze loan information
* Perform advanced SQL analysis
* Generate business KPIs and insights
* Apply SQL concepts used in real-world data analysis

---

## Business Problem

A banking organization needs to analyze customer, account, transaction, branch, and loan data to understand:

* Customer account activity
* Transaction behavior
* Account balances
* Branch performance
* Loan exposure
* Digital transaction adoption
* Customer engagement
* Business performance indicators

This project provides SQL-based analysis to answer these business questions.

---

## Technologies Used

* **Database:** MySQL
* **SQL Version:** MySQL 8.0
* **Tool:** MySQL Workbench
* **Analysis:** SQL Queries

---

## Database Schema

The project contains the following tables:

| Table           | Description                         |
| --------------- | ----------------------------------- |
| `branches`      | Stores bank branch information      |
| `customers`     | Stores customer details             |
| `accounts`      | Stores customer account information |
| `transactions`  | Stores banking transaction records  |
| `loans`         | Stores customer loan information    |
| `beneficiaries` | Stores beneficiary information      |
| `cards`         | Stores customer card information    |

### Relationships

* Customer → Accounts
* Customer → Loans
* Branch → Accounts
* Account → Transactions
* Account → Cards
* Account → Beneficiaries

---

## Project Workflow

```text
Database Creation
        ↓
Table Creation
        ↓
Relationships & Foreign Keys
        ↓
Data Insertion
        ↓
Data Validation
        ↓
Basic SQL Analysis
        ↓
Customer Analysis
        ↓
Account Analysis
        ↓
Transaction Analysis
        ↓
Branch Analysis
        ↓
Loan Analysis
        ↓
Advanced SQL
        ↓
CTE Analysis
        ↓
Window Functions
        ↓
SQL Views
        ↓
Business KPI Analysis
        ↓
Business Insights
```

---

## SQL Concepts Used

The project demonstrates the following SQL concepts:

* SELECT
* WHERE
* ORDER BY
* GROUP BY
* HAVING
* Aggregate Functions
* CASE Statements
* Subqueries
* Correlated Subqueries
* EXISTS
* NOT EXISTS
* IN
* UNION ALL
* COALESCE
* IFNULL
* Common Table Expressions (CTEs)
* Window Functions
* PARTITION BY
* ROW_NUMBER
* RANK
* DENSE_RANK
* LAG
* LEAD
* Running Totals
* Growth Analysis
* SQL Views
* JOINs
* Foreign Keys

---

## Business Analysis

The project performs analysis across multiple business areas.

### Customer Analysis

* Customer account activity
* Customers with multiple accounts
* Customers without accounts
* Customers without loans
* High-value customers
* Customer transaction activity
* Customer engagement analysis

### Account Analysis

* Account type distribution
* Account balances
* Account status
* Branch-wise accounts
* Top account balances
* Account opening trends

### Transaction Analysis

* Transaction type analysis
* Transaction mode analysis
* Daily transaction activity
* Monthly transaction activity
* Highest-value transactions
* Customer transaction analysis
* Account transaction analysis

### Branch Analysis

* Branch account performance
* Branch transaction performance
* Branch loan performance
* Branch balance analysis
* Account type distribution by branch

### Loan Analysis

* Loan type distribution
* Loan status analysis
* Customer loan exposure
* Interest rate analysis
* Active loan analysis

---

## Advanced SQL Analysis

Advanced SQL techniques were used to solve business problems, including:

* Subquery-based analysis
* CTE-based analysis
* Customer ranking
* Account ranking
* Running totals
* Customer transaction growth
* Month-over-month analysis
* Top accounts by branch
* Above-average analysis

---

## SQL Views

The following analytical views were created:

* `customer_account_summary`
* `customer_transaction_summary`
* `branch_performance`
* `loan_performance`

These views simplify repeated business analysis and provide reusable analytical datasets.

---

## Business KPIs

The project calculates important banking KPIs such as:

* Total Customers
* Total Accounts
* Total Bank Balance
* Average Account Balance
* Total Transaction Volume
* Average Transaction Value
* Active Customer Rate
* Transaction Activity Rate
* Loan-to-Balance Ratio
* Active Loan Rate
* Loan Penetration
* Digital Transaction Rate
* Branch Performance
* Channel Transaction Volume
* Account Type Contribution

---

## Business Insights

The analysis identifies insights related to:

* High-value customers
* Customer engagement
* Low-activity accounts
* Multiple-account customers
* Branch performance
* Digital banking adoption
* Transaction behavior
* Loan exposure
* Account activity
* Card and beneficiary usage
* Customer segmentation

---

## Dataset

The project contains sample banking data covering:

* 20 Branches
* 50 Customers
* 70 Accounts
* 500 Transactions
* 30 Loans
* 50 Beneficiaries
* 60 Cards

**Total Records: 780**

---

## Project Documentation

Detailed project documentation is included separately and covers the complete project workflow, SQL analysis, KPIs, business insights, and conclusions.

---

## Author

**Johnson Kothapalli**

### Project Type

**SQL / Data Analyst Portfolio Project**

### Focus Areas

**MySQL | SQL Analytics | Data Analysis | Business Insights**
