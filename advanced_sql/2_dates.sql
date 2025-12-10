SELECT
    c.name AS compay_name
FROM 
    job_postings_fact AS j
JOIN
    company_dim AS c
    ON
        j.company_id = c.company_id
WHERE
    j.job_health_insurance = TRUE AND
    EXTRACT(YEAR FROM j.job_posted_date) = 2023 AND
    EXTRACT(QUARTER FROM j.job_posted_date) = 2
GROUP BY
    c.name
ORDER BY
    c.name


