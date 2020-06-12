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

* ---------------------------------------------------------------------------- *
/* DISTRICT IDENTIFIER */
* ---------------------------------------------------------------------------- *
egen District_Identifier = incss(District_of_State), sub(district) insensitive /* insensitive = case insensitivity */

* ---------------------------------------------------------------------------- *
/* TEHSIL IDENTIFIER */
* ---------------------------------------------------------------------------- *
egen Tehsil_Identifier = incss(District_of_State), sub(tehsil) insensitive
replace Tehsil_Identifier = 1 if strmatch(District_of_State, "* Taluka") /* Tehsils are also called Talukas */

* ---------------------------------------------------------------------------- *
/* SUB-DIVISION IDENTIFIER */
* ---------------------------------------------------------------------------- *
egen Subdivision_Indentifier = incss(District_of_State), sub(Sub-Division) insensitive
rename Subdivision_Indentifier Subdivision_Identifier /* spelling error */
replace Subdivision_Identifier = 1 if strmatch(District_of_State, "* Subdivision")

* ---------------------------------------------------------------------------- *
/* DIVISION IDENTIFIER */
* ---------------------------------------------------------------------------- *
/*egen Division_Identifier = incss(District_of_State), sub(division) insensitive
drop Division_Identifier */ /* Going this route makes values containing 'sub-division' 1 as well */
gen Division_Identifier = strmatch(District_of_State, "* DIVISION")
replace Division_Identifier = 1 if strmatch(District_of_State, "* division")
replace Division_Identifier = 1 if strmatch(District_of_State, "* Division")
replace Division_Identifier = 1 if strmatch(District_of_State, "* Division ")

* ---------------------------------------------------------------------------- *
/* 1951 STATES IDENTIFIER */
* ---------------------------------------------------------------------------- *
egen State_Identifier = incss(District_of_State), sub(STATE) insensitive

* ---------------------------------------------------------------------------- *
/* PROVINCE IDENTIFIER */
* ---------------------------------------------------------------------------- *
egen Province_Identifier = incss(District_of_State), sub(PROVINCE) insensitive

* ---------------------------------------------------------------------------- *
/* Manually identifying values in 'District_of_State which do not have any of the above identifiers */
* ---------------------------------------------------------------------------- *

/* Sibi is also a division, but the division was not established until 1974 - Quddus, Syed Abdul (1990). The Tribal Baluchistan. Ferozsons. p. 49. ISBN 978-969-0-10047-4. */
/* District names - U.S. Department of Commerce and Bureau, “Foreign Statistical Publications: Accession List, Volume 3,” U.S. Department of Commerce, Bureau of the Census. p. 12 */
/* District names - Pakistan Minsitry of Interior, "Census of Pakistan, 1951". Office of Census Commissioner, Government of Pakistan */
replace District_Identifier = 1 if District_of_State == "Chagai" || District_of_State == "Loralai" || District_of_State == "Quetta-Pishin" || District_of_State == "Sibi"
replace District_Identifier = 1 if District_of_State == "Zhob" || District_of_State == "Dadu" || District_of_State == "Larkana" || District_of_State == "Bannu"
replace District_Identifier = 1 if District_of_State == "Dera Ismail Khan" || District_of_State == "Hazara" || District_of_State == "Kohat" || District_of_State == "Mardan"
replace District_Identifier = 1 if District_of_State == "Peshawar" || District_of_State == "Chittagong Hill Tracts" || District_of_State == "Noakhali" || District_of_State == "Slyhet"
replace District_Identifier = 1 if District_of_State == "Tippera" || District_of_State == "Bakerganj" || District_of_State == "Dacca" || District_of_State == "Faridpur"
replace District_Identifier = 1 if District_of_State == "Mymensingh" || District_of_State == "Bogra" || District_of_State == "Dinajpur" || District_of_State == "Jessore"
replace District_Identifier = 1 if District_of_State == "Khulna" || District_of_State == "Kushtia" || District_of_State == "Pabna" || District_of_State == "Rajshahi"
replace District_Identifier = 1 if District_of_State == "Rangpur" || District_of_State == "Gujranwala" || District_of_State == "Lahore" || District_of_State == "Sheikhupura"
replace District_Identifier = 1 if District_of_State == "Sialkot" || District_of_State == "Dera Ghazi Khan" || District_of_State == "Jhang" || District_of_State == "Lyallpur"
replace District_Identifier = 1 if District_of_State == "Montgomery" || District_of_State == "Multan" || District_of_State == "Muzaffargarh" || District_of_State == "Campbellpur"
replace District_Identifier = 1 if District_of_State == "Gujrat" || District_of_State == "Jhelum" || District_of_State == "Mianwali" || District_of_State == "Rawalpindi"
replace District_Identifier = 1 if District_of_State == "Shahpur" || District_of_State == "Bahawalpur" || District_of_State == "Rahimyarkhan" || District_of_State == "Larkana"
replace District_Identifier = 1 if District_of_State == "Nawabshah" || District_of_State == "Sukkur" || District_of_State == "Thar Parkar" || District_of_State == "Thatta"
replace District_Identifier = 1 if District_of_State == "Upper Sind Frontier" || District_of_State == "Bahawalpur" || District_of_State == "Kalat" 
replace District_Identifier = 1 if District_of_State == "Kharan" || District_of_State == "Las Bela" || District_of_State == "Mekran" 
replace District_Identifier = 1 if District_of_State == "Chittagong" || District_of_State == "Noakhali" || District_of_State == "Sylhet" 
replace District_Identifier = 1 if District_of_State == "Tippera" || District_of_State == "Mymensing" || District_of_State == "Mekran" 
replace District_Identifier = 1 if District_of_State == "Montgomer"

replace Tehsil_Identifier = 1 if District_of_State == "Tando Bago" || District_of_State == "Keti Bunder Mahal" || District_of_State == "Administered area" 
replace Tehsil_Identifier = 1 if District_of_State == "Mari-Bugti Country" || District_of_State == "Jhalawan" || District_of_State == "Kachhi" 
replace Tehsil_Identifier = 1 if District_of_State == "Kalat Niabat" || District_of_State == "Sarawan" || District_of_State == "Bahawalnagar"


/*After 1947 partition of the Indian subcontinent, East Bengal became a province of Pakistan */
replace  Province_Identifier = 1 if District_of_State == "East Bengal" || District_of_State == "BALUCHISTAN INCLUDING STATES UNION" || District_of_State == "Sind" || District_of_State == "PUNJAB INCLUDING BAHAWALPUR STATE"
replace  Province_Identifier = 1 if District_of_State == "Punjab Including Bahawalpur State" || District_of_State == "Punjab" || District_of_State == "Baluchistan including States Union" || District_of_State == "PUNJAB"
replace State_Identifier = 0 if District_of_State == "Punjab Including Bahawalpur State" /* It is a province, not a state; made so by earlier egen command of state identifier */
replace State_Identifier = 0 if District_of_State = "PUNJAB INCLUDING BAHAWALPUR STATE"


/*In 1951, Hyderdabad is the name of both, a district and division, unsure which one is referred to here */
/* It is unclear which identifier Biloch Trans Frontier Tract belongs to, in 1951 */ 
/* It is unclear which identifier 'Quetta city including Cantt.' belongs to in 1951 */

/* Dropping duplicates rows */
duplicates list
duplicates drop 
/* There are more duplicates in District_of_State however population values are different */


save "1951_dataset_clean.dta", replace








