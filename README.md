# Go Fish Case Study

A case study project analysing de-identified retail banking transaction data for Outdoor, a fishing retail brand on the island of Gotland. The goal is to compare Outdoor against a grouped competitor set, identify 3 business insights, and turn those insights into practical recommendations that could help improve sales growth.
## What this project does

This project uses customer, transaction, and store data to:

- evaluate Outdoor's performance against a grouped competitor benchmark
- analyse spending patterns by region, age band, and gender
- build an analysis-ready table in BigQuery
- produce business insights
- support a final 1 slide case study summary for stakeholders.

## Project requirements

The case study requires:

- comparison of Outdoor against key competitors
- 3 insights from the data
- 1 action or idea linked to each insight
- a final 1 slide summary only
- aggregated reporting only by region, age band, gender, or a valid combination
- no individual competitor brand metrics
- competitor results shown only as an aggregate of at least 3 competitor brands

## Data sources

The project uses 3 input tables:

- Customers
  - CustomerID
  - Region
  - Age band
  - Gender

- Transactions
  - TransactionID
  - CustomerID
  - Year
  - Amount
  - StoreID
  - Weekday or Weekend

- Stores
  - StoreID
  - Brand
  - Region 

## What has been done

- read Excel sheets into R using `readxl`
- cleaned the `customers`, `stores`, and `transactions` tables
- standardised column names with `janitor::clean_names()`
- trimmed text fields and converted blanks to null values
- removed duplicate records
- connected R to BigQuery using `bigrquery` and `DBI`
- uploaded cleaned tables to the `go-fish-project.case_study` dataset
- created a joined analysis table combining transactions, customers, and stores
- derived a `brand_group` field to separate Outdoor from competitors
- drafted 3 initial business insights for the final case study output

## Current insights

INSIGHTS

1. “Region-2 is one of Outdoor's lowest performing markets”. The 40-50 age band is the strongest spending group in this region, so targeted local promotions may help improve sales.

2. “Sales are weakest in the 20-30 age band”, suggesting Outdoor is not engaging younger adult customers effectively. More targeted digital campaigns and budget-friendly offers may help lift sales in this segment. 

3. “Male customer sales are lower than female customer sales”. Outdoor could test more targeted campaigns and messaging to improve engagement with male buyers and boost sales.

## Getting started

At the moment, the workspace contains project documents rather than a packaged codebase, so setup is based on the workflow captured in the project notes.

### Prerequisites

- R
- Google BigQuery
- Tableau Desktop Professional Edition
 

### Install required R packages

```r
install.packages(c("readxl", "dplyr", "janitor", "stringr", "tidyr", "bigrquery", "DBI"))
