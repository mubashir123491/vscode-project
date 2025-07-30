
/* 
Label new column as follows based on job_location:
- 'Anywhere' jobs as 'Remote'
- 'New York, NY' jobs as  'Local'
- Otherwise 'Onsite'
*/

SELECT 
COUNT (job_id) AS number_of_jobs,


case 
    when    job_location = 'New York, NY' THEN  'Local'
    WHEN     job_location = 'Anywhere' THEN 'Remote'
    ELSE    'onsite'
    end AS LOCATION_CATEGORY


FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
 GROUP BY
    LOCATION_CATEGORY
