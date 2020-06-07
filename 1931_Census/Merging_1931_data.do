/* ******************************************************************** *
* ******************************************************************** *
*  MERGING 1931 AGRICULTURAL DATA 


       ** PURPOSE:      Exploring 24 datasets, cleaning and combining them into one 1931 agricultural-workers dataset

	   ** NOTES:
       
	   ** WRITEN BY:    Mansi Panchamia
      
	  ** Last date modified:  June 4, 2020
      
	  
* ******************************************************************** *
* ******************************************************************** */

clear all
set more off
version 13.0

/*

	Install xls2dta (converting excel files into stata datasets)
	ssc install xls2dta 

	Install renvarlab (changing variable names to match label names)
	ssc install renvarlab

*/

cd "C:\Users\mansi\Dropbox\Pakistan Corridors IE\Data\RawData\Old_census\1931Census\T10"

/*Importing all excel files and converting them to .dta format*/
xls2dta: import excel .

* ---------------------------------------------------------------------------- *
* Data Cleaning
* ---------------------------------------------------------------------------- *

* ---------------------------------------------------------------------------- *
/* AJMER */
* ---------------------------------------------------------------------------- *
use "1931ajmeroc.dta", clear
drop in 11/24

foreach var of varlist A-L {
local labels = `var'[2] + `var'[3] + `var'[4]
label variable `var' "`labels'"

}
save "1931ajmeroc.dta", replace

* ---------------------------------------------------------------------------- *
/* ASSAM */
* ---------------------------------------------------------------------------- *
use "1931assamoc.dta", clear

drop J-Q
drop Z-CG
foreach var of varlist A-Y {
local labels = `var'[3] + `var'[4] + `var'[5]
label variable `var' "`labels'"

}
rename A District_of_State
rename B Total_population_Male
rename C Total_population_Female
rename D Total_earners_Male
rename E Total_earners_Female
rename F Working_dependants_Male
rename G Working_dependants_Female
rename H Nonworking_dependants_Male
rename I Nonworking_dependants_Female
rename R Total_workers_Male_agripasture
rename S Total_workers_Female_agripasture
rename T Working_dependants_M_agripasture /* Male shortened to _M due to variable character limit constriant */
rename U Working_dependants_F_agripasture /* Female shortened to _F due to variable character limit constraint */
rename V Total_workers_Male_cultivation
rename W Total_workers_Female_cultivation
rename X Working_dependants_M_cultivation /* Male shortened to _M due to variable character limit constriant */
rename Y Working_dependants_F_cultivation /* Female shortened to _F due to variable character limit constraint */

drop in 1/6
save "1931assamoc_clean.dta"

* ---------------------------------------------------------------------------- *
/* BALUCHISTAN */
* ---------------------------------------------------------------------------- *
use "1931baluchoc.dta", clear
drop in 9/22

foreach var of varlist A-AN {
local labels = `var'[1] + `var'[2] + `var'[3]
label variable `var' "`labels'"

}

save "1931baluchoc.dta", replace

* ---------------------------------------------------------------------------- *
/* BARODA */
* ---------------------------------------------------------------------------- *
use "1931barodaoc.dta", clear
drop in 11/24

foreach var of varlist A-BQ {
local labels = `var'[2] + `var'[3] + `var'[4]
label variable `var' "`labels'"

}
save "1931barodaoc.dta", replace

* ---------------------------------------------------------------------------- *
/* BENGAL */
* ---------------------------------------------------------------------------- *
use "1931bengaloc.dta", clear
drop I-P
drop Y-CC
foreach var of varlist A-X {
local labels = `var'[3] + `var'[4] + `var'[5]
label variable `var' "`labels'"

}

rename A District_of_State
rename B Total_population
rename C Total_earners_Male
rename D Total_earners_Female
rename E Working_dependants_Male
rename F Working_dependants_Female
rename G Nonworking_dependants_Male
rename H Nonworking_dependants_Female
rename Q Total_workers_Male_agripasture
rename R Total_workers_Female_agripasture
rename S Working_dependants_M_agripasture /* Male shortened to _M due to variable character limit constriant */
rename T Working_dependants_F_agripasture /* Female shortened to _F due to variable character limit constraint */
rename U Total_workers_Male_cultivation
rename V Total_workers_Female_cultivation
rename W Working_dependants_M_cultivation /* Male shortened to _M due to variable character limit constriant */
rename X Working_dependants_F_cultivation /* Female shortened to _F due to variable character limit constraint */

drop in 1/6
save "1931bengaloc_clean.dta"

* ---------------------------------------------------------------------------- *
/* BIHAR AND ORISSA */
* ---------------------------------------------------------------------------- *
use "1931biharoc.dta", clear
drop I-P
drop Y-CC
foreach var of varlist A-X {
local labels = `var'[3] + `var'[4] + `var'[5]
label variable `var' "`labels'"

}

rename A District_of_State
rename B Total_population
rename C Total_earners_Male
rename D Total_earners_Female
rename E Working_dependants_Male
rename F Working_dependants_Female
rename G Nonworking_dependants_Male
rename H Nonworking_dependants_Female
rename Q Total_workers_Male_agripasture
rename R Total_workers_Female_agripasture
rename S Working_dependants_M_agripasture /* Male shortened to _M due to variable character limit constriant */
rename T Working_dependants_F_agripasture /* Female shortened to _F due to variable character limit constraint */
rename U Total_workers_Male_cultivation
rename V Total_workers_Female_cultivation
rename W Working_dependants_M_cultivation /* Male shortened to _M due to variable character limit constriant */
rename X Working_dependants_F_cultivation /* Female shortened to _F due to variable character limit constraint */

drop in 1/6
save "1931biharoc_clean.dta"

* ---------------------------------------------------------------------------- *
/* BOMBAY */
* ---------------------------------------------------------------------------- *
use "1931bombayoc.dta", clear
drop I-P
drop Y-CB
foreach var of varlist A-X {
local labels = `var'[3] + `var'[4] + `var'[5]
label variable `var' "`labels'"

}

rename A District_of_State
rename B Total_population
rename C Total_earners_Male
rename D Total_earners_Female
rename E Working_dependants_Male
rename F Working_dependants_Female
rename G Nonworking_dependants_Male
rename H Nonworking_dependants_Female
rename Q Total_workers_Male_agripasture
rename R Total_workers_Female_agripasture
rename S Working_dependants_M_agripasture /* Male shortened to _M due to variable character limit constriant */
rename T Working_dependants_F_agripasture /* Female shortened to _F due to variable character limit constraint */
rename U Total_workers_Male_cultivation
rename V Total_workers_Female_cultivation
rename W Working_dependants_M_cultivation /* Male shortened to _M due to variable character limit constriant */
rename X Working_dependants_F_cultivation /* Female shortened to _F due to variable character limit constraint */

drop in 1/6
save "1931bombayoc_clean.dta"

* ---------------------------------------------------------------------------- *
/* CENTRAL PROVINCES AND BERAR */
* ---------------------------------------------------------------------------- *
use "1931centralprovincesoc.dta", clear
drop I-P
drop Y-CB
foreach var of varlist A-X {
local labels = `var'[3] + `var'[4] + `var'[5]
label variable `var' "`labels'"

}

rename A District_of_State
rename B Total_population
rename C Total_earners_Male
rename D Total_earners_Female
rename E Working_dependants_Male
rename F Working_dependants_Female
rename G Nonworking_dependants_Male
rename H Nonworking_dependants_Female
rename Q Total_workers_Male_agripasture
rename R Total_workers_Female_agripasture
rename S Working_dependants_M_agripasture /* Male shortened to _M due to variable character limit constriant */
rename T Working_dependants_F_agripasture /* Female shortened to _F due to variable character limit constraint */
rename U Total_workers_Male_cultivation
rename V Total_workers_Female_cultivation
rename W Working_dependants_M_cultivation /* Male shortened to _M due to variable character limit constriant */
rename X Working_dependants_F_cultivation /* Female shortened to _F due to variable character limit constraint */

drop in 1/6
save "1931centralprovincesoc_clean.dta"

* ---------------------------------------------------------------------------- *
/* CENTRAL INDIA AGENCY */
* ---------------------------------------------------------------------------- *
use "1931ciaoc.dta", clear
drop I-P
drop Y-CB
foreach var of varlist A-X {
local labels = `var'[3] + `var'[4] + `var'[5]
label variable `var' "`labels'"

}

rename A District_of_State
rename B Total_population
rename C Total_earners_Male
rename D Total_earners_Female
rename E Working_dependants_Male
rename F Working_dependants_Female
rename G Nonworking_dependants_Male
rename H Nonworking_dependants_Female
rename Q Total_workers_Male_agripasture
rename R Total_workers_Female_agripasture
rename S Working_dependants_M_agripasture /* Male shortened to _M due to variable character limit constriant */
rename T Working_dependants_F_agripasture /* Female shortened to _F due to variable character limit constraint */
rename U Total_workers_Male_cultivation
rename V Total_workers_Female_cultivation
rename W Working_dependants_M_cultivation /* Male shortened to _M due to variable character limit constriant */
rename X Working_dependants_F_cultivation /* Female shortened to _F due to variable character limit constraint */

drop in 1/6
save "1931ciaoc_clean.dta"

* ---------------------------------------------------------------------------- *
/* GWALIOR */
* ---------------------------------------------------------------------------- *
use "1931gwalioroc.dta", clear
drop in 15/27

save "1931gwalioroc.dta", replace  /* unsure of the nomenclature - no cultivation suborder */

* ---------------------------------------------------------------------------- *
/* HYDERABAD */
* ---------------------------------------------------------------------------- *
use "1931hyderabadoc.dta", clear
drop in 11/24
save "1931hyderabadoc.dta", replace

* ---------------------------------------------------------------------------- *
/* JAMMU AND KASHMIR */
* ---------------------------------------------------------------------------- *
use "1931jkoc.dta", clear
drop I-P
drop Y-CB
foreach var of varlist A-X {
local labels = `var'[3] + `var'[4] + `var'[5]
label variable `var' "`labels'"

}

rename A District_of_State
rename B Total_population
rename C Total_earners_Male
rename D Total_earners_Female
rename E Working_dependants_Male
rename F Working_dependants_Female
rename G Nonworking_dependants_Male
rename H Nonworking_dependants_Female
rename Q Total_workers_Male_agripasture
rename R Total_workers_Female_agripasture
rename S Working_dependants_M_agripasture /* Male shortened to _M due to variable character limit constriant */
rename T Working_dependants_F_agripasture /* Female shortened to _F due to variable character limit constraint */
rename U Total_workers_Male_cultivation
rename V Total_workers_Female_cultivation
rename W Working_dependants_M_cultivation /* Male shortened to _M due to variable character limit constriant */
rename X Working_dependants_F_cultivation /* Female shortened to _F due to variable character limit constraint */

drop in 1/6
save "1931jkoc_clean.dta"

* ---------------------------------------------------------------------------- *
/* MADRAS */
* ---------------------------------------------------------------------------- *
use "1931madrasoc.dta", clear
drop I-R
drop W-CZ 
/*Total order 1A assumed to be for cultivation from previous datasets */
foreach var of varlist A-V {
local labels = `var'[3] + `var'[4] + `var'[5]
label variable `var' "`labels'"

}
rename A District_of_State
rename B Total_population
rename C Total_earners_Male
rename D Total_earners_Female
rename E Working_dependants_Male
rename F Working_dependants_Female
rename G Nonworking_dependants_Male
rename H Nonworking_dependants_Female
rename S Total_workers_Male_cultivation
rename T Total_workers_Female_cultivation
rename U Working_dependants_M_cultivation /* Male shortened to _M due to variable character limit constriant */
rename V Working_dependants_F_cultivation /* Female shortened to _F due to variable character limit constraint */

drop in 1/6
save "1931madrasoc_clean.dta"

* ---------------------------------------------------------------------------- *
/* MYSORE */
* ---------------------------------------------------------------------------- *
use "1931mysoreoc.dta", clear
drop I-P
drop Y-CB
foreach var of varlist A-X {
local labels = `var'[3] + `var'[4] + `var'[5]
label variable `var' "`labels'"

}
rename A District_of_State
rename B Total_population
rename C Total_earners_Male
rename D Total_earners_Female
rename E Working_dependants_Male
rename F Working_dependants_Female
rename G Nonworking_dependants_Male
rename H Nonworking_dependants_Female
rename Q Total_workers_Male_agripasture
rename R Total_workers_Female_agripasture
rename S Working_dependants_M_agripasture /* Male shortened to _M due to variable character limit constriant */
rename T Working_dependants_F_agripasture /* Female shortened to _F due to variable character limit constraint */
rename U Total_workers_Male_cultivation
rename V Total_workers_Female_cultivation
rename W Working_dependants_M_cultivation /* Male shortened to _M due to variable character limit constriant */
rename X Working_dependants_F_cultivation /* Female shortened to _F due to variable character limit constraint */

drop in 1/6
save "1931mysoreoc_clean.dta"

* ---------------------------------------------------------------------------- *
/* NORTH WEST FRONTIER PROVINCE */
* ---------------------------------------------------------------------------- *
use "1931nwfpoc.dta", clear
drop in 11/24

save "1931nwfpoc.dta", replace

* ---------------------------------------------------------------------------- *
/* PUNJAB */
* ---------------------------------------------------------------------------- *
use "1931punjaboc.dta", clear
drop I-P
drop Y-CC
foreach var of varlist A-X {
local labels = `var'[3] + `var'[4] + `var'[5]
label variable `var' "`labels'"

}
rename A District_of_State
rename B Total_population
rename C Total_earners_Male
rename D Total_earners_Female
rename E Working_dependants_Male
rename F Working_dependants_Female
rename G Nonworking_dependants_Male
rename H Nonworking_dependants_Female
rename Q Total_workers_Male_agripasture
rename R Total_workers_Female_agripasture
rename S Working_dependants_M_agripasture /* Male shortened to _M due to variable character limit constriant */
rename T Working_dependants_F_agripasture /* Female shortened to _F due to variable character limit constraint */
rename U Total_workers_Male_cultivation
rename V Total_workers_Female_cultivation
rename W Working_dependants_M_cultivation /* Male shortened to _M due to variable character limit constriant */
rename X Working_dependants_F_cultivation /* Female shortened to _F due to variable character limit constraint */

drop in 1/6
save "1931punjaboc_clean.dta"

* ---------------------------------------------------------------------------- *
/* RAJPUTANA */
* ---------------------------------------------------------------------------- *
use "1931rajoc.dta", clear
drop I-P
drop Y-CC
foreach var of varlist A-X {
local labels = `var'[3] + `var'[4] + `var'[5]
label variable `var' "`labels'"

}
rename A District_of_State
rename B Total_population
rename C Total_earners_Male
rename D Total_earners_Female
rename E Working_dependants_Male
rename F Working_dependants_Female
rename G Nonworking_dependants_Male
rename H Nonworking_dependants_Female
rename Q Total_workers_Male_agripasture
rename R Total_workers_Female_agripasture
rename S Working_dependants_M_agripasture /* Male shortened to _M due to variable character limit constriant */
rename T Working_dependants_F_agripasture /* Female shortened to _F due to variable character limit constraint */
rename U Total_workers_Male_cultivation
rename V Total_workers_Female_cultivation
rename W Working_dependants_M_cultivation /* Male shortened to _M due to variable character limit constriant */
rename X Working_dependants_F_cultivation /* Female shortened to _F due to variable character limit constraint */

drop in 1/6
save "1931rajoc_clean.dta"

* ---------------------------------------------------------------------------- *
/* BIHAR AND ORRISA */
* ---------------------------------------------------------------------------- *
use "1931upoc.dta", clear
/* new columns - agricultural subsidiary occupation (male/female) added to each order, suborder and differentiating agricultural subsidiary in the total population */

* ---------------------------------------------------------------------------- *
/* WESTERN INDIA STATE AGENCY */
* ---------------------------------------------------------------------------- *
use "1931WISoc.dta", clear
drop I-P
drop Y-CB
foreach var of varlist A-X {
local labels = `var'[3] + `var'[4] + `var'[5]
label variable `var' "`labels'"

}
rename A District_of_State
rename B Total_population
rename C Total_earners_Male
rename D Total_earners_Female
rename E Working_dependants_Male
rename F Working_dependants_Female
rename G Nonworking_dependants_Male
rename H Nonworking_dependants_Female
rename Q Total_workers_Male_agripasture
rename R Total_workers_Female_agripasture
rename S Working_dependants_M_agripasture /* Male shortened to _M due to variable character limit constriant */
rename T Working_dependants_F_agripasture /* Female shortened to _F due to variable character limit constraint */
rename U Total_workers_Male_cultivation
rename V Total_workers_Female_cultivation
rename W Working_dependants_M_cultivation /* Male shortened to _M due to variable character limit constriant */
rename X Working_dependants_F_cultivation /* Female shortened to _F due to variable character limit constraint */

drop in 1/6
save "1931WISoc_clean.dta"

* ---------------------------------------------------------------------------- *
/* Temp1931-T10(V28) (DIVISIONS) */
* ---------------------------------------------------------------------------- *
use "Temp1931-T10(V28).dta", clear 
/* No district or state mentioned - Division */
drop in 11/24
save "Temp1931-T10(V28).dta", replace

* ---------------------------------------------------------------------------- *
/* Template v5T10-OUT (BENGAL) */
* ---------------------------------------------------------------------------- *
use "Template v5T10-OUT.dta", clear
drop L-O
drop T-AQ
foreach var of varlist A-S {
local labels = `var'[3] + `var'[4] 
label variable `var' "`labels'"

}
drop A
rename B District_of_State
rename C Total_population_Male
rename D Total_population_Female
rename E Total_population
rename F Total_earners_Male
rename G Total_earners_Female
rename H Working_dependants_Male
rename I Working_dependants_Female
rename J Nonworking_dependants_Male
rename K Nonworking_dependants_Female
rename P Population_agripasture_Male /* No specification given as to what the number represents [Workers or Dependants] */
rename Q Population_agripasture_Female
rename R Population_cultivation_Male /* No specification given as to what the number represents [Workers or Dependants] */
rename S Population_cultivation_Female
drop in 1/5
save "Template v5T10-OUT_clean.dta"

* ---------------------------------------------------------------------------- *
/* Template v17T10-OUT (PUNJAB) */
* ---------------------------------------------------------------------------- *
use "Template v17T10-OUT.dta", clear
drop A
drop L-O
drop T-AQ
foreach var of varlist B-S {
local labels = `var'[3] + `var'[4] 
label variable `var' "`labels'"

}
rename B District_of_State
rename C Total_population_Male
rename D Total_population_Female
rename E Total_population
rename F Total_earners_Male
rename G Total_earners_Female
rename H Working_dependants_Male
rename I Working_dependants_Female
rename J Nonworking_dependants_Male
rename K Nonworking_dependants_Female
rename P Population_agripasture_Male /* No specification given as to what the number represents [Workers or Dependants] */
rename Q Population_agripasture_Female
rename R Population_cultivation_Male /* No specification given as to what the number represents [Workers or Dependants] */
rename S Population_cultivation_Female
drop in 1/5
save "Template v17T10-OUT_clean.dta"

* ---------------------------------------------------------------------------- *
/* Template v18T10-OUT(UNITED PROVINCES) */
* ---------------------------------------------------------------------------- *
use "Template v18T10-OUT.dta", clear
drop A
drop L-O
drop T-AQ
foreach var of varlist B-S {
local labels = `var'[3] + `var'[4] 
label variable `var' "`labels'"

}
rename B District_of_State
rename C Total_population_Male
rename D Total_population_Female
rename E Total_population
rename F Total_earners_Male
rename G Total_earners_Female
rename H Working_dependants_Male
rename I Working_dependants_Female
rename J Nonworking_dependants_Male
rename K Nonworking_dependants_Female
rename P Population_agripasture_Male /* No specification given as to what the number represents [Workers or Dependants] */
rename Q Population_agripasture_Female
/*The absence of cultivators' numbers cannot be defined as the addition of tenant and non tenant cultivators. Hence, columns are left empty */
rename R Population_cultivation_Male /* No specification given as to what the number represents [Workers or Dependants] */
rename S Population_cultivation_Female
drop in 1/5
save "Template v18T10-OUT_clean.dta"

/* Merging '_clean' datasets */

use "1931assamoc_clean.dta", clear
append using "1931bengaloc_clean.dta"
append using "1931bombayoc_clean.dta"
append using "1931centralprovincesoc_clean.dta"
append using "1931ciaoc_clean.dta"
append using "1931jkoc_clean.dta"
append using "1931madrasoc_clean.dta"
append using "1931mysoreoc_clean.dta"
append using "1931punjaboc_clean.dta"
append using "1931rajoc_clean.dta"
append using "1931WISoc_clean.dta"
append using "Template v5T10-OUT_clean.dta"
append using "Template v17T10-OUT_clean.dta"
append using "Template v18T10-OUT_clean.dta"

save "1931_agriculture_clean.dta"






