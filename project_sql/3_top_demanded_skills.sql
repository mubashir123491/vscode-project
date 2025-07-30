/* what are the most demanded skills for data analyst
--join job posting to inner join similar to query 2
--identify top 5 in demand skills
--focus on all job posting*/


SELECT 
skills AS skill_names,
count(skills_job_dim.job_id) AS total_count_of_skills
FROM job_postings_fact

INNER JOIN skills_job_dim on skills_job_dim.job_id=job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id=skills_job_dim.skill_id     

where   
    job_title_short = 'Data Analyst' AND
    job_work_from_home= TRUE
GROUP BY
    skill_names
ORDER BY total_count_of_skills DESC
limit 5;