**************************************
****** PAKISTAN CORRIDORS ************

*** Author: Mansi Panchamia *********
*** Date: May 26, 2020 **************

*** Objective: This is a do-file that merges census data from 1921, 1931 and 1951 tracks***

clear all
set more off
import excel "C:\Users\mansi\OneDrive\Desktop\Stata Coding Samples\1931_Literacy and Agriculture.xls", sheet("Sheet1")
gen year = 1931
save 1931_append.dta
rename District_or_State District

import excel ""


/*rename A Serial_Number
rename B District_or_State
rename C Population_males
rename D Population_females
rename F Total_Earners_principal_occupation_Males
rename G Total_Earners_principal_occupation_Females
rename H Total_working_dependents_Males
rename I Total_working_dependents_Females
rename J Total_non_working_dependents_Males
rename K Total_non_working_dependents_Males
rename L Total_class_A_Production_Raw_Materials_Males
rename M Total_class_A_Production_Raw_Materials_Females
rename N Total_Sub_Class1_Exploitation_Animals_Vegetables_Males
rename O Total_Sub_Class1_Exploitation_Animals_Vegetables_Females
rename P Total_Order1_Pasture_and_Agriculture_Males
rename Q Total_Order1_Pasture_and_Agriculture_Females
rename T Cultivating_owners_Males
rename U Cultivating_owners_Females
rename V Tenant_cultivators_Males
rename W Tenant_cultivators_Females
rename X Total_Class_B_Preparation_Supply_Material_Substances_Males
rename Y Total_Class_B_Preparation_Supply_Material_Substances_Females
rename Z Total_Subclass3_Industry_Males
rename AA Total_Subclass3_Industry_Females
rename AB Total_order_5_Textiles_Males
rename AC Total_order_5_Textiles_Females
rename AD Total_order6_Hides_Skins_Materials_from_Animal_Kingdom_Males
rename AE Total_order6_Hides_Skins_Materials_from_Animal_Kingdom_Females
rename AF Total_subclass4_Transport_Males
rename AG Total_subclass4_Transport_Females
rename AH Total_subclass5_Trade_Males
rename AI Total_subclass5_Trade_Females
rename AJ Bank_managers_Money_lenders_Males
rename AK Bank_managers_Money_lenders_Females






foreach var of varlist A-AQ {
local labels = `var'[2] + `var'[3]
label variable `var' "`labels'"
*rename `var' `labels'
}
foreach v of varlist A-AQ {
   local x : variable label `v'
   rename `v' `x'
}
*/








