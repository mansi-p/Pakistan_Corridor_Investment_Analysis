sysuse auto

*Getting an overview of the file*
describe

codebook

inspect

*viewing all or a range of observations*
list make price mpg rep78 foreign in 1/10

*creating tables*
tabulate rep78

tabulate rep78 foreign 

*column command requests column percentages and nofreq suppresses cell frequencies*
tabulate rep78 foreign, column 
*Notice that only about 23% of domestic cars were rated 4 or 5 (rated highly)*

*to suppress frequencies and just focus on the percentages*
tabulate rep78 foreign, column nofreq

tabulate rep78 foreign if rep78 >=4, column nofreq

*Summary statistics
summarize mpg

summarize mpg, detail

*To summarize one column by values of another*
sort foreign
by foreign: summarize mpg

tabulate foreign, summarize(mpg)

summarize price if inrange(rep78, 3, 5)

*Common statistical tests in Stata*
*t-tests*
ttest mpg, by(foreign)
*As we can see from the output above, domestic cars have statistically significant lower mpg than foreign cars*

*chi-square test for independence between categorical variables*
tabulate rep78 foreign, chi2

*correlate*
correlate price mpg weight rep78
*cor drops data on a listwise basis (entire observation is deleted if any variable is missing)

*pwcorr - deletes missing data on pairwise basis (not listwise)*
pwcorr price mpg rep78 weight, obs

*to run a simple regression - more on it, further down*
tabulate rep78, gen(rep)
*since rep78 is categorical and to include it in regression, we would need a dummy variable*
regress mp price weight rep2 rep3

*analysis of variance*
oneway mpg rep78

anova mpg rep78 c.price c.weight

*Dealing with missing values*
egen sum = rowtotal(rep2, rep3), missing
egen avg = rowmean(rep2-rep3)
egen miss = rowmiss(rep2-rep3)
egen nomiss = rownomiss(rep2-rep3)
*simply doing an addition will not yield an answer for sum. rowtotal function treats missing values as a zero value. missing option will return a missing value if an observation is missing on all values*

*missing values in logical statements*
gen newvar = (rep78 < 2) if rep78!=.
*not writing the if causes missing values to be considered as infinity and hence greater than 2 and hence 0*

*Bar graphs with CI*
ssc install betterbar
sysuse auto.dta, clear
betterbarci ///
	headroom trunk mpg ///
	, over(foreign) legend(on)

*Effect of one treatment variable on multiple variables*
ssc install forest
global tw_opts ///
		title(, justification(left) color(blue) span pos(11)) ///
	graphregion(color(white) lc(white) lw(med)) bgcolor(white)///
	ylab(,angle(0) nogrid) xtit(,placement(left) justification(left)) ///
    yscale(noline) xscale(noline) legend(region(lc(none) fc(none)))
	
sysuse auto.dta, clear
forest reg mpg headroom trunk = displacement, graph($tw_opts)

*Bar graphs with two variables*
use "https://github.com/SaoriIwa/Stata-IE-Visual-Library/raw/develop/Library/Bar%20plots/Bar%20plot%20of%20two%20variables/data.dta", clear
global graph_opts1 bgcolor(white) graphregion(color(white)) legend(region(lc(none) fc(none))) ///
	ylab(,angle(0) nogrid) title(, justification(left) color(black) span pos(11)) subtitle(, justification(left) color(black))
graph bar treat_correct ///
	, over(type) asy bargap(20) over(study) over(case) nofill ///
	blabel(bar, format(%9.2f)) ///
	$graph_opts1 bar(1 , lc(black) lw(thin) fi(100)) bar(2 , lc(black) lw(thin) fi(100)) ///
	legend(r(1) order(0 "Measurement:" 1 "Standardized Patient" 2 "Clinical Vignette")) ///
	ytit("Providers ordering correct treatment {&rarr}", placement(bottom) justification(left)) ylab($pct)
	

	







