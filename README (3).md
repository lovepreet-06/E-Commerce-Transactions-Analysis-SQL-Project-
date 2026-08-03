# E-Commerce Transactions Analysis (SQL Project)

## 📌 Project Overview
This project analyzes an e-commerce transactions dataset to understand customer purchasing behavior across countries, product categories, age groups, and payment methods. The goal is to help business stakeholders identify revenue trends and make data-driven decisions on marketing, inventory, and regional strategy.

## 🎯 Business Problem
The company's management wants to understand customer purchasing behavior across different countries, product categories, and payment methods. They need to identify which customer segments and product categories generate the most revenue, and where sales are weak, so they can improve marketing strategy and increase overall sales.

## 📂 Dataset
- **Source:** Kaggle
- **Rows:** 50,000 transactions
- **Columns:** Transaction_ID, User_Name, Age, Country, Product_Category, Purchase_Amount, Payment_Method, Transaction_Date

## 🛠️ Tools Used
- **PostgreSQL** — database and query engine
- **pgAdmin** — database management tool
- **SQL** — data cleaning and analysis (joins, aggregations, window functions, CASE statements, subqueries)

## 🧹 Data Cleaning
Before analysis, the dataset was checked for common data quality issues:
- **Duplicate Transaction_IDs** — checked using `GROUP BY` + `HAVING`, none found
- **Missing (NULL) values** — checked across all 7 key columns, none found
- **Invalid values** — checked for negative/zero purchase amounts and unrealistic ages (below 0 or above 100), none found
- **Inconsistent text values** — checked `Country`, `Payment_Method`, and `Product_Category` using `DISTINCT` for spelling inconsistencies, none found

The dataset was found to be clean, with no missing, duplicate, or invalid records.

## ❓ Business Questions Answered
1. What is the total revenue generated overall?
2. How many transactions happened in total?
3. What is the average purchase amount per transaction?
4. What is the total revenue by country?
5. Which product category generates the most revenue?
6. What is the average purchase amount by age group?
7. How many transactions happened each month?
8. Which country has the highest number of unique customers?
9. Which country + product category combination generates the highest revenue?
10. What is the month-over-month revenue trend?
11. Who are the top 10 customers by total spending?
12. Which payment method is most popular in each country?

All SQL queries are available in [`e_commerce_queries.sql`](./SQL_QUERIES.sql).

## 💡 Key Insights
- The e-commerce platform generated a total revenue of **$25.16 million** from 50,000 transactions, with an average purchase amount of **$503.16** per transaction.
- Revenue is fairly evenly distributed across countries, with **France** leading at $2.55 million, only about 3% higher than the lowest-performing country, UK ($2.47 million) — indicating no single market dominates.
- **Sports** was the best-performing product category, generating $3.20 million in revenue, closely followed by Toys and Books — while Beauty had the lowest revenue at $3.06 million.
- Customer spending behavior is consistent across all age groups, with average purchase amounts ranging narrowly between $501.86 and $505.15 — suggesting age is not a strong factor in how much a customer spends.
- Sales volume remained stable throughout the year, with monthly transactions ranging between about 3,918 and 4,271 — showing no strong seasonal spikes.
- Payment method preference varies by country — for example, UPI is most popular in Canada and Australia, while Net Banking leads in Japan, and Debit Cards dominate in Germany and the USA — showing no single global payment method fits all markets.
- Each country in the dataset had exactly 100 unique customers, suggesting this is a structured/synthetic dataset rather than raw real-world data — a useful observation for context when interpreting results.

## 📚 What I Learned
- How to structure a real-world SQL project from raw data to business insights
- How to clean and validate data before analysis using `GROUP BY`, `HAVING`, `CASE`, and `DISTINCT`
- How to write aggregate queries (`SUM`, `COUNT`, `AVG`) combined with `GROUP BY` for business reporting
- How to use window functions (`RANK() OVER (PARTITION BY ...)`) to answer "top result per group" questions
- How to translate raw SQL output into clear, non-technical business insights for stakeholders

## 👤 Author
Lovepreet — Aspiring Data Analyst / MIS / Reporting professional, building a portfolio for the Dubai/UAE job market.
