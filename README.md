# Customer-Shopping-Behavior-Analysis
📌 Project Overview

This project analyzes customer shopping behavior using transactional retail data to uncover insights into spending patterns, customer segments, product preferences, discounts, and subscription behavior.

The analysis combines Python (EDA & data cleaning), MySQL (business queries), and Power BI (dashboarding) to deliver data-driven business recommendations.

📊 Dataset Summary

Total Records: 3,900

Total Features: 18

Key Feature Groups:

Customer Demographics: Age, Gender, Location, Subscription Status

Purchase Details: Item Purchased, Category, Purchase Amount, Season, Size, Color

Shopping Behavior: Discount Applied, Promo Code Used, Purchase Frequency, Review Rating, Shipping Type

Missing Data: 37 missing values in Review Rating

🧹 Data Cleaning & Feature Engineering (Python)

Loaded and explored data using pandas

Handled missing values in Review Rating using median imputation per product category

Created:

Age Group feature by binning ages

Purchase Frequency (Days) feature

Identified redundancy between Discount Applied and Promo Code Used and removed the redundant column

Ensured data consistency before database insertion

🗄️ Database Integration (MySQL)

Connected Python to MySQL

Loaded cleaned dataset into relational tables

Performed structured SQL analysis to answer key business questions

📈 Business Analysis (MySQL)

Key insights extracted using SQL:

Revenue comparison by Gender

Identification of high-spending discount users

Top 5 products by average review rating

Comparison of Standard vs Express shipping

Spending behavior of Subscribers vs Non-Subscribers

Products most dependent on discounts

Customer segmentation: New, Returning, Loyal

Top 3 products per category

Relationship between repeat purchases and subscription likelihood

📊 Dashboard (Power BI)

An interactive Power BI dashboard was created to visualize:

Revenue trends

Customer segmentation

Product performance

Subscription impact

Discount and shipping behavior

💡 Business Recommendations

Promote exclusive benefits to increase subscriptions

Optimize loyalty programs while protecting margins

Re-evaluate discount strategies

Highlight top-rated and best-selling products

Focus marketing on high-revenue age groups and express-shipping customers

🛠️ Tools & Technologies

Python: Pandas, NumPy

Database: MySQL

Visualization: Power BI

Environment: Jupyter Notebook, VS Code

🚀 Future Improvements

Predictive modeling for customer churn

RFM-based customer segmentation

A/B testing discount strategies

Automated data pipelines

👤 Author

Yug Patel
