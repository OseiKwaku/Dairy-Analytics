
# 🥛 Dairy Production Analysis Dashboard (India)

## 📊 Project Overview
This project analyzes dairy production and sales performance in India using SQL and Power BI.  
The goal was to uncover insights into revenue, profitability, farm efficiency, and product performance across multiple locations.

The project also includes a PowerPoint wireframe — my first time designing one — to plan the dashboard layout before building it in Power BI.


## 🧩 Tools Used
- SQL → Data cleaning, transformation, and aggregation  
- Power BI → Data modeling, visualization, and dashboard creation  
- PowerPoint → Dashboard wireframing and layout design


## 📁 Dataset Description
The dataset covers dairy operations from different Indian states and includes:
- Product details (Milk, Butter, Lassi, Paneer, etc.)
- Farm information (Land area, number of cows, location, brand)
- Sales and customer data
- Production metrics (Revenue, Quantity Sold, Profit Margin, Stockouts, Wastage)


## ⚙️ Data Processing (SQL)
Key SQL tasks included:
- Cleaning and standardizing product and location names  
- Calculating KPIs like Total Revenue, Profit Margin, Revenue per Cow, and Revenue per Acre  
- Aggregating data by product, brand, and location  
- Preparing summarized tables for Power BI import


## 📈 Power BI Dashboard
The final dashboard is divided into three main pages:

### 1️⃣ Overview
- Total Revenue, Quantity Sold, Profit Margin, Total Customers  
- Revenue by Product, Month, Location, and Sales Channel  
- Profit Margin % by Product  

### 2️⃣ Operations
- KPIs: Revenue per Acre, Revenue per Cow, Number of Farms  
- Scatter Plot: Revenue vs Number of Cows (bubble size = cows per location)  
- Total Revenue by Customer Location  
- Table: Brand-level performance breakdown  

### 3️⃣ Inventory
- Total Stockouts  
- Wastage Risk % = (Unsold near Expiration ÷ Total Quantity)  
- Days to Expiry = `DATEDIFF(Expiration Date, TODAY(), DAY)`  
- Conditional formatting (green = improvement, red = decline)


## 🧠 Key Insights
- Butter had the highest profit margin among dairy products  
- Chandigarh and Delhi generated the most revenue  
- Farms with larger cow populations showed higher overall returns, but not always better efficiency per acre  
- Inventory waste risks were higher in low-turnover locations  


## 💡 Lessons Learned
- How to design Power BI dashboards with storytelling flow
- The importance of color psychology and layout in visual analytics  
- Using SQL for precise KPI calculations before visualization  
- Creating a wireframe prototype before building the dashboard  



---

## 🏷️ Tags
`#PowerBI` `#SQL` `#DataAnalytics` `#DashboardDesign` `#Agribusiness` `#DataVisualization` `#IndiaDairy`
