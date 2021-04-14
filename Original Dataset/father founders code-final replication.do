***Father Founders***

* Use the file: "founding fathers dataset-corrections-attendance-replication.dta"

*Figure 1
*scatter total children on proportion (labels added manually)
scatter total pctson4


*Table 2 relevant votes (all expected to be positive coefficients except 4, 5, 6, 7, and 14)
* Note that this is the specification as a count of daughters / sons
poisson index1 sons dtrs ageco agecosq revoffco nslave dist2 vsecr vbank ddebt pols lawyer,r
probit vote2 sons dtrs ageco agecosq revoffco nslave dist2 vsecr vbank ddebt pols lawyer,r
probit anti5 sons dtrs ageco agecosq revoffco nslave dist2 vsecr vbank ddebt pols lawyer,r 
probit anti6 sons dtrs ageco agecosq revoffco nslave dist2 vsecr vbank ddebt pols lawyer,r 
probit anti7 sons dtrs ageco agecosq revoffco nslave dist2 vsecr vbank ddebt pols lawyer,r 
probit vote8 sons dtrs ageco agecosq revoffco nslave dist2 vsecr vbank ddebt pols lawyer,r 
probit vote9 sons dtrs ageco agecosq revoffco nslave dist2 vsecr vbank ddebt pols lawyer,r  
probit anti14 sons dtrs ageco agecosq revoffco nslave dist2 vsecr vbank ddebt pols lawyer,r 
probit vote15 sons dtrs ageco agecosq revoffco nslave dist2 vsecr vbank ddebt pols lawyer,r 

*Figure 2: panels comparing magnitude of sons effect with dist2 and nslave (margins range from 10th to 90th percentile)
poisson index1 sons dtrs ageco agecosq revoffco nslave dist2 vsecr vbank ddebt pols lawyer,r
margins, at(sons=(0(1)3)) vsquish
marginsplot,  recastci(rspike) aspect(1.75) ytitle(Predicted pro-national votes) xtitle(Number of sons) title(Panel A: Number of sons) xsize(2.5) ysize(4) graphregion(color(white) lcolor(white)) ylabel(0(2)10)

margins, at(dist2=(0(45)135)) vsquish
marginsplot, recastci(rspike) aspect(1.75) ytitle(Predicted pro-national votes) title(Panel B: Distance to coastline) xsize(2.5) ysize(4) graphregion(color(white) lcolor(white)) ylabel(0(2)10)

margins, at(nslave=(0(48)144)) vsquish
marginsplot, recastci(rspike) aspect(1.75) ytitle(Predicted pro-national votes) title(Panel C: Number of slaves owned) xsize(2.5) ysize(4) graphregion(color(white) lcolor(white)) ylabel(0(2)10)

*Table 3, note: VAR120 is dummy indicator for federalism
probit var120 sons dtrs ageco agecosq nslave dist2 vbank pols lawyer,r


* Table A1: H&D adjusted data analysis, CCVOTE represents altered data as described in the appendix.

gen cindex1B = ccvote2 + ccvote5 + ccvote6 + ccvote7 + ccvote8 + ccvote9 + ccvote14 + ccvote15 if v2a_june9 == 1 & v5a_july26 == 1 & v6a_august10 == 1 & v7a_august21 == 1 & v8a_august23 == 1 & v14a_august29 == 1 & v16a_september15 == 1
poisson cindex1B sons dtrs ageco agecosq revoffco nslave dist2 vsecr vbank ddebt pols lawyer,r
probit ccvote2 sons dtrs ageco agecosq revoffco nslave dist2 vsecr vbank ddebt pols lawyer if v2a_june9 == 1,r 
probit ccvote5 sons dtrs ageco agecosq revoffco nslave dist2 vsecr vbank ddebt pols lawyer if v5a_july26 == 1,r
probit ccvote6 sons dtrs ageco agecosq revoffco nslave dist2 vsecr vbank ddebt pols lawyer if v6a_august10 == 1,r
probit ccvote7 sons dtrs ageco agecosq revoffco nslave dist2 vsecr vbank ddebt pols lawyer if v7a_august21 == 1,r
probit ccvote8 sons dtrs ageco agecosq revoffco nslave dist2 vsecr vbank ddebt pols lawyer if v8a_august23 == 1,r
probit ccvote9 sons dtrs ageco agecosq revoffco nslave dist2 vsecr vbank ddebt pols lawyer if v9_13a_august28 == 1,r
probit ccvote14 sons dtrs ageco agecosq revoffco nslave dist2 vsecr vbank ddebt pols lawyer if v14a_august29 == 1,r
probit ccvote15 sons dtrs ageco agecosq revoffco nslave dist2 vsecr vbank ddebt pols lawyer if v16a_september15 == 1,r


* Table A2: Checking on "any son"
gen anyson = 0
replace anyson = 1 if sons > 0

gen anydaughter = 0
replace anydaughter = 1 if dtrs > 0

poisson index1 anyson anydaughter ageco agecosq revoffco nslave dist2 vsecr vbank ddebt pols lawyer,r


* Table A3: All votes 
poisson indexall sons dtrs ageco agecosq revoffco nslave dist2 vsecr vbank ddebt pols lawyer,r
logit vote2 sons dtrs ageco agecosq revoffco nslave dist2 vsecr vbank ddebt pols lawyer,r
logit anti4 sons dtrs ageco agecosq revoffco nslave dist2 vsecr vbank ddebt pols lawyer,r 
logit anti5 sons dtrs ageco agecosq revoffco nslave dist2 vsecr vbank ddebt pols lawyer,r 
logit anti6 sons dtrs ageco agecosq revoffco nslave dist2 vsecr vbank ddebt pols lawyer,r 
logit anti7 sons dtrs ageco agecosq revoffco nslave dist2 vsecr vbank ddebt pols lawyer,r 
logit vote8 sons dtrs ageco agecosq revoffco nslave dist2 vsecr vbank ddebt pols lawyer,r 
logit vote9 sons dtrs ageco agecosq revoffco nslave dist2 vsecr vbank ddebt pols lawyer,r 
logit vote10 sons dtrs ageco agecosq revoffco nslave dist2 vsecr vbank ddebt pols lawyer,r 
logit vote11 sons dtrs ageco agecosq revoffco nslave dist2 vsecr vbank ddebt pols lawyer,r 
logit vote12 sons dtrs ageco agecosq revoffco nslave dist2 vsecr vbank ddebt pols lawyer,r 
logit vote13 sons dtrs ageco agecosq revoffco nslave dist2 vsecr vbank ddebt pols lawyer,r 
logit anti14 sons dtrs ageco agecosq revoffco nslave dist2 vsecr vbank ddebt pols lawyer,r 
logit vote15 sons dtrs ageco agecosq revoffco nslave dist2 vsecr vbank ddebt pols lawyer,r 
logit anti16 sons dtrs ageco agecosq revoffco nslave dist2 vsecr vbank ddebt pols lawyer,r



* Table A4: Our preferred index and votes, PROPORTION OF SONS
poisson index1 pctson4 ageco agecosq revoffco nslave dist2 vsecr vbank ddebt pols lawyer,r
logit vote2 pctson4 ageco agecosq revoffco nslave dist2 vsecr vbank ddebt pols lawyer,r 
logit anti5 pctson4 ageco agecosq revoffco nslave dist2 vsecr vbank ddebt pols lawyer,r 
logit anti6 pctson4 ageco agecosq revoffco nslave dist2 vsecr vbank ddebt pols lawyer,r 
logit anti7 pctson4 ageco agecosq revoffco nslave dist2 vsecr vbank ddebt pols lawyer,r 
logit vote8 pctson4 ageco agecosq revoffco nslave dist2 vsecr vbank ddebt pols lawyer,r 
logit vote9 pctson4 ageco agecosq revoffco nslave dist2 vsecr vbank ddebt pols lawyer,r 
logit anti14 pctson4 ageco agecosq revoffco nslave dist2 vsecr vbank ddebt pols lawyer,r 
logit vote15 pctson4 ageco agecosq revoffco nslave dist2 vsecr vbank ddebt pols lawyer,r 

* Table A5: alternative indices 
poisson index1 sons dtrs ageco agecosq revoffco nslave dist2 vsecr vbank ddebt pols lawyer,r
poisson index2 sons dtrs ageco agecosq revoffco nslave dist2 vsecr vbank ddebt pols lawyer,r
poisson index3 sons dtrs ageco agecosq revoffco nslave dist2 vsecr vbank ddebt pols lawyer,r 
poisson indexall sons dtrs ageco agecosq revoffco nslave dist2 vsecr vbank ddebt pols lawyer,r 

* Table A6: standardized coefficients to compare magnitude
reg index1 sons dtrs ageco agecosq revoffco nslave dist2 vsecr vbank ddebt pols lawyer, r beta
