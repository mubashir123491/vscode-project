/*
Find the count of the number of remote job postings per skill
    - Display the top 5 skills by their demand in remote jobs
    - Include skill ID, name, and count of postings requiring the skill
*/

WITH remote_jobs AS(
SELECT
    skill_id,
count(*) as skill_count
FROM
skills_job_dim INNER JOIN job_postings_fact on job_postings_fact.job_id=skills_job_dim.job_id
WHERE
    job_postings_fact.job_title_short= 'Data Analyst' AND
    job_postings_fact.job_work_from_home= TRUE
GROUP BY
    skill_id
)

SELECT 
    skill_count,
    skills,
    skills_dim.skill_id
FROM remote_jobs
INNER JOIN skills_dim ON skills_dim.skill_id=remote_jobs.skill_id
ORDER BY
    skill_count DESC
LIMIT 5;