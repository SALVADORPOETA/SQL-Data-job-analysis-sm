SELECT
    c.company_id,
    c.name AS company_name,
    job_counts.total_jobs,
    CASE
        WHEN job_counts.total_jobs < 10 THEN 'Small'
        WHEN job_counts.total_jobs BETWEEN 10 AND 50 THEN 'Medium'
        WHEN job_counts.total_jobs > 50 THEN 'Large'
    END AS company_size
FROM
    company_dim AS c
JOIN (
    SELECT
        company_id,
        COUNT(*) AS total_jobs
    FROM job_postings_fact
    GROUP BY company_id
) AS job_counts
ON 
    c.company_id = job_counts.company_id
ORDER BY
    job_counts.total_jobs DESC