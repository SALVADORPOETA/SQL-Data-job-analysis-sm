SELECT
    j.job_id,
    j.job_title_short,
    j.company_id,
    j.salary_year_avg,
    s2j.skill_id,
    sd.type
FROM 
    january_jobs AS j
LEFT JOIN skills_job_dim AS s2j
    ON j.job_id = s2j.job_id
LEFT JOIN skills_dim AS sd  
    ON sd.skill_id = s2j.skill_id
WHERE
    j.salary_year_avg > 70000

UNION ALL

SELECT
    j.job_id,
    j.job_title_short,
    j.company_id,
    j.salary_year_avg,
    s2j.skill_id,
    sd.type
FROM 
    february_jobs AS j
LEFT JOIN skills_job_dim AS s2j
    ON j.job_id = s2j.job_id
LEFT JOIN skills_dim AS sd  
    ON sd.skill_id = s2j.skill_id
WHERE
    j.salary_year_avg > 70000

UNION ALL

SELECT
    j.job_id,
    j.job_title_short,
    j.company_id,
    j.salary_year_avg,
    s2j.skill_id,
    sd.type
FROM 
    march_jobs AS j
LEFT JOIN skills_job_dim AS s2j
    ON j.job_id = s2j.job_id
LEFT JOIN skills_dim AS sd  
    ON sd.skill_id = s2j.skill_id
WHERE
    j.salary_year_avg > 70000

