-- create database (only once)
CREATE DATABASE ccdb;

-- connect to db
\c ccdb;

-- create cc_detail table
DROP TABLE IF EXISTS cc_detail;

CREATE TABLE cc_detail (
    Client_Num INT,
    Card_Category VARCHAR(20),
    Annual_Fees INT,
    Activation_30_Days INT,
    Customer_Acq_Cost INT,
    Week_Start_Date DATE,
    Week_Num VARCHAR(20),
    Qtr VARCHAR(10),
    current_year INT,
    Credit_Limit DECIMAL(10,2),
    Total_Revolving_Bal INT,
    Total_Trans_Amt INT,
    Total_Trans_Ct INT,
    Avg_Utilization_Ratio DECIMAL(10,3),
    Use_Chip VARCHAR(10),
    Exp_Type VARCHAR(50),
    Interest_Earned DECIMAL(10,3),
    Delinquent_Acc VARCHAR(5)
);

-- create cust_detail table
DROP TABLE IF EXISTS cust_detail;

CREATE TABLE cust_detail (
    Client_Num INT,
    Customer_Age INT,
    Gender VARCHAR(5),
    Dependent_Count INT,
    Education_Level VARCHAR(50),
    Marital_Status VARCHAR(20),
    State_cd VARCHAR(50),
    Zipcode VARCHAR(20),
    Car_Owner VARCHAR(5),
    House_Owner VARCHAR(5),
    Personal_Loan VARCHAR(5),
    Contact VARCHAR(50),
    Customer_Job VARCHAR(50),
    Income INT,
    Cust_Satisfaction_Score INT
);

-- import data into cc_detail
COPY cc_detail
FROM 'D:\credit_card.csv'
DELIMITER ','
CSV HEADER;

-- import data into cust_detail
COPY cust_detail
FROM 'D:\customer.csv'
DELIMITER ','
CSV HEADER;

-- if you see error: "date/time field value out of range: '0'"
-- check csv for invalid dates (should be YYYY-MM-DD)
-- or set postgres datestyle like this:
SET datestyle TO 'ISO, DMY';

-- import additional week-53 data
COPY cc_detail
FROM 'D:\cc_add.csv'
DELIMITER ','
CSV HEADER;

COPY cust_detail
FROM 'D:\cust_add.csv'
DELIMITER ','
CSV HEADER;

-- quick sanity check
SELECT COUNT(*) FROM cc_detail;
SELECT COUNT(*) FROM cust_detail;