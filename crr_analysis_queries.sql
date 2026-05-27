
-- =============================================
-- CRR DEFECT ANALYSIS PROJECT
-- Author: Maneesh Avula
-- Tools Used: SQL Server
-- =============================================

-- 1. VIEW DATA

SELECT * 
FROM dbo.CRR;


-- 2. CHECK NULL / BLANK VALUES

SELECT *
FROM dbo.CRR
WHERE action_type IS NULL
   OR action_type = ''
   OR week IS NULL
   OR manager IS NULL;


-- 3. REPLACE NULLS WITH 'Unknown'

UPDATE dbo.CRR
SET action_type = 'Unknown'
WHERE action_type IS NULL
   OR action_type = '';

UPDATE dbo.CRR
SET manager = 'Unknown'
WHERE manager IS NULL
   OR manager = '';

UPDATE dbo.CRR
SET week = 'Unknown'
WHERE week IS NULL
   OR week = '';


-- 4. TOTAL DEFECTS BY ACTION TYPE

SELECT 
    action_type,
    COUNT(*) AS total_defects,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS defect_percentage
FROM dbo.CRR
GROUP BY action_type
ORDER BY total_defects DESC;


-- 5. UNKNOWN DEFECT PERCENTAGE

SELECT 
    CAST(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM dbo.CRR) AS DECIMAL(5,2)) AS unknown_percentage
FROM dbo.CRR
WHERE action_type = 'Unknown';


-- 6. WEEK-WISE DEFECT TREND

SELECT 
    week,
    COUNT(*) AS total_defects,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS defect_percentage
FROM dbo.CRR
WHERE week != 'Unknown'
GROUP BY week
ORDER BY week;


-- 7. MANAGER-WISE DEFECT CONTRIBUTION

SELECT 
    manager,
    COUNT(*) AS total_defects,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS defect_percentage
FROM dbo.CRR
WHERE manager != 'Unknown'
GROUP BY manager
ORDER BY total_defects DESC;


-- 8. ACTION TYPE TREND ACROSS WEEKS

SELECT 
    week,
    action_type,
    COUNT(*) AS total_defects
FROM dbo.CRR
WHERE week != 'Unknown'
GROUP BY week, action_type
ORDER BY week, total_defects DESC;


-- 9. TOP CONTRIBUTING MANAGER EACH WEEK

WITH manager_week AS (
    SELECT 
        manager,
        week,
        COUNT(*) AS defects
    FROM dbo.CRR
    WHERE week != 'Unknown'
      AND manager != 'Unknown'
    GROUP BY manager, week
),

ranked AS (
    SELECT *,
        ROW_NUMBER() OVER (PARTITION BY week ORDER BY defects DESC) AS rn
    FROM manager_week
)

SELECT *
FROM ranked
WHERE rn = 1;


-- 10. TOP CONTRIBUTING AGENT EACH WEEK

WITH agent_week AS (
    SELECT 
        agent_login,
        week,
        COUNT(*) AS defects
    FROM dbo.CRR
    WHERE week != 'Unknown'
      AND agent_login IS NOT NULL
    GROUP BY agent_login, week
),

ranked AS (
    SELECT *,
        ROW_NUMBER() OVER (PARTITION BY week ORDER BY defects DESC) AS rn
    FROM agent_week
)

SELECT *
FROM ranked
WHERE rn = 1;


-- 11. PROCESS VS AGENT ISSUE ANALYSIS

SELECT 
    manager,
    agent_login,
    COUNT(*) AS defects,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY manager), 2) AS manager_contribution_percentage
FROM dbo.CRR
WHERE manager != 'Unknown'
GROUP BY manager, agent_login
ORDER BY manager, defects DESC;


-- 12. FINAL BUSINESS INSIGHTS

-- Key Findings:
-- 1. Unknown action types contributed significantly to total defects.
-- 2. Email Customer action type showed increasing trend week-on-week.
-- 3. Defects were distributed evenly across investigators.
-- 4. Issue appeared to be process-driven rather than investigator-driven.
-- 5. Data quality improvements are required before deeper analysis.
