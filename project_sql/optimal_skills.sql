/*
Answer: What are the most optimal skills to learn (aka it’s in high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles
- Concentrates on remote positions with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries), 
    offering strategic insights for career development in data analysis
*/

-- Identifies skills in high demand for Data Analyst roles
-- Use Query #3
WITH demanded_skills AS (
SELECT 
    skills_dim.skill_id,
    skills_dim.skills AS skill_names,
    count(skills_job_dim.job_id) AS total_count_of_skills
FROM job_postings_fact

INNER JOIN skills_job_dim on skills_job_dim.job_id=job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id=skills_job_dim.skill_id     

where   
    job_title_short = 'Data Analyst' AND
    job_work_from_home= TRUE
    AND salary_year_avg IS NOT NULL
GROUP BY
    skills_dim.skill_id

)

-- Skills with high average salaries for Data Analyst roles
-- Use Query #4
,
average_salaries AS(
SELECT
    skills_job_dim.skill_id,
ROUND (AVG(job_postings_fact.salary_year_avg), 0) AS average_salary
FROM job_postings_fact

INNER JOIN skills_job_dim on skills_job_dim.job_id=job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id=skills_job_dim.skill_id     

where   
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home= TRUE
GROUP BY
    skills_job_dim.skill_id

)
-- Return high demand and high salaries for 10 skills 

SELECT
    demanded_skills.skill_id,
    demanded_skills.skill_names,
    total_count_of_skills,
    average_salary

FROM demanded_skills
INNER JOIN average_salaries ON demanded_skills.skill_id=average_salaries.skill_id 
WHERE
    total_count_of_skills>10
ORDER BY
    average_salary DESC,
    total_count_of_skills DESC
    
LIMIT 25;