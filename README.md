# Project-2---US_financial_consumer_complaints_analysis 


# Business Analysis Project - US Consumer Finance Complaints

## Overview
This project involves a comprehensive analysis of consumer finance complaints data, aimed at extracting actionable insights to enhance understanding of customer issues and company performance. The dataset provides critical information on complaints, including product type, company response, consumer consent, and geographical distribution.

## Technical Environment
SQL Dialect: MYSQL 

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
The dataset for this analysis is sourced from Kaggle: US Consumer Finance Complaints https://www.kaggle.com/datasets/kaggle/us-consumer-finance-complaints. The dataset contains the following columns:
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
- Company response to consumer
- Timely response
- Consumer disputed
- Complaint id

## Project Files
- **README.md**: This document.
- **project_US_fin_consumer_complaints.sql**: SQL script for analysis

## Getting Started
1. Clone this repository to your local machine.
2. Open SQL Server Management Studio or any SQL IDE to run the analysis.

## Usage
You can replicate the analysis by executing the provided SQL queries against the included datasets or your own datasets with similar structures.



##Key Findings
- **Complaint Volume and Trends:**
The top five products with the highest complaint volumes are:
Mortgage: 185,219 complaints
Debt Collection: 100,426 complaints
Credit Report: 91,447 complaints
Credit Card: 65,883 complaints
Bank Account or Service: 61,369 complaints
Consumer Loan: 20,853 complaints

- **Common Issues by Product:**
1. Mortgage-related complaints often stem from loan modifications, collections, and foreclosures.
2. Credit reporting issues predominantly relate to incorrect information on credit reports, typically concerning account status or disputed information.
3. Bank account complaints are mostly associated with account management and transaction issues.
   
- **Consumer Dispute Rate:**
1. The consumer dispute rate stands at 0.2, indicating a significant number of disputes in relation to the total complaints.
2. A correlation exists where more timely responses lead to an increase in disputes, suggesting that even the immediate response can alleviate customers emotions, customers may be more focused on resolving specific cases.
   
- **Consent Preferences:**
Most customers (480,546) chose not to provide consent for communication, while 66,618 consented, indicating a potential area for enhancing customer engagement.

- **Submission Channel Preferences:**
Complaints submitted via different channels show varying satisfaction levels:
Web: 360,173 complaints with a satisfaction rate of 0.78
Referral: 107,809 complaints with a satisfaction rate of 0.83
Phone: 39,009 complaints with a satisfaction rate of 0.83
Postal Mail: 36,290 complaints with a satisfaction rate of 0.85
Email: 297 complaints with a satisfaction rate of 0.79
!! Postal mail shows the highest satisfaction rate, suggesting a preference for written communication.

- **Geographical Insights:**
The top states for complaints are:
California: 81,700 complaints
Florida: 53,671 complaints
Texas: 41,352 complaints
New York: 38,265 complaints
Georgia: 24,548 complaints
California shows a relatively lower satisfaction rate compared to other states, indicating a need for focused improvement in customer service.

- **Service Provider Performance:**
The average delivery time for complaints across states ranges from 1 to 8 days, with top companies averaging 4 to 5 days.
Some companies have delivery times extending up to 683 days, highlighting significant inefficiencies in handling complaints.
Timeliness vs. Public Response:
Companies with higher complaint volumes tend to respond promptly (over 97% timely response rate) but often do not address complaints publicly. This may be due to the personal nature of complaints and a desire to mitigate public relations risks.








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
