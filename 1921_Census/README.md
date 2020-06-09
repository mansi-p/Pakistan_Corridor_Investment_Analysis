# README file for 1921 Census data cleaning for agricultural workers

This document details features of the 1921 census dataset made available to the researchers and cleaning operations performed on the data to generate a dataset of agricultural workers.

There are three subfolders within the 1921 Census track - 
1. 1921 pt - Contains population data of individual states (variables - district name, area in sq. miles, total population, male and female population)
2. 1921 t8 (religion) - Contains literacy rate and religious beliefs of population in each state (variables - district name, religious beliefs and age, Literate population_male, Literate population_female and population, literate in English)
3. 1921 t17 (means of living) - Contains occupation of population in each state (variables - district name, total population - males, females, dependants, classes and subclasses of different occupation)

To merge data on agricultural workers, 21 files in 1921 t17 (means of living) folder are used. Out of these 21 datasets, 12 are in the format of [District, disaggregated data (male, female, dependants) of different types of occupation as variables] and 9 are in the format of [Occupations, disaggreagated data of district populations for each of these occupations]. Overall, data availability is consistent across the datasets with a high degree of granularity with disaggreated data (male, female and dependants) available for all classes and subclasses of occupation


The goal is to combine these 21 datasets into one 1921 dataset which will then be merged with datsets from 1931 and 1951 to form a panel dataset.
To focus on agricultural data, the following variables from each dataset were generated:
| Variable name | Description |
|-------------- | ----------- |
|District_of_State | Name of the district (also includes subdivisions, tehsils)|
|Total_Population| Population of the district (not available in all datasets) |
|Total_workers_Male| Total male working force in the district (not available in all datasets) |
|Total_workers_Female| Total female working force in the district (not available in all datasets)  |
| Dependants | Total number of dependants in the district (not available in all datasets) |
|Workers_dependants_agripasture| Total number of workers and dependants in each district working in 'Total order 1' occupation of agriculture and pasture (abbv. agripasture)|
|Total_workers_Male_agripasture | Total male working force in agripasture in the district|
|Total_workers_Female_agripasture | Total female working force in agripasture in the district |
|Workers_dependants_cultivation | Total number of workers and dependants in each district working in 'Total suborder a' occupation of cultivation|
|Total_workers_Male_cultivation | Total male working force in cultivation in the district|
|Total_workers_Female_cultivation |  Total female working force in cultivation in the district|
|Dependants_agripasture | Dependants of workers in agripasture (not available in all datasets)|
|Dependants_cultivation | Dependants of workers in cultivation (not avaiable in all datasets)|

P.S. 
1. Dataset '1921 t17 central provinces and berar' is the only dataset to have additional disaggregate data on 'partial agriculturist' which has been retained for that dataset. (Unsure what the semantics mean)
2. Dataset 'temp1921-t17(v13)-out' has occupation 'Total order 1a' (different from nomenclature used in other datasets such as 'Total order 1' and 'Total suborder a'). No explaination has been offered regarding its meaning. The dataset does not have cultivation as occupation, as well. 
3. Dataset 'temp1921-t17(v16)-out' has 'Ordinary cultivation' listed as an occupation twice, with different population values in variable columns under the names '2. Ordinary cultivation' and 'Total order 1(a) Ordinary cultivation'. For now, Data under 'Total order 1(a)'' has been classified as per cultivation data from other datasets whereas '2. Ordinary cultivation' has been retained under the same title with suffix '_2'
4. Dataset 'temp1921-t17(v18)' has no district or state listed - just 'Central India' as the abstract region
5. Dataset 'temp1921-t17(v12)' has no district or state specified

The .do file associated with this README first reads all the excel files in the selected folder and converts them into .dta format. Since each of these datasets have a unique combination of structure, position of the selected variables (column numbers are different), and difference in naming formats, each of these files are individually cleaned and stored as a new .dta file with the same name as before, with the suffix '_clean'. Then, the individual cleaned files are appended at the lowest common denominator of state, to generate a 1921 dataset of agricultural workers. 

