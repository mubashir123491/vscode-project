/*
Find job postings from the first quarter that have a salary greater than $70K
- Combine job posting tables from the first quarter of 2023 (Jan-Mar)
- Gets job postings with an average yearly salary > $70,000 
- Filter for Data Analyst Jobs and order by salary
*/

SELECT
    job_title_short,
    job_location,
    job_via,
    job_posted_date:: DATE
FROM(
    SELECT *
    FROM jan_jobs
UNION ALL
    SELECT *
    FROm feb_jobs
UNION ALL
    SELECT *
    FROM mar_jobs
) 
WHERE
    job_title_short= 'Data Analyst' AND
    salary_year_avg>70000
    ORDER BY 
    salary_year_avg DESC