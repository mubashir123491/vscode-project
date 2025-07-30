/* what skills are req for data analyst paying jobs?
use first query for top paying jobs
add specific skills required for these roles*/

WITH top_paying_jobs AS
(
SELECT 
    job_id,
    job_title,
    salary_year_avg,
    company_dim.name AS company_name

FROM
    job_postings_fact LEFT JOIN
    company_dim ON job_postings_fact.company_id=company_dim.company_id
where   
    job_title_short= 'Data Analyst' and
    job_location='Anywhere' AND
    salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
limit 10
) 

SELECT 
    top_paying_jobs.*,
    skills_dim.skills AS skills_name
FROM top_paying_jobs
INNER JOIN skills_job_dim ON skills_job_dim.job_id=top_paying_jobs.job_id
INNER JOIN skills_dim ON skills_dim.skill_id=skills_job_dim.skill_id
ORDER BY salary_year_avg DESC

LIMIT 10