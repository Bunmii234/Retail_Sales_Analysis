CREATE DATABASE Retail_Portfolio_DB;

-- Tell MySQL which database to work in
USE Retail_Portfolio_DB;

-- Create the structural 'container' for our Kaggle data
CREATE TABLE RETAIL_DATA (
    Transaction_ID INT PRIMARY KEY, -- Unique ID for every sale
    Date DATE,                      -- Date of purchase (YYYY-MM-DD)
    Customer_ID VARCHAR(50),        -- Text ID for the customer
    Gender VARCHAR(20),             -- Customer gender
    Age INT,                        -- Customer age (Whole number)
    Product_Category VARCHAR(50),   -- Category (Beauty, Electronics, etc.)
    Quantity INT,                   -- Number of items bought
    Price_Per_Unit INT,             -- Cost of one item
    Total_Amount INT                -- Total price (Qty x Price)
);

SELECT * FROM RETAIL_DATA;

/* ANALYSIS GOAL: 
   Identify which age groups spend the most money and 
   which product categories are their favorites.
*/ 

-- Select specific columns and create a 'calculated' age group column
CREATE TABLE RETAIL_DATA (
    Transaction_ID INT PRIMARY KEY,
    Date DATE,
    Customer_ID VARCHAR(50),
    Gender VARCHAR(20),
    Age INT,
    `Product Category` VARCHAR(50), -- Matching Kaggle CSV spacing
    Quantity INT,
    `Price per Unit` INT,           -- Matching Kaggle CSV spacing
    `Total Amount` INT              -- Matching Kaggle CSV spacing
);
-- Generate a summary of total sales and revenue broken down by age buckets and product types
SELECT 
    CASE 
        WHEN Age < 25 THEN '18-24'
        WHEN Age BETWEEN 25 AND 40 THEN '25-40'
        WHEN Age BETWEEN 41 AND 60 THEN '41-60'
        ELSE '60+' 
    END AS Age_Group,
    `Product Category`,
    COUNT(*) AS Total_Transactions,
    SUM(`Total Amount`) AS Total_Revenue
FROM RETAIL_DATA
GROUP BY Age_Group, `Product Category`
ORDER BY Age_Group, Total_Revenue DESC;