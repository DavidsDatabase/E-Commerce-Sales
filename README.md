# E-Commerce Sales

### Project Overview

E-Commerce has become a new method in supporting business development. Businesses can look to sell products or services online to yield more sales and profits. E-commerce has revolutionized the way people shop and consume products and services. With the press of a button, whether on the computer or mobile phone, consumers can purchase their products with ease and without having to set foot inside the store. This project's goals are to find the top performing products purchased from many customers, the top spending customers, and where most of these purchases are made from. 

### About the Data

The primary dataset can be found on <(https://www.kaggle.com/datasets/gabrielramos87/an-online-shop-business)>. The provided csv file is labeled Sales Transaction v.4a.xlsx

### Tools Used

- Excel - Data Cleaning
- SQL - Data Cleaning & Data Analysis
- Tableau - Data Visualization

### Data Cleaning/Preparation

1. Data loading and Joining
2. Data Cleaning and Sorting
3. Data Formatting and Transforming

### Exploratory Data Analysis (EDA)

EDA was performed to answer key questions, such as, but not limited to:

1. How was the sales trend over the months?
2. What are the most frequently purchased products?
3. How many products does the customer purchase in each transaction?
4. What are the most profitable segment customers?

### Results/Findings

1. We see that the early months of the year have constant sales from 12/2018 all the way to 08/2019. Afterwards, we start to see an upwards trend in the amount of sales from 09/2019 to 11/2019. Between 08/2019 and 09/2019, there was an **increase** of **42%** in sales.

![image](https://github.com/user-attachments/assets/f5d321ca-9579-44b4-af40-bf929a41142e)

2. Hinohara has the highest average pricing of 499$ per night, but it is only 1 listing in the Ku. A more reliable answer would be Chuo Ku being at 232$ per night. Musashimurayama Shi has the lowest average price at 24$ per night. 
3. Shinjuku Ku has the most reviews per month being 4,343 reviews from all of it's 2,838 listings. Following that are Taito Ku and Sumida Ku being slightly under 3,000 total reviews. These top 3 Kus are very popular amongst locals/tourists as they have nearly over 3,000 reviews per month.

![image](https://github.com/DavidsDatabase/JapanAirbnb/assets/156726833/a072c585-80ab-481f-896e-414db6fd5a7d)

4. Shinjuku Ku has the most total reviews at 104,190 reviews. Next are Taito Ku at 74,555 reviews and Sumida Ku at 66,100 reviews. This strongly suggests that listings in these 3 Ku are very popular and people would most likely want to stay here. Having the most reviews lifetime and most reviews per month is a strong indicator for popularity. 

![image](https://github.com/DavidsDatabase/JapanAirbnb/assets/156726833/1d485e39-bce9-49f2-a697-a60193d9c1ac)


### Recommendations

Based on the analysis, we recommend the following actions:

Booking an airbnb in the areas of **Shinjuku**, **Taito**, or **Sumida** may be the best choice. All 3 of these Ku are popular as they have the most reviews per month and overall. Average prices for these 3 are around mid compared to the rest of the areas Tokyo has to offer. There are over 1,800 listings for all 3 of these Ku, so options are there. Filtering your choices based on your preferred location, accommodation, beds, bathrooms even further may strengthen your decision-making, but in doing so, may change the pricing per night either upwards or downwards. 

### Limitations

This dataset did not provide any dates/timestamps so it was hard to make comparative analyses. We would need to find data regarding **time** to make a more induced analysis for decision-making. Having this data would be useful in finding price changes from time to time in certain areas and room types, total amount of reviews per month per neighbourhood, or making monthly, quarterly, seasonal analyses. 

### Complimentary Visualization

https://public.tableau.com/app/profile/david.lee7724/viz/E-Commerce_Sales_17394038184680/Dashboard1
