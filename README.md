**International Debt Analysis Using SQL & Data Visualization**

**Project Overview**


This project analyzes international debt data collected by the World Bank, covering debt owed by developing countries across multiple categories from 1970 to 2015. The goal is to extract meaningful insights using SQL in PostgreSQL and answer key financial questions about debt.

**Steps for Loading Data into PostgreSQL**

Follow these steps to load the CSV file into PostgreSQL:

1. Ensure PostgreSQL is installed and you have access to a client like DBeaver.

2. Download the CSV file from GitHub or your source.

3. Open DBeaver and connect to your PostgreSQL server.

4. Create a new schema for the project:
    CREATE SCHEMA international_debt_analysis;

5. Set the search path to your new schema:
   SET search_path TO international_debt_analysis;

6. Import the CSV file:

7. Navigate to your schema.

8. Right-click Tables under your schema and choose Import Data.

10. Select the CSV as your source file.

11. Map the columns to your table.

12. Confirm and proceed.

13. Verify your table import by running:
 SELECT * FROM international_debt_analysis.international_debt;
