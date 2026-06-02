# Go Fish Outdoor Sales Analysis

## Project Overview

This project analyses de-identified customer transaction data for **Outdoor**, a fishing retail brand in the Go Fish case study.

The aim of the project is to identify why Outdoor's sales performance has slowed, compare Outdoor against an aggregated **Competitor Group**, and present practical business recommendations through a one-page executive Tableau dashboard.

The final dashboard focuses on three key areas:

1. Outdoor vs Competitor Group performance
2. Region 2 demand, leakage, and pop-up store opportunity
3. Customer behaviour clusters and targeted marketing strategies

## Dashboard Preview

<img width="1623" height="1025" alt="image" src="https://github.com/user-attachments/assets/2ba66f51-a054-4259-9d8e-4bfe8096c023" />


## Business Problem

Outdoor's total revenue declined by **2 percent year-on-year**.

The project investigates whether this decline is linked to:

* lower revenue growth
* weaker customer growth
* lower average spend per customer
* lower basket size
* regional demand leakage
* different customer behaviour patterns

The final output is designed as a CEO-style summary that highlights the most important insights and recommended actions without exposing individual customer-level data.

## Key Insights

### Insight 1: Outdoor's slowdown is driven by weaker Avg. Basket Size and Avg. Spend per Customer compared to previous year. 

Outdoor is compared against one aggregated Competitor Group rather than individual competitors. This follows the case study requirement and avoids displaying individual competitor brand performance.

The analysis shows that Outdoor is performing below the Competitor Group across multiple customer value metrics, including:

* total revenue
* total distinct customers
* customer growth
* average basket size
* average spend per customer

Recommended action:

* Sales strategies to increase the basket size and average spending per customer.

### Insight 2: Region 2 appears underserved

Region 2 shows local shopping behaviour and fair demand, but Outdoor has no physical store presence in the region.

The leakage analysis suggests that some Region 2 customer spend is currently flowing to stores outside the region.

Recommended action:

* Test Region 2 demand through a low-risk pop-up store before considering any permanent store decision.

Important note:

* The Region 2 scenario is revenue-only and assumption-based.
* It should not be treated as a full investment forecast.

### Insight 3: Outdoor has two customer behaviour clusters

The customer clustering analysis identifies four behaviour-based customer groups:

Cluster 1: High Frequency, Low Basket
Cluster 2: Moderate Frequency, High Spend
Cluster 3: Low Frequency, Mid Basket
Cluster 4: Very Low Frequency, High Basket

The clustering model is based on:

average basket size
average transactions per customer
average spend per customer

Gender and age are used only after clustering to describe the customer audience. They are not used to create the clusters.

Recommended actions:

Cluster 1: Use bundle and add-on offers in high female traffic areas.
Cluster 2: Use limited-time offers at sports events.
Cluster 3: Use limited-time offers at sports events.
Cluster 4: Use reminders and re-engagement campaigns.

## Project Features

This project includes:

* Data cleaning and preparation in R
* Upload of cleaned data into BigQuery
* Creation of an analysis-ready table for Tableau
* Outdoor vs Competitor Group KPI comparison
* Revenue growth and customer growth analysis
* Region 2 leakage analysis
* Region 2 pop-up store scenario model
* Customer behaviour clustering
* Age and gender breakdown after clustering
* One-page executive Tableau dashboard
* Business-focused recommendations linked to each insight

## Data Sources

The project uses three main data tables:

### Customers

Contains customer demographic and regional information.

Key fields include:

* CustomerID
* Customer Region
* Gender
* Age Band

### Transactions

Contains transaction-level sales activity.

Key fields include:

* TransactionID
* CustomerID
* StoreID
* Year
* Amount
* Weekday or Weekend

### Stores

Contains store and brand information.

Key fields include:

* StoreID
* Brand
* Store Region

## Tools Used

* R
* RStudio
* Google BigQuery
* Tableau Desktop
* Excel

## R Packages Used

```r
install.packages(c(
  "readxl",
  "dplyr",
  "janitor",
  "stringr",
  "tidyr",
  "bigrquery",
  "DBI"
))
```

Main package purposes:

* `readxl`: import Excel data
* `dplyr`: clean and transform data
* `janitor`: clean column names
* `stringr`: standardise text fields
* `tidyr`: reshape and tidy data
* `bigrquery`: connect R to BigQuery
* `DBI`: database connection support

## Project Workflow

### 1. Data Cleaning in R

The raw Excel data was cleaned and prepared in R.

Main cleaning steps included:

* importing Excel sheets
* standardising column names
* trimming text fields
* converting blank values to missing values
* checking duplicates
* cleaning customers, stores, and transactions tables
* preparing the data for upload into BigQuery

### 2. BigQuery Setup

The cleaned tables were uploaded into BigQuery under the project dataset.

Main analysis table:

```text
go-fish-project.case_study.analysis_table
```

The final analysis table combines customer, transaction, and store data into one Tableau-ready table.

### 3. Tableau Analysis

The Tableau workbook was used to build the final visual analysis.

Key analysis areas include:

* Outdoor vs Competitor Group performance
* total revenue and revenue change
* customer growth and distinct customer count
* average basket size
* average spend per customer
* Region 2 leakage spend
* Region 2 total spend
* Region 2 pop-up store scenario
* customer behaviour clustering
* customer profile by gender and age group

### 4. Executive Dashboard

The final Tableau dashboard is designed as a one-page executive summary.

It includes:

* CEO concern
* colour coding for Outdoor and Competitor Group
* revenue decline visual
* KPI comparison table
* Region 2 demand and leakage visuals
* pop-up store scenario model
* customer cluster summary
* customer profile by gender and age group
* recommended actions

## Scenario Model

The Region 2 scenario model estimates potential revenue impact using three components:

```text
Estimated Net Gain = Recoverable Leakage + New Convenience Demand - Cannibalised Sales
```

Scenario inputs include:

* capture rate
* convenience uplift rate
* cannibalisation rate

The model is used to test possible revenue impact only.

It does not include:

* rent
* profit margins
* store operating costs
* travel distance
* customer travel time
* product category data
* competitor location data

Because of these limitations, the recommendation is to test Region 2 demand through a pop-up store rather than immediately recommending a permanent store.

## Customer Clustering

The customer clustering model is behaviour-based.

Inputs used:

* average transactions per customer
* average basket size
* average spend per customer

Final customer clusters:

| Cluster                   | Description                                                 | Recommended Strategy                      |
| ------------------------- | ----------------------------------------------------------- | ----------------------------------------- |
| High Frequency, Low Spend | Customers who buy often but spend less per transaction      | Use bundles and add-on offers             |
| Low Frequency, High Spend | Customers who buy less often but spend more per transaction | Use reminders and re-engagement campaigns |

Gender and age group are used only as explanatory dimensions after clustering.

## Case Study Rules Followed

This project follows the key case study rules:

* Competitor brands are grouped into one Competitor Group.
* Individual competitor brands are not shown separately.
* Final insights are presented at an aggregated level.
* Individual customer-level data is not exposed in the final dashboard.
* Customer clustering is based on behavioural measures.
* Gender and age are used only to explain clusters after modelling.
* Region 2 scenario values are treated as indicative estimates, not confirmed forecasts.


## Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/your-username/go-fish-outdoor-sales-analysis.git
cd go-fish-outdoor-sales-analysis
```

### 2. Open the R project or script

Open the data cleaning script in RStudio:

```text
scripts/data_cleaning.R
```

### 3. Install required R packages

```r
install.packages(c(
  "readxl",
  "dplyr",
  "janitor",
  "stringr",
  "tidyr",
  "bigrquery",
  "DBI"
))
```

### 4. Run the cleaning script

The script prepares the customer, transaction, and store tables for analysis.

### 5. Open the Tableau workbook

Open the Tableau packaged workbook:

```text
tableau/outdoor_dashboard.twbx
```

Use the final dashboard tab to view the executive summary.

## Usage

This project can be used as a portfolio example for:

* data cleaning
* business analysis
* Tableau dashboard development
* customer segmentation
* scenario modelling
* retail sales analysis
* executive reporting

The project demonstrates how transaction data can be transformed into clear business recommendations.

## Limitations

The analysis has several limitations:

* The scenario model is revenue-only.
* The model does not include profit, rent, or operating costs.
* Customer distance and travel time are not available.
* Competitor location data is not available.
* Product category data is not available.
* Customer clusters show behaviour patterns, not fixed customer types.
* The analysis suggests opportunities but does not prove causation.

## Future Improvements

Future improvements could include:

* adding profit margin data
* adding store operating cost data
* adding customer distance or travel time data
* adding product category data
* testing Region 2 through a real pop-up store trial
* tracking marketing campaign performance by customer cluster
* comparing results before and after customer acquisition campaigns


## Maintainer

Maintained by:

```text
Lekhraj Shah
Sydney, NSW
```

## Contribution Guidelines

This is a personal case study and portfolio project.

If contributing or reviewing:

* keep analysis aggregated
* do not expose customer-level records
* do not display individual competitor brand performance
* maintain Australian English spelling
* keep dashboard wording clear, cautious, and business-focused

## Acknowledgements

Thank you to Sumanyu and Jesper from Choreograph, WPP Sydney, for providing the Go Fish case study dataset and feedback on the analysis approach, dashboard structure, and business interpretation.

This project was completed for educational and portfolio purposes. The analysis, dashboard design, and final recommendations are my own work.
