/* ******************************************************************** *
* ******************************************************************** *
*  MERGING 1931 AGRICULTURAL DATA 


       ** PURPOSE:      Exploring 24 datasets, cleaning and combining them into one 1931 agricultural-workers dataset

	   ** NOTES:
       
	   ** WRITEN BY:    Mansi Panchamia
      
	  ** Last date modified:  June 17, 2020
      
	  
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
drop L
drop in 7/8

rename A Occupation
rename B Total_population_Ajmer_dist
rename C Total_earners_M_Ajmer_dist
rename D Total_earners_F_Ajmer_dist
rename E Working_dependants_M_Ajmer_dist
rename F Working_dependants_F_Ajmer_dist
rename G Total_population_Ajmer_city
rename H Total_earners_M_Ajmer_city
rename I Total_earners_F_Ajmer_city
rename J Working_dependants_M_Ajmer_city
rename K Working_dependants_F_Ajmer_city 
drop in 1/5

gen id = _n
encode Occupation, gen(occ_n)
drop Occupation
order id occ_n

reshape long Total_population_ Total_earners_M_ Total_earners_F_ Working_dependants_M_ Working_dependants_F_, i(occ_n) j(District_of_State) s

decode occ_n, gen(Occupation)
order District_of_State Occupation
sort District_of_State Occupation
drop occ_n id

replace Occupation = "cultivation" if Occupation == "1. (a) cultivation"
replace Occupation = "agripasture" if Occupation == "order 1. --Pasture and Agriculture"
replace Occupation = "total" if Occupation == "Total of Classes A, B, C and D"

reshape wide Total_population_ Total_earners_M_ Total_earners_F_ Working_dependants_M_ Working_dependants_F_, i(District_of_State) j(Occupation) s 

save "1931ajmeroc_clean.dta" ////

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
drop in 5/6
rename A Occupation
rename B Total_population_Baluch /* Baluchistan reduced to _Baluch because after first reshaping, implied name was too long */
rename C Total_earners_M_Baluch
rename D Total_earners_F_Baluch
rename E Working_dependants_M_Baluch
rename F Working_dependants_F_Baluch
rename G Nonworking_dependants_M_Baluch
rename H Nonworking_dependants_F_Baluch
rename I Total_earners_M_Quetta
rename J Total_earners_F_Quetta
rename K Working_dependants_M_Quetta
rename L Working_dependants_F_Quetta
rename M Total_earners_M_Loralai
rename N Total_earners_F_Loralai
rename O Working_dependants_M_Loralai
rename P Working_dependants_F_Loralai
rename Q Total_earners_M_Zhob
rename R Total_earners_F_Zhob
rename S Working_dependants_M_Zhob
rename T Working_dependants_F_Zhob
rename U Total_earners_M_Bolan
rename V Total_earners_F_Bolan
rename W Working_dependants_M_Bolan
rename X Working_dependants_F_Bolan
rename Y Total_earners_M_Chagai
rename Z Total_earners_F_Chagai
rename AA Working_dependants_M_Chagai
rename AB Working_dependants_F_Chagai
rename AC Total_earners_M_Sibi
rename AD Total_earners_F_Sibi
rename AE Working_dependants_M_Sibi
rename AF Working_dependants_F_Sibi
rename AG Total_earners_M_Kalat
rename AH Total_earners_F_Kalat
rename AI Working_dependants_M_Kalat
rename AJ Working_dependants_F_Kalat
rename AK Total_earners_M_Lasbela
rename AL Total_earners_F_Lasbela
rename AM Working_dependants_M_Lasbela
rename AN Working_dependants_F_Lasbela

drop in 1/3

gen id = _n
encode Occupation, gen(occ_n)
drop Occupation
order id occ_n

reshape long Total_population_ Total_earners_M_ Total_earners_F_ Working_dependants_M_ Working_dependants_F_ Nonworking_dependants_M_ Nonworking_dependants_F_, i(occ_n) j(District_of_State) s

decode occ_n, gen(Occupation)
order District_of_State Occupation
sort District_of_State Occupation
drop occ_n id

replace Occupation = "culti" if Occupation == "1. (a) cultivation" /* cultivation reduced to culti as resulting name after second reshaping became too long */
replace Occupation = "agripast" if Occupation == "order 1. --Pasture and Agriculture" /*agripasture reduced to agripast as resulting name after second reshaping became too long */
replace Occupation = "total" if Occupation == "Total of Classes A, B, C and D"

reshape wide Total_population_ Total_earners_M_ Total_earners_F_ Working_dependants_M_ Working_dependants_F_ Nonworking_dependants_M_ Nonworking_dependants_F_, i(District_of_State) j(Occupation) s 

save "1931baluchoc_clean.dta" 


* ---------------------------------------------------------------------------- *
/* BARODA */
* ---------------------------------------------------------------------------- *
use "1931barodaoc.dta", clear
drop in 11/24

foreach var of varlist A-BQ {
local labels = `var'[2] + `var'[3] + `var'[4]
label variable `var' "`labels'"

}
drop in 7/8
drop AD-BQ

rename A Occupation
rename B Total_earners_M_Baroda_st /* state reduced to _st*/
rename C Total_earners_F_Baroda_st
rename D Working_dependants_M_Baroda_st
rename E Working_dependants_F_Baroda_st
rename F Total_earners_M_Baroda_ct /* city reduced to _ct*/
rename G Total_earners_F_Baroda_ct
rename H Working_dependants_M_Baroda_ct
rename I Working_dependants_F_Baroda_ct
rename J Total_earners_M_Amreli /* Amreli is a division */
rename K Total_earners_F_Amreli
rename L Working_dependants_M_Amreli
rename M Working_dependants_F_Amreli
rename N Total_earners_M_Baroda_d /* Division reduced to _d due to constraints after first reshaping */
rename O Total_earners_F_Baroda_d
rename P Working_dependants_M_Baroda_d
rename Q Working_dependants_F_Baroda_d
rename R Total_earners_M_Mehsana_d /* Division reduced to _d due to constraints after first reshaping */
rename S Total_earners_F_Mehsana_d
rename T Working_dependants_M_Mehsana_d
rename U Working_dependants_F_Mehsana_d
rename V Total_earners_M_Navsari_d /* Division reduced to _d due to constraints after first reshaping */
rename W Total_earners_F_Navsari_d
rename X Working_dependants_M_Navsari_d
rename Y Working_dependants_F_Navsari_d
rename Z Total_earners_M_Okhamandal
rename AA Total_earners_F_Okhamandal
rename AB Working_dependants_M_Okhamandal
rename AC Working_dependants_F_Okhamandal

drop in 1/5

gen id = _n
encode Occupation, gen(occ_n)
drop Occupation
order id occ_n

reshape long Total_earners_M_ Total_earners_F_ Working_dependants_M_ Working_dependants_F_, i(occ_n) j(District_of_State) s

decode occ_n, gen(Occupation)
order District_of_State Occupation
sort District_of_State Occupation
drop occ_n id

replace Occupation = "culti" if Occupation == "1. (a) cultivation" /* cultivation reduced to culti as resulting name after second reshaping became too long */
replace Occupation = "agripast" if Occupation == "order 1. --Pasture and Agriculture" /*agripasture reduced to agripast as resulting name after second reshaping became too long */
replace Occupation = "total" if Occupation == "Total of Classes A, B, C and D"

reshape wide Total_earners_M_ Total_earners_F_ Working_dependants_M_ Working_dependants_F_, i(District_of_State) j(Occupation) s 

save "1931baroda_clean.dta" 

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
drop in 7/8

rename A Occupation
rename B Total_earners_M_Hyder_st /* state reduced to _st*/ /* Hyderabad reduced to _Hyder due to variable length constriants after first reshaping */
rename C Total_earners_F_Hyder_st
rename D Working_dependants_M_Hyder_st
rename E Working_dependants_F_Hyder_st
rename F Total_earners_M_Hyder_ct /* city reduced to _ct*/
rename G Total_earners_F_Hyder_ct
rename H Working_dependants_M_Hyder_ct
rename I Working_dependants_F_Hyder_ct
rename J Total_earners_M_Atraf /* Atraf-I-Balda reduced to _Atraf due to variable length constraints after first reshaping */
rename K Total_earners_F_Atraf
rename L Working_dependants_M_Atraf
rename M Working_dependants_F_Atraf
rename N Total_earners_M_Warangal
rename O Total_earners_F_Warangal
rename P Working_dependants_M_Warangal
rename Q Working_dependants_F_Warangal
rename R Total_earners_M_Karimnagar
rename S Total_earners_F_Karimnagar
rename T Working_dependants_M_Karimnagar
rename U Working_dependants_F_Karimnagar
rename V Total_earners_M_Adilabad
rename W Total_earners_F_Adilabad
rename X Working_dependants_M_Adilabad
rename Y Working_dependants_F_Adilabad
rename Z Total_earners_M_Medak
rename AA Total_earners_F_Medak
rename AB Working_dependants_M_Medak
rename AC Working_dependants_F_Medak
rename AD Total_earners_M_Nizam /* Nizamabad reduced to _Nizam due to variable length constraints after first reshaping */
rename AE Total_earners_F_Nizam
rename AF Working_dependants_M_Nizam
rename AG Working_dependants_F_Nizam
rename AH Total_earners_M_Mahbub /* Mahbubnagar reduced to _Mahbub due to variable length constraints after first reshapings */
rename AI Total_earners_F_Mahbub
rename AJ Working_dependants_M_Mahbub
rename AK Working_dependants_F_Mahbub
rename AL Total_earners_M_Nalgonda
rename AM Total_earners_F_Nalgonda
rename AN Working_dependants_M_Nalgonda
rename AO Working_dependants_F_Nalgonda
rename AP Total_earners_M_Aurang /* Aurangabad reduced to _Aurang due to variable length constraints after first reshaping */
rename AQ Total_earners_F_Aurang
rename AR Working_dependants_M_Aurang
rename AS Working_dependants_F_Aurang
rename AT Total_earners_M_Bir
rename AU Total_earners_F_Bir
rename AV Working_dependants_M_Bir
rename AW Working_dependants_F_Bir
rename AX Total_earners_M_Nander
rename AY Total_earners_F_Nander
rename AZ Working_dependants_M_Nander
rename BA Working_dependants_F_Nander
rename BB Total_earners_M_Parbhani
rename BC Total_earners_F_Parbhani
rename BD Working_dependants_M_Parbhani
rename BE Working_dependants_F_Parbhani
rename BF Total_earners_M_Gulbarga
rename BG Total_earners_F_Gulbarga
rename BH Working_dependants_M_Gulbarga
rename BI Working_dependants_F_Gulbarga
rename BJ Total_earners_M_Osmana /* Osmanabad reduced to _Osmana */
rename BK Total_earners_F_Osmana
rename BL Working_dependants_M_Osmana
rename BM Working_dependants_F_Osmana
rename BN Total_earners_M_Raichur
rename BO Total_earners_F_Raichur
rename BP Working_dependants_M_Raichur
rename BQ Working_dependants_F_Raichur
rename BR Total_earners_M_Bidar
rename BS Total_earners_F_Bidar
rename BT Working_dependants_M_Bidar
rename BU Working_dependants_F_Bidar

drop in 1/5
gen id = _n
encode Occupation, gen(occ_n)
drop Occupation
order id occ_n

reshape long Total_earners_M_ Total_earners_F_ Working_dependants_M_ Working_dependants_F_, i(occ_n) j(District_of_State) s

decode occ_n, gen(Occupation)
order District_of_State Occupation
sort District_of_State Occupation
drop occ_n id

replace Occupation = "culti" if Occupation == "1. (a) cultivation" /* cultivation reduced to culti as resulting name after second reshaping became too long */
replace Occupation = "agripast" if Occupation == "order 1. --Pasture and Agriculture" /*agripasture reduced to agripast as resulting name after second reshaping became too long */
replace Occupation = "total" if Occupation == "Total of Classes A, B, C and D"

reshape wide Total_earners_M_ Total_earners_F_ Working_dependants_M_ Working_dependants_F_, i(District_of_State) j(Occupation) s 



save "1931hyderabadoc_clean.dta"

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
drop in 7/8
rename A Occupation
rename B Total_population_NWFP /* entire province data */
rename C Total_earners_M_NWFP
rename D Total_earners_F_NWFP
rename E Working_dependants_M_NWFP
rename F Working_dependants_F_NWFP
rename G Total_population_NWFP_d /* total population data of all the districts in NWF province  */
rename H Total_earners_M_NWFP_d
rename I Total_earners_F_NWFP_d
rename J Working_dependants_M_NWFP_d
rename K Working_dependants_F_NWFP_d
rename L Total_population_Hazara
rename M Total_earners_M_Hazara
rename N Total_earners_F_Hazara
rename O Working_dependants_M_Hazara
rename P Working_dependants_F_Hazara
rename Q Total_population_Peshawar
rename R Total_earners_M_Peshawar
rename S Total_earners_F_Peshawar
rename T Working_dependants_M_Peshawar
rename U Working_dependants_F_Peshawar
rename V Total_population_Kohat
rename W Total_earners_M_Kohat
rename X Total_earners_F_Kohat
rename Y Working_dependants_M_Kohat
rename Z Working_dependants_F_Kohat
rename AA Total_population_Banna
rename AB Total_earners_M_Banna
rename AC Total_earners_F_Banna
rename AD Working_dependants_M_Banna
rename AE Working_dependants_F_Banna
rename AF Total_population_DIK /* DIK = Dera Ismail Khan */
rename AG Total_earners_M_DIK
rename AH Total_earners_F_DIK
rename AI Working_dependants_M_DIK
rename AJ Working_dependants_F_DIK
rename AK Total_population_TFP /* TFP = Trans Frontier Posts */
rename AL Total_earners_M_TFP
rename AM Total_earners_F_TFP
rename AN Working_dependants_M_TFP
rename AO Working_dependants_F_TFP
rename AP Total_population_Peshawar_M /* Peshawar_M = Peshawar Municipalty */
rename AQ Total_earners_M_Peshawar_M
rename AR Total_earners_F_Peshawar_M
rename AS Working_dependants_M_Pesahawar_M
rename AT Working_dependants_F_Peshawar_M

drop in 1/5

gen id = _n
encode Occupation, gen(occ_n)
drop Occupation
order id occ_n

reshape long Total_population_ Total_earners_M_ Total_earners_F_ Working_dependants_M_ Working_dependants_F_, i(occ_n) j(District_of_State) s

decode occ_n, gen(Occupation)
order District_of_State Occupation
sort District_of_State Occupation
drop occ_n id

replace Occupation = "culti" if Occupation == "1. (a) cultivation" /* cultivation reduced to culti as resulting name after second reshaping became too long */
replace Occupation = "agripast" if Occupation == "order 1. --Pasture and Agriculture" /*agripasture reduced to agripast as resulting name after second reshaping became too long */
replace Occupation = "total" if Occupation == "Total All Occupations"

reshape wide Total_population_ Total_earners_M_ Total_earners_F_ Working_dependants_M_ Working_dependants_F_, i(District_of_State) j(Occupation) s 

save "1931nwfpoc_clean.dta"

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

/* Renaming certain column names which were shortened in reshaped files [like _M to _Male] so that they can match the rest of the datasets */

/* First, all the reshpaed datasets are appended. Second, columns which identify similar quantities are merged and renamed to match the remaining 
'_clean' datasets */

/* STEP 1 */
use "1931ajmeroc_clean.dta", clear
append using "1931baluchoc_clean.dta"
append using "1931baroda_clean.dta"
append using "1931nwfpoc_clean.dta"
append using "1931hyderabadoc_clean.dta"

/*step 2*/
/*replacing values in Total_earners_M_agripasture with values from Total_earners_M_agripast if the former is empty and then dropping
the latter column*/
replace Total_earners_M_agripasture = Total_earners_M_agripast[_n] if Total_earners_M_agripasture == ""
replace Total_earners_F_agripasture = Total_earners_F_agripast[_n] if Total_earners_F_agripasture == ""
replace Working_dependants_M_agripasture = Working_dependants_M_agripast[_n] if Working_dependants_M_agripasture == ""
replace Working_dependants_F_agripasture = Working_dependants_F_agripast[_n] if Working_dependants_F_agripasture == ""
replace Total_earners_M_cultivation = Total_earners_M_culti[_n] if Total_earners_M_cultivation == ""
replace Total_earners_F_cultivation = Total_earners_F_culti[_n] if Total_earners_F_cultivation == ""
replace Working_dependants_F_cultivation = Working_dependants_F_culti[_n] if Working_dependants_F_cultivation == ""
replace Working_dependants_M_cultivation = Working_dependants_M_culti[_n] if Working_dependants_F_cultivation == ""
replace Total_population_agripasture = Total_population_agripast[_n] if Total_population_agripasture == ""
replace Total_population_cultivation = Total_population_culti[_n] if Total_population_cultivation == ""

/*dropping redundant columns */
drop Total_earners_M_agripast
drop Total_earners_F_agripast
drop Working_dependants_M_agripast
drop Working_dependants_F_agripast
drop Total_earners_M_culti
drop Total_earners_F_culti
drop Working_dependants_M_culti
drop Working_dependants_F_culti
drop Total_population_agripast
drop Total_population_culti

save "1931_reshaped_clean.dta"

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

use "1931_agriculture_clean.dta", clear
append using "1931_reshaped_clean.dta"

/* dropping empty rows, rows with unneccesary data such as number of spelling errors, etc. */
drop if missing(District_of_State)
drop if District_of_State == "0" || District_of_State == "6" || District_of_State == "3" || District_of_State == "17"

/*Merging similar columns from the reshaped and non-reshaped datasets */
replace Total_earners_Male = Total_earners_M_total[_n] if Total_earners_Male == ""
replace Total_earners_Female = Total_earners_F_total[_n] if Total_earners_Female == ""
replace Nonworking_dependants_Male = Nonworking_dependants_M_total[_n] if Nonworking_dependants_Male == ""
replace Nonworking_dependants_Female = Nonworking_dependants_F_total[_n] if Nonworking_dependants_Female == ""
replace Working_dependants_Male = Working_dependants_M_total[_n] if Working_dependants_Male == ""
replace Working_dependants_Female = Working_dependants_F_total[_n] if Working_dependants_Female == ""
replace Total_population = Total_population_total[_n] if Total_population == ""

drop Total_earners_M_total
drop Total_earners_F_total
drop Nonworking_dependants_M_total
drop Nonworking_dependants_F_total
drop Working_dependants_M_total
drop Working_dependants_F_total
drop Total_population_total

save "1931_agriculture_clean.dta", replace



