# International Debt Analysis Using SQL & Data Visualization

## Project Overview


This project analyzes international debt data collected by the World Bank, covering debt owed by developing countries across multiple categories from 1970 to 2015. The goal is to extract meaningful insights using SQL in PostgreSQL and answer key financial questions about debt.

### Steps for Loading Data into PostgreSQL

Follow these steps to load the CSV file into PostgreSQL:

1. Ensure PostgreSQL is installed and you have access to a client like DBeaver.

2. Download the CSV file from GitHub or your source.

3. Open DBeaver and connect to your PostgreSQL server.

4. Create a new schema for the project:
       ```CREATE SCHEMA international_debt_analysis;```

5. Set the search path to your new schema:
       ```SET search_path TO international_debt_analysis;```

6. Import the CSV file:

7. Navigate to your schema.

8. Right-click Tables under your schema and choose Import Data.

10. Select the CSV as your source file.

11. Map the columns to your table.

12. Confirm and proceed.

13. Verify your table import by running:
        ```SELECT * FROM international_debt_analysis.international_debt; ```

## Sample SQL Queries 
### i. Total amount of debt owed by all countries
```SELECT SUM(debt) AS total_debt FROM international_debt_with_missing_values;```


#### ii. Number of distinct countries recorded in the dataset
```SELECT COUNT(DISTINCT country_name) AS unique_countries FROM international_debt_with_missing_values;```


#### iii. Distinct types of debt indicators and their codes
```
SELECT DISTINCT indicator_name, indicator_code AS unique_code
FROM international_debt_with_missing_values
WHERE indicator_name IS NOT NULL AND indicator_name <> ''
AND indicator_code IS NOT NULL AND indicator_code <> '';
 ```

### iv. The country with the highest total debt
```
SELECT country_name, SUM(debt) AS highest_debt
FROM international_debt_with_missing_values
WHERE country_name IS NOT NULL AND country_name <> ''
GROUP BY country_name
ORDER BY highest_debt DESC
LIMIT 1;
 ```

### v. Average debt across different debt indicators
```
SELECT indicator_name, AVG(debt) AS avg_debt
FROM international_debt_with_missing_values
GROUP BY indicator_name
ORDER BY avg_debt DESC;
```

#### vi. The country with the highest amount of principal repayments
```
SELECT country_name, country_code, SUM(debt) AS repayments
FROM international_debt_with_missing_values
WHERE indicator_name LIKE '%Principal repayments%' AND debt > 0
GROUP BY country_name, country_code
ORDER BY repayments DESC
LIMIT 1;
```

#### vii. Most common debt indicator across all countries
```
SELECT indicator_name, COUNT(*) AS common
FROM international_debt_with_missing_values
WHERE indicator_name IS NOT NULL AND indicator_name <> ''
GROUP BY indicator_name
ORDER BY common DESC;
```

#### viii. Other key debt trends: the top 5 highest debt countries
```
SELECT country_name, SUM(debt) AS highest_debt
FROM international_debt_with_missing_values
WHERE country_name IS NOT NULL AND country_name <> ''
GROUP BY country_name
ORDER BY highest_debt DESC
LIMIT 5;
```

#### viii. Bottom 5 countries with the least debt
```
SELECT country_name, SUM(debt) AS least_debt
FROM international_debt_with_missing_values
WHERE country_name IS NOT NULL AND country_name <> ''
GROUP BY country_name
ORDER BY least_debt ASC
LIMIT 5;
```

#### viii. Total debt per debt indicator
```
SELECT indicator_name, SUM(debt) AS total_debt
FROM international_debt_with_missing_values
GROUP BY indicator_name
ORDER BY total_debt DESC;
```

## Summary of Findings

1. The **total debt** owed by all countries in the dataset is estimated at $2.82 trillion based on the sum of the debt column.
2. There are **125 distinct countries** represented in the data.
3. **Debt indicators** help categorize different debt components. In our data, we have 25 distinct indicators, such as principal repayments and loan types.
4. The country with the **highest total debt**  is China, which stands out significantly among peers.
5. **Average debt** varies across indicators, reflecting diverse financial obligations between countries.
6. The country with the **highest principal repayments** demonstrates proactive debt management. China also leads in principal repayments.
7. The **most common debt indicator** helps reveal which debt types are tracked most frequently across nations. _PPG, official creditors (INT, current US$)_ occurs 116 times making it most common
8. Additional queries were used to show the **top 5** and **bottom 5** **countries by debt**, and the **total debt per indicator** to outline global debt trends.
