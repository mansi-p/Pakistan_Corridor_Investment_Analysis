# README file for 1931 Census data cleaning for agricultural workers

This document details features of the 1931 census dataset made available to the researchers and cleaning operations performed on the data to generate a dataset of agricultural workers.

There are three subfolders within the 1931 Census track - 
1. PT1 - Contains population data of individual states (variables - states and agencies, area in sq. miles, total population, male and female population)
2. PT2 - Contains literacy rate and religious beliefs of population in each state (variables - district name, religious beliefs, Literate population_male, Literate population_female and population, literate in English)
3. T10 - Contains occupation of population in each state (variables - district name, total population - males, females, dependants, classes and subclasses of different occupation)

To merge data on agricultural workers, 24 files in T10 folder are used. Out of these 24 datasets, 16 are in the format of [District, disaggregated data (male, female, dependants) of different types of occupation as variables] and 8 are in the format of [Occupations, disaggreagated data of district populations for each of these occupations]

The goal is to combine these 24 datasets into one 1931 dataset which will then be merged with datsets from 1921 and 1951 to form a panel dataset.

To focus on agricultural data, the following variables from each dataset were generated:
| Variable name | Description |
|-------------- | ----------- |
|District_of_State | Name of the district (also includes subdivisions, tehsils)|
|Total_Population| Population of the district (not available in all datasets) |
|Total_population_Male | Total male population of that district (not avaiable in all datasets)|
|Total_population_Female | Total female population of that district (not avaiable in all datasets)|
|Total_earners_Male| Total male earning force in the district (not avaiable in all datasets) |
|Total_earners_Female| Total female earning force in the district (not avaiable in all datasets)  |
|Working_dependants_Male| Total number of male dependants in that district |
|Working_dependants_Female| Total number of female dependants in that district|
|Nonworking_dependants_Male| Total number of male nonworking dependants in that district |
|Nonworking_dependants_Female | Total number of female nonworking dependants in that district |
|Total_workers_Male_agripasture | Total male working force in 'Total order 1' occupation of agriculture and pasture (abbv. agripasture) in the district|
|Total_workers_Female_agripasture | Total female working force in agripasture in the district |
|Total_workers_Male_cultivation | Total male working force in cultivation in the district|
|Total_workers_Female_cultivation |  Total female working force in cultivation in the district|
|Working_dependants_M_agripasture| Total male working dependants in agripasture|
|Working_dependants_F_agripasture | Total female working dependants in agripasture |
|Working_dependants_M_cultivation | Total male working dependants in cultivation |
|Working_dependants_F_cultivation | Total female working dependants in cultivation |
|Population_agripasture_Male | Total male population in agripasture (Only available in one dataset)|
|Population_agripasture_Female | Total female population in agripasture (Only avaiable in one dataset)|
|Population_cultivation_Male | Total male population in cultivation (Only avaiable in one dataset)|
|Population_cultivation_Female | Total female population in cultivation (Only avaiable in one dataset)|

Observations:
1. Dataset '1931gwalioroc' has different, undefined nomenclature used without cultivation suborder used
2. In dataset '1931madrasoc', 'Total order 1a' has no occupation identified and is assumed to be for cultivation, from previous datasets
3. In dataset '1931upoc' (Bihar and Orissa), occupations are differently aggregated than all other datasets- 'agricultural subsidiary' [Male and Female] added to each order and suborder and a new 'agricultural subsidiary' in the total population
4. Dataset 'Temp1931-T10(V28)' has no districts or state, just divisons (Central, Northern, High range, Southern)
5. Dataset 'Template v18T10-OUT' is the only dataset which has 'Population_agripasture_Male', etc. It is unclear what that term represents [(Earners + Working dependants + Nonworking dependants) or (Earners + Dependants) or some other combination]

The .do file associated with this README first reads all the excel files in the selected folder and converts them into .dta format. Since each of these datasets have a unique combination of structure, position of the selected variables (column numbers are different), and difference in naming formats, each of these files are individually cleaned and stored as a new .dta file with the same name as before, with the suffix '_clean'. Then, the individual cleaned files are appended at the lowest common denominator of state, to generate a 1931 dataset of agricultural workers. 
