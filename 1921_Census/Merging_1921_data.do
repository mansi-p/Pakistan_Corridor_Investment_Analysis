/* ******************************************************************** *
* ******************************************************************** *
*  MERGING 1921 AGRICULTURAL DATA 


       ** PURPOSE:      Exploring 21 datasets, cleaning and combining them into one 1921 agricultural-workers dataset

	   ** NOTES:
       
	   ** WRITEN BY:    Mansi Panchamia
      
	  ** Last date modified:  June 3, 2020
      
	  
* ******************************************************************** *
* ******************************************************************** */

clear all
set more off
version 16.0

/*

	Install xls2dta (converting excel files into stata datasets)
	ssc install xls2dta 

	Install renvarlab (changing variable names to match label names)
	ssc install renvarlab

*/

cd "C:\Users\mansi\Dropbox\Pakistan Corridors IE\Data\RawData\Old_census\1921Census\1921 t17 (means of living)"


/*Importing all excel files and converting them to .dta format*/
xls2dta: import excel . 

* ---------------------------------------------------------------------------- *
* Data Cleaning
* ---------------------------------------------------------------------------- *

* ---------------------------------------------------------------------------- *
/* CENTRAL PROVINCES AND BERAR */
* ---------------------------------------------------------------------------- *
use "1921- t17 central provinces and berar.dta", clear

/* removing the unnecessary variables */
drop H-O
drop X-BW

/********** For loop to create labels ************/
foreach var of varlist A-W {
local labels = `var'[2] + `var'[3] + `var'[4]
label variable `var' "`labels'"

}

/* Rename all variables to their label names*/
*renvarlab A-BW, label

 /* Manually renaming only the necessary columns */
rename A District_of_State
rename B Total_Population
rename C Total_workers_Male
rename D Total_workers_Female
rename E Partial_agriculturist_Male
rename F Partial_agriculturist_Female
rename G Dependants 
rename P Workers_dependants_agripasture
rename Q Total_workers_Male_agripasture
rename R Total_workers_Female_agripasture
rename S Dependants_agripasture
rename T Workers_dependants_cultivation
rename U Total_workers_Male_cultivation
rename V Total_workers_Female_cultivation
rename W Dependants_cultivation

/*removing first few observations containing column names*/
drop in 1/6

save "1921-t17 central provinces and berar_ clean.dta"

/*repeating the above process for all datasets before merging*/

* ---------------------------------------------------------------------------- *
/* BALOCHISTAN */
* ---------------------------------------------------------------------------- *

use "1921-t17baluhistan.dta", clear
gen District_of_State = "Balochistan"
drop F-HC
foreach var of varlist A-E {
local labels = `var'[3] + `var'[6]
label variable `var' "`labels'"

}
rename A Occupation
rename B Total_workers_and_dependants
rename C Total_workers_Male
rename D Total_workers_Female
rename E Dependants
drop in 1/7     /* removing first few observations containing column names */
drop in 2/20	/* removing unnecessary observations like population working in textiles, etc. */
save "1921-t17baluhistan_clean.dta"

* ---------------------------------------------------------------------------- *
/* BIHAR AND ORISSA */
* ---------------------------------------------------------------------------- *
use "1921-t17bihar and orissa.dta", clear
foreach var of varlist A-BW {
local labels = `var'[3] + `var'[4] + `var'[6]
label variable `var' "`labels'"

}
drop H-FP
rename A District_of_State
rename B Workers_dependants_agripasture
rename C Total_workers_Male_agripasture
rename D Total_workers_Female_agripasture
rename E Workers_dependants_cultivation
rename F Total_workers_Male_cultivation
rename G Total_workers_Female_cultivation
drop in 1/7
save "1921-t17bihar and orissa_clean.dta"

* ---------------------------------------------------------------------------- *
/* BOMBAY */
* ---------------------------------------------------------------------------- *
use "1921-t17bombay.dta", clear
drop F-M
drop V-CR
foreach var of varlist A-U {
local labels = `var'[2] + `var'[3] + `var'[4]
label variable `var' "`labels'"

}
rename A District_of_State
rename B Total_workers_and_dependants
rename C Total_workers_Male
rename D Total_workers_Female
rename E Dependants
rename N Workers_dependants_agripasture
rename O Total_workers_Male_agripasture
rename P Total_workers_Female_agripasture
rename Q Dependants_agripasture
rename R Workers_dependants_cultivation
rename S Total_workers_Male_cultivation
rename T Total_workers_Female_cultivation
rename U Dependants_cultivation
drop in 1/5
save "1921-t17bombay_clean.dta"

* ---------------------------------------------------------------------------- *
/* GWALIOR STATE */
* ---------------------------------------------------------------------------- *
use "1921-t17gwalior state.dta", clear
drop in 11/12
drop in 13/25
drop BC-HQ
foreach var of varlist A-BB {
local labels = `var'[3] + `var'[4] + `var'[6]
label variable `var' "`labels'"

}
drop A
drop in 7
drop in 1/2
save "1921-t17gwalior state.dta", replace 

* ---------------------------------------------------------------------------- *
/* HYDERABAD */
* ---------------------------------------------------------------------------- *
use "1921-t17hyderabad.dta", clear
drop AH-IC
foreach var of varlist A-AG {
local labels = `var'[2] + `var'[3] + `var'[5]
label variable `var' "`labels'"

}
drop F-I
drop N-AG
rename A District_of_State
rename B Workers_dependants_cultivation
rename C Total_workers_Male_cultivation
rename D Total_workers_Female_cultivation
rename E Dependants_cultivation
drop J-M
drop in 1/6
save "1921-t17hyderabad_clean.dta"

* ---------------------------------------------------------------------------- *
/* JAMMU AND KASHMIR */
* ---------------------------------------------------------------------------- *
use "1921-t17jandk.dta", clear
drop F-M
drop V-BU
foreach var of varlist A-U{
local labels = `var'[2] + `var'[3] + `var'[4]
label variable `var' "`labels'"

}
rename A District_of_State
rename B Total_workers_and_dependants
rename C Total_workers_Male
rename D Total_workers_Female
rename E Dependants
rename N Workers_dependants_agripasture
rename O Total_workers_Male_agripasture
rename P Total_workers_Female_agripasture
rename Q Dependants_agripasture
rename R Workers_dependants_cultivation
rename S Total_workers_Male_cultivation
rename T Total_workers_Female_cultivation
rename U Dependants_cultivation
drop in 1/5
save "1921-t17jandk_clean.dta"

* ---------------------------------------------------------------------------- *
/* N.W.F.P */
* ---------------------------------------------------------------------------- *
use "1921-t17nwfp.dta", clear
drop in 9/10
drop in 13/25
drop in 7
drop AH-FV
foreach var of varlist A-AG {
local labels = `var'[3] + `var'[4] + `var'[6]
label variable `var' "`labels'"

}
save "1921-t17nwfp.dta", replace

* ---------------------------------------------------------------------------- *
/* QUETTA */
* ---------------------------------------------------------------------------- *
use "1921-t17quetta.dta", clear
drop in 7
drop in 9/10
drop in 10/24
drop in 1/2
save "1921-t17quetta.dta", replace

* ---------------------------------------------------------------------------- *
/* RAJPUTANA */
* ---------------------------------------------------------------------------- *
use "1921-t17rajputna.dta", clear
drop F-M
drop V-CM
foreach var of varlist A-U{
local labels = `var'[2] + `var'[3] + `var'[4]
label variable `var' "`labels'"

}
rename A District_of_State
rename B Total_workers_and_dependants
rename C Total_workers_Male
rename D Total_workers_Female
rename E Dependants
rename N Workers_dependants_agripasture
rename O Total_workers_Male_agripasture
rename P Total_workers_Female_agripasture
rename Q Dependants_agripasture
rename R Workers_dependants_cultivation
rename S Total_workers_Male_cultivation
rename T Total_workers_Female_cultivation
rename U Dependants_cultivation
drop in 1/5
save "1921-t17rajputna_clean.dta"

* ---------------------------------------------------------------------------- *
/* temp1921-t17(v3)-out (ASSAM) */
* ---------------------------------------------------------------------------- *
use "temp1921-t17(v3)-out.dta", clear
drop J-IQ
foreach var of varlist A-I{
local labels = `var'[2] + `var'[3] + `var'[5]
label variable `var' "`labels'"

}
rename A District_of_State
rename B Workers_dependants_agripasture
rename C Total_workers_Male_agripasture
rename D Total_workers_Female_agripasture
rename E Dependants_agripasture
rename F Workers_dependants_cultivation
rename G Total_workers_Male_cultivation
rename H Total_workers_Female_cultivation
rename I Dependants_cultivation
drop in 1/6
save "temp1921-t17(v3)-out_clean.dta"

* ---------------------------------------------------------------------------- *
/* temp1921-t17(v5)-out (BENGAL)*/
* ---------------------------------------------------------------------------- *
use "temp1921-t17(v5)-out.dta", clear
drop J-IG
rename A District_of_State
rename B Workers_dependants_agripasture
rename C Total_workers_Male_agripasture
rename D Total_workers_Female_agripasture
rename E Dependants_agripasture
rename F Workers_dependants_cultivation
rename G Total_workers_Male_cultivation
rename H Total_workers_Female_cultivation
rename I Dependants_cultivation
drop in 1/6
save "temp1921-t17(v5)-out_clean.dta"

* ---------------------------------------------------------------------------- *
/* temp1921-t17(v12)- NO STATE/DISTRICT SPECIFIED */
* ---------------------------------------------------------------------------- *
use "temp1921-t17(v12).dta", clear
drop in 13/27
save "temp1921-t17(v12).dta", replace /* No district/state mentioned, hence the dataset is not completely clean yet - June 3, 2020 */

* ---------------------------------------------------------------------------- *
/* temp1921-t17(v13)-out (MADRAS) */
* ---------------------------------------------------------------------------- *
use "temp1921-t17(v13)-out.dta", clear  /* Unsure of the nomenclature, hence the dataset has not been cleaned yet - June 3, 2020 */

* ---------------------------------------------------------------------------- *
/* temp1921-t17(v15)-out (PUNJAB) */
* ---------------------------------------------------------------------------- *
use "temp1921-t17(v15)-out", clear
drop F-M
drop V-BU
foreach var of varlist A-U{
local labels = `var'[3] + `var'[4] + `var'[5]
label variable `var' "`labels'"

}
rename A District_of_State
rename B Total_workers_and_dependants
rename C Total_workers_Male
rename D Total_workers_Female
rename E Dependants
rename N Workers_dependants_agripasture
rename O Total_workers_Male_agripasture
rename P Total_workers_Female_agripasture
rename Q Dependants_agripasture
rename R Workers_dependants_cultivation
rename S Total_workers_Male_cultivation
rename T Total_workers_Female_cultivation
rename U Dependants_cultivation
drop in 1/6
save "temp1921-t17(v15)-out_clean.dta"

* ---------------------------------------------------------------------------- *
/* temp1921-t17(v16)-out (UNITED PROVINCES OF AGRA AND OUDH) */
* ---------------------------------------------------------------------------- *
use "temp1921-t17(v16)-out.dta"
drop B-E
drop J-M
drop R-BM
drop BR-HL
foreach var of varlist A-BQ{
local labels = `var'[2] + `var'[3] + `var'[5]
label variable `var' "`labels'"

} 
rename A District_of_State
rename F Workers_dependants_cultivation_2
rename G Total_workers_Male_cultivation_2
rename H Total_workers_F_cultivation_2    /*due to constraint of variable name character limit, female has been reduced to F_ */
rename I Dependants_cultivation_2
rename N Workers_dependants_cultivation
rename O Total_workers_Male_cultivation
rename P Total_workers_Female_cultivation
rename Q Dependants_cultivation
rename BN Total_workers_and_dependants
rename BO Total_workers_Male
rename BP Total_workers_Female
rename BQ Dependants
drop in 1/6
save "temp1921-t17(v16)-out_clean.dta"

* ---------------------------------------------------------------------------- *
/* temp1921-t17(v18) (CENTRAL INDIA) - NO DISTRICT/STATE MENTIONED */
* ---------------------------------------------------------------------------- *
use "temp1921-t17(v18).dta", clear
drop in 13/25
drop in 9/10
save "temp1921-t17(v18).dta", replace 
	
* ---------------------------------------------------------------------------- *
/* temp1921-t17(v23) - (MYSORE) */
* ---------------------------------------------------------------------------- *
use "temp1921-t17(v23).dta", clear	
drop F-M
drop V-CX
foreach var of varlist A-U{
local labels = `var'[2] + `var'[3] + `var'[4]
label variable `var' "`labels'"

}
rename A District_of_State
rename B Total_workers_and_dependants
rename C Total_workers_Male
rename D Total_workers_Female
rename E Dependants
rename N Workers_dependants_agripasture
rename O Total_workers_Male_agripasture
rename P Total_workers_Female_agripasture
rename Q Dependants_agripasture
rename R Workers_dependants_cultivation
rename S Total_workers_Male_cultivation
rename T Total_workers_Female_cultivation
rename U Dependants_cultivation
drop in 1/5
save "temp1921-t17(v23)_clean.dta"

*Datasets in the form of [Occupation, disaggregated data of each district] is yet to reshaped 
*Once done, all the clean datasets will be merged 




















