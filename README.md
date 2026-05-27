# CRR Defect Analysis Dashboard

## Project Overview

This project focuses on analyzing CRR (Customer Return Rate) defects using Excel, SQL, and Power BI to identify key defect drivers, operational gaps, and process-level issues.

The goal of this project was to simulate a real-world operational analytics use case by working with raw and messy data, performing data cleaning, deriving KPIs, analyzing trends, and presenting insights through an interactive dashboard.

This project was personally important to me because it helped me transition from an operations/investigation background into data analytics by applying business thinking along with technical skills.

---

# Business Problem

The business observed increasing CRR defects across multiple teams and needed answers to:

- Which action types contribute most to defects?
- Are defects increasing week-on-week?
- Are defects concentrated within specific teams or agents?
- Is the issue process-driven or agent-driven?
- How is missing/unknown data impacting the analysis?

---

# Tools Used

| Tool | Purpose |
|---|---|
| Excel | Initial exploration, pivots, trend analysis |
| SQL Server | Data cleaning, transformations, KPI calculations |
| Power BI | Dashboard creation and storytelling |

---

# Dataset Information

## Dataset Characteristics

- ~20,000 records
- 8 weeks of operational data
- Multiple managers and investigators
- Multiple action types
- Included:
  - Missing values
  - Duplicate records
  - Unknown categories
  - Data quality issues

---

# Data Cleaning Performed (SQL)

- Replaced NULL and blank values with 'Unknown'
- Standardized categorical fields
- Removed duplicates
- Derived week-wise analysis structure
- Calculated percentage contribution metrics
- Created ranking logic using window functions

---

# SQL Concepts Used

## Aggregations
- COUNT()
- SUM()
- ROUND()

## Window Functions
- ROW_NUMBER()
- SUM() OVER()
- PARTITION BY

## Other Concepts
- CTEs (Common Table Expressions)
- CASE WHEN
- Percentage calculations
- Ranking logic
- Trend analysis

---

# Key KPIs

- Total Defects
- Unknown %
- Week-wise Defect Trend
- Manager-wise Defect Contribution
- Action Type Contribution
- Agent-level Distribution

---

# Key Insights

## 1. High Unknown Percentage

Approximately 29% of records were categorized as 'Unknown', which significantly impacted the reliability of the analysis and highlighted a major data quality issue.

### Recommendation
Improve data capture validation and enforce mandatory action type logging.

---

## 2. Email Customer Trend

Email Customer defects showed a gradual increasing trend across weeks, indicating a potential process or communication gap.

### Recommendation
Perform sample audits and provide targeted SOP/training refreshers.

---

## 3. Process-Level Issue

Defects were evenly distributed across investigators within the highest contributing manager's team.

### Conclusion
The issue appeared to be process-driven rather than individual performance-driven.

---

# Power BI Dashboard

## Dashboard Pages

### Page 1 — Executive Overview
- Total Defects KPI
- Unknown % KPI
- Action Type Contribution
- Week-wise Trend
- Manager Filters

### Page 2 — Performance Analysis
- Manager Comparison
- Agent Breakdown
- Trend Analysis
- Team Contribution

---

# Business Recommendations

1. Prioritize fixing Unknown data categories before process optimization.
2. Conduct targeted audits for Email Customer actions.
3. Review SOP adherence across teams.
4. Introduce mandatory action-type validation.
5. Monitor week-on-week trends after implementing fixes.

---

# Folder Structure

```text
CRR-Defect-Analysis/
│
├── Dataset/
│   └── crr_dataset.xlsx
│
├── SQL Queries/
│   └── crr_analysis_queries.sql
│
├── Power BI Dashboard/
│   └── crr_dashboard.pbix
│
├── Screenshots/
│   ├── dashboard_overview.png
│   ├── trend_analysis.png
│   └── manager_analysis.png
│
└── README.md
```

---

# What I Learned

This project helped me strengthen:

- SQL querying and data transformation
- KPI calculations and trend analysis
- Business storytelling using Power BI
- Root cause analysis thinking
- Stakeholder-focused communication

It also helped me understand how raw operational data can be transformed into actionable business insights.

---

# About Me

I currently work in operations/investigation support and am transitioning into data analytics by building hands-on projects using SQL, Power BI, and Excel.

This project reflects both my operational understanding and my growing analytical skill set.
