# Project 2: US Financial Consumer Complaints Analysis

## Business Analysis Project - US Consumer Finance Complaints

### Overview
This project involves a comprehensive analysis of consumer finance complaints data, aimed at extracting actionable insights to enhance understanding of customer issues and company performance. The dataset provides critical information on complaints, including product type, company response, consumer consent, and geographical distribution.

### Technical Environment
- **SQL Dialect**: MySQL 

### Analysis Tasks

1. **Data Cleansing**
   - **Task**: Cleanse and preprocess the dataset to ensure data accuracy and consistency.
   - **Details**: Handle missing values in key columns, such as state and consumer consent, and create new columns for improved data integrity. This includes creating a new column (`state_new`) that matches states with known postcodes where the original state is null. Additionally, address other inconsistencies and outliers in the data to prepare it for analysis.

2. **Consumer Complaints Analysis**
   - **Task**: Analyse the volume of complaints by product type.
   - **Details**: Identify which products receive the most complaints to inform product management and customer service strategies.

3. **Root Cause Analysis**
   - **Task**: Investigate common issues reported by consumers.
   - **Details**: Categorise complaints by sub-product and issue type to uncover frequent problems and potential areas for improvement.

4. **Customer Behaviour Analysis**
   - **Task**: Assess consumer dispute rates and response effectiveness.
   - **Details**: Analyse the relationship between timely responses and customer disputes to identify best practices in complaint resolution.

5. **Company Performance Evaluation**
   - **Task**: Evaluate the performance of companies based on complaint handling.
   - **Details**: Analyse metrics such as response rates, public response rates, and customer satisfaction levels across different companies.

6. **Geographical Analysis**
   - **Task**: Examine complaint trends based on geographical distribution.
   - **Details**: Identify top products and companies being complained about in each state to tailor regional strategies.

7. **Monthly Reporting Automation**
   - **Task**: Create automated monthly reporting for company complaints.
   - **Details**: Implement a scheduled event to generate and store monthly complaint reports for ongoing monitoring of company performance.

### Data Sources
The dataset for this analysis is sourced from Kaggle: [US Consumer Finance Complaints]. The dataset contains the following columns:
- Date received
- Product
- Sub-product
- Issue
- Sub-issue
- Consumer complaint narrative
- Company public response
- Company
- State
- Postcode
- Tags
- Consumer consent provided
- Submitted via
- Date sent to company
- Company response to consumer
- Timely response
- Consumer disputed
- Complaint ID

### Project Files
- **README.md**: This document.
- **project_US_fin_consumer_complaints.sql**: SQL script for analysis.

### Getting Started
1. Clone this repository to your local machine.
2. Open SQL Server Management Studio or any SQL IDE to run the analysis.

### Usage
You can replicate the analysis by executing the provided SQL queries against the included datasets or your own datasets with similar structures.

### Key Findings

#### Complaint Volume and Trends
The top five products with the highest complaint volumes are:
- **Mortgage**: 185,219 complaints
- **Debt Collection**: 100,426 complaints
- **Credit Report**: 91,447 complaints
- **Credit Card**: 65,883 complaints
- **Bank Account or Service**: 61,369 complaints
- **Consumer Loan**: 20,853 complaints

- **Insight**: Mortgage products represent the largest share of complaints, indicating potential systemic issues in loan management, modification processes, and customer service. This calls for targeted interventions to streamline operations and improve customer satisfaction.

#### Common Issues by Product
Mortgage-related complaints often stem from loan modifications, collections, and foreclosures. Credit reporting issues predominantly relate to incorrect information on credit reports, typically concerning account status or disputed information. Bank account complaints are mostly associated with account management and transaction issues.

- **Insight**: Common complaints across products, especially regarding loan modifications and incorrect information on credit reports, highlight the need for better data accuracy and clearer communication with customers throughout their experience.

#### Consumer Dispute Rate
The consumer dispute rate stands at 0.2, indicating a significant number of disputes in relation to the total complaints. A correlation exists where more timely responses lead to an increase in disputes, suggesting that even the immediate response can alleviate customers' emotions; customers may be more focused on resolving specific cases.

- **Insight**: The correlation between timely responses and increased disputes suggests that while quick resolutions are appreciated, they may also lead to more customers initiating disputes, possibly due to unmet expectations or unresolved issues. Understanding customer motivations for disputes is crucial.

#### Consent Preferences
Most customers (480,546) chose not to provide consent for communication, while 66,618 consented, indicating a potential area for enhancing customer engagement.

- **Insight**: A significant number of customers opted not to provide consent for communication, indicating a potential barrier to engagement. Companies should explore strategies to build trust and encourage customers to opt-in for updates and communication.

#### Submission Channel Preferences
Complaints submitted via different channels show varying satisfaction levels:
- **Web**: 360,173 complaints with a satisfaction rate of 0.78
- **Referral**: 107,809 complaints with a satisfaction rate of 0.83
- **Phone**: 39,009 complaints with a satisfaction rate of 0.83
- **Postal Mail**: 36,290 complaints with a satisfaction rate of 0.85
- **Email**: 297 complaints with a satisfaction rate of 0.79

The web is the most popular channel for customers raising their complaints but shows the lowest satisfaction rate, possibly due to auto-reply functions and delays in case handling due to the large volume. Banks should review the case handling quality and efficiency of complaints submitted via the website.

- **Insight**: The varying satisfaction rates across complaint submission channels indicate that certain channels (like postal mail) are more effective in meeting customer needs. Companies should analyse these differences and enhance the performance of lower-rated channels, such as web and phone.

#### Geographical Insights
The top five states for complaints are:
- **California**: 81,700 complaints
- **Florida**: 53,671 complaints
- **Texas**: 41,352 complaints
- **New York**: 38,265 complaints
- **Georgia**: 24,548 complaints

The most complained-about products in these states account for about 25-40% of the total complaints within each state. Mortgage remains the most complained-about product in four of the above states, whereas Texas citizens complained more about credit reporting.

- **Insight**: The concentration of complaints in states like California and the associated lower satisfaction rates suggest that regional factors may influence customer experiences. Tailoring approaches to these specific markets could yield better outcomes.

#### Service Provider Performance
The average delivery time for complaints across states ranges from 1 to 8 days, with top companies averaging 4 to 5 days. Some companies have delivery times extending up to 683 days, highlighting significant inefficiencies in handling complaints.

- **Insight**: The wide range of average delivery times, with some complaints taking up to 683 days to resolve, indicates significant operational inefficiencies that need to be addressed to improve overall service delivery.

#### Timeliness vs. Public Response
Companies with higher complaint volumes tend to respond promptly (over 97% timely response rate) but often do not address complaints publicly. This may be due to the personal nature of complaints and a desire to mitigate public relations risks.

- **Insight**: Companies with higher complaint volumes prioritise timely responses but often avoid public acknowledgment of these complaints, likely due to concerns over PR risks. This approach may hinder transparency and customer trust.

#### Monthly Performance Insights

1. **Average Delivery Time Fluctuations**: The average delivery time shows significant fluctuations across the months. For example, the average delivery time increased dramatically from 7.56 days in December 2011 to 15.66 days in January 2012, indicating a potential backlog or inefficiency in processing complaints. The delivery time decreased again in February but saw a notable rise in March, suggesting possible operational challenges or changes in the volume of complaints.

2. **Number of Complaints**: The number of complaints also displays considerable variability. There was a sharp increase in complaints from December 2011 (2,532 complaints) to January 2012 (3,240 complaints), which corresponds to the increased delivery time during the same period.

3. **Performance Change Metrics**: The performance change on delivery time shows both positive and negative percentages. For instance, in January 2012, there was a dramatic drop of -107.20%, indicating a significant increase in delivery time compared to December. Conversely, in February 2012, the performance change was positive at 24.82%, suggesting an improvement in delivery efficiency. The performance change on the number of complaints also varies. For example, in March 2012, there was a 77.28% increase in complaints compared to February, indicating a surge in issues that required resolution.

- **Insights**:
  - **Seasonality and Trends**: The data reveals a pattern where months following a peak in complaints often show a drop in performance metrics. For instance, after reaching a high number of complaints in March 2012, April saw a decrease in both average delivery time and the number of complaints.
  - **Operational Challenges**: The fluctuation in average delivery time, alongside rising complaint numbers, suggests potential operational challenges, especially during peak complaint months. The company may need to investigate the causes of these spikes and implement strategies for better resource allocation during high-demand periods.
  - **Customer Experience Impact**: The relationship between average delivery time and the number of complaints indicates a direct impact on customer experience. Longer delivery times correlate with increased complaints, which can affect customer satisfaction and retention.
  - **Potential for Improvement**: The data suggests opportunities for improvement in complaint handling. For example, months showing significant increases in delivery time could be investigated for process bottlenecks or staffing issues.

### Recommendations

1. **Enhance Mortgage Management Processes**
   - **Streamline Procedures**: Review and refine processes related to loan modifications, collections, and foreclosures to minimise customer dissatisfaction. Implement training programmes for staff to improve their handling of mortgage-related issues.
   - **Data Accuracy**: Improve data management practices to ensure that customer information is accurate, particularly in credit reporting, to reduce disputes and complaints.

2. **Investigate Operational Bottlenecks**
   - Identify and analyse specific months with high delivery times and complaint volumes to understand root causes. This may involve examining staffing levels, processes, and external factors impacting performance, enabling targeted improvements.

3. **Develop Proactive Communication Strategies**
   - **Opt-In Campaigns**: Create campaigns that encourage customers to opt-in for communications by highlighting the benefits of staying informed about their accounts and available services.
   - **Regular Updates**: Improve communication with customers during peak periods by providing updates on complaint statuses and expected resolution times, thereby enhancing customer satisfaction.

4. **Optimise Complaint Submission Channels**
   - **Channel Performance Review**: Analyse the performance of various complaint submission channels and make improvements where necessary. Prioritise enhancing the web and phone channels, which currently show lower satisfaction rates.
   - **Integrated Solutions**: Consider implementing a unified complaint management system that allows customers to submit complaints through their preferred channels while maintaining consistent tracking and responses.

5. **Focus on Training and Resources**
   - Invest in training for staff handling complaints and consider resource allocation strategies that can be adapted based on anticipated complaint volumes. This ensures that employees are equipped to handle fluctuations effectively.

6. **Implement Predictive Analytics for Complaint Management**
   - **Forecasting Tools**: Utilise predictive analytics to forecast complaint volumes based on historical data, allowing the company to anticipate and prepare for high-demand periods. This proactive approach can help in managing potential issues before they escalate.
   - **Root Cause Analysis**: Employ data analysis techniques to identify the root causes of complaints and disputes, allowing for targeted interventions to address underlying issues.

7. **Improve Response Time and Public Engagement**
   - **Public Acknowledgment**: Companies should consider being more transparent about complaint volumes and resolution efforts. Publicly acknowledging complaints could help build trust and demonstrate commitment to customer satisfaction.
   - **Timeliness Metrics**: Set and monitor metrics for response times and resolution rates to ensure that improvements are made where needed.

8. **Increase Customer Feedback Mechanisms**
   - **Post-Resolution Surveys**: Implement surveys following the resolution of complaints to gather insights on customer satisfaction and areas for improvement.
   - **Focus Groups**: Organise focus groups or feedback sessions with customers to better understand their experiences and expectations, especially regarding common complaints.

9. **Continuous Monitoring**
   - Establish a regular monitoring system for delivery metrics and complaint numbers, enabling the company to react quickly to any emerging trends or issues. This ongoing assessment will facilitate timely adjustments and improvements.

By implementing these comprehensive recommendations, companies can effectively reduce complaint volumes, enhance customer satisfaction, and improve overall service delivery. Addressing operational inefficiencies and focusing on customer communication will lead to a more positive customer experience and stronger brand loyalty.

### Conclusion
This project aims to provide in-depth insights into consumer finance complaints, focusing on complaint patterns, company performance, and customer behaviour. The findings will assist stakeholders in making informed decisions to enhance customer satisfaction and improve complaint resolution processes.

For any questions or further information, feel free to reach out.

**Author**: Ho Sing Andy CHAU  
**Email**: hosingchau@outlook.com  
**Date**: 8 JAN 2025  

### Logical Sequence Explanation
1. Data Cleansing sets the foundation for accurate analysis.
2. Consumer Complaints Analysis identifies high-impact product issues.
3. Root Cause Analysis reveals frequent problems needing attention.
4. Customer Behaviour Analysis optimises complaint resolution strategies.
5. Company Performance Evaluation benchmarks company effectiveness.
6. Geographical Analysis informs regional strategies for improvement.
7. Monthly Reporting Automation ensures ongoing performance monitoring.
