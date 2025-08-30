International Debt Analysis Using SQL & Data Visualization
Project Overview
This project analyzes international debt data collected by the World Bank, covering debt owed by developing countries across multiple categories from 1970 to 2015. The goal is to extract meaningful insights using SQL in PostgreSQL and answer key financial questions about debt.

Steps for Loading Data into PostgreSQL
Follow these steps to load the CSV file into PostgreSQL:

  Ensure PostgreSQL is installed and you have access to a client like DBeaver.

  Download the CSV file from GitHub or your source.

  Open DBeaver and connect to your PostgreSQL server.

  Create a new schema for the project:
    CREATE SCHEMA international_debt_analysis;
  Set the search path to your new schema:
   SET search_path TO international_debt_analysis;
  Import the CSV file:

    Navigate to your schema.

    Right-click Tables under your schema and choose Import Data.

    Select the CSV as your source file.

    Map the columns to your table.

    Confirm and proceed.

 Verify your table import by running:
 SELECT * FROM international_debt_analysis.international_debt;
