# 🚀 **DataSpark: Illuminating Insights for Global Electronics**

## **Table of Contents**
- [🚀 **DataSpark: Illuminating Insights for Global Electronics**](#-dataspark-illuminating-insights-for-global-electronics)
  - [**Table of Contents**](#table-of-contents)
  - [🌍 **Domain**](#-domain)
  - [🛠️ **Problem Statement**](#️-problem-statement)
  - [💼 **Business Use Cases**](#-business-use-cases)
  - [📂 **Data Sources**](#-data-sources)
  - [📚 **Skills Acquired**](#-skills-acquired)
  - [🛠️ **Technologies Used**](#️-technologies-used)
  - [⚙️ **Approach**](#️-approach)
    - [1️⃣ **Data Cleaning and Preparation**](#1️⃣-data-cleaning-and-preparation)
    - [2️⃣ **Data Management**](#2️⃣-data-management)
    - [3️⃣ **Develop SQL and DAX Queries**](#3️⃣-develop-sql-and-dax-queries)
    - [4️⃣ **Power BI Visualization**](#4️⃣-power-bi-visualization)
  - [📝 **Analysis Steps**](#-analysis-steps)
    - [🧑‍🤝‍🧑 **Customer Analysis**](#-customer-analysis)
    - [💵 **Sales Analysis**](#-sales-analysis)
    - [📦 **Product Analysis**](#-product-analysis)
    - [🏬 **Store Analysis**](#-store-analysis)
  - [🏆 **Report Summary**](#-report-summary)
  - [📊 **PowerBI Reports**](#-powerbi-reports)


---

## 🌍 **Domain**  
**Retail Analytics in the Electronics Industry**

---

## 🛠️ **Problem Statement**  
Global Electronics, a leading retailer of consumer electronics, provided datasets containing:  
- 👥 **Customer Data**  
- 📦 **Product Information**  
- 💰 **Sales Data**  
- 🏬 **Store Details**  
- 💱 **Currency Exchange Rates**  

This project focuses on analyzing these datasets to uncover insights that:  
1️⃣ Enhance customer satisfaction.  
2️⃣ Optimize operations.  
3️⃣ Drive business growth.  

---

## 💼 **Business Use Cases**  
By analyzing customer, product, sales, and store data, the project addresses:  
- 🎯 **Marketing Strategies**: Tailor campaigns based on customer preferences.  
- 📦 **Inventory Optimization**: Efficient stock management.  
- 📈 **Sales Forecasting**: Predict trends and seasonality.  
- 🛠️ **Product Development**: Develop better products and promotions.  
- 🏬 **Store Management**: Plan store expansions and operational efficiency.  

Understanding the impact of currency exchange rates ensures better international pricing strategies, enhancing customer satisfaction and profitability.

---

## 📂 **Data Sources**

The following dataset of global-electronics-retailers, this data contains sales information from 1/1/2016 to 2/20/2021.

1. Customer data (customers.csv): Contains information about customers such gender, D.O.B, and demographics, used for analyzing customer behavior and segmentation.
2. Sales data (sales.csv): Includes records of transactions, such as number of sales, product ID, it's quantities, order date, delivery date, store ID, and currency essential for understanding sales patterns and performance.
3. Products data (products.csv): Lists product details including IDs, names, categories, subcategory, unit prices, unit costs helping to analyze product performance and trends.
4. Stores data (stores.csv): Provides information on store locations, IDs, and attributes, useful for examining geographic sales performance and store-related analysis.
5. Currency exchange rates data (exchangerates.csv): Contains historical exchange rates between different currencies, crucial for analyzing sales and financial data in a global context.

---

## 📚 **Skills Acquired**
- 🧹 **Data Cleaning and Preprocessing**  
- 📊 **Exploratory Data Analysis (EDA)**  
- 🛢️ **Data Management using SQL**  
- 📈 **Data Visualization using PowerBI**  

---

## 🛠️ **Technologies Used**  
- 🐍 **Python**  
- 🛢️ **SQL**  
- 📊 **Power BI/Tableau**

---

## ⚙️ **Approach**

### 1️⃣ **Data Cleaning and Preparation**

Checking for missing values and handle them appropriately.
Converting data types where necessary (e.g., dates, numerical values).
Merging datasets where necessary for analysis (e.g., linking sales data with product and customer data).

### 2️⃣ **Data Management**

Inserting the preprocessed data into an SQL database by creating relevant tables for each data source.

### 3️⃣ **Develop SQL and DAX Queries**

Formulating and executing SQL and DAX queries to extract key insights from the data.

### 4️⃣ **Power BI Visualization**

Connecting SQL to Power BI/Tableau, import the data, and create interactive dashboards by implementing star schema using data modeling.

---

## 📝 **Analysis Steps**  

### 🧑‍🤝‍🧑 **Customer Analysis**  
- 🗺️ **Demographics**: Analyze by gender, age, and location.  
- 🛒 **Purchase Patterns**: Average order values, frequency, and preferences.  
- 🏷️ **Segmentation**: Identify key customer groups by behavior.  

### 💵 **Sales Analysis**  
- 📈 **Performance Trends**: Overall sales trends and seasonality.  
- 🏆 **Top Products**: Bestsellers by quantity and revenue.  
- 🏬 **Store Analysis**: Performance metrics by location.  
- 💱 **Currency Impact**: Assess sales affected by exchange rates.  

### 📦 **Product Analysis**  
- ⭐ **Popularity**: Most and least popular products.  
- 💰 **Profitability**: Profit margins by comparing costs and prices.  
- 🗂️ **Category Insights**: Performance by category and subcategory.  

### 🏬 **Store Analysis**  
- 📊 **Performance Metrics**: Sales, size, and operational data.  
- 🌎 **Geographical Insights**: High-performing regions.  

---

## 🏆 **Report Summary**

The analysis results are summarized as follows

1. Gender and country wise: There is no notable variation in customer distribution across different gender categories. However, the United States has the highest number of customers compared to other countries.

2. City wise: It is evident that several cities in the United States rank among the top ten cities with the highest number of customers. Notably, Toronto leads the list, followed by Montreal and Calgary, indicating a significant interest in our products within these Canadian cities as well.

3. State wise: Analysis also shows strong customer bases in major U.S. states, as well as significant interest from Canada and Germany. This provides valuable insights into market concentration and potential areas for targeted engagement and expansion.

4. Customers with No Orders: There are 3379 customers with no orders that could generate around an additional revenue of 15 million USD with targeted campaigns.

5. Age wise: The analysis reveals that the majority of customers are aged 60 and above. This demographic trend suggests a significant interest and engagement from older adults.

6. Frequency of customer visits: Most customer visits around 5 to 10 , while the visitors between 1 to 5 and >10 are split evenly. Based on customers engagement levels, we can create targeted marketing campaigns that resonate with different segments, thereby enhancing customer engagement and optimizing advertising efforts.

7. Currency wise : We can infer that most customers use USD, with significant numbers also using EUR and GBP indicating their region as well. Also, there is notable interest from Canadian and Australian markets, indicating a diverse international customer base. In regard to exchange rates, there is indication that changes in exchange rates for AUD, CAD, EUR, and GBP have minimal to no effect on the revenue in USD.

8. Category and subcategory wise : Computers lead this category with 41.75% of orders numbering 10,990 among 8 categories and has generated 19 million USD or 36.62 %. The subcategory Desktops lead the subcategory as well with 9.9 million USD in revenue.

9. Brand wise: Adventure Works, Contoso, and Wide World Importers lead the brands section, making more than 5 million USD each.

10. Product wise: The top product sold was WWI Desktop PC.33 X2330 Black selling 550 quantities and making around .51 million USD. This is followed by desktop products from Adventure works as well in the top 5 making around 0.40 million USD each.

11. Store Wise: The Online Store leads with 20.45% of total sales among 67 stores and has generated around 11 million USD.

12. Store age and size: There is no co-relation between the revenue and store's age and store's size.

13. Stores with No orders: There are 9 stores with no orders, these stores could either include targeted campaigns or be closed to focus more on online sales as it spearheads the sales.

14. Time analysis:  From 2016 to 2019, the sales revenue exhibited a consistent upward trend. During this period, the revenue increased annually, reflecting positive business performance and successful market strategies. In 2020, there was a notable decline in sales revenue. The decrease could be associated with  economic downturns, or supply chain disruptions due to the Covid-19 pandemic. For the year 2021, revenue data is only available up to February. However, the early data for 2021 suggests that the revenue challenges have continued into the new year. Further, it can be infered from all the years that the lowest performing month is April with the top 3 being December, January, and February.

---

## 📊 **PowerBI Reports**

[Slides](https://docs.google.com/presentation/d/14A1nbxD9RQsgFSPYF9BU99OkN-wYQZVCGuNznuGPD4g)

---
^ [Back to table of contents](#table-of-contents)