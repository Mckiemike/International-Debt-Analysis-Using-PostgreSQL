-- Create schema and set search path
CREATE SCHEMA IF NOT EXISTS international_debt_with_missing_values;
SET search_path TO international_debt_with_missing_values;

-- Verify search path and table availability
SHOW search_path;
SELECT * FROM international_debt_with_missing_values;

-- i. Total amount of debt owed by all countries
SELECT SUM(debt) AS total_debt FROM international_debt_with_missing_values;

-- ii. Number of distinct countries recorded in the dataset
SELECT COUNT(DISTINCT country_name) AS unique_countries FROM international_debt_with_missing_values;

-- iii. Distinct types of debt indicators and their codes
SELECT DISTINCT indicator_name, indicator_code AS unique_code
FROM international_debt_with_missing_values
WHERE indicator_name IS NOT NULL AND indicator_name <> ''
  AND indicator_code IS NOT NULL AND indicator_code <> '';

-- iv. Country with the highest total debt
SELECT country_name, SUM(debt) AS highest_debt
FROM international_debt_with_missing_values
WHERE country_name IS NOT NULL AND country_name <> ''
GROUP BY country_name
ORDER BY highest_debt DESC
LIMIT 1;

-- v. Average debt across different debt indicators
SELECT indicator_name, AVG(debt) AS avg_debt
FROM international_debt_with_missing_values
GROUP BY indicator_name
ORDER BY avg_debt DESC;

-- vi. Country with the highest amount of principal repayments
SELECT country_name, country_code, SUM(debt) AS repayments
FROM international_debt_with_missing_values
WHERE indicator_name LIKE '%Principal repayments%' AND debt > 0
GROUP BY country_name, country_code
ORDER BY repayments DESC
LIMIT 1;

-- vii. Most common debt indicator across all countries
SELECT indicator_name, COUNT(*) AS common
FROM international_debt_with_missing_values
WHERE indicator_name IS NOT NULL AND indicator_name <> ''
GROUP BY indicator_name
ORDER BY common DESC;

-- viii. Other key debt trends: top 5 highest debt countries
SELECT country_name, SUM(debt) AS highest_debt
FROM international_debt_with_missing_values
WHERE country_name IS NOT NULL AND country_name <> ''
GROUP BY country_name
ORDER BY highest_debt DESC
LIMIT 5;

-- Bottom 5 countries with least debt
SELECT country_name, SUM(debt) AS least_debt
FROM international_debt_with_missing_values
WHERE country_name IS NOT NULL AND country_name <> ''
GROUP BY country_name
ORDER BY least_debt ASC
LIMIT 5;

-- Total debt per debt indicator
SELECT indicator_name, SUM(debt) AS total_debt
FROM international_debt_with_missing_values
GROUP BY indicator_name
ORDER BY total_debt DESC;
