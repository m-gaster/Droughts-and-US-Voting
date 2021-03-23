clear

import delimited "C:\Users\mikha\Dropbox\mikhael_misc\Projects\544 Replication - Bruckner and Ciccone - Rainfall and Voting\collapsed_elec_df.csv"





encode(state), gen(state_code)
// encode(dpres), gen(DPres)
rename dpres DPres

// tab year, gen(time)

// tab encode(state), gen(stateFE)

gen drought_score_x_agricultural = drought_score * agricultural
gen drought_score_x_agricultural_gdp = drought_score * agricultural_gdp

gen DS_vs_avg_x_agricultural = drought_score_vs_avg * agricultural
gen DS_vs_avg_x_agricultural_gdp = drought_score_vs_avg* agricultural_gdp



// regress totalvotes drought_score agricultural drought_score_x_agricultural i.DPres i.state_code i.year i.state_code##i.year, cluster(state_code)

*Table 1: totalvotes OLS*

regress totalvotes drought_score agricultural drought_score_x_agricultural i.DPres i.state_code i.year i.state_code##i.year, cluster(state_code)
outreg2 using collapsed_table1, replace dec(4) keep(drought_score agricultural drought_score_x_agricultural) addtext(State FE, Yes, Time FE, Yes, State-Time FE, Yes) title(Table I, Rainfall and Voter Turnout) ctitle("OLS", "Total Votes") nocons

regress totalvotes drought_score agricultural_gdp drought_score_x_agricultural_gdp i.DPres i.state_code i.year i.state_code##i.year, cluster(state_code)
outreg2 using collapsed_table1, append dec(4) keep(drought_score agricultural_gdp drought_score_x_agricultural_gdp) addtext(State FE, Yes, Time FE, Yes, State-Time FE, Yes) ctitle("OLS", "Total Votes") nocons

regress totalvotes drought_score_vs_avg agricultural DS_vs_avg_x_agricultural i.DPres i.state_code i.year i.state_code##i.year, cluster(state_code)
outreg2 using collapsed_table1, append dec(4) keep(drought_score_vs_avg agricultural DS_vs_avg_x_agricultural) addtext(State FE, Yes, Time FE, Yes, State-Time FE, Yes) ctitle("OLS", "Total Votes") nocons

regress totalvotes drought_score_vs_avg agricultural_gdp DS_vs_avg_x_agricultural_gdp i.DPres i.state_code i.year i.state_code##i.year, cluster(state_code)
outreg2 using collapsed_table1, tex append dec(4) keep(totalvotes drought_score_vs_avg agricultural_gdp DS_vs_avg_x_agricultural_gdp) addtext(State FE, Yes, Time FE, Yes, State-Time FE, Yes) ctitle("OLS", "Total Votes") nocons

seeout


*Table 2: Incumbent Lost OLS & Probit*

regress incumbent_lost drought_score agricultural drought_score_x_agricultural i.DPres i.state_code i.year i.state_code##i.year, cluster(state_code)
outreg2 using collapsed_table2, replace dec(5) keep(drought_score agricultural drought_score_x_agricultural) addtext(State FE, Yes, Time FE, Yes, State-Time FE, Yes) title(Table II, Rainfall and Incumbent Outcome) ctitle("OLS", "Incumbent Lost") nocons

regress incumbent_lost drought_score agricultural_gdp drought_score_x_agricultural_gdp i.DPres i.state_code i.year i.state_code##i.year, cluster(state_code)
outreg2 using collapsed_table2, append dec(5) keep(drought_score agricultural_gdp drought_score_x_agricultural_gdp) addtext(State FE, Yes, Time FE, Yes, State-Time FE, Yes) ctitle("OLS", "Incumbent Lost") nocons

regress incumbent_lost drought_score_vs_avg agricultural DS_vs_avg_x_agricultural i.DPres i.state_code i.year i.state_code##i.year, cluster(state_code)
outreg2 using collapsed_table2, append dec(5) keep(drought_score_vs_avg agricultural DS_vs_avg_x_agricultural) addtext(State FE, Yes, Time FE, Yes, State-Time FE, Yes) ctitle("OLS", "Incumbent Lost") nocons

regress incumbent_lost drought_score_vs_avg agricultural_gdp DS_vs_avg_x_agricultural_gdp i.DPres i.state_code i.year i.state_code##i.year, cluster(state_code)
outreg2 using collapsed_table2, append dec(5) keep(totalvotes drought_score_vs_avg agricultural_gdp DS_vs_avg_x_agricultural_gdp) addtext(State FE, Yes, Time FE, Yes, State-Time FE, Yes) ctitle("OLS", "Incumbent Lost") nocons

//probit
probit incumbent_lost drought_score agricultural drought_score_x_agricultural i.DPres i.state_code i.year, cluster(state_code)
outreg2 using collapsed_table2, append dec(5) keep(drought_score agricultural drought_score_x_agricultural) addtext(State FE, Yes, Time FE, Yes, State-Time FE, No)  ctitle("Probit", "Incumbent Lost") nocons

probit incumbent_lost drought_score agricultural_gdp drought_score_x_agricultural_gdp i.DPres i.state_code i.year , cluster(state_code)
outreg2 using collapsed_table2, append dec(5) keep(drought_score agricultural_gdp drought_score_x_agricultural_gdp) addtext(State FE, Yes, Time FE, Yes, State-Time FE, No) ctitle("Probit", "Incumbent Lost") nocons

probit incumbent_lost drought_score_vs_avg agricultural DS_vs_avg_x_agricultural i.DPres i.state_code i.year , cluster(state_code)
outreg2 using collapsed_table2, append dec(5) keep(drought_score_vs_avg agricultural DS_vs_avg_x_agricultural) addtext(State FE, Yes, Time FE, Yes, State-Time FE, No) ctitle("Probit", "Incumbent Lost") nocons

probit incumbent_lost drought_score_vs_avg agricultural_gdp DS_vs_avg_x_agricultural_gdp i.DPres i.state_code i.year, cluster(state_code)
outreg2 using collapsed_table2, tex append dec(5) keep(totalvotes drought_score_vs_avg agricultural_gdp DS_vs_avg_x_agricultural_gdp) addtext(State FE, Yes, Time FE, No, State-Time FE, Yes) ctitle("Probit", "Incumbent Lost") nocons




*Table 3: Change in Incumbent Voteshare OLS & Probit*

regress share_diff drought_score agricultural drought_score_x_agricultural i.DPres i.state_code i.year i.state_code##i.year, cluster(state_code)
outreg2 using collapsed_table3, replace dec(5) keep(drought_score agricultural drought_score_x_agricultural) addtext(State FE, Yes, Time FE, Yes, State-Time FE, Yes) title(Table III, Rainfall and Change in Incumbent Voteshare) ctitle("OLS", "\Delta Inc. Voteshare") nocons

regress share_diff drought_score agricultural_gdp drought_score_x_agricultural_gdp i.DPres i.state_code i.year i.state_code##i.year, cluster(state_code)
outreg2 using collapsed_table3, append dec(5) keep(drought_score agricultural_gdp drought_score_x_agricultural_gdp) addtext(State FE, Yes, Time FE, Yes, State-Time FE, Yes) ctitle("OLS", "\Delta Inc. Voteshare") nocons

regress share_diff drought_score_vs_avg agricultural DS_vs_avg_x_agricultural i.DPres i.state_code i.year i.state_code##i.year, cluster(state_code)
outreg2 using collapsed_table3, append dec(5) keep(drought_score_vs_avg agricultural DS_vs_avg_x_agricultural) addtext(State FE, Yes, Time FE, Yes, State-Time FE, Yes) ctitle("OLS", "\Delta Inc. Voteshare") nocons

regress share_diff drought_score_vs_avg agricultural_gdp DS_vs_avg_x_agricultural_gdp i.DPres i.state_code i.year i.state_code##i.year, cluster(state_code)
outreg2 using collapsed_table3, append dec(5) keep(totalvotes drought_score_vs_avg agricultural_gdp DS_vs_avg_x_agricultural_gdp) addtext(State FE, Yes, Time FE, Yes, State-Time FE, Yes) ctitle("OLS", "\Delta Inc. Voteshare") nocons

//probit
probit share_diff drought_score agricultural drought_score_x_agricultural i.DPres i.state_code i.year , cluster(state_code)
outreg2 using collapsed_table3, append dec(5) keep(drought_score agricultural drought_score_x_agricultural) addtext(State FE, Yes, Time FE, Yes, State-Time FE, No)  ctitle("Probit", "\Delta Inc. Voteshare") nocons

probit share_diff drought_score agricultural_gdp drought_score_x_agricultural_gdp i.DPres i.state_code i.year , cluster(state_code)
outreg2 using collapsed_table3, append dec(5) keep(drought_score agricultural_gdp drought_score_x_agricultural_gdp) addtext(State FE, Yes, Time FE, Yes, State-Time FE, No) ctitle("Probit", "\Delta Inc. Voteshare") nocons

probit share_diff drought_score_vs_avg agricultural DS_vs_avg_x_agricultural i.DPres i.state_code i.year , cluster(state_code)
outreg2 using collapsed_table3, append dec(5) keep(drought_score_vs_avg agricultural DS_vs_avg_x_agricultural) addtext(State FE, Yes, Time FE, Yes, State-Time FE, No) ctitle("Probit", "\Delta Inc. Voteshare") nocons

probit share_diff drought_score_vs_avg agricultural_gdp DS_vs_avg_x_agricultural_gdp i.DPres i.state_code i.year , cluster(state_code)
outreg2 using collapsed_table3, tex append dec(5) keep(totalvotes drought_score_vs_avg agricultural_gdp DS_vs_avg_x_agricultural_gdp) addtext(State FE, Yes, Time FE, Yes, State-Time FE, No) ctitle("Probit", "\Delta Inc. Voteshare") nocons



* Table 4: Republican voteshare *

regress repub_voteshare drought_score agricultural drought_score_x_agricultural i.DPres i.state_code i.year i.state_code##i.year, cluster(state_code)
outreg2 using collapsed_table4, replace dec(5) keep(drought_score agricultural drought_score_x_agricultural) addtext(State FE, Yes, Time FE, Yes, State-Time FE, Yes) title(Table IV, Rainfall and Republican Voteshare) ctitle("OLS", "Repub. Voteshare") nocons

regress repub_voteshare drought_score agricultural_gdp drought_score_x_agricultural_gdp i.DPres i.state_code i.year i.state_code##i.year, cluster(state_code)
outreg2 using collapsed_table4, append dec(5) keep(drought_score agricultural_gdp drought_score_x_agricultural_gdp) addtext(State FE, Yes, Time FE, Yes, State-Time FE, Yes) ctitle("OLS", "Repub. Voteshare") nocons

regress repub_voteshare drought_score_vs_avg agricultural DS_vs_avg_x_agricultural i.DPres i.state_code i.year i.state_code##i.year, cluster(state_code)
outreg2 using collapsed_table4, append dec(5) keep(drought_score_vs_avg agricultural DS_vs_avg_x_agricultural) addtext(State FE, Yes, Time FE, Yes, State-Time FE, Yes) ctitle("OLS", "Repub. Voteshare") nocons

regress repub_voteshare drought_score_vs_avg agricultural_gdp DS_vs_avg_x_agricultural_gdp i.DPres i.state_code i.year i.state_code##i.year, cluster(state_code)
outreg2 using collapsed_table4, tex append dec(5) keep(totalvotes drought_score_vs_avg agricultural_gdp DS_vs_avg_x_agricultural_gdp) addtext(State FE, Yes, Time FE, Yes, State-Time FE, Yes) ctitle("OLS", "Repub. Voteshare") nocons

//probit
// probit repub_voteshare drought_score agricultural drought_score_x_agricultural i.DPres i.state_code i.year , cluster(state_code)
// outreg2 using collapsed_table4, append dec(5) keep(drought_score agricultural drought_score_x_agricultural) addtext(State FE, Yes, Time FE, Yes, State-Time FE, No)  ctitle("Probit", "Repub. Voteshare") nocons
//
// probit repub_voteshare drought_score agricultural_gdp drought_score_x_agricultural_gdp i.DPres i.state_code i.year, cluster(state_code)
// outreg2 using collapsed_table4, append dec(5) keep(drought_score agricultural_gdp drought_score_x_agricultural_gdp) addtext(State FE, Yes, Time FE, Yes, State-Time FE, No) ctitle("Probit", "Repub. Voteshare") nocons
//
// probit repub_voteshare drought_score_vs_avg agricultural DS_vs_avg_x_agricultural i.DPres i.state_code i.year , cluster(state_code)
// outreg2 using collapsed_table4, append dec(5) keep(drought_score_vs_avg agricultural DS_vs_avg_x_agricultural) addtext(State FE, Yes, Time FE, Yes, State-Time FE, No) ctitle("Probit", "Repub. Voteshare") nocons
//
// probit repub_voteshare drought_score_vs_avg agricultural_gdp DS_vs_avg_x_agricultural_gdp i.DPres i.state_code i.year, cluster(state_code)
// outreg2 using collapsed_table4, word append dec(5) keep(totalvotes drought_score_vs_avg agricultural_gdp DS_vs_avg_x_agricultural_gdp) addtext(State FE, Yes, Time FE, No, State-Time FE, Yes) ctitle("Probit", "Repub. Voteshare") nocons








* Table 4 attempt 2 because it won't render to tex*


regress repub_voteshare drought_score agricultural drought_score_x_agricultural i.DPres i.state_code i.year i.state_code##i.year, cluster(state_code)
outreg2 using collapsed_table5, replace dec(5) keep(drought_score agricultural drought_score_x_agricultural) addtext(State FE, Yes, Time FE, Yes, State-Time FE, Yes) title(Table IV, Rainfall and Republican Voteshare) ctitle("OLS", "Repub. Voteshare") nocons

regress repub_voteshare drought_score agricultural_gdp drought_score_x_agricultural_gdp i.DPres i.state_code i.year i.state_code##i.year, cluster(state_code)
outreg2 using collapsed_table5, append dec(5) keep(drought_score agricultural_gdp drought_score_x_agricultural_gdp) addtext(State FE, Yes, Time FE, Yes, State-Time FE, Yes) ctitle("OLS", "Repub. Voteshare") nocons

regress repub_voteshare drought_score_vs_avg agricultural DS_vs_avg_x_agricultural i.DPres i.state_code i.year i.state_code##i.year, cluster(state_code)
outreg2 using collapsed_table5, append dec(5) keep(drought_score_vs_avg agricultural DS_vs_avg_x_agricultural) addtext(State FE, Yes, Time FE, Yes, State-Time FE, Yes) ctitle("OLS", "Repub. Voteshare") nocons

regress repub_voteshare drought_score_vs_avg agricultural_gdp DS_vs_avg_x_agricultural_gdp i.DPres i.state_code i.year i.state_code##i.year, cluster(state_code)
outreg2 using collapsed_table5, tex append dec(5) keep(totalvotes drought_score_vs_avg agricultural_gdp DS_vs_avg_x_agricultural_gdp) addtext(State FE, Yes, Time FE, Yes, State-Time FE, Yes) ctitle("OLS", "Repub. Voteshare") nocons

//probit
probit repub_voteshare drought_score agricultural drought_score_x_agricultural i.DPres i.state_code i.year , cluster(state_code)
outreg2 using collapsed_table5, append dec(5) keep(drought_score agricultural drought_score_x_agricultural) addtext(State FE, Yes, Time FE, Yes, State-Time FE, No)  ctitle("Probit", "Repub. Voteshare") nocons

probit repub_voteshare drought_score agricultural_gdp drought_score_x_agricultural_gdp i.DPres i.state_code i.year, cluster(state_code)
outreg2 using collapsed_table5, append dec(5) keep(drought_score agricultural_gdp drought_score_x_agricultural_gdp) addtext(State FE, Yes, Time FE, Yes, State-Time FE, No) ctitle("Probit", "Repub. Voteshare") nocons

probit repub_voteshare drought_score_vs_avg agricultural DS_vs_avg_x_agricultural i.DPres i.state_code i.year , cluster(state_code)
outreg2 using collapsed_table5, append dec(5) keep(drought_score_vs_avg agricultural DS_vs_avg_x_agricultural) addtext(State FE, Yes, Time FE, Yes, State-Time FE, No) ctitle("Probit", "Repub. Voteshare") nocons

probit repub_voteshare drought_score_vs_avg agricultural_gdp DS_vs_avg_x_agricultural_gdp i.DPres i.state_code i.year, cluster(state_code)
outreg2 using collapsed_table5, tex append dec(5) keep(totalvotes drought_score_vs_avg agricultural_gdp DS_vs_avg_x_agricultural_gdp) addtext(State FE, Yes, Time FE, No, State-Time FE, Yes) ctitle("Probit", "Repub. Voteshare") nocons






