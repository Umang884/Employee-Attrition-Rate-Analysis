use hranalyticsproject;
select * from hr12;

## KPI 1 ( Attrition Rate percent department wsie)

## ANSWER

SELECT 
    department,
    ROUND(SUM(`Attrition Count`) * 100.0 / COUNT(*), 2) AS attrition_rate_percent
FROM hr12
GROUP BY department order by attrition_rate_percent desc;


#KPI 2 (Average Hourly Rate foe Male Research Scientist

# Answer

SELECT jobrole,gender,avg(hourlyrate) AS AverageHourlyRate
FROM hr12
WHERE JobRole = 'Research Scientist' 
  AND Gender = 'Male';
  
#KPI 3 Attrition Rate in terms of Monthy Income

SELECT
    `Income Band`,
    COUNT(*) AS total_employees,
    SUM(`Attrition Count`) AS attrition_count,
    ROUND(SUM(`Attrition Count`) * 100.0 / COUNT(*), 2) AS attrition_rate_percent
FROM hr12
GROUP BY `Income Band`
ORDER BY `Income Band`;

#KPI4 ( Average working years department wise)

select avg(totalworkingyears) as averageworkingyears , department
from hr12
group by department order by averageworkingyears desc;

#KPI 5 Job role vs work life balance

 #answer
 
select avg(worklifebalance) as average_work_life_balance ,jobrole from hr12
group by jobrole order by average_work_life_balance desc;

#KPI6 Attrition rate vs Years since last Promotion

SELECT
    CASE
        WHEN yearssincelastpromotion BETWEEN 1 AND 2 THEN '1-2 Years'
        WHEN yearssincelastpromotion BETWEEN 3 AND 5 THEN '3-5 Years'
        WHEN yearssincelastpromotion BETWEEN 6 AND 10 THEN '6-10 Years'
        WHEN yearssincelastpromotion > 10 THEN '10+ Years'
        ELSE 'No Promotion'
    END AS promotion_band,

    SUM(`Attrition Count`) AS total_attrition,
    COUNT(*) AS total_employees,
	ROUND(SUM(`Attrition Count`) * 100.0 / COUNT(*), 2) AS attrition_rate_percent
FROM hr12
GROUP BY promotion_band
ORDER BY attrition_rate_percent DESC;


