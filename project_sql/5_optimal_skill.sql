WITH skills_demand AS (
    SELECT
        sd.skill_id,
        sd.skills,
        COUNT(sj.job_id) AS demand_count
    FROM job_postings_fact AS j 
    INNER JOIN skills_job_dim AS sj ON j.job_id = sj.job_id
    INNER JOIN skills_dim AS sd ON sj.skill_id = sd.skill_id
    WHERE
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = TRUE
    GROUP BY
        sd.skill_id
), average_salary AS (
    SELECT
        sj.skill_id,
        ROUND(AVG(j.salary_year_avg), 0) AS avg_salary
    FROM job_postings_fact AS j
    INNER JOIN skills_job_dim AS sj ON j.job_id = sj.job_id
    INNER JOIN skills_dim AS sd ON sj.skill_id = sd.skill_id
    WHERE
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = TRUE
    GROUP BY
        sj.skill_id
)

SELECT
    sd.skill_id,
    sd.skills,
    demand_count,
    avg_salary
FROM
    skills_demand AS sd
INNER JOIN average_salary ON sd.skill_id = average_salary.skill_id
WHERE
    demand_count > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25;

--------- Rewriting the same query more concisely
SELECT
    sd.skill_id,
    sd.skills,
    COUNT(sj.job_id) AS demand_count,
    ROUND(AVG(j.salary_year_avg), 0) AS avg_salary
FROM
    job_postings_fact AS j
INNER JOIN
    skills_job_dim AS sj ON j.job_id = sj.job_id
INNER JOIN
    skills_dim AS sd ON sj.skill_id = sd.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
GROUP BY
    sd.skill_id
HAVING
    COUNT(sj.job_id) > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25;

/*

The data highlights the most valuable remote-friendly technical skills associated with Data Analyst roles 
that offer average salaries between USD 97,000 and 115,000. 
The highest-paying skills, such as Go (USD 115,320), Confluence (USD 114,210), Hadoop (USD 113,193), 
and Snowflake (USD 112,948), reflect a strong demand for capabilities traditionally associated with data engineering, 
cloud analytics, and enterprise data infrastructure. 
Although these skills command high compensation, their demand counts are relatively modest, 
indicating that they are specialized competencies required by a smaller segment of employers.

In contrast, widely adopted analytical skills such as Python (236 listings), Tableau (230 listings), 
and R (148 listings) show substantially higher demand but slightly lower average salary levels, 
generally around USD 99,000–101,000. 
This pattern suggests a mature and competitive market for core analytics tools, 
where broad adoption stabilizes salary ranges despite strong employer interest.

Cloud ecosystem skills—Azure, AWS, BigQuery, and Redshift—demonstrate both high demand and competitive compensation, 
underscoring the ongoing migration of analytical workloads to cloud platforms. 
Similarly, BI and data visualization tools such as Looker, Qlik, and SSRS maintain relevance, 
offering salaries near USD 100,000.

Overall, the dataset indicates that Data Analyst roles with higher salary potential increasingly value 
hybrid profiles that blend analytics, cloud infrastructure, and data engineering skills. 
High-demand foundational skills (SQL, Python, Tableau) remain essential, 
while specialized technologies (Snowflake, Hadoop, Go, Confluence) 
offer a premium for analysts capable of operating across more complex data ecosystems.

[
  {
    "skill_id": 8,
    "skills": "go",
    "demand_count": "27",
    "avg_salary": "115320"
  },
  {
    "skill_id": 234,
    "skills": "confluence",
    "demand_count": "11",
    "avg_salary": "114210"
  },
  {
    "skill_id": 97,
    "skills": "hadoop",
    "demand_count": "22",
    "avg_salary": "113193"
  },
  {
    "skill_id": 80,
    "skills": "snowflake",
    "demand_count": "37",
    "avg_salary": "112948"
  },
  {
    "skill_id": 74,
    "skills": "azure",
    "demand_count": "34",
    "avg_salary": "111225"
  },
  {
    "skill_id": 77,
    "skills": "bigquery",
    "demand_count": "13",
    "avg_salary": "109654"
  },
  {
    "skill_id": 76,
    "skills": "aws",
    "demand_count": "32",
    "avg_salary": "108317"
  },
  {
    "skill_id": 4,
    "skills": "java",
    "demand_count": "17",
    "avg_salary": "106906"
  },
  {
    "skill_id": 194,
    "skills": "ssis",
    "demand_count": "12",
    "avg_salary": "106683"
  },
  {
    "skill_id": 233,
    "skills": "jira",
    "demand_count": "20",
    "avg_salary": "104918"
  },
  {
    "skill_id": 79,
    "skills": "oracle",
    "demand_count": "37",
    "avg_salary": "104534"
  },
  {
    "skill_id": 185,
    "skills": "looker",
    "demand_count": "49",
    "avg_salary": "103795"
  },
  {
    "skill_id": 2,
    "skills": "nosql",
    "demand_count": "13",
    "avg_salary": "101414"
  },
  {
    "skill_id": 1,
    "skills": "python",
    "demand_count": "236",
    "avg_salary": "101397"
  },
  {
    "skill_id": 5,
    "skills": "r",
    "demand_count": "148",
    "avg_salary": "100499"
  },
  {
    "skill_id": 78,
    "skills": "redshift",
    "demand_count": "16",
    "avg_salary": "99936"
  },
  {
    "skill_id": 187,
    "skills": "qlik",
    "demand_count": "13",
    "avg_salary": "99631"
  },
  {
    "skill_id": 182,
    "skills": "tableau",
    "demand_count": "230",
    "avg_salary": "99288"
  },
  {
    "skill_id": 197,
    "skills": "ssrs",
    "demand_count": "14",
    "avg_salary": "99171"
  },
  {
    "skill_id": 92,
    "skills": "spark",
    "demand_count": "13",
    "avg_salary": "99077"
  },
  {
    "skill_id": 13,
    "skills": "c++",
    "demand_count": "11",
    "avg_salary": "98958"
  },
  {
    "skill_id": 186,
    "skills": "sas",
    "demand_count": "63",
    "avg_salary": "98902"
  },
  {
    "skill_id": 7,
    "skills": "sas",
    "demand_count": "63",
    "avg_salary": "98902"
  },
  {
    "skill_id": 61,
    "skills": "sql server",
    "demand_count": "35",
    "avg_salary": "97786"
  },
  {
    "skill_id": 9,
    "skills": "javascript",
    "demand_count": "20",
    "avg_salary": "97587"
  }
]

*/