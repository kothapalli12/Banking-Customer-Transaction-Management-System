CREATE DATABASE banking_management_system;
use banking_management_system;
SELECT DATABASE();
CREATE TABLE branches (
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL,
    ifsc_code VARCHAR(20) UNIQUE NOT NULL
);
desc branches;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender VARCHAR(10),
    date_of_birth DATE,
    phone VARCHAR(15) UNIQUE,
    email VARCHAR(100) UNIQUE,
    city VARCHAR(50),
    state VARCHAR(50),
    registration_date DATE NOT NULL
);
DESC customers;
CREATE TABLE accounts (
    account_id BIGINT PRIMARY KEY,
    customer_id INT NOT NULL,
    branch_id INT NOT NULL,
    account_type VARCHAR(30) NOT NULL,
    opening_date DATE NOT NULL,
    balance DECIMAL(15,2) DEFAULT 0,
    account_status VARCHAR(20) DEFAULT 'Active',

    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),

    FOREIGN KEY (branch_id)
        REFERENCES branches(branch_id)
);
DESC accounts;
CREATE TABLE transactions (
    transaction_id BIGINT PRIMARY KEY,
    account_id BIGINT NOT NULL,
    transaction_date DATETIME NOT NULL,
    transaction_type VARCHAR(20) NOT NULL,
    amount DECIMAL(15,2) NOT NULL,
    transaction_mode VARCHAR(30),
    description VARCHAR(255),

    FOREIGN KEY (account_id)
        REFERENCES accounts(account_id)
);
DESC transactions;
CREATE TABLE loans (
    loan_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    loan_type VARCHAR(50) NOT NULL,
    loan_amount DECIMAL(15,2) NOT NULL,
    interest_rate DECIMAL(5,2),
    loan_date DATE,
    loan_status VARCHAR(20),

    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);
DESC loans;
CREATE TABLE beneficiaries (
    beneficiary_id INT PRIMARY KEY,
    account_id BIGINT NOT NULL,
    beneficiary_name VARCHAR(100) NOT NULL,
    beneficiary_account_no BIGINT NOT NULL,
    bank_name VARCHAR(100),
    added_date DATE,

    FOREIGN KEY (account_id)
        REFERENCES accounts(account_id)
);
DESC beneficiaries;
CREATE TABLE cards (
    card_id INT PRIMARY KEY,
    account_id BIGINT NOT NULL,
    card_type VARCHAR(20),
    card_network VARCHAR(30),
    issue_date DATE,
    expiry_date DATE,
    card_status VARCHAR(20),

    FOREIGN KEY (account_id)
        REFERENCES accounts(account_id)
);
DESC cards;
INSERT INTO branches
(branch_id, branch_name, city, state, ifsc_code)
VALUES
(1, 'Hyderabad Main Branch', 'Hyderabad', 'Telangana', 'BNK01001'),
(2, 'Warangal Central Branch', 'Warangal', 'Telangana', 'BNK01002'),
(3, 'Nizamabad City Branch', 'Nizamabad', 'Telangana', 'BNK01003'),
(4, 'Bengaluru Main Branch', 'Bengaluru', 'Karnataka', 'BNK01004'),
(5, 'Mysuru Central Branch', 'Mysuru', 'Karnataka', 'BNK01005'),
(6, 'Chennai Main Branch', 'Chennai', 'Tamil Nadu', 'BNK01006'),
(7, 'Coimbatore City Branch', 'Coimbatore', 'Tamil Nadu', 'BNK01007'),
(8, 'Mumbai Main Branch', 'Mumbai', 'Maharashtra', 'BNK01008'),
(9, 'Pune Central Branch', 'Pune', 'Maharashtra', 'BNK01009'),
(10, 'New Delhi Main Branch', 'New Delhi', 'Delhi', 'BNK01010'),
(11, 'Ahmedabad City Branch', 'Ahmedabad', 'Gujarat', 'BNK01011'),
(12, 'Kolkata Main Branch', 'Kolkata', 'West Bengal', 'BNK01012'),
(13, 'Jaipur Central Branch', 'Jaipur', 'Rajasthan', 'BNK01013'),
(14, 'Kochi Main Branch', 'Kochi', 'Kerala', 'BNK01014'),
(15, 'Vijayawada City Branch', 'Vijayawada', 'Andhra Pradesh', 'BNK01015'),
(16, 'Visakhapatnam Main Branch', 'Visakhapatnam', 'Andhra Pradesh', 'BNK01016'),
(17, 'Lucknow Central Branch', 'Lucknow', 'Uttar Pradesh', 'BNK01017'),
(18, 'Indore City Branch', 'Indore', 'Madhya Pradesh', 'BNK01018'),
(19, 'Bhubaneswar Main Branch', 'Bhubaneswar', 'Odisha', 'BNK01019'),
(20, 'Ludhiana Central Branch', 'Ludhiana', 'Punjab', 'BNK01020');
SELECT * 
FROM branches;
INSERT INTO customers
(customer_id, first_name, last_name, gender, date_of_birth, phone, email, city, state, registration_date)
VALUES
(1, 'Rahul', 'Sharma', 'Male', '1995-04-12', '9000000001', 'rahul.sharma@gmail.com', 'Hyderabad', 'Telangana', '2022-01-15'),
(2, 'Priya', 'Reddy', 'Female', '1997-08-21', '9000000002', 'priya.reddy@gmail.com', 'Warangal', 'Telangana', '2022-02-10'),
(3, 'Arjun', 'Kumar', 'Male', '1992-11-05', '9000000003', 'arjun.kumar@gmail.com', 'Bengaluru', 'Karnataka', '2022-03-18'),
(4, 'Sneha', 'Patel', 'Female', '1998-02-14', '9000000004', 'sneha.patel@gmail.com', 'Ahmedabad', 'Gujarat', '2022-04-22'),
(5, 'Vikram', 'Singh', 'Male', '1990-06-30', '9000000005', 'vikram.singh@gmail.com', 'New Delhi', 'Delhi', '2022-05-11'),
(6, 'Ananya', 'Rao', 'Female', '1996-09-17', '9000000006', 'ananya.rao@gmail.com', 'Chennai', 'Tamil Nadu', '2022-06-09'),
(7, 'Karthik', 'Naidu', 'Male', '1994-01-25', '9000000007', 'karthik.naidu@gmail.com', 'Vijayawada', 'Andhra Pradesh', '2022-07-14'),
(8, 'Divya', 'Menon', 'Female', '1999-12-03', '9000000008', 'divya.menon@gmail.com', 'Kochi', 'Kerala', '2022-08-19'),
(9, 'Suresh', 'Iyer', 'Male', '1988-03-11', '9000000009', 'suresh.iyer@gmail.com', 'Coimbatore', 'Tamil Nadu', '2022-09-23'),
(10, 'Neha', 'Gupta', 'Female', '1995-07-28', '9000000010', 'neha.gupta@gmail.com', 'Pune', 'Maharashtra', '2022-10-12'),

(11, 'Rohit', 'Verma', 'Male', '1993-05-16', '9000000011', 'rohit.verma@gmail.com', 'Mumbai', 'Maharashtra', '2022-11-05'),
(12, 'Pooja', 'Desai', 'Female', '1997-10-09', '9000000012', 'pooja.desai@gmail.com', 'Mumbai', 'Maharashtra', '2022-12-17'),
(13, 'Manoj', 'Reddy', 'Male', '1989-02-26', '9000000013', 'manoj.reddy@gmail.com', 'Hyderabad', 'Telangana', '2023-01-08'),
(14, 'Lakshmi', 'Rao', 'Female', '1991-06-18', '9000000014', 'lakshmi.rao@gmail.com', 'Visakhapatnam', 'Andhra Pradesh', '2023-02-14'),
(15, 'Ajay', 'Shah', 'Male', '1996-04-07', '9000000015', 'ajay.shah@gmail.com', 'Jaipur', 'Rajasthan', '2023-03-21'),
(16, 'Swathi', 'Krishna', 'Female', '1998-11-22', '9000000016', 'swathi.krishna@gmail.com', 'Hyderabad', 'Telangana', '2023-04-13'),
(17, 'Naveen', 'Babu', 'Male', '1990-08-15', '9000000017', 'naveen.babu@gmail.com', 'Bengaluru', 'Karnataka', '2023-05-18'),
(18, 'Kavya', 'Reddy', 'Female', '1995-01-31', '9000000018', 'kavya.reddy@gmail.com', 'Warangal', 'Telangana', '2023-06-24'),
(19, 'Tarun', 'Joshi', 'Male', '1992-09-12', '9000000019', 'tarun.joshi@gmail.com', 'Indore', 'Madhya Pradesh', '2023-07-16'),
(20, 'Meena', 'Nair', 'Female', '1987-12-19', '9000000020', 'meena.nair@gmail.com', 'Kochi', 'Kerala', '2023-08-09'),

(21, 'Aditya', 'Mishra', 'Male', '1994-03-27', '9000000021', 'aditya.mishra@gmail.com', 'Lucknow', 'Uttar Pradesh', '2023-09-11'),
(22, 'Harini', 'Reddy', 'Female', '1999-05-05', '9000000022', 'harini.reddy@gmail.com', 'Hyderabad', 'Telangana', '2023-10-14'),
(23, 'Sanjay', 'Kumar', 'Male', '1986-07-23', '9000000023', 'sanjay.kumar@gmail.com', 'Chennai', 'Tamil Nadu', '2023-11-18'),
(24, 'Aishwarya', 'Iyer', 'Female', '1996-02-08', '9000000024', 'aishwarya.iyer@gmail.com', 'Bengaluru', 'Karnataka', '2023-12-03'),
(25, 'Ramesh', 'Patel', 'Male', '1985-10-17', '9000000025', 'ramesh.patel@gmail.com', 'Ahmedabad', 'Gujarat', '2024-01-12'),
(26, 'Shreya', 'Sharma', 'Female', '1998-06-26', '9000000026', 'shreya.sharma@gmail.com', 'Jaipur', 'Rajasthan', '2024-02-19'),
(27, 'Vijay', 'Rao', 'Male', '1991-11-14', '9000000027', 'vijay.rao@gmail.com', 'Visakhapatnam', 'Andhra Pradesh', '2024-03-08'),
(28, 'Nandini', 'Mehta', 'Female', '1997-04-29', '9000000028', 'nandini.mehta@gmail.com', 'Pune', 'Maharashtra', '2024-04-15'),
(29, 'Prakash', 'Das', 'Male', '1989-08-03', '9000000029', 'prakash.das@gmail.com', 'Kolkata', 'West Bengal', '2024-05-21'),
(30, 'Riya', 'Sen', 'Female', '2000-01-18', '9000000030', 'riya.sen@gmail.com', 'Kolkata', 'West Bengal', '2024-06-11'),

(31, 'Gopal', 'Reddy', 'Male', '1987-05-24', '9000000031', 'gopal.reddy@gmail.com', 'Nizamabad', 'Telangana', '2024-07-17'),
(32, 'Madhuri', 'Rao', 'Female', '1993-09-08', '9000000032', 'madhuri.rao@gmail.com', 'Hyderabad', 'Telangana', '2024-08-12'),
(33, 'Sunil', 'Khan', 'Male', '1990-12-27', '9000000033', 'sunil.khan@gmail.com', 'New Delhi', 'Delhi', '2024-09-19'),
(34, 'Deepika', 'Singh', 'Female', '1995-03-16', '9000000034', 'deepika.singh@gmail.com', 'Lucknow', 'Uttar Pradesh', '2024-10-07'),
(35, 'Mahesh', 'Naidu', 'Male', '1988-06-11', '9000000035', 'mahesh.naidu@gmail.com', 'Vijayawada', 'Andhra Pradesh', '2024-11-14'),
(36, 'Sowmya', 'Krishnan', 'Female', '1996-10-25', '9000000036', 'sowmya.krishnan@gmail.com', 'Chennai', 'Tamil Nadu', '2024-12-02'),
(37, 'Varun', 'Kapoor', 'Male', '1993-01-09', '9000000037', 'varun.kapoor@gmail.com', 'Mumbai', 'Maharashtra', '2025-01-18'),
(38, 'Bhavana', 'Reddy', 'Female', '1999-07-13', '9000000038', 'bhavana.reddy@gmail.com', 'Warangal', 'Telangana', '2025-02-14'),
(39, 'Ravi', 'Shankar', 'Male', '1986-04-20', '9000000039', 'ravi.shankar@gmail.com', 'Mysuru', 'Karnataka', '2025-03-11'),
(40, 'Keerthi', 'Nair', 'Female', '1997-11-06', '9000000040', 'keerthi.nair@gmail.com', 'Kochi', 'Kerala', '2025-04-09'),

(41, 'Abhishek', 'Jain', 'Male', '1992-02-15', '9000000041', 'abhishek.jain@gmail.com', 'Indore', 'Madhya Pradesh', '2025-05-16'),
(42, 'Sangeetha', 'Rao', 'Female', '1994-08-28', '9000000042', 'sangeetha.rao@gmail.com', 'Hyderabad', 'Telangana', '2025-06-12'),
(43, 'Chandra', 'Mohan', 'Male', '1985-09-17', '9000000043', 'chandra.mohan@gmail.com', 'Bhubaneswar', 'Odisha', '2025-07-20'),
(44, 'Tejaswini', 'Patel', 'Female', '1998-12-22', '9000000044', 'tejaswini.patel@gmail.com', 'Ahmedabad', 'Gujarat', '2025-08-08'),
(45, 'Nikhil', 'Varma', 'Male', '1991-05-04', '9000000045', 'nikhil.varma@gmail.com', 'Pune', 'Maharashtra', '2025-09-13'),
(46, 'Anusha', 'Reddy', 'Female', '1996-03-30', '9000000046', 'anusha.reddy@gmail.com', 'Hyderabad', 'Telangana', '2025-10-18'),
(47, 'Srinivas', 'Rao', 'Male', '1984-07-12', '9000000047', 'srinivas.rao@gmail.com', 'Visakhapatnam', 'Andhra Pradesh', '2025-11-09'),
(48, 'Monika', 'Gupta', 'Female', '1999-02-24', '9000000048', 'monika.gupta@gmail.com', 'Jaipur', 'Rajasthan', '2025-12-15'),
(49, 'Rakesh', 'Yadav', 'Male', '1988-11-19', '9000000049', 'rakesh.yadav@gmail.com', 'New Delhi', 'Delhi', '2026-01-10'),
(50, 'Ishita', 'Roy', 'Female', '2000-06-07', '9000000050', 'ishita.roy@gmail.com', 'Kolkata', 'West Bengal', '2026-02-14');
SELECT * FROM customers;

SELECT COUNT(*) AS total_customers
FROM customers;
INSERT INTO accounts
(account_id, customer_id, branch_id, account_type, opening_date, balance, account_status)
VALUES
(10001, 1, 1, 'Savings', '2022-01-20', 85000.00, 'Active'),
(10002, 1, 1, 'Current', '2023-03-15', 145000.00, 'Active'),
(10003, 2, 2, 'Savings', '2022-02-15', 62000.00, 'Active'),
(10004, 2, 2, 'Salary', '2023-06-10', 78000.00, 'Active'),
(10005, 3, 4, 'Savings', '2022-03-25', 95000.00, 'Active'),
(10006, 4, 11, 'Savings', '2022-04-28', 54000.00, 'Active'),
(10007, 5, 10, 'Current', '2022-05-20', 210000.00, 'Active'),
(10008, 6, 6, 'Savings', '2022-06-15', 73000.00, 'Active'),
(10009, 7, 15, 'Salary', '2022-07-20', 68000.00, 'Active'),
(10010, 8, 14, 'Savings', '2022-08-25', 49000.00, 'Active'),
(10011, 9, 7, 'Savings', '2022-09-28', 87000.00, 'Active'),
(10012, 10, 9, 'Savings', '2022-10-18', 91000.00, 'Active'),
(10013, 11, 8, 'Current', '2022-11-15', 185000.00, 'Active'),
(10014, 12, 8, 'Savings', '2022-12-20', 57000.00, 'Active'),
(10015, 13, 1, 'Savings', '2023-01-15', 125000.00, 'Active'),
(10016, 14, 16, 'Salary', '2023-02-20', 83000.00, 'Active'),
(10017, 15, 13, 'Savings', '2023-03-28', 46000.00, 'Active'),
(10018, 16, 1, 'Savings', '2023-04-18', 99000.00, 'Active'),
(10019, 17, 4, 'Current', '2023-05-25', 172000.00, 'Active'),
(10020, 18, 2, 'Savings', '2023-06-28', 61000.00, 'Active'),
(10021, 19, 18, 'Savings', '2023-07-20', 76000.00, 'Active'),
(10022, 20, 14, 'Savings', '2023-08-15', 52000.00, 'Active'),
(10023, 21, 17, 'Current', '2023-09-20', 198000.00, 'Active'),
(10024, 22, 1, 'Savings', '2023-10-18', 68000.00, 'Active'),
(10025, 23, 6, 'Salary', '2023-11-25', 72000.00, 'Active'),
(10026, 24, 4, 'Savings', '2023-12-15', 89000.00, 'Active'),
(10027, 25, 11, 'Current', '2024-01-20', 235000.00, 'Active'),
(10028, 26, 13, 'Savings', '2024-02-25', 43000.00, 'Active'),
(10029, 27, 16, 'Savings', '2024-03-18', 97000.00, 'Active'),
(10030, 28, 9, 'Salary', '2024-04-20', 81000.00, 'Active'),
(10031, 29, 12, 'Savings', '2024-05-28', 59000.00, 'Active'),
(10032, 30, 12, 'Savings', '2024-06-18', 67000.00, 'Active'),
(10033, 31, 3, 'Current', '2024-07-25', 155000.00, 'Active'),
(10034, 32, 1, 'Savings', '2024-08-20', 74000.00, 'Active'),
(10035, 33, 10, 'Savings', '2024-09-15', 88000.00, 'Active'),
(10036, 34, 17, 'Salary', '2024-10-25', 69000.00, 'Active'),
(10037, 35, 15, 'Savings', '2024-11-20', 56000.00, 'Active'),
(10038, 36, 6, 'Current', '2024-12-18', 165000.00, 'Active'),
(10039, 37, 8, 'Savings', '2025-01-25', 92000.00, 'Active'),
(10040, 38, 2, 'Savings', '2025-02-20', 48000.00, 'Active'),
(10041, 39, 5, 'Savings', '2025-03-18', 71000.00, 'Active'),
(10042, 40, 14, 'Salary', '2025-04-25', 86000.00, 'Active'),
(10043, 41, 18, 'Current', '2025-05-20', 190000.00, 'Active'),
(10044, 42, 1, 'Savings', '2025-06-15', 63000.00, 'Active'),
(10045, 43, 19, 'Savings', '2025-07-25', 58000.00, 'Active'),
(10046, 44, 11, 'Savings', '2025-08-20', 77000.00, 'Active'),
(10047, 45, 9, 'Current', '2025-09-18', 220000.00, 'Active'),
(10048, 46, 1, 'Savings', '2025-10-25', 93000.00, 'Active'),
(10049, 47, 16, 'Salary', '2025-11-20', 75000.00, 'Active'),
(10050, 48, 13, 'Savings', '2025-12-15', 51000.00, 'Active'),
(10051, 49, 10, 'Savings', '2026-01-18', 82000.00, 'Active'),
(10052, 50, 12, 'Current', '2026-02-20', 175000.00, 'Active'),
(10053, 3, 4, 'Salary', '2024-01-10', 64000.00, 'Active'),
(10054, 5, 10, 'Savings', '2024-02-12', 115000.00, 'Active'),
(10055, 7, 15, 'Savings', '2024-03-15', 58000.00, 'Active'),
(10056, 9, 7, 'Current', '2024-04-18', 205000.00, 'Active'),
(10057, 11, 8, 'Savings', '2024-05-20', 73000.00, 'Active'),
(10058, 13, 1, 'Current', '2024-06-15', 185000.00, 'Active'),
(10059, 16, 1, 'Salary', '2024-07-18', 91000.00, 'Active'),
(10060, 20, 14, 'Savings', '2024-08-20', 66000.00, 'Active'),
(10061, 23, 6, 'Savings', '2024-09-15', 82000.00, 'Active'),
(10062, 27, 16, 'Current', '2024-10-20', 240000.00, 'Active'),
(10063, 30, 12, 'Savings', '2024-11-18', 55000.00, 'Active'),
(10064, 32, 1, 'Savings', '2025-01-12', 78000.00, 'Active'),
(10065, 35, 15, 'Current', '2025-02-18', 195000.00, 'Active'),
(10066, 37, 8, 'Savings', '2025-03-20', 88000.00, 'Active'),
(10067, 40, 14, 'Savings', '2025-04-15', 69000.00, 'Active'),
(10068, 42, 1, 'Current', '2025-05-18', 215000.00, 'Active'),
(10069, 46, 1, 'Savings', '2025-06-20', 97000.00, 'Active'),
(10070, 50, 12, 'Savings', '2025-07-15', 61000.00, 'Active');
SELECT * FROM accounts;

SELECT COUNT(*) AS total_accounts
FROM accounts;

INSERT INTO transactions
(transaction_id, account_id, transaction_date, transaction_type, amount, transaction_mode, description)
WITH RECURSIVE transaction_data AS
(
    SELECT 1 AS n

    UNION ALL

    SELECT n + 1
    FROM transaction_data
    WHERE n < 500
)
SELECT
    20000 + n AS transaction_id,

    10001 + MOD(n - 1, 70) AS account_id,

    DATE_ADD(
        '2025-01-01 09:00:00',
        INTERVAL (n * 2) HOUR
    ) AS transaction_date,

    CASE MOD(n, 4)
        WHEN 0 THEN 'Deposit'
        WHEN 1 THEN 'Withdrawal'
        WHEN 2 THEN 'Transfer'
        ELSE 'Payment'
    END AS transaction_type,

    ROUND(
        500 + MOD(n * 137, 45000),
        2
    ) AS amount,

    CASE MOD(n, 6)
        WHEN 0 THEN 'UPI'
        WHEN 1 THEN 'ATM'
        WHEN 2 THEN 'NEFT'
        WHEN 3 THEN 'IMPS'
        WHEN 4 THEN 'RTGS'
        ELSE 'Branch'
    END AS transaction_mode,

    CASE MOD(n, 4)
        WHEN 0 THEN 'Cash Deposit'
        WHEN 1 THEN 'ATM Withdrawal'
        WHEN 2 THEN 'Fund Transfer'
        ELSE 'Bill Payment'
    END AS description

FROM transaction_data;
SELECT COUNT(*) AS total_transactions
FROM transactions;
SELECT *
FROM transactions
LIMIT 10;
INSERT INTO loans
(loan_id, customer_id, loan_type, loan_amount, interest_rate, loan_date, loan_status)
VALUES
(30001, 1, 'Home Loan', 4500000.00, 8.25, '2022-02-15', 'Active'),
(30002, 2, 'Personal Loan', 500000.00, 11.50, '2022-04-20', 'Closed'),
(30003, 3, 'Car Loan', 900000.00, 9.25, '2022-06-10', 'Active'),
(30004, 4, 'Education Loan', 750000.00, 8.75, '2022-08-18', 'Closed'),
(30005, 5, 'Business Loan', 2500000.00, 10.25, '2022-10-12', 'Active'),
(30006, 6, 'Home Loan', 3800000.00, 8.50, '2023-01-15', 'Active'),
(30007, 7, 'Personal Loan', 350000.00, 12.00, '2023-03-22', 'Closed'),
(30008, 8, 'Car Loan', 1200000.00, 9.50, '2023-05-14', 'Active'),
(30009, 9, 'Business Loan', 1800000.00, 10.75, '2023-07-19', 'Active'),
(30010, 10, 'Education Loan', 600000.00, 8.25, '2023-09-10', 'Closed'),
(30011, 11, 'Home Loan', 5200000.00, 8.15, '2023-11-18', 'Active'),
(30012, 12, 'Personal Loan', 450000.00, 11.25, '2024-01-20', 'Active'),
(30013, 13, 'Car Loan', 1100000.00, 9.00, '2024-03-15', 'Closed'),
(30014, 14, 'Business Loan', 3000000.00, 10.50, '2024-04-22', 'Active'),
(30015, 15, 'Home Loan', 4200000.00, 8.40, '2024-05-17', 'Active'),
(30016, 16, 'Personal Loan', 700000.00, 11.75, '2024-06-20', 'Active'),
(30017, 17, 'Car Loan', 950000.00, 9.10, '2024-07-15', 'Closed'),
(30018, 18, 'Education Loan', 800000.00, 8.50, '2024-08-18', 'Active'),
(30019, 19, 'Business Loan', 2200000.00, 10.00, '2024-09-12', 'Active'),
(30020, 20, 'Home Loan', 3600000.00, 8.35, '2024-10-20', 'Active'),
(30021, 21, 'Personal Loan', 550000.00, 11.50, '2024-11-15', 'Closed'),
(30022, 22, 'Car Loan', 1300000.00, 9.25, '2024-12-18', 'Active'),
(30023, 23, 'Business Loan', 2700000.00, 10.25, '2025-01-20', 'Active'),
(30024, 24, 'Education Loan', 650000.00, 8.60, '2025-02-15', 'Active'),
(30025, 25, 'Home Loan', 4800000.00, 8.20, '2025-03-18', 'Active'),
(30026, 26, 'Personal Loan', 400000.00, 11.90, '2025-04-20', 'Closed'),
(30027, 27, 'Car Loan', 1050000.00, 9.15, '2025-05-15', 'Active'),
(30028, 28, 'Business Loan', 3200000.00, 10.40, '2025-06-18', 'Active'),
(30029, 29, 'Home Loan', 3900000.00, 8.30, '2025-07-20', 'Active'),
(30030, 30, 'Personal Loan', 600000.00, 11.25, '2025-08-15', 'Pending');
SELECT COUNT(*) AS total_loans
FROM loans;
SELECT *
FROM loans
LIMIT 10;
INSERT INTO beneficiaries
(beneficiary_id, account_id, beneficiary_name, beneficiary_account_no, bank_name, added_date)
VALUES
(40001, 10001, 'Amit Sharma', 800000001, 'HDFC Bank', '2023-01-10'),
(40002, 10002, 'Neha Verma', 800000002, 'ICICI Bank', '2023-02-15'),
(40003, 10003, 'Ravi Kumar', 800000003, 'SBI Bank', '2023-03-12'),
(40004, 10004, 'Pooja Reddy', 800000004, 'Axis Bank', '2023-04-18'),
(40005, 10005, 'Arun Patel', 800000005, 'Kotak Bank', '2023-05-20'),
(40006, 10006, 'Sneha Singh', 800000006, 'HDFC Bank', '2023-06-14'),
(40007, 10007, 'Kiran Rao', 800000007, 'ICICI Bank', '2023-07-19'),
(40008, 10008, 'Rahul Nair', 800000008, 'SBI Bank', '2023-08-11'),
(40009, 10009, 'Meena Iyer', 800000009, 'Axis Bank', '2023-09-16'),
(40010, 10010, 'Vijay Das', 800000010, 'Kotak Bank', '2023-10-21'),
(40011, 10011, 'Anil Gupta', 800000011, 'HDFC Bank', '2023-11-14'),
(40012, 10012, 'Kavya Menon', 800000012, 'ICICI Bank', '2023-12-18'),
(40013, 10013, 'Suresh Rao', 800000013, 'SBI Bank', '2024-01-15'),
(40014, 10014, 'Divya Shah', 800000014, 'Axis Bank', '2024-02-20'),
(40015, 10015, 'Manoj Kumar', 800000015, 'Kotak Bank', '2024-03-17'),
(40016, 10016, 'Priya Nair', 800000016, 'HDFC Bank', '2024-04-22'),
(40017, 10017, 'Rohit Mehta', 800000017, 'ICICI Bank', '2024-05-19'),
(40018, 10018, 'Swathi Rao', 800000018, 'SBI Bank', '2024-06-14'),
(40019, 10019, 'Ajay Patel', 800000019, 'Axis Bank', '2024-07-20'),
(40020, 10020, 'Lakshmi Devi', 800000020, 'Kotak Bank', '2024-08-15'),
(40021, 10021, 'Naveen Kumar', 800000021, 'HDFC Bank', '2024-09-18'),
(40022, 10022, 'Ananya Singh', 800000022, 'ICICI Bank', '2024-10-22'),
(40023, 10023, 'Vikas Sharma', 800000023, 'SBI Bank', '2024-11-17'),
(40024, 10024, 'Harini Reddy', 800000024, 'Axis Bank', '2024-12-20'),
(40025, 10025, 'Sanjay Rao', 800000025, 'Kotak Bank', '2025-01-15'),
(40026, 10026, 'Aishwarya Iyer', 800000026, 'HDFC Bank', '2025-02-18'),
(40027, 10027, 'Ramesh Patel', 800000027, 'ICICI Bank', '2025-03-21'),
(40028, 10028, 'Shreya Gupta', 800000028, 'SBI Bank', '2025-04-17'),
(40029, 10029, 'Vijay Rao', 800000029, 'Axis Bank', '2025-05-20'),
(40030, 10030, 'Nandini Shah', 800000030, 'Kotak Bank', '2025-06-14'),
(40031, 10031, 'Prakash Das', 800000031, 'HDFC Bank', '2025-07-18'),
(40032, 10032, 'Riya Sen', 800000032, 'ICICI Bank', '2025-08-22'),
(40033, 10033, 'Gopal Reddy', 800000033, 'SBI Bank', '2025-09-16'),
(40034, 10034, 'Madhuri Rao', 800000034, 'Axis Bank', '2025-10-19'),
(40035, 10035, 'Sunil Khan', 800000035, 'Kotak Bank', '2025-11-21'),
(40036, 10036, 'Deepika Singh', 800000036, 'HDFC Bank', '2025-12-15'),
(40037, 10037, 'Mahesh Naidu', 800000037, 'ICICI Bank', '2026-01-18'),
(40038, 10038, 'Sowmya Krishnan', 800000038, 'SBI Bank', '2026-02-20'),
(40039, 10039, 'Varun Kapoor', 800000039, 'Axis Bank', '2026-03-15'),
(40040, 10040, 'Bhavana Reddy', 800000040, 'Kotak Bank', '2026-04-19'),
(40041, 10041, 'Ravi Shankar', 800000041, 'HDFC Bank', '2026-05-16'),
(40042, 10042, 'Keerthi Nair', 800000042, 'ICICI Bank', '2026-05-22'),
(40043, 10043, 'Abhishek Jain', 800000043, 'SBI Bank', '2026-06-18'),
(40044, 10044, 'Sangeetha Rao', 800000044, 'Axis Bank', '2026-06-25'),
(40045, 10045, 'Chandra Mohan', 800000045, 'Kotak Bank', '2026-07-15'),
(40046, 10046, 'Tejaswini Patel', 800000046, 'HDFC Bank', '2026-07-20'),
(40047, 10047, 'Nikhil Varma', 800000047, 'ICICI Bank', '2026-08-12'),
(40048, 10048, 'Anusha Reddy', 800000048, 'SBI Bank', '2026-08-18'),
(40049, 10049, 'Srinivas Rao', 800000049, 'Axis Bank', '2026-09-01'),
(40050, 10050, 'Monika Gupta', 800000050, 'Kotak Bank', '2026-09-05');
SELECT COUNT(*) AS total_beneficiaries
FROM beneficiaries;
SELECT *
FROM beneficiaries
LIMIT 10;
INSERT INTO cards
(card_id, account_id, card_type, card_network, issue_date, expiry_date, card_status)
VALUES
(50001, 10001, 'Debit', 'Visa', '2022-02-01', '2027-01-31', 'Active'),
(50002, 10002, 'Credit', 'Mastercard', '2023-04-10', '2028-04-09', 'Active'),
(50003, 10003, 'Debit', 'RuPay', '2022-03-01', '2027-02-28', 'Active'),
(50004, 10004, 'Debit', 'Visa', '2023-07-01', '2028-06-30', 'Active'),
(50005, 10005, 'Credit', 'Mastercard', '2022-04-15', '2027-04-14', 'Active'),
(50006, 10006, 'Debit', 'RuPay', '2022-05-10', '2027-05-09', 'Active'),
(50007, 10007, 'Credit', 'Visa', '2022-06-20', '2027-06-19', 'Active'),
(50008, 10008, 'Debit', 'Mastercard', '2022-07-15', '2027-07-14', 'Active'),
(50009, 10009, 'Debit', 'RuPay', '2022-08-10', '2027-08-09', 'Active'),
(50010, 10010, 'Credit', 'Visa', '2022-09-20', '2027-09-19', 'Active'),
(50011, 10011, 'Debit', 'Mastercard', '2022-10-15', '2027-10-14', 'Active'),
(50012, 10012, 'Debit', 'Visa', '2022-11-10', '2027-11-09', 'Active'),
(50013, 10013, 'Credit', 'RuPay', '2022-12-15', '2027-12-14', 'Active'),
(50014, 10014, 'Debit', 'Mastercard', '2023-01-20', '2028-01-19', 'Active'),
(50015, 10015, 'Debit', 'Visa', '2023-02-15', '2028-02-14', 'Active'),
(50016, 10016, 'Credit', 'Mastercard', '2023-03-20', '2028-03-19', 'Active'),
(50017, 10017, 'Debit', 'RuPay', '2023-04-15', '2028-04-14', 'Active'),
(50018, 10018, 'Debit', 'Visa', '2023-05-20', '2028-05-19', 'Active'),
(50019, 10019, 'Credit', 'Mastercard', '2023-06-15', '2028-06-14', 'Active'),
(50020, 10020, 'Debit', 'RuPay', '2023-07-20', '2028-07-19', 'Active'),
(50021, 10021, 'Debit', 'Visa', '2023-08-15', '2028-08-14', 'Active'),
(50022, 10022, 'Credit', 'Mastercard', '2023-09-20', '2028-09-19', 'Active'),
(50023, 10023, 'Debit', 'RuPay', '2023-10-15', '2028-10-14', 'Active'),
(50024, 10024, 'Debit', 'Visa', '2023-11-20', '2028-11-19', 'Active'),
(50025, 10025, 'Credit', 'Mastercard', '2023-12-15', '2028-12-14', 'Active'),
(50026, 10026, 'Debit', 'RuPay', '2024-01-20', '2029-01-19', 'Active'),
(50027, 10027, 'Debit', 'Visa', '2024-02-15', '2029-02-14', 'Active'),
(50028, 10028, 'Credit', 'Mastercard', '2024-03-20', '2029-03-19', 'Active'),
(50029, 10029, 'Debit', 'RuPay', '2024-04-15', '2029-04-14', 'Active'),
(50030, 10030, 'Debit', 'Visa', '2024-05-20', '2029-05-19', 'Active'),
(50031, 10031, 'Credit', 'Mastercard', '2024-06-15', '2029-06-14', 'Active'),
(50032, 10032, 'Debit', 'RuPay', '2024-07-20', '2029-07-19', 'Active'),
(50033, 10033, 'Debit', 'Visa', '2024-08-15', '2029-08-14', 'Active'),
(50034, 10034, 'Credit', 'Mastercard', '2024-09-20', '2029-09-19', 'Active'),
(50035, 10035, 'Debit', 'RuPay', '2024-10-15', '2029-10-14', 'Active'),
(50036, 10036, 'Debit', 'Visa', '2024-11-20', '2029-11-19', 'Active'),
(50037, 10037, 'Credit', 'Mastercard', '2024-12-15', '2029-12-14', 'Active'),
(50038, 10038, 'Debit', 'RuPay', '2025-01-20', '2030-01-19', 'Active'),
(50039, 10039, 'Debit', 'Visa', '2025-02-15', '2030-02-14', 'Active'),
(50040, 10040, 'Credit', 'Mastercard', '2025-03-20', '2030-03-19', 'Active'),
(50041, 10041, 'Debit', 'RuPay', '2025-04-15', '2030-04-14', 'Active'),
(50042, 10042, 'Debit', 'Visa', '2025-05-20', '2030-05-19', 'Active'),
(50043, 10043, 'Credit', 'Mastercard', '2025-06-15', '2030-06-14', 'Active'),
(50044, 10044, 'Debit', 'RuPay', '2025-07-20', '2030-07-19', 'Active'),
(50045, 10045, 'Debit', 'Visa', '2025-08-15', '2030-08-14', 'Active'),
(50046, 10046, 'Credit', 'Mastercard', '2025-09-20', '2030-09-19', 'Active'),
(50047, 10047, 'Debit', 'RuPay', '2025-10-15', '2030-10-14', 'Active'),
(50048, 10048, 'Debit', 'Visa', '2025-11-20', '2030-11-19', 'Active'),
(50049, 10049, 'Credit', 'Mastercard', '2025-12-15', '2030-12-14', 'Active'),
(50050, 10050, 'Debit', 'RuPay', '2026-01-20', '2031-01-19', 'Active'),
(50051, 10051, 'Debit', 'Visa', '2026-02-15', '2031-02-14', 'Active'),
(50052, 10052, 'Credit', 'Mastercard', '2026-03-20', '2031-03-19', 'Active'),
(50053, 10053, 'Debit', 'RuPay', '2024-02-10', '2029-02-09', 'Active'),
(50054, 10054, 'Debit', 'Visa', '2024-03-15', '2029-03-14', 'Active'),
(50055, 10055, 'Credit', 'Mastercard', '2024-04-20', '2029-04-19', 'Active'),
(50056, 10056, 'Debit', 'RuPay', '2024-05-15', '2029-05-14', 'Active'),
(50057, 10057, 'Debit', 'Visa', '2024-06-20', '2029-06-19', 'Active'),
(50058, 10058, 'Credit', 'Mastercard', '2024-07-15', '2029-07-14', 'Active'),
(50059, 10059, 'Debit', 'RuPay', '2024-08-20', '2029-08-19', 'Active'),
(50060, 10060, 'Debit', 'Visa', '2024-09-15', '2029-09-14', 'Active');
SELECT COUNT(*) AS total_cards
FROM cards;
SELECT *
FROM cards
LIMIT 10;

SELECT 'branches' AS table_name, COUNT(*) AS total_records
FROM branches

UNION ALL

SELECT 'customers', COUNT(*)
FROM customers

UNION ALL

SELECT 'accounts', COUNT(*)
FROM accounts

UNION ALL

SELECT 'transactions', COUNT(*)
FROM transactions

UNION ALL

SELECT 'loans', COUNT(*)
FROM loans

UNION ALL

SELECT 'beneficiaries', COUNT(*)
FROM beneficiaries

UNION ALL

SELECT 'cards', COUNT(*)
FROM cards;

SELECT customer_id, COUNT(*) AS duplicate_count
FROM customers
GROUP BY customer_id
HAVING COUNT(*) > 1;

SELECT account_id, COUNT(*) AS duplicate_count
FROM accounts
GROUP BY account_id
HAVING COUNT(*) > 1;

SELECT transaction_id, COUNT(*) AS duplicate_count
FROM transactions
GROUP BY transaction_id
HAVING COUNT(*) > 1;

SELECT loan_id, COUNT(*) AS duplicate_count
FROM loans
GROUP BY loan_id
HAVING COUNT(*) > 1;

SELECT card_id, COUNT(*) AS duplicate_count
FROM cards
GROUP BY card_id
HAVING COUNT(*) > 1;

SELECT
    SUM(customer_id IS NULL) AS null_customer_id,
    SUM(first_name IS NULL) AS null_first_name,
    SUM(last_name IS NULL) AS null_last_name,
    SUM(gender IS NULL) AS null_gender,
    SUM(date_of_birth IS NULL) AS null_date_of_birth,
    SUM(phone IS NULL) AS null_phone,
    SUM(email IS NULL) AS null_email,
    SUM(city IS NULL) AS null_city,
    SUM(state IS NULL) AS null_state,
    SUM(registration_date IS NULL) AS null_registration_date
FROM customers;

SELECT
    SUM(account_id IS NULL) AS null_account_id,
    SUM(customer_id IS NULL) AS null_customer_id,
    SUM(branch_id IS NULL) AS null_branch_id,
    SUM(account_type IS NULL) AS null_account_type,
    SUM(opening_date IS NULL) AS null_opening_date,
    SUM(balance IS NULL) AS null_balance,
    SUM(account_status IS NULL) AS null_account_status
FROM accounts;

SELECT a.account_id, a.customer_id
FROM accounts a
LEFT JOIN customers c
    ON a.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

SELECT a.account_id, a.branch_id
FROM accounts a
LEFT JOIN branches b
    ON a.branch_id = b.branch_id
WHERE b.branch_id IS NULL;

SELECT t.transaction_id, t.account_id
FROM transactions t
LEFT JOIN accounts a
    ON t.account_id = a.account_id
WHERE a.account_id IS NULL;

SELECT l.loan_id, l.customer_id
FROM loans l
LEFT JOIN customers c
    ON l.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

SELECT c.card_id, c.account_id
FROM cards c
LEFT JOIN accounts a
    ON c.account_id = a.account_id
WHERE a.account_id IS NULL;

SELECT b.beneficiary_id, b.account_id
FROM beneficiaries b
LEFT JOIN accounts a
    ON b.account_id = a.account_id
WHERE a.account_id IS NULL;

SELECT *
FROM transactions
WHERE amount <= 0;

SELECT *
FROM accounts
WHERE balance < 0;

SELECT *
FROM loans
WHERE loan_amount <= 0;

SELECT COUNT(*) AS total_customers
FROM customers;

SELECT COUNT(*) AS total_accounts
FROM accounts;

SELECT 
    SUM(balance) AS total_bank_balance
FROM accounts;

SELECT 
    ROUND(AVG(balance), 2) AS average_account_balance
FROM accounts;

SELECT
    account_type,
    COUNT(*) AS total_accounts
FROM accounts
GROUP BY account_type
ORDER BY total_accounts DESC;

SELECT
    account_type,
    COUNT(*) AS total_accounts,
    SUM(balance) AS total_balance
FROM accounts
GROUP BY account_type
ORDER BY total_balance DESC;

SELECT
    gender,
    COUNT(*) AS total_customers
FROM customers
GROUP BY gender
ORDER BY total_customers DESC;

SELECT
    state,
    COUNT(*) AS total_customers
FROM customers
GROUP BY state
ORDER BY total_customers DESC;

SELECT
    city,
    COUNT(*) AS total_customers
FROM customers
GROUP BY city
ORDER BY total_customers DESC;

SELECT
    ROUND(SUM(amount), 2) AS total_transaction_amount
FROM transactions;

SELECT
    ROUND(AVG(amount), 2) AS average_transaction_amount
FROM transactions;

SELECT
    transaction_type,
    COUNT(*) AS total_transactions
FROM transactions
GROUP BY transaction_type
ORDER BY total_transactions DESC;

SELECT
    transaction_type,
    COUNT(*) AS total_transactions,
    ROUND(SUM(amount), 2) AS total_amount
FROM transactions
GROUP BY transaction_type
ORDER BY total_amount DESC;

SELECT
    transaction_mode,
    COUNT(*) AS total_transactions
FROM transactions
GROUP BY transaction_mode
ORDER BY total_transactions DESC;

SELECT
    loan_type,
    COUNT(*) AS total_loans
FROM loans
GROUP BY loan_type
ORDER BY total_loans DESC;

SELECT
    loan_type,
    COUNT(*) AS total_loans,
    ROUND(SUM(loan_amount), 2) AS total_loan_amount
FROM loans
GROUP BY loan_type
ORDER BY total_loan_amount DESC;

SELECT
    loan_status,
    COUNT(*) AS total_loans,
    ROUND(SUM(loan_amount), 2) AS total_loan_amount
FROM loans
GROUP BY loan_status
ORDER BY total_loans DESC;

SELECT
    branch_id,
    COUNT(*) AS total_accounts
FROM accounts
GROUP BY branch_id
ORDER BY total_accounts DESC;

SELECT
    branch_id,
    COUNT(*) AS total_accounts,
    ROUND(SUM(balance), 2) AS total_balance
FROM accounts
GROUP BY branch_id
ORDER BY total_balance DESC;

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    a.account_id,
    a.account_type,
    a.balance,
    a.account_status
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
ORDER BY c.customer_id;

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(a.account_id) AS total_accounts
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING COUNT(a.account_id) > 1
ORDER BY total_accounts DESC;

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(a.account_id) AS total_accounts,
    ROUND(SUM(a.balance), 2) AS total_balance
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY total_balance DESC;

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    c.city,
    c.state
FROM customers c
LEFT JOIN accounts a
    ON c.customer_id = a.customer_id
WHERE a.account_id IS NULL
ORDER BY c.customer_id;

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    l.loan_type,
    l.loan_amount,
    l.interest_rate,
    l.loan_status
FROM customers c
INNER JOIN loans l
    ON c.customer_id = l.customer_id
ORDER BY l.loan_amount DESC;

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    c.city,
    c.state
FROM customers c
LEFT JOIN loans l
    ON c.customer_id = l.customer_id
WHERE l.loan_id IS NULL
ORDER BY c.customer_id;

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(DISTINCT a.account_id) AS total_accounts,
    ROUND(COALESCE(SUM(DISTINCT a.balance), 0), 2) AS total_balance,
    COUNT(DISTINCT l.loan_id) AS total_loans,
    ROUND(COALESCE(SUM(DISTINCT l.loan_amount), 0), 2) AS total_loan_amount
FROM customers c
LEFT JOIN accounts a
    ON c.customer_id = a.customer_id
LEFT JOIN loans l
    ON c.customer_id = l.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY total_balance DESC;

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(t.transaction_id) AS total_transactions,
    ROUND(COALESCE(SUM(t.amount), 0), 2) AS total_transaction_amount
FROM customers c
LEFT JOIN accounts a
    ON c.customer_id = a.customer_id
LEFT JOIN transactions t
    ON a.account_id = t.account_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY total_transaction_amount DESC;

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(t.transaction_id) AS total_transactions,
    ROUND(SUM(t.amount), 2) AS total_transaction_amount
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
INNER JOIN transactions t
    ON a.account_id = t.account_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY total_transaction_amount DESC
LIMIT 10;

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    ROUND(SUM(a.balance), 2) AS total_balance
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING SUM(a.balance) > 100000
ORDER BY total_balance DESC;

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(l.loan_id) AS total_loans,
    ROUND(SUM(l.loan_amount), 2) AS total_loan_amount
FROM customers c
INNER JOIN loans l
    ON c.customer_id = l.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING COUNT(l.loan_id) > 1
ORDER BY total_loans DESC, total_loan_amount DESC;

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(l.loan_id) AS total_loans,
    ROUND(SUM(l.loan_amount), 2) AS total_loan_amount,
    ROUND(AVG(l.interest_rate), 2) AS average_interest_rate
FROM customers c
INNER JOIN loans l
    ON c.customer_id = l.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY total_loan_amount DESC;

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(l.loan_id) AS active_loans,
    ROUND(SUM(l.loan_amount), 2) AS total_active_loan_amount
FROM customers c
INNER JOIN loans l
    ON c.customer_id = l.customer_id
WHERE l.loan_status = 'Active'
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY total_active_loan_amount DESC;

SELECT DISTINCT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    c.city,
    c.state
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
INNER JOIN loans l
    ON c.customer_id = l.customer_id
ORDER BY c.customer_id;

SELECT
    account_status,
    COUNT(*) AS total_accounts,
    ROUND(SUM(balance), 2) AS total_balance
FROM accounts
GROUP BY account_status
ORDER BY total_accounts DESC;

SELECT
    b.branch_name,
    a.account_type,
    COUNT(a.account_id) AS total_accounts
FROM branches b
INNER JOIN accounts a
    ON b.branch_id = a.branch_id
GROUP BY
    b.branch_name,
    a.account_type
ORDER BY
    b.branch_name,
    total_accounts DESC;
    
    SELECT
    a.account_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    a.account_type,
    ROUND(a.balance, 2) AS balance,
    a.account_status
FROM accounts a
INNER JOIN customers c
    ON a.customer_id = c.customer_id
ORDER BY a.balance DESC
LIMIT 10;

SELECT
    account_type,
    COUNT(*) AS total_accounts,
    ROUND(AVG(balance), 2) AS average_balance,
    ROUND(SUM(balance), 2) AS total_balance
FROM accounts
GROUP BY account_type
ORDER BY average_balance DESC;

SELECT
    b.branch_id,
    b.branch_name,
    b.city,
    b.state,
    COUNT(a.account_id) AS total_accounts,
    ROUND(SUM(a.balance), 2) AS total_balance
FROM branches b
INNER JOIN accounts a
    ON b.branch_id = a.branch_id
GROUP BY
    b.branch_id,
    b.branch_name,
    b.city,
    b.state
ORDER BY total_balance DESC;

SELECT
    a.account_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    a.account_type,
    ROUND(a.balance, 2) AS balance
FROM accounts a
INNER JOIN customers c
    ON a.customer_id = c.customer_id
WHERE a.balance < 10000
ORDER BY a.balance ASC;

SELECT
    YEAR(opening_date) AS opening_year,
    COUNT(*) AS total_accounts
FROM accounts
GROUP BY YEAR(opening_date)
ORDER BY opening_year;

SELECT
    MONTH(opening_date) AS opening_month,
    COUNT(*) AS total_accounts
FROM accounts
GROUP BY MONTH(opening_date)
ORDER BY total_accounts DESC;

SELECT
    account_status,
    COUNT(*) AS total_accounts,
    ROUND(SUM(balance), 2) AS total_balance,
    ROUND(AVG(balance), 2) AS average_balance
FROM accounts
GROUP BY account_status
ORDER BY total_balance DESC;

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(a.account_id) AS total_accounts
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY total_accounts DESC
LIMIT 10;

SELECT
    transaction_type,
    COUNT(*) AS total_transactions,
    ROUND(SUM(amount), 2) AS total_amount,
    ROUND(AVG(amount), 2) AS average_amount
FROM transactions
GROUP BY transaction_type
ORDER BY total_amount DESC;

SELECT
    transaction_mode,
    COUNT(*) AS total_transactions,
    ROUND(SUM(amount), 2) AS total_amount,
    ROUND(AVG(amount), 2) AS average_amount
FROM transactions
GROUP BY transaction_mode
ORDER BY total_amount DESC;

SELECT
    DATE(transaction_date) AS transaction_day,
    COUNT(*) AS total_transactions,
    ROUND(SUM(amount), 2) AS total_amount
FROM transactions
GROUP BY DATE(transaction_date)
ORDER BY transaction_day;

SELECT
    YEAR(transaction_date) AS transaction_year,
    MONTH(transaction_date) AS transaction_month,
    COUNT(*) AS total_transactions,
    ROUND(SUM(amount), 2) AS total_amount
FROM transactions
GROUP BY
    YEAR(transaction_date),
    MONTH(transaction_date)
ORDER BY
    transaction_year,
    transaction_month;
    
    SELECT
    a.account_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(t.transaction_id) AS total_transactions,
    ROUND(SUM(t.amount), 2) AS total_transaction_amount
FROM accounts a
INNER JOIN customers c
    ON a.customer_id = c.customer_id
INNER JOIN transactions t
    ON a.account_id = t.account_id
GROUP BY
    a.account_id,
    c.first_name,
    c.last_name
ORDER BY total_transaction_amount DESC
LIMIT 10;

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(t.transaction_id) AS total_transactions
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
INNER JOIN transactions t
    ON a.account_id = t.account_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY total_transactions DESC
LIMIT 10;

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    t.transaction_type,
    COUNT(t.transaction_id) AS total_transactions,
    ROUND(SUM(t.amount), 2) AS total_amount
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
INNER JOIN transactions t
    ON a.account_id = t.account_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name,
    t.transaction_type
ORDER BY
    c.customer_id,
    total_amount DESC;
    
    SELECT
    t.transaction_id,
    t.account_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    t.transaction_type,
    t.amount,
    t.transaction_mode,
    t.transaction_date
FROM transactions t
INNER JOIN accounts a
    ON t.account_id = a.account_id
INNER JOIN customers c
    ON a.customer_id = c.customer_id
ORDER BY t.amount DESC
LIMIT 10;

SELECT
    a.account_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    a.account_type,
    COUNT(t.transaction_id) AS total_transactions,
    ROUND(SUM(t.amount), 2) AS total_transaction_amount,
    ROUND(AVG(t.amount), 2) AS average_transaction_amount
FROM accounts a
INNER JOIN customers c
    ON a.customer_id = c.customer_id
LEFT JOIN transactions t
    ON a.account_id = t.account_id
GROUP BY
    a.account_id,
    c.first_name,
    c.last_name,
    a.account_type
ORDER BY total_transaction_amount DESC;

SELECT
    a.account_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    a.account_type,
    a.balance,
    a.account_status
FROM accounts a
INNER JOIN customers c
    ON a.customer_id = c.customer_id
LEFT JOIN transactions t
    ON a.account_id = t.account_id
WHERE t.transaction_id IS NULL
ORDER BY a.account_id;

SELECT
    a.account_type,
    COUNT(t.transaction_id) AS total_transactions,
    ROUND(SUM(t.amount), 2) AS total_transaction_amount,
    ROUND(AVG(t.amount), 2) AS average_transaction_amount
FROM accounts a
INNER JOIN transactions t
    ON a.account_id = t.account_id
GROUP BY a.account_type
ORDER BY total_transaction_amount DESC;

SELECT
    transaction_type,
    transaction_mode,
    COUNT(*) AS total_transactions,
    ROUND(SUM(amount), 2) AS total_amount
FROM transactions
GROUP BY
    transaction_type,
    transaction_mode
ORDER BY
    transaction_type,
    total_transactions DESC;
    
    SELECT
    b.branch_id,
    b.branch_name,
    b.city,
    b.state,
    COUNT(DISTINCT a.customer_id) AS total_customers,
    COUNT(a.account_id) AS total_accounts,
    ROUND(SUM(a.balance), 2) AS total_balance
FROM branches b
LEFT JOIN accounts a
    ON b.branch_id = a.branch_id
GROUP BY
    b.branch_id,
    b.branch_name,
    b.city,
    b.state
ORDER BY total_balance DESC;

SELECT
    b.branch_id,
    b.branch_name,
    b.city,
    COUNT(t.transaction_id) AS total_transactions,
    ROUND(SUM(t.amount), 2) AS total_transaction_amount,
    ROUND(AVG(t.amount), 2) AS average_transaction_amount
FROM branches b
INNER JOIN accounts a
    ON b.branch_id = a.branch_id
INNER JOIN transactions t
    ON a.account_id = t.account_id
GROUP BY
    b.branch_id,
    b.branch_name,
    b.city
ORDER BY total_transaction_amount DESC;

SELECT
    b.branch_id,
    b.branch_name,
    b.city,
    COUNT(DISTINCT l.loan_id) AS total_loans,
    ROUND(SUM(l.loan_amount), 2) AS total_loan_amount
FROM branches b
INNER JOIN accounts a
    ON b.branch_id = a.branch_id
INNER JOIN loans l
    ON a.customer_id = l.customer_id
GROUP BY
    b.branch_id,
    b.branch_name,
    b.city
ORDER BY total_loan_amount DESC;

SELECT
    b.branch_name,
    a.account_type,
    COUNT(a.account_id) AS total_accounts,
    ROUND(SUM(a.balance), 2) AS total_balance
FROM branches b
INNER JOIN accounts a
    ON b.branch_id = a.branch_id
GROUP BY
    b.branch_name,
    a.account_type
ORDER BY
    b.branch_name,
    total_accounts DESC;
    
    SELECT
    b.branch_id,
    b.branch_name,
    b.city,
    b.state,
    COUNT(a.account_id) AS total_accounts,
    ROUND(SUM(a.balance), 2) AS total_balance
FROM branches b
INNER JOIN accounts a
    ON b.branch_id = a.branch_id
GROUP BY
    b.branch_id,
    b.branch_name,
    b.city,
    b.state
ORDER BY total_balance DESC
LIMIT 10;

SELECT
    b.branch_id,
    b.branch_name,
    COUNT(DISTINCT a.customer_id) AS total_customers,
    COUNT(a.account_id) AS total_accounts,
    ROUND(
        COUNT(a.account_id) / NULLIF(COUNT(DISTINCT a.customer_id), 0),
        2
    ) AS accounts_per_customer
FROM branches b
LEFT JOIN accounts a
    ON b.branch_id = a.branch_id
GROUP BY
    b.branch_id,
    b.branch_name
ORDER BY accounts_per_customer DESC;

SELECT
    loan_type,
    COUNT(*) AS total_loans,
    ROUND(SUM(loan_amount), 2) AS total_loan_amount,
    ROUND(AVG(loan_amount), 2) AS average_loan_amount,
    ROUND(AVG(interest_rate), 2) AS average_interest_rate
FROM loans
GROUP BY loan_type
ORDER BY total_loan_amount DESC;

SELECT
    loan_status,
    COUNT(*) AS total_loans,
    ROUND(SUM(loan_amount), 2) AS total_loan_amount,
    ROUND(AVG(loan_amount), 2) AS average_loan_amount
FROM loans
GROUP BY loan_status
ORDER BY total_loan_amount DESC;

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(l.loan_id) AS total_loans,
    ROUND(SUM(l.loan_amount), 2) AS total_loan_amount,
    ROUND(AVG(l.interest_rate), 2) AS average_interest_rate
FROM customers c
INNER JOIN loans l
    ON c.customer_id = l.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY total_loan_amount DESC
LIMIT 10;

SELECT
    interest_rate,
    COUNT(*) AS total_loans,
    ROUND(SUM(loan_amount), 2) AS total_loan_amount,
    ROUND(AVG(loan_amount), 2) AS average_loan_amount
FROM loans
GROUP BY interest_rate
ORDER BY interest_rate;

SELECT
    COUNT(*) AS active_loans,
    ROUND(SUM(loan_amount), 2) AS total_active_loan_amount,
    ROUND(AVG(loan_amount), 2) AS average_active_loan_amount,
    ROUND(AVG(interest_rate), 2) AS average_active_interest_rate
FROM loans
WHERE loan_status = 'Active';

SELECT
    c.state,
    COUNT(l.loan_id) AS total_loans,
    COUNT(DISTINCT c.customer_id) AS total_customers,
    ROUND(SUM(l.loan_amount), 2) AS total_loan_amount,
    ROUND(AVG(l.loan_amount), 2) AS average_loan_amount
FROM customers c
INNER JOIN loans l
    ON c.customer_id = l.customer_id
GROUP BY c.state
ORDER BY total_loan_amount DESC;

SELECT
    loan_type,
    loan_status,
    COUNT(*) AS total_loans,
    ROUND(SUM(loan_amount), 2) AS total_loan_amount
FROM loans
GROUP BY
    loan_type,
    loan_status
ORDER BY
    loan_type,
    total_loan_amount DESC;
    
    SELECT
    a.account_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    a.account_type,
    ROUND(a.balance, 2) AS balance
FROM accounts a
INNER JOIN customers c
    ON a.customer_id = c.customer_id
WHERE a.balance > (
    SELECT AVG(balance)
    FROM accounts
)
ORDER BY a.balance DESC;

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    ROUND(SUM(a.balance), 2) AS total_balance
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING SUM(a.balance) > (
    SELECT AVG(customer_balance)
    FROM (
        SELECT
            customer_id,
            SUM(balance) AS customer_balance
        FROM accounts
        GROUP BY customer_id
    ) AS customer_totals
)
ORDER BY total_balance DESC;

SELECT
    a.account_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    a.account_type,
    a.balance
FROM accounts a
INNER JOIN customers c
    ON a.customer_id = c.customer_id
WHERE a.balance = (
    SELECT MAX(balance)
    FROM accounts
    WHERE balance < (
        SELECT MAX(balance)
        FROM accounts
    )
);

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    l.loan_id,
    l.loan_type,
    l.loan_amount,
    l.loan_status
FROM customers c
INNER JOIN loans l
    ON c.customer_id = l.customer_id
WHERE l.loan_amount > (
    SELECT AVG(loan_amount)
    FROM loans
)
ORDER BY l.loan_amount DESC;

SELECT
    a.account_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(t.transaction_id) AS total_transactions
FROM accounts a
INNER JOIN customers c
    ON a.customer_id = c.customer_id
INNER JOIN transactions t
    ON a.account_id = t.account_id
GROUP BY
    a.account_id,
    c.first_name,
    c.last_name
HAVING COUNT(t.transaction_id) > (
    SELECT AVG(transaction_count)
    FROM (
        SELECT
            account_id,
            COUNT(*) AS transaction_count
        FROM transactions
        GROUP BY account_id
    ) AS account_transaction_summary
)
ORDER BY total_transactions DESC;

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    ROUND(SUM(t.amount), 2) AS total_transaction_amount
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
INNER JOIN transactions t
    ON a.account_id = t.account_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING SUM(t.amount) > (
    SELECT AVG(customer_transaction_amount)
    FROM (
        SELECT
            a.customer_id,
            SUM(t.amount) AS customer_transaction_amount
        FROM accounts a
        INNER JOIN transactions t
            ON a.account_id = t.account_id
        GROUP BY a.customer_id
    ) AS customer_transaction_summary
)
ORDER BY total_transaction_amount DESC;

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    c.city,
    c.state
FROM customers c
WHERE EXISTS (
    SELECT 1
    FROM loans l
    WHERE l.customer_id = c.customer_id
)
ORDER BY c.customer_id;

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    c.city,
    c.state
FROM customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM loans l
    WHERE l.customer_id = c.customer_id
)
ORDER BY c.customer_id;

SELECT
    customer_id,
    CONCAT(first_name, ' ', last_name) AS customer_name,
    city,
    state
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM loans
)
ORDER BY customer_id;

SELECT
    account_id,
    account_type,
    balance,
    CASE
        WHEN balance >= 100000 THEN 'High Balance'
        WHEN balance >= 50000 THEN 'Medium Balance'
        ELSE 'Low Balance'
    END AS balance_category
FROM accounts
ORDER BY balance DESC;

SELECT
    loan_id,
    customer_id,
    loan_type,
    loan_amount,
    CASE
        WHEN loan_amount >= 1000000 THEN 'High Loan'
        WHEN loan_amount >= 500000 THEN 'Medium Loan'
        ELSE 'Low Loan'
    END AS loan_category
FROM loans
ORDER BY loan_amount DESC;

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COALESCE(SUM(l.loan_amount), 0) AS total_loan_amount
FROM customers c
LEFT JOIN loans l
    ON c.customer_id = l.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_loan_amount DESC;

SELECT
    a.account_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    a.account_type,
    a.balance
FROM accounts a
INNER JOIN customers c
    ON a.customer_id = c.customer_id
WHERE a.balance > (
    SELECT AVG(a2.balance)
    FROM accounts a2
    WHERE a2.customer_id = a.customer_id
)
ORDER BY a.balance DESC;

SELECT
    a.account_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(t.transaction_id) AS total_transactions,
    IFNULL(SUM(t.amount), 0) AS total_transaction_amount
FROM accounts a
INNER JOIN customers c
    ON a.customer_id = c.customer_id
LEFT JOIN transactions t
    ON a.account_id = t.account_id
GROUP BY a.account_id, c.first_name, c.last_name
ORDER BY total_transaction_amount DESC;

WITH customer_account_summary AS (
    SELECT
        customer_id,
        COUNT(account_id) AS total_accounts,
        SUM(balance) AS total_balance
    FROM accounts
    GROUP BY customer_id
)
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    cas.total_accounts,
    ROUND(cas.total_balance, 2) AS total_balance
FROM customers c
INNER JOIN customer_account_summary cas
    ON c.customer_id = cas.customer_id
ORDER BY total_balance DESC;

WITH customer_transaction_summary AS (
    SELECT
        a.customer_id,
        COUNT(t.transaction_id) AS total_transactions,
        SUM(t.amount) AS total_transaction_amount
    FROM accounts a
    INNER JOIN transactions t
        ON a.account_id = t.account_id
    GROUP BY a.customer_id
)
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    cts.total_transactions,
    ROUND(cts.total_transaction_amount, 2) AS total_transaction_amount
FROM customers c
INNER JOIN customer_transaction_summary cts
    ON c.customer_id = cts.customer_id
ORDER BY total_transaction_amount DESC;

WITH account_summary AS (
    SELECT
        customer_id,
        COUNT(account_id) AS total_accounts,
        SUM(balance) AS total_balance
    FROM accounts
    GROUP BY customer_id
),
loan_summary AS (
    SELECT
        customer_id,
        COUNT(loan_id) AS total_loans,
        SUM(loan_amount) AS total_loan_amount
    FROM loans
    GROUP BY customer_id
)
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COALESCE(a.total_accounts, 0) AS total_accounts,
    ROUND(COALESCE(a.total_balance, 0), 2) AS total_balance,
    COALESCE(l.total_loans, 0) AS total_loans,
    ROUND(COALESCE(l.total_loan_amount, 0), 2) AS total_loan_amount
FROM customers c
LEFT JOIN account_summary a
    ON c.customer_id = a.customer_id
LEFT JOIN loan_summary l
    ON c.customer_id = l.customer_id
ORDER BY total_balance DESC;

WITH customer_balance AS (
    SELECT
        c.customer_id,
        CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
        SUM(a.balance) AS total_balance
    FROM customers c
    INNER JOIN accounts a
        ON c.customer_id = a.customer_id
    GROUP BY c.customer_id, c.first_name, c.last_name
)
SELECT
    customer_id,
    customer_name,
    ROUND(total_balance, 2) AS total_balance
FROM customer_balance
ORDER BY total_balance DESC
LIMIT 10;

SELECT
    a.account_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    a.account_type,
    a.balance,
    ROW_NUMBER() OVER (
        ORDER BY a.balance DESC
    ) AS balance_rank
FROM accounts a
INNER JOIN customers c
    ON a.customer_id = c.customer_id
ORDER BY balance_rank;

SELECT
    a.account_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    a.account_type,
    a.balance,
    RANK() OVER (
        ORDER BY a.balance DESC
    ) AS balance_rank
FROM accounts a
INNER JOIN customers c
    ON a.customer_id = c.customer_id
ORDER BY balance_rank;

SELECT
    a.account_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    a.account_type,
    a.balance,
    DENSE_RANK() OVER (
        ORDER BY a.balance DESC
    ) AS balance_rank
FROM accounts a
INNER JOIN customers c
    ON a.customer_id = c.customer_id
ORDER BY balance_rank;

SELECT
    account_id,
    account_type,
    balance,
    ROUND(
        SUM(balance) OVER (),
        2
    ) AS total_bank_balance
FROM accounts
ORDER BY balance DESC;

SELECT
    account_id,
    account_type,
    balance,
    ROUND(
        SUM(balance) OVER (
            PARTITION BY account_type
        ),
        2
    ) AS account_type_total_balance
FROM accounts
ORDER BY account_type, balance DESC;

SELECT
    account_id,
    account_type,
    balance,
    ROUND(
        AVG(balance) OVER (
            PARTITION BY account_type
        ),
        2
    ) AS account_type_average_balance
FROM accounts
ORDER BY account_type, balance DESC;

SELECT
    transaction_id,
    account_id,
    transaction_date,
    transaction_type,
    amount,
    LAG(amount) OVER (
        ORDER BY transaction_date
    ) AS previous_transaction_amount
FROM transactions
ORDER BY transaction_date;

SELECT
    transaction_id,
    account_id,
    transaction_date,
    transaction_type,
    amount,
    LEAD(amount) OVER (
        ORDER BY transaction_date
    ) AS next_transaction_amount
FROM transactions
ORDER BY transaction_date;

SELECT
    transaction_id,
    transaction_date,
    transaction_type,
    amount,
    ROUND(
        SUM(amount) OVER (
            ORDER BY transaction_date
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ),
        2
    ) AS running_total
FROM transactions
ORDER BY transaction_date;

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    t.transaction_id,
    t.amount,
    t.transaction_type,
    RANK() OVER (
        PARTITION BY c.customer_id
        ORDER BY t.amount DESC
    ) AS transaction_rank
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
INNER JOIN transactions t
    ON a.account_id = t.account_id
ORDER BY c.customer_id, transaction_rank;

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    t.transaction_id,
    t.transaction_date,
    t.amount,
    ROUND(
        SUM(t.amount) OVER (
            PARTITION BY c.customer_id
            ORDER BY t.transaction_date
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ),
        2
    ) AS customer_running_total
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
INNER JOIN transactions t
    ON a.account_id = t.account_id
ORDER BY c.customer_id, t.transaction_date;

WITH monthly_transactions AS (
    SELECT
        YEAR(transaction_date) AS transaction_year,
        MONTH(transaction_date) AS transaction_month,
        SUM(amount) AS total_amount
    FROM transactions
    GROUP BY
        YEAR(transaction_date),
        MONTH(transaction_date)
)
SELECT
    transaction_year,
    transaction_month,
    ROUND(total_amount, 2) AS total_amount,
    ROUND(
        LAG(total_amount) OVER (
            ORDER BY transaction_year, transaction_month
        ),
        2
    ) AS previous_month_amount
FROM monthly_transactions
ORDER BY transaction_year, transaction_month;

WITH monthly_transactions AS (
    SELECT
        YEAR(transaction_date) AS transaction_year,
        MONTH(transaction_date) AS transaction_month,
        SUM(amount) AS total_amount
    FROM transactions
    GROUP BY
        YEAR(transaction_date),
        MONTH(transaction_date)
),
monthly_comparison AS (
    SELECT
        transaction_year,
        transaction_month,
        total_amount,
        LAG(total_amount) OVER (
            ORDER BY transaction_year, transaction_month
        ) AS previous_month_amount
    FROM monthly_transactions
)
SELECT
    transaction_year,
    transaction_month,
    ROUND(total_amount, 2) AS total_amount,
    ROUND(previous_month_amount, 2) AS previous_month_amount,
    ROUND(
        ((total_amount - previous_month_amount)
        / NULLIF(previous_month_amount, 0)) * 100,
        2
    ) AS growth_percentage
FROM monthly_comparison
ORDER BY transaction_year, transaction_month;

WITH ranked_accounts AS (
    SELECT
        a.account_id,
        a.branch_id,
        CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
        a.account_type,
        a.balance,
        ROW_NUMBER() OVER (
            PARTITION BY a.branch_id
            ORDER BY a.balance DESC
        ) AS account_rank
    FROM accounts a
    INNER JOIN customers c
        ON a.customer_id = c.customer_id
)
SELECT
    account_id,
    branch_id,
    customer_name,
    account_type,
    balance,
    account_rank
FROM ranked_accounts
WHERE account_rank <= 3
ORDER BY branch_id, account_rank;

CREATE VIEW customer_account_summary AS
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(a.account_id) AS total_accounts,
    ROUND(SUM(a.balance), 2) AS total_balance
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name;
    
    CREATE VIEW customer_transaction_summary AS
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(t.transaction_id) AS total_transactions,
    ROUND(COALESCE(SUM(t.amount), 0), 2) AS total_transaction_amount,
    ROUND(COALESCE(AVG(t.amount), 0), 2) AS average_transaction_amount
FROM customers c
LEFT JOIN accounts a
    ON c.customer_id = a.customer_id
LEFT JOIN transactions t
    ON a.account_id = t.account_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name;
    
    CREATE VIEW branch_performance AS
SELECT
    b.branch_id,
    b.branch_name,
    b.city,
    b.state,
    COUNT(DISTINCT a.customer_id) AS total_customers,
    COUNT(a.account_id) AS total_accounts,
    ROUND(COALESCE(SUM(a.balance), 0), 2) AS total_balance
FROM branches b
LEFT JOIN accounts a
    ON b.branch_id = a.branch_id
GROUP BY
    b.branch_id,
    b.branch_name,
    b.city,
    b.state;
    
    CREATE VIEW loan_performance AS
SELECT
    loan_type,
    loan_status,
    COUNT(*) AS total_loans,
    ROUND(SUM(loan_amount), 2) AS total_loan_amount,
    ROUND(AVG(loan_amount), 2) AS average_loan_amount,
    ROUND(AVG(interest_rate), 2) AS average_interest_rate
FROM loans
GROUP BY
    loan_type,
    loan_status;
    
    SHOW FULL TABLES
WHERE TABLE_TYPE = 'VIEW';

SELECT
    (SELECT COUNT(*) FROM customers) AS total_customers,
    (SELECT COUNT(*) FROM accounts) AS total_accounts,
    (SELECT ROUND(SUM(balance), 2) FROM accounts) AS total_bank_balance,
    (SELECT COUNT(*) FROM transactions) AS total_transactions,
    (SELECT ROUND(SUM(amount), 2) FROM transactions) AS total_transaction_amount,
    (SELECT COUNT(*) FROM loans) AS total_loans,
    (SELECT ROUND(SUM(loan_amount), 2) FROM loans) AS total_loan_amount;
    
    SELECT
    COUNT(DISTINCT a.customer_id) AS customers_with_accounts,
    COUNT(*) AS total_customers,
    ROUND(
        COUNT(DISTINCT a.customer_id) * 100.0
        / COUNT(*),
        2
    ) AS active_customer_rate
FROM customers c
LEFT JOIN accounts a
    ON c.customer_id = a.customer_id;
    
    SELECT
    ROUND(
        SUM(a.balance) / COUNT(DISTINCT a.customer_id),
        2
    ) AS average_balance_per_customer
FROM accounts a;

SELECT
    COUNT(DISTINCT t_customer.customer_id) AS customers_with_transactions,
    COUNT(*) AS total_customers,
    ROUND(
        COUNT(DISTINCT t_customer.customer_id) * 100.0
        / COUNT(*),
        2
    ) AS transaction_activity_rate
FROM customers c
LEFT JOIN (
    SELECT DISTINCT
        a.customer_id
    FROM accounts a
    INNER JOIN transactions t
        ON a.account_id = t.account_id
) AS t_customer
    ON c.customer_id = t_customer.customer_id;
    
    SELECT
    COUNT(*) AS total_transactions,
    ROUND(SUM(amount), 2) AS total_transaction_amount,
    ROUND(AVG(amount), 2) AS average_transaction_value
FROM transactions;

SELECT
    ROUND(SUM(l.loan_amount), 2) AS total_loan_amount,
    ROUND((SELECT SUM(balance) FROM accounts), 2) AS total_account_balance,
    ROUND(
        SUM(l.loan_amount) * 100.0
        / NULLIF((SELECT SUM(balance) FROM accounts), 0),
        2
    ) AS loan_to_balance_ratio
FROM loans l;

SELECT
    COUNT(*) AS total_loans,
    SUM(
        CASE
            WHEN loan_status = 'Active' THEN 1
            ELSE 0
        END
    ) AS active_loans,
    ROUND(
        SUM(
            CASE
                WHEN loan_status = 'Active' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS active_loan_rate
FROM loans;

SELECT
    COUNT(DISTINCT l.customer_id) AS customers_with_loans,
    COUNT(*) AS total_customers,
    ROUND(
        COUNT(DISTINCT l.customer_id) * 100.0 / COUNT(*),
        2
    ) AS loan_penetration_rate
FROM customers c
LEFT JOIN loans l
    ON c.customer_id = l.customer_id;
    
    SELECT
    COUNT(*) AS total_transactions,
    SUM(
        CASE
            WHEN transaction_mode IN ('UPI', 'NEFT', 'IMPS', 'RTGS')
            THEN 1
            ELSE 0
        END
    ) AS digital_transactions,
    ROUND(
        SUM(
            CASE
                WHEN transaction_mode IN ('UPI', 'NEFT', 'IMPS', 'RTGS')
                THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS digital_transaction_rate
FROM transactions;

SELECT
    b.branch_id,
    b.branch_name,
    b.city,
    COUNT(a.account_id) AS total_accounts,
    ROUND(SUM(a.balance), 2) AS total_balance,
    ROUND(AVG(a.balance), 2) AS average_balance
FROM branches b
LEFT JOIN accounts a
    ON b.branch_id = a.branch_id
GROUP BY
    b.branch_id,
    b.branch_name,
    b.city
ORDER BY total_balance DESC;

SELECT
    transaction_mode,
    COUNT(*) AS total_transactions,
    ROUND(SUM(amount), 2) AS total_transaction_amount,
    ROUND(AVG(amount), 2) AS average_transaction_value
FROM transactions
GROUP BY transaction_mode
ORDER BY total_transactions DESC;

SELECT
    account_type,
    COUNT(*) AS total_accounts,
    ROUND(SUM(balance), 2) AS total_balance,
    ROUND(
        SUM(balance) * 100.0 /
        (SELECT SUM(balance) FROM accounts),
        2
    ) AS balance_contribution_percentage
FROM accounts
GROUP BY account_type
ORDER BY total_balance DESC;

WITH customer_balance AS (
    SELECT
        c.customer_id,
        CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
        SUM(a.balance) AS total_balance
    FROM customers c
    INNER JOIN accounts a
        ON c.customer_id = a.customer_id
    GROUP BY
        c.customer_id,
        c.first_name,
        c.last_name
)
SELECT
    customer_id,
    customer_name,
    ROUND(total_balance, 2) AS total_balance,
    CASE
        WHEN total_balance >= 200000 THEN 'Premium'
        WHEN total_balance >= 100000 THEN 'High Value'
        WHEN total_balance >= 50000 THEN 'Medium Value'
        ELSE 'Standard'
    END AS customer_segment
FROM customer_balance
ORDER BY total_balance DESC;

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(a.account_id) AS total_accounts,
    ROUND(SUM(a.balance), 2) AS total_balance
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY total_balance DESC
LIMIT 10;

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    ROUND(SUM(a.balance), 2) AS total_balance
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING SUM(a.balance) < 50000
ORDER BY total_balance ASC;

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(t.transaction_id) AS total_transactions,
    ROUND(SUM(t.amount), 2) AS total_transaction_amount
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
INNER JOIN transactions t
    ON a.account_id = t.account_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY total_transactions DESC
LIMIT 10;

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(l.loan_id) AS total_loans,
    ROUND(SUM(l.loan_amount), 2) AS total_loan_amount
FROM customers c
INNER JOIN loans l
    ON c.customer_id = l.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY total_loan_amount DESC
LIMIT 10;

SELECT
    b.branch_id,
    b.branch_name,
    b.city,
    b.state,
    COUNT(a.account_id) AS total_accounts,
    ROUND(SUM(a.balance), 2) AS total_balance
FROM branches b
INNER JOIN accounts a
    ON b.branch_id = a.branch_id
GROUP BY
    b.branch_id,
    b.branch_name,
    b.city,
    b.state
ORDER BY total_balance DESC
LIMIT 10;

SELECT
    b.branch_id,
    b.branch_name,
    b.city,
    b.state,
    COUNT(a.account_id) AS total_accounts,
    ROUND(COALESCE(SUM(a.balance), 0), 2) AS total_balance
FROM branches b
LEFT JOIN accounts a
    ON b.branch_id = a.branch_id
GROUP BY
    b.branch_id,
    b.branch_name,
    b.city,
    b.state
ORDER BY total_balance ASC
LIMIT 10;

SELECT
    transaction_mode,
    COUNT(*) AS total_transactions,
    ROUND(SUM(amount), 2) AS total_transaction_amount,
    ROUND(AVG(amount), 2) AS average_transaction_value
FROM transactions
GROUP BY transaction_mode
ORDER BY total_transactions DESC
LIMIT 1;

SELECT
    account_type,
    COUNT(*) AS total_accounts,
    ROUND(SUM(balance), 2) AS total_balance,
    ROUND(AVG(balance), 2) AS average_balance
FROM accounts
GROUP BY account_type
ORDER BY total_accounts DESC
LIMIT 1;

SELECT
    loan_type,
    COUNT(*) AS total_loans,
    ROUND(SUM(loan_amount), 2) AS total_loan_amount,
    ROUND(AVG(loan_amount), 2) AS average_loan_amount
FROM loans
GROUP BY loan_type
ORDER BY total_loans DESC
LIMIT 1;

SELECT
    YEAR(transaction_date) AS transaction_year,
    MONTH(transaction_date) AS transaction_month,
    COUNT(*) AS total_transactions,
    ROUND(SUM(amount), 2) AS total_transaction_amount
FROM transactions
GROUP BY
    YEAR(transaction_date),
    MONTH(transaction_date)
ORDER BY total_transaction_amount DESC;

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(DISTINCT a.account_id) AS total_accounts
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
LEFT JOIN transactions t
    ON a.account_id = t.account_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING COUNT(t.transaction_id) = 0
ORDER BY c.customer_id;

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(DISTINCT a.account_id) AS total_accounts,
    ROUND(SUM(a.balance), 2) AS total_balance
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
LEFT JOIN loans l
    ON c.customer_id = l.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING COUNT(l.loan_id) = 0
ORDER BY total_balance DESC;

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    ROUND(SUM(a.balance), 2) AS total_balance
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
LEFT JOIN loans l
    ON c.customer_id = l.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING
    SUM(a.balance) >= 100000
    AND COUNT(l.loan_id) = 0
ORDER BY total_balance DESC;

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    ROUND(SUM(a.balance), 2) AS total_balance,
    COUNT(t.transaction_id) AS total_transactions
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
LEFT JOIN transactions t
    ON a.account_id = t.account_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING
    SUM(a.balance) >= 100000
    AND COUNT(t.transaction_id) <= 5
ORDER BY total_balance DESC;

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(a.account_id) AS total_accounts,
    ROUND(SUM(a.balance), 2) AS total_balance
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING
    COUNT(a.account_id) > 1
    AND SUM(a.balance) < 50000
ORDER BY total_balance ASC;

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    ROUND(SUM(DISTINCT a.balance), 2) AS total_balance,
    COUNT(t.transaction_id) AS total_transactions,
    ROUND(SUM(t.amount), 2) AS total_transaction_amount
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
INNER JOIN transactions t
    ON a.account_id = t.account_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING
    SUM(DISTINCT a.balance) >= 100000
    AND COUNT(t.transaction_id) >= 10
ORDER BY total_balance DESC;

SELECT
    b.branch_id,
    b.branch_name,
    b.city,
    COUNT(a.account_id) AS total_accounts,
    ROUND(SUM(a.balance), 2) AS total_balance,
    ROUND(AVG(a.balance), 2) AS average_balance
FROM branches b
INNER JOIN accounts a
    ON b.branch_id = a.branch_id
GROUP BY
    b.branch_id,
    b.branch_name,
    b.city
HAVING
    COUNT(a.account_id) >= 4
    AND SUM(a.balance) < 200000
ORDER BY total_balance ASC;

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(t.transaction_id) AS total_transactions,
    SUM(
        CASE
            WHEN t.transaction_mode IN ('UPI', 'NEFT', 'IMPS', 'RTGS')
            THEN 1
            ELSE 0
        END
    ) AS digital_transactions,
    ROUND(
        SUM(
            CASE
                WHEN t.transaction_mode IN ('UPI', 'NEFT', 'IMPS', 'RTGS')
                THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(t.transaction_id),
        2
    ) AS digital_transaction_percentage
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
INNER JOIN transactions t
    ON a.account_id = t.account_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING
    COUNT(t.transaction_id) >= 5
ORDER BY digital_transaction_percentage DESC;

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    ROUND(SUM(a.balance), 2) AS total_balance,
    COUNT(t.transaction_id) AS total_transactions,
    SUM(
        CASE
            WHEN t.transaction_mode IN ('UPI', 'NEFT', 'IMPS', 'RTGS')
            THEN 1
            ELSE 0
        END
    ) AS digital_transactions,
    ROUND(
        SUM(
            CASE
                WHEN t.transaction_mode IN ('UPI', 'NEFT', 'IMPS', 'RTGS')
                THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(t.transaction_id),
        2
    ) AS digital_usage_percentage
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
INNER JOIN transactions t
    ON a.account_id = t.account_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING
    SUM(DISTINCT a.balance) >= 100000
    AND COUNT(t.transaction_id) >= 10
ORDER BY total_balance DESC;

SELECT
    b.branch_id,
    b.branch_name,
    b.city,
    COUNT(t.transaction_id) AS total_transactions,
    ROUND(SUM(t.amount), 2) AS total_transaction_amount,
    ROUND(AVG(t.amount), 2) AS average_transaction_value
FROM branches b
INNER JOIN accounts a
    ON b.branch_id = a.branch_id
INNER JOIN transactions t
    ON a.account_id = t.account_id
GROUP BY
    b.branch_id,
    b.branch_name,
    b.city
ORDER BY total_transactions DESC
LIMIT 10;

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(DISTINCT a.account_id) AS total_accounts,
    ROUND(SUM(a.balance), 2) AS total_balance
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
LEFT JOIN transactions t
    ON a.account_id = t.account_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING
    SUM(a.balance) >= 100000
    AND COUNT(t.transaction_id) = 0
ORDER BY total_balance DESC;

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(t.transaction_id) AS total_transactions,
    ROUND(SUM(t.amount), 2) AS total_transaction_amount,
    ROUND(AVG(t.amount), 2) AS average_transaction_value
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
INNER JOIN transactions t
    ON a.account_id = t.account_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING
    COUNT(t.transaction_id) <= 10
    AND SUM(t.amount) >= 100000
ORDER BY total_transaction_amount DESC;

SELECT
    b.branch_id,
    b.branch_name,
    b.city,
    COUNT(DISTINCT a.account_id) AS total_accounts,
    COUNT(t.transaction_id) AS total_transactions,
    ROUND(AVG(a.balance), 2) AS average_account_balance,
    ROUND(SUM(t.amount), 2) AS total_transaction_amount
FROM branches b
INNER JOIN accounts a
    ON b.branch_id = a.branch_id
INNER JOIN transactions t
    ON a.account_id = t.account_id
GROUP BY
    b.branch_id,
    b.branch_name,
    b.city
HAVING
    COUNT(t.transaction_id) >= 20
    AND AVG(a.balance) < 50000
ORDER BY total_transactions DESC;

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(DISTINCT a.account_id) AS total_accounts,
    COUNT(t.transaction_id) AS total_transactions,
    ROUND(SUM(t.amount), 2) AS total_transaction_amount
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
INNER JOIN transactions t
    ON a.account_id = t.account_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING
    COUNT(DISTINCT a.account_id) > 1
    AND COUNT(t.transaction_id) >= 10
ORDER BY total_transaction_amount DESC;

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    ROUND(SUM(DISTINCT a.balance), 2) AS total_balance,
    COUNT(DISTINCT l.loan_id) AS active_loans,
    ROUND(SUM(DISTINCT l.loan_amount), 2) AS total_active_loan_amount
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
INNER JOIN loans l
    ON c.customer_id = l.customer_id
WHERE l.loan_status = 'Active'
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING
    SUM(DISTINCT a.balance) >= 100000
ORDER BY total_balance DESC;

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(t.transaction_id) AS total_transactions,
    ROUND(SUM(t.amount), 2) AS total_transaction_amount
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
INNER JOIN transactions t
    ON a.account_id = t.account_id
LEFT JOIN loans l
    ON c.customer_id = l.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING
    COUNT(t.transaction_id) >= 10
    AND COUNT(l.loan_id) = 0
ORDER BY total_transaction_amount DESC;

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    ROUND(SUM(a.balance), 2) AS total_balance,
    COUNT(t.transaction_id) AS total_transactions,
    SUM(
        CASE
            WHEN t.transaction_mode IN ('UPI', 'NEFT', 'IMPS', 'RTGS')
            THEN 1
            ELSE 0
        END
    ) AS digital_transactions,
    ROUND(
        SUM(
            CASE
                WHEN t.transaction_mode IN ('UPI', 'NEFT', 'IMPS', 'RTGS')
                THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(t.transaction_id),
        2
    ) AS digital_usage_percentage
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
INNER JOIN transactions t
    ON a.account_id = t.account_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING
    SUM(DISTINCT a.balance) >= 100000
    AND COUNT(t.transaction_id) >= 5
    AND digital_usage_percentage < 50
ORDER BY total_balance DESC;

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(DISTINCT a.account_id) AS total_accounts,
    COUNT(DISTINCT l.loan_id) AS total_loans,
    COUNT(DISTINCT ca.card_id) AS total_cards,
    ROUND(SUM(DISTINCT a.balance), 2) AS total_balance
FROM customers c
LEFT JOIN accounts a
    ON c.customer_id = a.customer_id
LEFT JOIN loans l
    ON c.customer_id = l.customer_id
LEFT JOIN cards ca
    ON a.account_id = ca.account_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING
    COUNT(DISTINCT a.account_id) >= 1
    AND (
        COUNT(DISTINCT l.loan_id) > 0
        OR COUNT(DISTINCT ca.card_id) > 0
    )
ORDER BY total_balance DESC;

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(DISTINCT a.account_id) AS total_accounts,
    COUNT(DISTINCT ca.card_id) AS total_cards,
    COUNT(DISTINCT l.loan_id) AS total_loans,
    ROUND(SUM(DISTINCT a.balance), 2) AS total_balance,
    ROUND(SUM(DISTINCT l.loan_amount), 2) AS total_loan_amount
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
INNER JOIN cards ca
    ON a.account_id = ca.account_id
INNER JOIN loans l
    ON c.customer_id = l.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY total_balance DESC;

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(DISTINCT a.account_id) AS total_accounts,
    ROUND(SUM(a.balance), 2) AS total_balance
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
LEFT JOIN cards ca
    ON a.account_id = ca.account_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING COUNT(ca.card_id) = 0
ORDER BY total_balance DESC;

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(DISTINCT ca.card_id) AS total_cards,
    COUNT(DISTINCT a.account_id) AS total_accounts,
    ROUND(SUM(DISTINCT a.balance), 2) AS total_balance
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
INNER JOIN cards ca
    ON a.account_id = ca.account_id
LEFT JOIN loans l
    ON c.customer_id = l.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING COUNT(DISTINCT l.loan_id) = 0
ORDER BY total_balance DESC;

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(DISTINCT l.loan_id) AS total_loans,
    ROUND(SUM(DISTINCT l.loan_amount), 2) AS total_loan_amount,
    COUNT(DISTINCT a.account_id) AS total_accounts,
    ROUND(SUM(DISTINCT a.balance), 2) AS total_balance
FROM customers c
INNER JOIN loans l
    ON c.customer_id = l.customer_id
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
LEFT JOIN cards ca
    ON a.account_id = ca.account_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING COUNT(DISTINCT ca.card_id) = 0
ORDER BY total_loan_amount DESC;

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(DISTINCT a.account_id) AS total_accounts,
    ROUND(SUM(a.balance), 2) AS total_balance
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
LEFT JOIN transactions t
    ON a.account_id = t.account_id
LEFT JOIN loans l
    ON c.customer_id = l.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING
    COUNT(t.transaction_id) = 0
    AND COUNT(l.loan_id) = 0
ORDER BY total_balance DESC;

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(DISTINCT t.transaction_mode) AS channels_used,
    COUNT(t.transaction_id) AS total_transactions,
    ROUND(SUM(t.amount), 2) AS total_transaction_amount
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
INNER JOIN transactions t
    ON a.account_id = t.account_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING COUNT(DISTINCT t.transaction_mode) >= 4
ORDER BY channels_used DESC, total_transaction_amount DESC;

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(a.account_id) AS total_accounts,
    ROUND(SUM(a.balance), 2) AS total_balance,
    ROUND(AVG(a.balance), 2) AS average_account_balance
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING
    COUNT(a.account_id) >= 2
    AND SUM(a.balance) >= 100000
ORDER BY total_balance DESC;

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    ROUND(SUM(DISTINCT a.balance), 2) AS total_balance,
    COUNT(DISTINCT l.loan_id) AS total_loans,
    ROUND(SUM(DISTINCT l.loan_amount), 2) AS total_loan_amount
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
INNER JOIN loans l
    ON c.customer_id = l.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING
    SUM(DISTINCT l.loan_amount) >= 500000
    AND SUM(DISTINCT a.balance) < 50000
ORDER BY total_loan_amount DESC;

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    ROUND(SUM(a.balance), 2) AS total_balance,
    COUNT(l.loan_id) AS total_loans,
    SUM(
        CASE
            WHEN l.loan_status = 'Active' THEN 1
            ELSE 0
        END
    ) AS active_loans
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
LEFT JOIN loans l
    ON c.customer_id = l.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING
    SUM(a.balance) >= 100000
    AND SUM(
        CASE
            WHEN l.loan_status = 'Active' THEN 1
            ELSE 0
        END
    ) = 0
ORDER BY total_balance DESC;

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(DISTINCT a.account_id) AS total_accounts,
    COUNT(t.transaction_id) AS total_transactions,
    ROUND(SUM(t.amount), 2) AS total_transaction_amount,
    ROUND(AVG(t.amount), 2) AS average_transaction_value
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
INNER JOIN transactions t
    ON a.account_id = t.account_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING
    COUNT(DISTINCT a.account_id) > 1
    AND COUNT(t.transaction_id) >= 15
ORDER BY total_transaction_amount DESC;

SELECT
    b.branch_id,
    b.branch_name,
    b.city,
    COUNT(DISTINCT a.customer_id) AS total_customers,
    COUNT(a.account_id) AS total_accounts,
    ROUND(SUM(a.balance), 2) AS total_balance,
    ROUND(AVG(a.balance), 2) AS average_balance
FROM branches b
INNER JOIN accounts a
    ON b.branch_id = a.branch_id
GROUP BY
    b.branch_id,
    b.branch_name,
    b.city
HAVING
    COUNT(DISTINCT a.customer_id) >= 3
    AND SUM(a.balance) < 200000
ORDER BY total_customers DESC, total_balance ASC;

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(DISTINCT a.account_id) AS total_accounts,
    COUNT(DISTINCT ca.card_id) AS total_cards,
    COUNT(DISTINCT l.loan_id) AS total_loans,
    ROUND(SUM(DISTINCT a.balance), 2) AS total_balance
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
LEFT JOIN cards ca
    ON a.account_id = ca.account_id
LEFT JOIN loans l
    ON c.customer_id = l.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING
    COUNT(DISTINCT ca.card_id) = 0
    AND COUNT(DISTINCT l.loan_id) = 0
ORDER BY total_balance DESC;

SELECT
    b.branch_id,
    b.branch_name,
    b.city,
    COUNT(DISTINCT a.customer_id) AS total_customers,
    ROUND(SUM(a.balance), 2) AS total_balance,
    ROUND(
        SUM(a.balance) / COUNT(DISTINCT a.customer_id),
        2
    ) AS average_balance_per_customer
FROM branches b
INNER JOIN accounts a
    ON b.branch_id = a.branch_id
GROUP BY
    b.branch_id,
    b.branch_name,
    b.city
ORDER BY average_balance_per_customer DESC
LIMIT 10;

SELECT
    b.branch_id,
    b.branch_name,
    b.city,
    COUNT(DISTINCT l.loan_id) AS total_loans,
    ROUND(SUM(DISTINCT l.loan_amount), 2) AS total_loan_amount,
    ROUND(AVG(DISTINCT l.loan_amount), 2) AS average_loan_amount
FROM branches b
INNER JOIN accounts a
    ON b.branch_id = a.branch_id
INNER JOIN loans l
    ON a.customer_id = l.customer_id
GROUP BY
    b.branch_id,
    b.branch_name,
    b.city
ORDER BY average_loan_amount DESC
LIMIT 10;

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(DISTINCT ca.card_id) AS total_cards,
    COUNT(DISTINCT a.account_id) AS total_accounts,
    ROUND(SUM(DISTINCT a.balance), 2) AS total_balance
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
INNER JOIN cards ca
    ON a.account_id = ca.account_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING COUNT(DISTINCT ca.card_id) > 1
ORDER BY total_cards DESC, total_balance DESC;

SELECT
    card_status,
    COUNT(*) AS total_cards,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM cards),
        2
    ) AS card_status_percentage
FROM cards
GROUP BY card_status
ORDER BY total_cards DESC;

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(DISTINCT b.beneficiary_id) AS total_beneficiaries,
    COUNT(DISTINCT a.account_id) AS total_accounts,
    ROUND(SUM(DISTINCT a.balance), 2) AS total_balance
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
INNER JOIN beneficiaries b
    ON a.account_id = b.account_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING COUNT(DISTINCT b.beneficiary_id) > 1
ORDER BY total_beneficiaries DESC, total_balance DESC;

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(DISTINCT ca.card_id) AS total_cards,
    COUNT(t.transaction_id) AS total_transactions,
    ROUND(SUM(t.amount), 2) AS total_transaction_amount
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
INNER JOIN cards ca
    ON a.account_id = ca.account_id
INNER JOIN transactions t
    ON a.account_id = t.account_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING COUNT(t.transaction_id) >= 10
ORDER BY total_transaction_amount DESC;

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(DISTINCT l.loan_id) AS total_loans,
    ROUND(SUM(DISTINCT l.loan_amount), 2) AS total_loan_amount,
    COUNT(t.transaction_id) AS total_transactions,
    ROUND(SUM(t.amount), 2) AS total_transaction_amount
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
INNER JOIN loans l
    ON c.customer_id = l.customer_id
INNER JOIN transactions t
    ON a.account_id = t.account_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING COUNT(t.transaction_id) >= 10
ORDER BY total_transaction_amount DESC;

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(a.account_id) AS total_accounts,
    SUM(
        CASE
            WHEN a.account_status = 'Inactive' THEN 1
            ELSE 0
        END
    ) AS inactive_accounts,
    ROUND(SUM(a.balance), 2) AS total_balance
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING
    SUM(
        CASE
            WHEN a.account_status = 'Inactive' THEN 1
            ELSE 0
        END
    ) > 0
ORDER BY total_balance DESC;

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    MIN(a.opening_date) AS first_account_opening_date,
    COUNT(DISTINCT a.account_id) AS total_accounts,
    COUNT(t.transaction_id) AS total_transactions,
    ROUND(SUM(a.balance), 2) AS total_balance
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
LEFT JOIN transactions t
    ON a.account_id = t.account_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING
    MIN(a.opening_date) >= '2025-01-01'
    AND COUNT(t.transaction_id) <= 5
ORDER BY first_account_opening_date DESC;

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,

    COUNT(DISTINCT a.account_id) AS total_accounts,
    ROUND(SUM(DISTINCT a.balance), 2) AS total_balance,

    COUNT(DISTINCT t.transaction_id) AS total_transactions,

    COUNT(DISTINCT l.loan_id) AS total_loans,
    COUNT(DISTINCT ca.card_id) AS total_cards,
    COUNT(DISTINCT b.beneficiary_id) AS total_beneficiaries,

    (
        COUNT(DISTINCT a.account_id)
        + COUNT(DISTINCT t.transaction_id)
        + COUNT(DISTINCT l.loan_id)
        + COUNT(DISTINCT ca.card_id)
        + COUNT(DISTINCT b.beneficiary_id)
    ) AS engagement_score

FROM customers c

LEFT JOIN accounts a
    ON c.customer_id = a.customer_id

LEFT JOIN transactions t
    ON a.account_id = t.account_id

LEFT JOIN loans l
    ON c.customer_id = l.customer_id

LEFT JOIN cards ca
    ON a.account_id = ca.account_id

LEFT JOIN beneficiaries b
    ON a.account_id = b.account_id

GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name

ORDER BY engagement_score DESC
LIMIT 10;

SHOW FULL TABLES
WHERE TABLE_TYPE = 'VIEW';

select version();

show variables like 'port';
