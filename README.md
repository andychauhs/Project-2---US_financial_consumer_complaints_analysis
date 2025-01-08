# Project-2---US_financial_consumer_complaints_analysis 


# Business Analysis Project - US Consumer Finance Complaints

## Overview
This project involves a comprehensive analysis of consumer finance complaints data, aimed at extracting actionable insights to enhance understanding of customer issues and company performance. The dataset provides critical information on complaints, including product type, company response, consumer consent, and geographical distribution.

## Analysis Tasks

1. **Data Cleansing**
   - **Task**: Cleanse and preprocess the dataset to ensure data accuracy and consistency.
   - **Details**: Handle missing values in key columns, such as state and consumer consent, and create new columns for improved data integrity. This includes creating a new column (`state_new`) that matches states with known zipcodes where the original state is null. Additionally, address other inconsistencies and outliers in the data to prepare it for analysis.

2. **Consumer Complaints Analysis**
   - **Task**: Analyze the volume of complaints by product type.
   - **Details**: Identify which products receive the most complaints to inform product management and customer service strategies.

3. **Root Cause Analysis**
   - **Task**: Investigate common issues reported by consumers.
   - **Details**: Categorize complaints by sub-product and issue type to uncover frequent problems and potential areas for improvement.

4. **Customer Behavior Analysis**
   - **Task**: Assess consumer dispute rates and response effectiveness.
   - **Details**: Analyze the relationship between timely responses and customer disputes to identify best practices in complaint resolution.

5. **Company Performance Evaluation**
   - **Task**: Evaluate the performance of companies based on complaint handling.
   - **Details**: Analyze metrics such as response rates, public response rates, and customer satisfaction levels across different companies.

6. **Geographical Analysis**
   - **Task**: Examine complaint trends based on geographical distribution.
   - **Details**: Identify top products and companies being complained about in each state to tailor regional strategies.

7. **Monthly Reporting Automation**
   - **Task**: Create automated monthly reporting for company complaints.
   - **Details**: Implement a scheduled event to generate and store monthly complaint reports for ongoing monitoring of company performance.

## Data Sources
The dataset for this analysis is sourced from Kaggle: US Consumer Finance Complaints. Each dataset contains the following columns:
- Date received
- Product
- Sub-product
- Issue
- sub_issue
- Consumer complaint narrative
- Company public response
- Company
- State
- Zipcode
- Tags
- Consumer consent provided
- Submitted via
- Date sent to company
- Company repsonse to consumer
- Timely response
- Consumer disputed
- Complaint id

## Project Files
- **README.md**: This document.

## Getting Started
1. Clone this repository to your local machine.
2. Open SQL Server Management Studio or any SQL IDE to run the analysis.

## Usage
You can replicate the analysis by executing the provided SQL queries against the included datasets or your own datasets with similar structures.

## Conclusion
This project aims to provide in-depth insights into consumer finance complaints, focusing on complaint patterns, company performance, and customer behavior. The findings will assist stakeholders in making informed decisions to enhance customer satisfaction and improve complaint resolution processes.

For any questions or further information, feel free to reach out.

**Author**: Ho Sing Andy CHAU
**Email**: hosingchau@outlook.com
**Date**: 8 JAN 2025

## Logical Sequence Explanation
1. Data Cleansing sets the foundation for accurate analysis.
2. Consumer Complaints Analysis identifies high-impact product issues.
3. Root Cause Analysis reveals frequent problems needing attention.
4. Customer Behavior Analysis optimizes complaint resolution strategies.
5. Company Performance Evaluation benchmarks company effectiveness.
6. Geographical Analysis informs regional strategies for improvement.
7. Monthly Reporting Automation ensures ongoing performance monitoring.
