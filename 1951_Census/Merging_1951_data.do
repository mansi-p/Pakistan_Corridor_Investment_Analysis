/* ******************************************************************** *
* ******************************************************************** *
*  MERGING 1951 AGRICULTURAL DATA 


       ** PURPOSE:      Exploring 30 datasets, cleaning and combining them into one 1951 agricultural-workers dataset

	   ** NOTES:
       
	   ** WRITEN BY:    Mansi Panchamia
      
	  ** Last date modified:  June 9, 2020
      
	  
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
cd "C:\Users\mansi\Dropbox\Pakistan Corridors IE\Data\RawData\Old_census\1951Census\Pakistan"

/*Importing all excel files and converting them to .dta format*/
xls2dta: import excel . 

* ---------------------------------------------------------------------------- *
* Data Cleaning
* ---------------------------------------------------------------------------- *

* ---------------------------------------------------------------------------- *
/* 1951 Pak V2T11-OUT (BALUCHISTAN) */
* ---------------------------------------------------------------------------- *
use "1951 Pak V2T11-OUT.dta", clear
foreach var of varlist A-K {
local labels = `var'[4] + `var'[5] + `var'[6] + `var'[7]
label variable `var' "`labels'"

}
rename A District_of_State
rename B Total_population_Male
rename C Total_workers_M_agriculture /* Male shortened to _M due to variable character limit constriant */
rename D Total_workers_M_non_agriculture /* Male shortened to _M due to variable character limit constriant */
rename E Total_workers_M_non_civilian /* Male shortened to _M due to variable character limit constriant */
rename F Dependants_on_Male
rename G Total_population_Female
rename H Total_workers_F_agriculture /* Female shortened to _F due to variable character limit constraint */
rename I Total_workers_F_non_agriculture /* Female shortened to _F due to variable character limit constraint */
rename J Total_workers_F_non_civilian /* Female shortened to _F due to variable character limit constraint */
rename K Dependants_on_Female /* Female shortened to _F due to variable character limit constraint */
drop in 1/7
save "1951 Pak V2T11-OUT_clean.dta"

* ---------------------------------------------------------------------------- *
/* 1951Pak V2 T9B-OUT (BALUCHISTAN) */
* ---------------------------------------------------------------------------- *
use "1951Pak V2 T9B-OUT.dta", clear
/* education outcomes dataset */

* ---------------------------------------------------------------------------- *
/* 1951Pak V2T6-OUT (BALUCHISTAN) */
* ---------------------------------------------------------------------------- *
use "1951Pak V2T6-OUT.dta", clear
/* religious beliefs dataset */

* ---------------------------------------------------------------------------- *
/* 1951Pak V2T9 A Muslim-OUT (BALUCHISTAN) */
* ---------------------------------------------------------------------------- *
use "1951Pak V2T9 A Muslim-OUT.dta", clear
/*Muslim education outcomes dataset */

* ---------------------------------------------------------------------------- *
/* 1951Pak V2T9A-OUT (BALUCHISTAN) */
* ---------------------------------------------------------------------------- *
use "1951Pak V2T9A-OUT.dta", clear
/* educational outcomes dataset */

* ---------------------------------------------------------------------------- *
/* 1951Pak V3T1-OUT (EAST BENGAL) */
* ---------------------------------------------------------------------------- *
use "1951Pak V3T1-OUT.dta", clear
/* population dataset, does not contain any occupation data */

* ---------------------------------------------------------------------------- *
/* 1951Pak v3T6s2-OUT (EAST BENGAL) */
* ---------------------------------------------------------------------------- *
use "1951Pak v3T6s2-OUT.dta", clear
/* religious beliefs dataset */

* ---------------------------------------------------------------------------- *
/* 1951Pak V3T9B-OUT (EAST BENGAL) */
* ---------------------------------------------------------------------------- *
use "1951Pak V3T9B-OUT.dta", clear
/*education outcomes dataset */

* ---------------------------------------------------------------------------- *
/* 1951Pak V4T1-OUT (AGENCY STATES AND TRIBAL AREAS) */
* ---------------------------------------------------------------------------- *
use "1951Pak V4T1-OUT.dta", clear
/* population dataset, does not contain any occupation data */

* ---------------------------------------------------------------------------- *
/* 1951Pak v4T8-OUT (FRONTIER REGIONS) */
* ---------------------------------------------------------------------------- *
use "1951Pak v4T8-OUT.dta", clear
/* educational outcomes dataset */

* ---------------------------------------------------------------------------- *
/* 1951Pak V5T1-OUT(PUNJAB) */
* ---------------------------------------------------------------------------- *
use "1951Pak V5T1-OUT.dta", clear
/* population dataset, does not contain any occupation data */

* ---------------------------------------------------------------------------- *
/* 1951Pak V6T1-OUT(SIND) */
* ---------------------------------------------------------------------------- *
use "1951Pak V6T1-OUT.dta", clear
/* population dataset, does not contain any occupation data */

* ---------------------------------------------------------------------------- *
/* 1951Pak V6T6s2-OUT(SIND) */
* ---------------------------------------------------------------------------- *
use "1951Pak V6T6s2-OUT.dta", clear
/* religious beleifs dataset */

* ---------------------------------------------------------------------------- *
/* 1951Pak V6T9A Muslim-OUT(SIND) */
* ---------------------------------------------------------------------------- *
use "1951Pak V6T9A Muslim-OUT.dta", clear
/* Muslim educational outcomes dataset */

* ---------------------------------------------------------------------------- *
/* 1951Pak V6T9B-OUT(SIND) */
* ---------------------------------------------------------------------------- *
use "1951Pak V6T9B-OUT.dta", clear
/* educational outcomes dataset */

* ---------------------------------------------------------------------------- *
/* 1951Pak v6T11-OUT(SIND) */
* ---------------------------------------------------------------------------- *
use "1951Pak v6T11-OUT.dta", clear
foreach var of varlist A-K {
local labels = `var'[4] + `var'[5] + `var'[6] + `var'[7]
label variable `var' "`labels'"

}
rename A District_of_State
rename B Total_population_Male
rename C Total_workers_M_agriculture /* Male shortened to _M due to variable character limit constriant */
rename D Total_workers_M_non_agriculture /* Male shortened to _M due to variable character limit constriant */
rename E Total_workers_M_non_civilian /* Male shortened to _M due to variable character limit constriant */
rename F Dependants_on_Male
rename G Total_population_Female
rename H Total_workers_F_agriculture /* Female shortened to _F due to variable character limit constraint */
rename I Total_workers_F_non_agriculture /* Female shortened to _F due to variable character limit constraint */
rename J Total_workers_F_non_civilian /* Female shortened to _F due to variable character limit constraint */
rename K Dependants_on_Female /* Female shortened to _F due to variable character limit constraint */
drop in 1/7
save "1951Pak v6T11-OUT_clean.dta"

* ---------------------------------------------------------------------------- *
/* 1951PakV2T1-OUT (BALUCHISTAN INCLUDING STATES UNION) */
* ---------------------------------------------------------------------------- *
use "1951PakV2T1-OUT.dta", clear
/*population dataset, does not contain occupation data */

* ---------------------------------------------------------------------------- *
/* 1951PakV3T6-OUT(EAST BENGAL) */
* ---------------------------------------------------------------------------- *
use "1951PakV3T6-OUT.dta", clear
/* religious beleifs dataset */

* ---------------------------------------------------------------------------- *
/* 1951PakV3T9A-OUT(CHITTAGONG DIVISION) */
* ---------------------------------------------------------------------------- *
use "1951PakV3T9A-OUT.dta", clear
/* educational outcomes dataset */

* ---------------------------------------------------------------------------- *
/* 1951PakV4T3-OUT(AGENCIES, TRIBAL AREAS AND STATES) */
* ---------------------------------------------------------------------------- *
use "1951PakV4T3-OUT.dta", clear
/* relgious beliefs dataset */

* ---------------------------------------------------------------------------- *
/* 1951PakV5T6-OUT(PUNJAB) */
* ---------------------------------------------------------------------------- *
use "1951PakV5T6-OUT.dta", clear
/* religious beliefs dataset */

* ---------------------------------------------------------------------------- *
/* 1951PakV5T6s2-OUT(PUNJAB) */
* ---------------------------------------------------------------------------- *
use "1951PakV5T6s2-OUT.dta", clear
/* religious beliefs dataset */

* ---------------------------------------------------------------------------- *
/* 1951PakV5T9B-OUT(PUNJAB) */
* ---------------------------------------------------------------------------- *
use "1951PakV5T9B-OUT.dta", clear
/* educational outcomes dataset */

* ---------------------------------------------------------------------------- *
/* 1951PakV6T6-OUT(SIND) */
* ---------------------------------------------------------------------------- *
use "1951PakV6T6-OUT.dta", clear
/* religious beliefs dataset */

* ---------------------------------------------------------------------------- *
/* 1951PakV6T9A-OUT (SIND) */
* ---------------------------------------------------------------------------- *
use "1951PakV6T9A-OUT.dta", clear
/* educational outcomes dataset */

* ---------------------------------------------------------------------------- *
/* 1951v4t9-OUT (AGENCIES, STATES AND TRIBAL AREAS) */
* ---------------------------------------------------------------------------- *
use "1951v4t9-OUT.dta", clear
/* population dataset, does not contain any occupation data */

* ---------------------------------------------------------------------------- *
/* Template 19B-OUT(NORTH WEST FRONTIER PROVINCE) */
* ---------------------------------------------------------------------------- *
use "Template 19B-OUT.dta", clear
/* educational outcomes dataset */

* ---------------------------------------------------------------------------- *
/* Template 19C-OUT(NORTH WEST FRONTIER PROVINCE, EAST BENGAL, PUNJAB AND SIND) */
* ---------------------------------------------------------------------------- *
/*contains 305 observations */
use "Template 19C-OUT.dta", clear
foreach var of varlist A-L {
local labels = `var'[4] + `var'[5] + `var'[6] + `var'[7]
label variable `var' "`labels'"

}
drop A
rename B District_of_State
rename C Total_population_Male
rename D Total_workers_M_agriculture /* Male shortened to _M due to variable character limit constriant */
rename E Total_workers_M_non_agriculture /* Male shortened to _M due to variable character limit constriant */
rename F Total_workers_M_non_civilian /* Male shortened to _M due to variable character limit constriant */
rename G Dependants_on_Male
rename H Total_population_Female
rename I Total_workers_F_agriculture /* Female shortened to _F due to variable character limit constraint */
rename J Total_workers_F_non_agriculture /* Female shortened to _F due to variable character limit constraint */
rename K Total_workers_F_non_civilian /* Female shortened to _F due to variable character limit constraint */
rename L Dependants_on_Female /* Female shortened to _F due to variable character limit constraint */
drop in 1/7
save "Template 19C-OUT_clean.dta"

* ---------------------------------------------------------------------------- *
/* Template v3T11-OUT(EAST BENGAL) */
* ---------------------------------------------------------------------------- *
import using "Template v3T11-OUT.xls", clear
foreach var of varlist A-L {
local labels = `var'[4] + `var'[5] + `var'[6] + `var'[7]
label variable `var' "`labels'"

}
drop A
rename B District_of_State
rename C Total_population_Male
rename D Total_workers_M_agriculture /* Male shortened to _M due to variable character limit constriant */
rename E Total_workers_M_non_agriculture /* Male shortened to _M due to variable character limit constriant */
rename F Total_workers_M_non_civilian /* Male shortened to _M due to variable character limit constriant */
rename G Dependants_on_Male
rename H Total_population_Female
rename I Total_workers_F_agriculture /* Female shortened to _F due to variable character limit constraint */
rename J Total_workers_F_non_agriculture /* Female shortened to _F due to variable character limit constraint */
rename K Total_workers_F_non_civilian /* Female shortened to _F due to variable character limit constraint */
rename L Dependants_on_Female /* Female shortened to _F due to variable character limit constraint */
drop in 1/7
save "Template v3T11-OUT_clean.dta"

* ---------------------------------------------------------------------------- *
/* Template v5T11-OUT(PUNJAB) */
* ---------------------------------------------------------------------------- *
use "Template v5T11-OUT.dta", clear
foreach var of varlist A-L {
local labels = `var'[3] + `var'[4] + `var'[5] + `var'[6]
label variable `var' "`labels'"

}
drop A
rename B District_of_State
rename C Total_population_Male
rename D Total_workers_M_agriculture /* Male shortened to _M due to variable character limit constriant */
rename E Total_workers_M_non_agriculture /* Male shortened to _M due to variable character limit constriant */
rename F Total_workers_M_non_civilian /* Male shortened to _M due to variable character limit constriant */
rename G Dependants_on_Male
rename H Total_population_Female
rename I Total_workers_F_agriculture /* Female shortened to _F due to variable character limit constraint */
rename J Total_workers_F_non_agriculture /* Female shortened to _F due to variable character limit constraint */
rename K Total_workers_F_non_civilian /* Female shortened to _F due to variable character limit constraint */
rename L Dependants_on_Female /* Female shortened to _F due to variable character limit constraint */
drop in 1/6
save "Template v5T11-OUT_clean.dta"

/* Merging all occupation datasets '_clean' */
use "1951 Pak V2T11-OUT_clean.dta", clear
append using "1951Pak v6T11-OUT_clean.dta"
append using "Template 19C-OUT_clean.dta"
append using "Template v3T11-OUT_clean.dta"
append using "Template v5T11-OUT_clean.dta"
drop if District_of_State == "Spelling Errors"
drop if District_of_State == "Big Numeric Errors"
drop if District_of_State == "Small Numeric Errors"
drop if District_of_State == "Data Inconsistency"
drop if District_of_State == "Data point(s):"
drop if District_of_State == "Printed:"
drop if District_of_State == "Corrected to:"
drop if District_of_State == "4"
drop if District_of_State == "C131:G131"
drop if District_of_State == "2" || District_of_State == "6" || District_of_State == "7" || District_of_State == "0" || District_of_State == "8" || District_of_State == "12"
drop if District_of_State == ""
save "1951_dataset_clean.dta"







