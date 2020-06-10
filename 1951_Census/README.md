# README file for 1951 Census data cleaning for agricultural workers

This document details features of the 1951 census dataset made available to the researchers and cleaning operations performed on the data to generate a dataset of agricultural workers.

There are two subfolders within the 1951 Census track - 
1. Pakistan - 30 files containing educational outcomes, religious beliefs and occupation data
2. India - 3 subfolders containing educational and occupational outcomes

To merge data on agricultural workers in Pakistan, 30 files in the Pakistan folder are used. Out of these 30 datasets, 5 datasets contain occupational data, 11 datasets contain data on educational outcomes, 8 datasets contain data on population's religious beliefs and 6 datasets contain population information [district, total population (males/females), area in sq miles]

The goal is to combine these 5 datasets into one 1951 dataset which will then be merged with datsets from 1921 and 1931 to form a panel dataset.

To focus on agricultural data, the following variables from each dataset were generated:
| Variable name | Description |
|-------------- | ----------- |
|District_of_State | Name of the district (also includes subdivisions, tehsils)|
|Total_population_Male | Total male population of that district |
|Total_population_Female | Total female population of that district |
|Total_workers_M_agriculture | Total male civilian workers in agriculture|
| Total_workers_M_non_agriculture| Total male civilian workers working in non agricultural occupations|
|Total_workers_M_non_civilian | Total male non-civilian workers |
|Dependants_on_Male | Total population of dependants on male workers|
|Total_workers_F_agriculture| Total female civilian workers in agriculture|
|Total_workers_F_non_agriculture |Total male civilian workers working in non agricultural occupations|
| Total_workers_F_non_civilian | Total female non-civilian workers|
| Dependants_on_Female| Total population of dependants on female workers|


The .do file associated with this README first reads all the excel files in the selected folder and converts them into .dta format. Since each of these datasets have a unique combination of structure, position of the selected variables (column numbers are different), and difference in naming formats, each of these files are individually cleaned and stored as a new .dta file with the same name as before, with the suffix '_clean'. Then, the individual cleaned files are appended at the lowest common denominator of state, to generate a 1951 dataset of agricultural workers. 

