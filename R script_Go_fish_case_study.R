#Read excel sheets as tables.
library(readxl)
file_path <- "C:/Users/Lekh/Documents/Learn Data - Copy/Go Fish Case Study/work files/Go Fish Case Study Data.xlsx"
file.exists(file_path)
customers <- read_excel(file_path, sheet = "Customers")
transactions <- read_excel(file_path, sheet = "Transactions")
stores <- read_excel(file_path, sheet = "Stores")

#Clean the data in tables: 
install.packages(c("readxl", "dplyr", "janitor", "stringr", "tidyr"))

#Clean "customers" table and save as "customers_clean":

library(dplyr)
library(stringr)
library(tidyr)
library(janitor)

customers_clean <- customers %>%
  clean_names() %>%
  filter(!if_all(everything(), is.na)) %>%
  mutate(across(where(is.character), str_trim)) %>%
  mutate(across(where(is.character), ~ na_if(., ""))) %>%
  distinct()

#Clean "stores" table and save as "stores_clean":

stores_clean <- stores %>%
  clean_names() %>%
  filter(!if_all(everything(), is.na)) %>%
  mutate(across(where(is.character), str_trim)) %>%
  mutate(across(where(is.character), ~ na_if(., ""))) %>%
  distinct()

#Clean "transactions" table and save as "transaction_clean":

transaction_clean <- transactions %>%
  clean_names() %>%
  filter(!if_all(everything(), is.na)) %>%
  mutate(across(where(is.character), str_trim)) %>%
  mutate(across(where(is.character), ~ na_if(., ""))) %>%
  distinct()

#Clean table name:

transactions_clean <- transaction_clean
rm(transaction_clean)

#Connect R to Biquery and upload cleaned tables into BigQuery:

install.packages(c("bigrquery", "DBI", "janitor")) #install required packages

library(bigrquery)
library(DBI)
library(janitor)


#Authenticate R to BigQuery:
bq_auth()
project_id <- "go-fish-project"
dataset_id <- "case_study"
con <- dbConnect(
  bigquery(),
  project = project_id,
  dataset = dataset_id,
  billing = project_id
)


#upload the tables to BQ.

dbWriteTable(con, "customers_clean", customers_clean, overwrite = TRUE)
dbWriteTable(con, "stores_clean", stores_clean, overwrite = TRUE)
dbWriteTable(con, "transactions_clean", transactions_clean, overwrite = TRUE)

#Check the connection to BQ(BigQuery):

dbListTables(con)

bq_auth(use_oob = TRUE)
