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





## Key Findings
**Complaint Volume and Trends:**
The top five products with the highest complaint volumes are:
Mortgage: 185,219 complaints.
Debt Collection: 100,426 complaints.
Credit Report: 91,447 complaints.
Credit Card: 65,883 complaints.
Bank Account or Service: 61,369 complaints.
Consumer Loan: 20,853 complaints.

- **insight:** Mortgage products represent the largest share of complaints, indicating potential systemic issues in loan management, modification processes, and customer service. This calls for targeted interventions to streamline operations and improve customer satisfaction.
  
**Common Issues by Product:** Mortgage-related complaints often stem from loan modifications, collections, and foreclosures. Credit reporting issues predominantly relate to incorrect information on credit reports, typically concerning account status or disputed information. Bank account complaints are mostly associated with account management and transaction issues.

- **insight:** Common complaints across products, especially regarding loan modifications and incorrect information on credit reports, highlight the need for better data accuracy and clearer communication with customers throughout their experience.
   
**Consumer Dispute Rate:** The consumer dispute rate stands at 0.2, indicating a significant number of disputes in relation to the total complaints. A correlation exists where more timely responses lead to an increase in disputes, suggesting that even the immediate response can alleviate customers emotions, customers may be more focused on resolving specific cases.

- **insight:** The correlation between timely responses and increased disputes suggests that while quick resolutions are appreciated, they may also lead to more customers initiating disputes, possibly due to unmet expectations or unresolved issues. Understanding customer motivations for disputes is crucial.
   
**Consent Preferences:** Most customers (480,546) chose not to provide consent for communication, while 66,618 consented, indicating a potential area for enhancing customer engagement.

- **insight:** A significant number of customers opted not to provide consent for communication, indicating a potential barrier to engagement. Companies should explore strategies to build trust and encourage customers to opt-in for updates and communication.

**Submission Channel Preferences:**
Complaints submitted via different channels show varying satisfaction levels:
Web: 360,173 complaints with a satisfaction rate of 0.78.
Referral: 107,809 complaints with a satisfaction rate of 0.83.
Phone: 39,009 complaints with a satisfaction rate of 0.83.
Postal Mail: 36,290 complaints with a satisfaction rate of 0.85.
Email: 297 complaints with a satisfaction rate of 0.79.
Web is the most popular channel for customer raising their complaints but it shows the lowest satisfaction rate, this may due to the auto_reply functions and delay in case handling due to the large volume. Bank should review the case handling quality and efficiency sent from website.

- **insight:** The varying satisfaction rates across complaint submission channels indicate that certain channels (like postal mail) are more effective in meeting customer needs. Companies should analyze these differences and enhance the performance of lower-rated channels, such as web and phone.

**Geographical Insights:**
The top five states for complaints are:
California: 81,700 complaints.
Florida: 53,671 complaints.
Texas: 41,352 complaints.
New York: 38,265 complaints.
Georgia: 24,548 complaints.
The most being complainted product(s) in the the above states accounted about 25-40% of the total complaints within the state. Mortgage is still the most complainted products in 4 of the above states, whereas TX citizens complainted mroe on credit reporting.

- **insight:** The concentration of complaints in states like California and the associated lower satisfaction rates suggest that regional factors may influence customer experiences. Tailoring approaches to these specific markets could yield better outcomes.
  
**Service Provider Performance:**The average delivery time for complaints across states ranges from 1 to 8 days, with top companies averaging 4 to 5 days.
Some companies have delivery times extending up to 683 days, highlighting significant inefficiencies in handling complaints.

- **insight:** The wide range of average delivery times, with some complaints taking up to 683 days to resolve, indicates significant operational inefficiencies that need to be addressed to improve overall service delivery.

**Timeliness vs. Public Response:** Companies with higher complaint volumes tend to respond promptly (over 97% timely response rate) but often do not address complaints publicly. This may be due to the personal nature of complaints and a desire to mitigate public relations risks.

- **insight:** Companies with higher complaint volumes prioritize timely responses but often avoid public acknowledgment of these complaints, likely due to concerns over PR risks. This approach may hinder transparency and customer trust.

**Monthly performance:**

1. **Average Delivery Time Fluctuations:**
The average delivery time shows significant fluctuations across the months. For example, the average delivery time increased dramatically from 7.56 days in December 2011 to 15.66 days in January 2012, indicating a potential backlog or inefficiency in processing complaints.
The delivery time decreased again in February but saw a notable rise in March, suggesting possible operational challenges or changes in the volume of complaints.

2. **Number of Complaints:**
The number of complaints also displays considerable variability. There was a sharp increase in complaints from December 2011 (2,532 complaints) to January 2012 (3,240 complaints), which corresponds to the increased delivery time during the same period.

3. **Performance Change Metrics:**
The performance change on delivery time shows both positive and negative percentages. For instance, in January 2012, there was a dramatic drop of -107.20%, indicating a significant increase in delivery time compared to December. Conversely, in February 2012, the performance change was positive at 24.82%, suggesting an improvement in delivery efficiency.
The performance change on the number of complaints also varies. For example, in March 2012, there was a 77.28% increase in complaints compared to February, indicating a surge in issues that required resolution.

- **insight:**
     - **Seasonality and Trends:** The data reveals a pattern where months following a peak in complaints often show a drop in performance metrics. For instance, after reaching a high number of complaints in March 2012, April saw a decrease in both average delivery time and the number of complaints.
     - **Operational Challenges:** The fluctuation in average delivery time, alongside rising complaint numbers, suggests potential operational challenges, especially during peak complaint months. The company may need to investigate the causes of these spikes and implement strategies for better resource allocation during high-demand periods.
     - **Customer Experience Impact:** The relationship between average delivery time and the number of complaints indicates a direct impact on customer experience. Longer delivery times correlate with increased complaints, which can affect customer satisfaction and retention.
     - **Potential for Improvement:** The data suggests opportunities for improvement in complaint handling. For example, months showing significant increases in delivery time could be investigated for process bottlenecks or staffing issues.








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
