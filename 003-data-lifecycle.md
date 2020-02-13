# Data LifeCycle

## OLTP (Online Transactional Processing) - Data Analysis Reports
    * Data Generation
    * Entry Point in a Software System
        1. Web Screen / Form Appliction (for data entry)
        2. Automated Data (Program generated / action generated)
        3. Telemetry Systems
    * Types of Data
        1. Master Data   (Data doesnt Change, Store Address, Contact Numbers, Department IDs)
        2. Look up data  (ProductIDs, EmpIDs, usually PKs of transactional data)
        3. Transactional Data

## ODS (Operational Data Store)
* Temporary or cumulated data from OLTP DB systems

## OLAP (Online Analytical Processing)
* Datawarehouse or Very Large database that has historical OLTP data, for 
  data analysis.


# ILM (Information LifeCycle Management)
* Set Data Age Limit upto which the data is stored in OLTP Tables
* Set Data Age Limit upto which the data is stored in ODS Tables
* Set Data Age Limit upto which the data is stored in OLAP Tables
  