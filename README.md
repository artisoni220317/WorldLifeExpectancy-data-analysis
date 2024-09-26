# WorldLifeExpectancy-data-analysis
This project aims to explore the WorldLifeExpectancy data to understand WorldLifeExpectancy data and its attributes like GDP,Minimum and Maximum Life Expectancy of different countries,Adult Mortality,and number of peoples with particular diseases. The dataset was obtained from the Analyst Builder.

## Purpose of the Project
The major aim of thie project is to gain insight into the WorldLifeExpectancy data to understand the different factors that affect Life Expectancy of different countries in the world.

## About the Data
The dataset was obtained from the Analyst Builder Website. This dataset contains data from different countries around the world.The data contains 18 columns and 2941 rows:

![export (1)](https://github.com/user-attachments/assets/81096519-d25d-412d-879f-21984a5831f4)

## Approach Used

  1. **Data Wrangling:** This is the first step where inspection of data is done to make sure NULL values and missing values are detected and data replacement methods are 
      used to replace, missing or NULL values.\
    1. Build a database.\
    2. Create table and insert the data.\
    3. Select columns with null values in them. There are no null values in our database as in creating the tables, we set NOT NULL for each field, hence null values are 
         filtered out.\
    4. Select (Country,Year ) as Primary Key as there is no unique attribute is present.\
    5. Identify Duplicates using ROW_NUMBER().\
    6. Delete those rows where ROW_NUMBER() is greater than 1.\
    7. Handle Missing Values in Status Column and Life Expectancy Column.\
    8. To fill the missing in Life Expectancy Column we will use the Avg of the previous and Post year.

  2. **Exploratory Data Analysis (EDA):** Exploratory data analysis is done to answer the listed questions and aims of this project.

### Generic Question

1. Which Country have the MIN and MAX Life Expectancy?
2. What is the Increase in Life Expectancy in last 15 years?
3. Average Life Expectancy with GDP of the Country?
4. Average Life Expectancy with Status?
5. Average Life Expectancy in Countries having GDP>=1500
6. Total Adult Mortality with Country and Year.
    




