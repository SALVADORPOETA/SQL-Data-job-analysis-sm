SELECT
    skills,
    COUNT(sj.job_id) AS demand_count
FROM job_postings_fact AS j 
INNER JOIN skills_job_dim AS sj ON j.job_id = sj.job_id
INNER JOIN skills_dim AS sd ON sj.skill_id = sd.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5 

/*

The data shows a clear hierarchy of core skills required for data analyst roles. 
SQL dominates the market with the highest demand, 
confirming its position as the essential competency for virtually every analytics job. 
Excel remains unexpectedly strong, reflecting its continued importance in day-to-day analysis, 
reporting, and corporate workflows. Python ranks close behind, 
signaling the growing need for analysts who can automate processes, handle larger datasets, 
and perform advanced analytical tasks. Tableau leads the visualization tools, 
indicating higher demand in enterprise and technical environments, while Power BI maintains solid demand, 
especially in Microsoft-centric organizations.

Overall, the data highlights a well-defined foundational skill set for competitiveness in the field: 
SQL, Excel, Python, and at least one major BI tool. 
These skills represent the core capabilities employers consistently look for and collectively cover 
the majority of requirements in modern data analyst positions.

[
  {
    "skills": "sql",
    "demand_count": "7291"
  },
  {
    "skills": "excel",
    "demand_count": "4611"
  },
  {
    "skills": "python",
    "demand_count": "4330"
  },
  {
    "skills": "tableau",
    "demand_count": "3745"
  },
  {
    "skills": "power bi",
    "demand_count": "2609"
  }
]

*/