/*create table*/
CREATE TABLE e_commerce (
    Transaction_ID INT,
    User_Name VARCHAR(100),
    Age INT,
    Country VARCHAR(100),
    Product_Category VARCHAR(100),
    Purchase_Amount DECIMAL(10,2),
    Payment_Method VARCHAR(50),
    Transaction_Date DATE
);
select * from e_commerce;

/*checking data is loaded*/
SELECT COUNT(*) FROM e_commerce;

/*duplicate check*/
SELECT Transaction_ID, COUNT(*) AS count
FROM e_commerce
GROUP BY Transaction_ID
HAVING COUNT(*) > 1;

/*Null Values*/
SELECT 
  SUM(CASE WHEN User_Name IS NULL THEN 1 ELSE 0 END) AS missing_username,
  SUM(CASE WHEN Age IS NULL THEN 1 ELSE 0 END) AS missing_age,
  SUM(CASE WHEN Country IS NULL THEN 1 ELSE 0 END) AS missing_country,
  SUM(CASE WHEN Product_Category IS NULL THEN 1 ELSE 0 END) AS missing_category,
  SUM(CASE WHEN Purchase_Amount IS NULL THEN 1 ELSE 0 END) AS missing_amount,
  SUM(CASE WHEN Payment_Method IS NULL THEN 1 ELSE 0 END) AS missing_payment,
  SUM(CASE WHEN Transaction_Date IS NULL THEN 1 ELSE 0 END) AS missing_date
FROM e_commerce;

/*impossible/invalid values*/
SELECT * FROM e_commerce
WHERE Purchase_amount <=0 OR age >100;

select Distinct Country from e_commerce
order by Country;

select Distinct Payment_Method from e_commerce
order by Payment_Method;

select Distinct Product_Category from e_commerce
order by Product_Category;

/*QUERY1*/
select sum(Purchase_Amount) as Total_Revenue from e_commerce;

/*Query2*/
Select Count(Transaction_id) as total_transactions from e_commerce;

/*Query3*/
SELECT avg(Purchase_Amount) as average_purchase_amount from e_commerce;

/*Query4*/
SELECT Country, SUM(Purchase_Amount) as total_revenue_country from e_commerce
GROUP BY Country
ORDER BY total_revenue_country DESC;

/*Query5*/
SELECT Product_Category, SUM(Purchase_Amount) as total_category_revenue from e_commerce
GROUP BY Product_Category
ORDER BY total_category_revenue DESC;

/*query6*/
SELECT 
  CASE 
    WHEN Age BETWEEN 18 AND 25 THEN '18-25'
    WHEN Age BETWEEN 26 AND 35 THEN '26-35'
    WHEN Age BETWEEN 36 AND 45 THEN '36-45'
    WHEN Age BETWEEN 46 AND 60 THEN '46-60'
    WHEN Age BETWEEN 61 AND 70 THEN '61-70'
  END AS age_group,
  AVG(Purchase_Amount) AS avg_purchase FROM e_commerce
GROUP BY age_group
ORDER BY age_group;

/*query7*/
/*How many transactions happened each month*/
SELECT 
  EXTRACT(MONTH FROM Transaction_Date) AS month,
  COUNT(Transaction_ID) AS total_transactions FROM e_commerce
GROUP BY month
ORDER BY month;

/*query8*/
/*Which country has the highest number of customers*/
SELECT Country,
COUNT(DISTINCT User_Name) AS total_customers from e_commerce
GROUP BY Country
ORDER BY total_customers DESC;

/*query9*/
/*Which country + product category combination generates the highest revenue?*/
SELECT country, Product_category, SUM(purchase_amount) as total_revenue from e_commerce
GROUP BY country, Product_category
ORDER BY total_revenue DESC
LIMIT 10;

/*query10*/
/*What is the month-over-month revenue growth trend?*/
SELECT 
  EXTRACT(MONTH FROM Transaction_Date) AS month,
  SUM(Purchase_Amount) AS total_revenue FROM e_commerce
GROUP BY month
ORDER BY month;

/*query11*/
/*Who are the top 10 customers by total spending?*/
SELECT User_Name, SUM(Purchase_Amount) AS total_spending FROM e_commerce
GROUP BY User_Name
ORDER BY total_spending DESC
LIMIT 10;

/*query12*/
/*Which payment method is most popular in each country?*/
SELECT Country, Payment_Method, usage_count
FROM (
  SELECT Country, Payment_Method, 
    COUNT(*) AS usage_count,
    RANK() OVER (PARTITION BY Country ORDER BY COUNT(*) DESC) AS rank FROM e_commerce
  GROUP BY Country, Payment_Method
) 
AS ranked_data
WHERE rank = 1;