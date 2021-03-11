clear
#delimit;
log using "C:\Users\Ryan\Desktop\Choice Experiment\discrete_choice_experiment\STATA\CEresult2.log", replace; 



insheet using "C:\Users\Ryan\Desktop\Choice Experiment\discrete_choice_experiment\Data\FinalDataStata.csv";



/*full results*/
asclogit choice dirt gravel paved dist cost, vce(cluster id)case(case) alternative(alternative) basealternative(3);

estimates store full;



/*Krinsky Robb for full*/

matrix list e(V);
nlcom WTP_Dirt: - _b[dirt] / _b[cost];
nlcom WTP_Gravel: - _b[gravel] / _b[cost];
nlcom WTP_Paved: - _b[paved] / _b[cost];
nlcom WTP_Dist: - _b[dist] / _b[cost];

/*population results*/
asclogit choice_p dirt_p gravel_p paved_p dist_p cost_p, vce(cluster id_p)case(case_p) alternative(alternative_p) basealternative(3);

estimates store population;

/*Krinsky Robb for population*/

matrix list e(V);
nlcom WTP_Dirtp: - _b[dirt_p] / _b[cost_p];
nlcom WTP_Gravelp: - _b[gravel_p] / _b[cost_p];
nlcom WTP_Pavedp: - _b[paved_p] / _b[cost_p];
nlcom WTP_Distp: - _b[dist_p] / _b[cost_p];

/*student results*/
asclogit choice_s dirt_s gravel_s paved_s dist_s cost_s, vce(cluster id_s)case(case_s) alternative(alternative_s) basealternative(3);


estimates store student;

/*Krinsky Robb for student*/

matrix list e(V);
nlcom WTP_Dirts: - _b[dirt_s] / _b[cost_s];
nlcom WTP_Gravels: - _b[gravel_s] / _b[cost_s];
nlcom WTP_Paveds: - _b[paved_s] / _b[cost_s];
nlcom WTP_Dists: - _b[dist_s] / _b[cost_s];



log close;
