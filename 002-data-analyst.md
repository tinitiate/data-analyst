# Enterprise Data Base Management

## OLTP Multiple Systems
* Transactional Data
* Core Business Data
  * Look Up Data
  * Master Data
* Exmaples
  * Sales OLTP
  * Inventory OLTP
  * HR OLTP
  * Marketing OLTP


## ODS (Operational Data Store)
* Collect all data from various **OLTP** systems
* The ODS **DataModel** is similar to same as the OLTP **DataModel**


## OLAP or Data Warehouse For Analysis
* This is the database where we run reports and analytics
* This is a copy of the OLTP data, but the data here is **Transformed**

## ETL Process
* **ETL** Extract Transform and Load
* **Extract** from OLTP database
* **Load** to Staging or ODS database
* **Transform** and **Load** to OLAP database
