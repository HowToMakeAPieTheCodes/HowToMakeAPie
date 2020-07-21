/**** Definition of the useful path ****/
local CodeFolder "c:/ApplePie/Progs"

/**** Positioning ****/
cd "`CodeFolder'"

capture mkdir ../Outputs

/*************************************************************************************/
/*Install needed commands*/
ssc install ivreg2,  replace 		/*works with ivreg2 4.1.11  22Nov2019*/
ssc install estout, replace
net install st0085_2, replace from(http://www.stata-journal.com/software/sj14-2) /*works with version 2.0.6  02jun2014*/

/*************************************************************************************/
/**** Using data that is in another folder ****/
use ../Raw_Data/FictiveData_Restaurants.dta, clear

/*************************************************************************************/
/*Define Dependant ("Y") and independant variables
(exogeneous ones "Xexo", endogeneous one "Xendo") 
and instrumental variables ("IV")*/
/*************************************************************************************/
local Y      "Taste"
local Xexo   "Cooker_Level NbIngredients NbServers French Michelin"
local Xendo  "price"
local IV     "Eggs_Price Flour_Price Sugar_Price"

/*************************************************************************************/
/*Estimations : OLS and 2SLS*/
/*************************************************************************************/
eststo OLS : reg `Y' `Xendo' `Xexo' 
eststo IV  : ivreg2 `Y' `Xexo' (`Xendo' = `IV'), endog(`Xendo') first savefirst  ///
savefprefix(First_Stage)

/*************************************************************************************/
/*Exporting a nice table (LaTeX format) with both OLS and 2SLS estimations results*/
/*************************************************************************************/	
esttab OLS IV using ../Outputs/NiceTableRegressions.tex, ///
scalar("N \emph{Obs.}"  "r2 \emph{R$^2$}" "sargan \emph{Sargan Stat.}" "sarganp \emph{pvalue}") ///
b(3) not nonumber mtitle compress  replace ///
se  star(* 0.10   ** 0.05    *** 0.01) label ///
title(Example of the \textit{esttab} Stata command : OLS and 2SLS estimations regressing the /// 
Taste of the pie on several variables \label{ExampleNiceReg}) ///
addnote("IV are input prices : sugar, flour and eggs prices." ///
"Sargan test is an overidentification test of all instruments." ///
"This is a created example (no real interpretation!).") ///
mtitle("OLS" "2SLS") wide


