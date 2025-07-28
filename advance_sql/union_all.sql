-- Get jobs and companies from January
SELECT
company_id,
    job_title_short,
    job_location
    FROM
    jan_jobs;

UNION ALL
-- Get jobs and companies from February
SELECT
    company_id,
    job_title_short,
    job_location
    FROM feb_jobs;

    UNION ALL
-- Get jobs and companies from march
SELECT
    company_id,
    job_title_short,
    job_location
    FROM mar_jobs;