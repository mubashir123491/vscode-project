/*what are the top skills based on salary?
--look at the average salary associated witheach skill for data analyst
--focuses on roles with specified salaries, regardless of location
*/
SELECT 
skills AS skill_names,
ROUND (AVG(salary_year_avg), 0) AS average_salary
FROM job_postings_fact

INNER JOIN skills_job_dim on skills_job_dim.job_id=job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id=skills_job_dim.skill_id     

where   
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home= TRUE
GROUP BY
    skill_names
ORDER BY
average_salary DESC
limit 25;
