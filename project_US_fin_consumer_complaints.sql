https://www.kaggle.com/datasets/kaggle/us-consumer-finance-complaints

#Create a clean table which nulls in state column are matched with zip code in a new column 'state_new'
SELECT * FROM us_fin_consumer_complaints.test

CREATE TABLE clean_table AS
	WITH unique_zipcode_list AS (
		SELECT DISTINCT zipcode, max(state) as state_new 
		FROM test 
		WHERE zipcode IS NOT NULL
		group by zipcode
	), 
	state_null AS (
		SELECT zipcode 
		FROM test 
		WHERE state IS NULL AND zipcode IS NOT NULL
	)#,clean as (
	SELECT 
		b.*,
		COALESCE(b.state, uz.state_new) AS state_new
	FROM 
		test b
	LEFT JOIN 
		unique_zipcode_list uz ON b.zipcode = uz.zipcode
	WHERE 
		b.zipcode IS NOT NULL


#For nulls in 'consumer_consent_provided' column are assumed to be 'consent_not_provided'
SELECT distinct consumer_consent_provided from clean_table;
UPDATE clean_table
SET consumer_consent_provided = CASE
	WHEN consumer_consent_provided IS NULL THEN 'Consent not provided' ELSE consumer_consent_provided END;
    

#For nulls in 'company_public_response' column are assumed to be 'Company chooses not to provide a public response'
SELECT distinct company_public_response from clean_table;
UPDATE clean_table
SET company_public_response = CASE
	WHEN company_public_response IS NULL THEN 'Company chooses not to provide a public response' ELSE company_public_response END;
    

select * from clean_table;


#OVERALL performance analysis 
#Consumer complaints analysis for products
#Complaint by products
SELECT product,
	COUNT(*) AS counts
FROM clean_table
GROUP BY product 
ORDER by counts DESC;

#Common issues by products - Root cause analysis for frequent issues
SELECT product,
	sub_product, 
    issue,
    sub_issue,
    COUNT(*) as issue_count 
FROM clean_table 
GROUP BY product, sub_product, issue, sub_issue
ORDER BY issue_count DESC;


#customer behaviour analysis 
#dispute rate 
SELECT 
    SUM(CASE WHEN consumer_disputed LIKE '%Yes%' THEN 1 ELSE 0 END) AS consumer_disputed,
    SUM(CASE WHEN consumer_disputed LIKE '%No%' THEN 1 ELSE 0 END) AS consumer_did_not_disput,
    SUM(CASE WHEN consumer_disputed LIKE '%Yes%' THEN 1 ELSE 0 END) / count(*) as dispute_rate
FROM clean_table;
#0.2 dispoute rate

#correlation between timely response and consumer disputed, timely response --> less dispute?
SELECT 
    timely_response,
    COUNT(*) AS complaint_count,
    SUM(CASE WHEN consumer_disputed = 'Yes' THEN 1 ELSE 0 END) AS disputed_count,
    (SUM(CASE WHEN consumer_disputed = 'Yes' THEN 1 ELSE 0 END) / COUNT(*))  AS dispute_rate
FROM clean_table
GROUP BY timely_response;
#positivly correlated, more complaint with timely response tend to receive more client disputes 
#customer seems to not sensitive to timely response, more case focus for disputing 

#consent provide preference 
SELECT consumer_consent_provided, 
	COUNT(*) AS counts
FROM clean_table
GROUP BY consumer_consent_provided
ORDER BY counts DESC;

#customer submission channel perference and satisfaction 
SELECT submitted_via, 
	COUNT(*) AS counts,
    ROUND(SUM(CASE WHEN consumer_disputed LIKE '%No%' THEN 1 ELSE 0 END) / COUNT(*), 2) AS complaints_handled_satisfaction
FROM clean_table
GROUP BY submitted_via
ORDER BY counts DESC;


#company analysis 
#top 5 companies being complained 
SELECT company, COUNT(*) AS counts
FROM clean_table
GROUP BY company 
ORDER BY counts DESC
LIMIT 5;

#satisfaction rate by companies 
SELECT company,
	SUM(CASE WHEN consumer_disputed LIKE '%No%' THEN 1 ELSE 0 END)/ COUNT(*) AS satisfaction_rate 
FROM clean_table 
GROUP BY company
ORDER BY satisfaction_rate DESC;

#companies's top product being complained
WITH counts AS(
	SELECT DISTINCT company, 
		product,
		COUNT(*) OVER (PARTITION BY company, product) as counts
	FROM clean_table
), rnk AS(
	SELECT *,
		RANK() OVER(PARTITION BY company ORDER BY counts DESC) AS rnk
	FROM counts
)
SELECT company, product, counts 
FROM rnk 
WHERE rnk = 1
ORDER BY counts DESC;

#timely response rate of companies
SELECT company, 
	SUM(CASE WHEN timely_response LIKE '%Yes%' THEN 1 ELSE 0 END)/ COUNT(*) AS timely_response_rate ,
    COUNT(*) AS number_of_complains
FROM clean_table
GROUP BY company 
ORDER BY number_of_complains DESC, timely_response_rate DESC;

#public response rate of companies 
SELECT company, 
	SUM(CASE WHEN company_public_response not LIKE '%chooses not to %' THEN 1 ELSE 0 END)/ COUNT(*) AS public_response_rate ,
    COUNT(*) AS number_of_complains
FROM clean_table
GROUP BY company 
ORDER BY number_of_complains DESC, public_response_rate DESC;

# Detail of companies response to public 
SELECT company, company_public_response, count(*) 
FROM clean_table 
GROUP BY company , company_public_response
ORDER BY company ;

select state, count(*) counts from clean_table group by state order by counts desc
#Geographical analysis 
#product performance 
#Top product in each state 
WITH temp AS(
	SELECT state,
		product, 
		count(*) AS complaints_counts
	FROM clean_table 
	GROUP BY state, product
	ORDER BY state , complaints_counts DESC
), rnk AS(
	SELECT state, 
		product,
		complaints_counts,
		RANK() OVER(PARTITION BY state ORDER BY complaints_counts DESC) AS rnk, 
		complaints_counts/ SUM(complaints_counts) OVER(PARTITION BY state)
		AS percentage_in_state
	FROM temp 
)
SELECT state, product,  complaints_counts, percentage_in_state
FROM rnk
WHERE rnk =1
ORDER BY complaints_counts DESC;


#customer behaviour of each state 
SELECT 
	distinct state,
    COUNT(*) AS counts, 
    SUM(CASE WHEN consumer_consent_provided LIKE '%Consent provided%' THEN 1 ELSE 0 END) / COUNT(*) as consumer_consent_provided_rate, 
	SUM(CASE WHEN consumer_disputed LIKE '%No%' THEN 1 ELSE 0 END) / COUNT(*) as consumer_satisfaction_rate
FROM clean_table
GROUP BY state 
ORDER BY counts DESC


#Serive provider 
#complaints delivery time 
#1. state 
SELECT state,
	AVG(DATEDIFF(date_sent_to_company, date_received)) AS avg_delivery_time, 
    MAX(DATEDIFF(date_sent_to_company, date_received)) AS max_delivery_time, 
    MIN(DATEDIFF(date_sent_to_company, date_received)) AS min_delivery_time,
    COUNT(*) AS complaints_counts
FROM clean_table
GROUP BY state
ORDER BY avg_delivery_time;

#2. company 
SELECT company,
	AVG(DATEDIFF(date_sent_to_company, date_received)) AS avg_delivery_time, 
    MAX(DATEDIFF(date_sent_to_company, date_received)) AS max_delivery_time, 
    MIN(DATEDIFF(date_sent_to_company, date_received)) AS min_delivery_time,
    COUNT(*) AS complaints_counts
FROM clean_table
GROUP BY company
ORDER BY complaints_counts DESC;

#monthly avg_delivery_time, number of complaints and performance changes 
WITH monthly_performance AS(
	SELECT 
		DATE_FORMAT(date_received, '%Y-%m') as delivery_month,
		AVG(DATEDIFF(date_sent_to_company, date_received)) AS avg_delivery_time,
        COUNT(*) AS number_of_complaints
	FROM clean_table
	GROUP BY delivery_month
), last_month AS(
	SELECT delivery_month,
		avg_delivery_time,
		LAG(avg_delivery_time) OVER() AS last_month_avg_delivery_time,
        number_of_complaints,
        LAG(number_of_complaints) OVER() AS last_month_number_of_complaints
	FROM monthly_performance
)
SELECT 
	*,
	CONCAT(
		ROUND(CASE 
			WHEN avg_delivery_time < last_month_avg_delivery_time THEN ((last_month_avg_delivery_time - avg_delivery_time)/ last_month_avg_delivery_time) * 100
			ELSE -((avg_delivery_time - last_month_avg_delivery_time)/ last_month_avg_delivery_time * 100) #calculate perfomrance drop
		END, 2), '%') AS performance_change_on_delivery_time,
	CONCAT(ROUND((number_of_complaints - last_month_number_of_complaints) / last_month_number_of_complaints * 100, 2), '%') AS performance_change_on_number_of_complaints
FROM last_month


#YOY performacnce on complaints
WITH this_year AS(
	SELECT 
		CASE WHEN YEAR(date_received) = 2016 THEN '2016-S1' ELSE YEAR(date_received) END AS `year`,
		COUNT(*) AS number_of_complaints
	FROM clean_table
	GROUP BY `year`
), last_year AS(
	SELECT *, 
		LAG(number_of_complaints) OVER(ORDER BY `year`) as last_year_number_of_complaints
	from this_year
)
SELECT *, 
	CONCAT(ROUND((number_of_complaints - last_year_number_of_complaints) / last_year_number_of_complaints, 2), '%') AS performance_change
FROM last_year;

	
# month reporting event by company 
DELIMITER // 
CREATE EVENT monthly_complaints_report_by_company
ON SCHEDULE EVERY 1 MONTH
DO
BEGIN
    INSERT INTO monthly_complaints_report (company, current_month_complaints, last_month_complaints, percentage_change)
    SELECT 
        company,
        SUM(CASE 
            WHEN MONTH(date_received) = MONTH(CURDATE()) AND YEAR(date_received) = YEAR(CURDATE()) THEN 1 
            ELSE 0 
        END) AS current_month_complaints,
        SUM(CASE 
            WHEN MONTH(date_received) = MONTH(CURDATE() - INTERVAL 1 MONTH) AND YEAR(date_received) = YEAR(CURDATE()) THEN 1 
            ELSE 0 
        END) AS last_month_complaints,
        CONCAT(
            ROUND(
                (SUM(CASE 
                    WHEN MONTH(date_received) = MONTH(CURDATE()) AND YEAR(date_received) = YEAR(CURDATE()) THEN 1 
                    ELSE 0 
                END) - 
                SUM(CASE 
                    WHEN MONTH(date_received) = MONTH(CURDATE() - INTERVAL 1 MONTH) AND YEAR(date_received) = YEAR(CURDATE()) THEN 1 
                    ELSE 0 
                END)) / 
                NULLIF(SUM(CASE 
                    WHEN MONTH(date_received) = MONTH(CURDATE() - INTERVAL 1 MONTH) AND YEAR(date_received) = YEAR(CURDATE()) THEN 1 
                    ELSE 0 
                END), 0) * 100, 2
            ), 
            '%'
        ) AS percentage_change
    FROM 
        clean_table
    WHERE 
        YEAR(date_received) = YEAR(CURDATE())
    GROUP BY 
        company; 
END// 
DELIMITER 
