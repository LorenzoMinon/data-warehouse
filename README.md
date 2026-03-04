SQL Data Warehouse Project

This project demonstrates the design and implementation of a modern Data Warehouse using SQL Server and the Medallion Architecture (Bronze, Silver, Gold) approach.

The goal is to transform raw ERP and CRM datasets into business-ready analytical models optimized for reporting and decision-making.

🏗️ Architecture Overview

The warehouse follows a 3-layer Medallion Architecture:

🥉 Bronze Layer – Raw Data

Ingests ERP and CRM data from CSV files

Stores data as-is inside SQL Server

No transformations applied

🥈 Silver Layer – Clean & Standardized

Data cleansing

Handling nulls and inconsistencies

Standardization and normalization

Data quality improvements

🥇 Gold Layer – Business-Ready Model

Star schema modeling

Creation of fact and dimension tables

Optimized for analytical queries and reporting

📂 Project Structure
datasets/        # Raw ERP and CRM CSV files  
scripts/  
   ├── bronze/   # Raw data loading scripts  
   ├── silver/   # Data cleaning and transformation scripts  
   └── gold/     # Star schema and analytical model scripts  
🎯 Objectives

Build a modern SQL-based data warehouse

Implement ETL transformations across layered architecture

Apply data modeling best practices

Deliver structured analytical datasets for BI and reporting

🛠️ Technologies Used

SQL Server

T-SQL

Medallion Architecture

Star Schema Modeling

📊 Key Concepts Demonstrated

ETL pipeline design

Data quality handling

Dimensional modeling

Fact & Dimension table creation

Layered data engineering approach
