/*Step0. ??? ???*/
/*file? ??? library name ??, Y? ??*/
libname Y "C:\Users\user\Documents\My SAS Files";
run;

/*library Y? ?? file?? ?? year_all??? ???? work library? ??*/
data Y.year_all;
set Y.drinking_drug_test; 
run;

data year_all;
set Y.year_all;
run;

/*library Y? ?? pop_all file? pop_all??? ???? work library? ??*/
data pop_all;
set Y.pop_all;
run;

/*period ???*/
data year_all; set year_all;
if  2005<= year <2009 then year_2=1;
else if 2009<= year <2013 then year_2=2;
else if 2013<= year <2017 then year_2=3;
else if 2017<= year <2020 then year_2=4;
else if year=2020 then year_2=5;
else if year=2021 then year_2=6;
else if year=2022 then year_2=7;
run;

data year_all; set year_all;
if  city_num in (1 4 9) then regional_group=1;
else if city_num in (10) then regional_group=2;
else if city_num in (6 8 11 12) then regional_group=3;
else if city_num in (5 13 14) then regional_group=4;
else if city_num in (2 3 7 15 16) then regional_group=5;
else if city_num in (17) then regional_group=6;
run;

/*alcoholic_consumption ??? (no within 1 month=0, yes within 1 month=1)*/
data year_all; set year_all; 
if alcoholic_consumption in (0) then alcoholic_consumption_bi=0;
else if alcoholic_consumption in (1 2 3 4) then alcoholic_consumption_bi=1;
run;


data year_all; set year_all; 
if alcohol_try in (1) then alcoholic_try_bi=0;
else if alcohol_try in (2 3 4 5) then alcoholic_try_bi=1;
run;
proc freq data=year_all; table alcohol_try; run;

/*SEX ??? (male=0, female=1)*/
data year_all; set year_all; 
if SEX in (1) then sex_bi=0;
else if SEX in (2) then sex_bi=1;
run;

/*age ??? (middle school=0, high school=1)*/
data year_all; set year_all; 
if age in (13 14 15) then age_bi=0;
else if age in (16 17 18) then age_bi=1;
run;

/*bmi_2 ??? (normal or lower=0, overweight or higher=1)*/
data year_all; set year_all; 
if bmi_2 in (1 2) then bmi_2_bi =0;
else if bmi_2 in (3 4) then bmi_2_bi=1;
run;

/*economic ??? (Q1~Q2=0, Q3~Q4=1)*/
data year_all; set year_all; 
if economic in (1 2) then economic_bi =0;
else if economic in (3 4) then economic_bi=1;
run;

/*study ??? (middle or lower=0, Middle high or higher=1)*/
data year_all; set year_all; 
if study in (1 2 3) then study_bi=0;
else if study in (4 5) then study_bi=1;
run;

/*edp ??? (middle school graduated or lower=0, high school graduated or higher=1)*/
data year_all; set year_all; 
if edp in (2) then edp_bi=0;
else if study in (3 4) then edp_bi=1;
run;

/*stress ??? (a little or lower=0, much or higher=1)*/
data year_all; set year_all; 
if stress in (1 2 3) then stress_bi=0;
else if stress in (4 5) then stress_bi=1;
run;

/*smoking ??? (no=0, yes=1)*/
data year_all; set year_all; 
if smoking in (0) then smoking_bi=0;
else if smoking in (1) then smoking_bi=1;
run;

/*depression ??? (no=0, yes=1)*/
data year_all; set year_all; 
if depression in (0) then depression_bi=0;
else if depression in (1) then depression_bi=1;
run;

/*suicidalthinking ??? (no=0, yes=1)*/
data year_all; set year_all; 
if suicidalthinking in (0) then suicidalthinking_bi=0;
else if suicidalthinking in (1) then suicidalthinking_bi=1;
run;

/*suicideattempts ??? (no=0, yes=1)*/
data year_all; set year_all; 
if suicideattempts in (0) then suicideattempts_bi=0;
else if suicideattempts in (1) then suicideattempts_bi=1;
run;

/*??? ??*/
data year_all;
set year_all;
if region^=. or alcoholic_consumption^=. or alcoholic_try^=. or SEX^=. or age^=. or bmi_2^=. or economic^=. or study^=. or edp^=. or stress^=. or smoking^=. or depression=^. or suicidalthinking^=. or suicideattempts=^. then aaa=1;
else aaa=0;
run;

/*table 2? table 3? ?? ?? ??*/
data year_all; set year_all;
if	aaa=1	 and 				alcoholic_consumption_bi	=1	 then 	ac	=1	; else if	 aaa=1	 and 				alcoholic_consumption_bi	=0	 then 	ac	=0	;
																						
if	aaa=1	 and 	sex_bi	=0	 and 	alcoholic_consumption_bi	=1	 then 	sex0_con	=1	; else if	 aaa=1	 and 	sex_bi	=0	 and 	alcoholic_consumption_bi	=0	 then 	sex0_con	=0	;
if	aaa=1	 and 	sex_bi	=1	 and 	alcoholic_consumption_bi	=1	 then 	sex1_con	=1	; else if	 aaa=1	 and 	sex_bi	=1	 and 	alcoholic_consumption_bi	=0	 then 	sex1_con	=0	;
																						
if	aaa=1	 and 	age_bi	=0	 and 	alcoholic_consumption_bi	=1	 then 	age0_con	=1	; else if	 aaa=1	 and 	age_bi	=0	 and 	alcoholic_consumption_bi	=0	 then 	age0_con	=0	;
if	aaa=1	 and 	age_bi	=1	 and 	alcoholic_consumption_bi	=1	 then 	age1_con	=1	; else if	 aaa=1	 and 	age_bi	=1	 and 	alcoholic_consumption_bi	=0	 then 	age1_con	=0	;
																						
if	aaa=1	 and 	bmi_2_bi	=0	 and 	alcoholic_consumption_bi	=1	 then 	bmi_20_con	=1	; else if	 aaa=1	 and 	bmi_2_bi	=0	 and 	alcoholic_consumption_bi	=0	 then 	bmi_20_con	=0	;
if	aaa=1	 and 	bmi_2_bi	=1	 and 	alcoholic_consumption_bi	=1	 then 	bmi_21_con	=1	; else if	 aaa=1	 and 	bmi_2_bi	=1	 and 	alcoholic_consumption_bi	=0	 then 	bmi_21_con	=0	;
																						
if	aaa=1	 and 	economic_bi	=0	 and 	alcoholic_consumption_bi	=1	 then 	economic0_con	=1	; else if	 aaa=1	 and 	economic_bi	=0	 and 	alcoholic_consumption_bi	=0	 then 	economic0_con	=0	;
if	aaa=1	 and 	economic_bi	=1	 and 	alcoholic_consumption_bi	=1	 then 	economic1_con	=1	; else if	 aaa=1	 and 	economic_bi	=1	 and 	alcoholic_consumption_bi	=0	 then 	economic1_con	=0	;
																						
if	aaa=1	 and 	study_bi	=0	 and 	alcoholic_consumption_bi	=1	 then 	study0_con	=1	; else if	 aaa=1	 and 	study_bi	=0	 and 	alcoholic_consumption_bi	=0	 then 	study0_con	=0	;
if	aaa=1	 and 	study_bi	=1	 and 	alcoholic_consumption_bi	=1	 then 	study1_con	=1	; else if	 aaa=1	 and 	study_bi	=1	 and 	alcoholic_consumption_bi	=0	 then 	study1_con	=0	;
																						
if	aaa=1	 and 	edp_bi	=0	 and 	alcoholic_consumption_bi	=1	 then 	edp0_con	=1	; else if	 aaa=1	 and 	edp_bi	=0	 and 	alcoholic_consumption_bi	=0	 then 	edp0_con	=0	;
if	aaa=1	 and 	edp_bi	=1	 and 	alcoholic_consumption_bi	=1	 then 	edp1_con	=1	; else if	 aaa=1	 and 	edp_bi	=1	 and 	alcoholic_consumption_bi	=0	 then 	edp1_con	=0	;
																						
if	aaa=1	 and 	stress_bi	=0	 and 	alcoholic_consumption_bi	=1	 then 	stress0_con	=1	; else if	 aaa=1	 and 	stress_bi	=0	 and 	alcoholic_consumption_bi	=0	 then 	stress0_con	=0	;
if	aaa=1	 and 	stress_bi	=1	 and 	alcoholic_consumption_bi	=1	 then 	stress1_con	=1	; else if	 aaa=1	 and 	stress_bi	=1	 and 	alcoholic_consumption_bi	=0	 then 	stress1_con	=0	;
																						
if	aaa=1	 and 	smoking_bi	=0	 and 	alcoholic_consumption_bi	=1	 then 	smoking0_con	=1	; else if	 aaa=1	 and 	smoking_bi	=0	 and 	alcoholic_consumption_bi	=0	 then 	smoking0_con	=0	;
if	aaa=1	 and 	smoking_bi	=1	 and 	alcoholic_consumption_bi	=1	 then 	smoking1_con	=1	; else if	 aaa=1	 and 	smoking_bi	=1	 and 	alcoholic_consumption_bi	=0	 then 	smoking1_con	=0	;
																						
if	aaa=1	 and 	depression_bi	=0	 and 	alcoholic_consumption_bi	=1	 then 	depression0_con	=1	; else if	 aaa=1	 and 	depression_bi	=0	 and 	alcoholic_consumption_bi	=0	 then 	depression0_con	=0	;
if	aaa=1	 and 	depression_bi	=1	 and 	alcoholic_consumption_bi	=1	 then 	depression1_con	=1	; else if	 aaa=1	 and 	depression_bi	=1	 and 	alcoholic_consumption_bi	=0	 then 	depression1_con	=0	;
																						
if	aaa=1	 and 	suicidalthinking_bi	=0	 and 	alcoholic_consumption_bi	=1	 then 	suicidalthinking0_con	=1	; else if	 aaa=1	 and 	suicidalthinking_bi	=0	 and 	alcoholic_consumption_bi	=0	 then 	suicidalthinking0_con	=0	;
if	aaa=1	 and 	suicidalthinking_bi	=1	 and 	alcoholic_consumption_bi	=1	 then 	suicidalthinking1_con	=1	; else if	 aaa=1	 and 	suicidalthinking_bi	=1	 and 	alcoholic_consumption_bi	=0	 then 	suicidalthinking1_con	=0	;
																						
if	aaa=1	 and 	suicideattempts_bi	=0	 and 	alcoholic_consumption_bi	=1	 then 	suicideattempts0_con	=1	; else if	 aaa=1	 and 	suicideattempts_bi	=0	 and 	alcoholic_consumption_bi	=0	 then 	suicideattempts0_con	=0	;
if	aaa=1	 and 	suicideattempts_bi	=1	 and 	alcoholic_consumption_bi	=1	 then 	suicideattempts1_con	=1	; else if	 aaa=1	 and 	suicideattempts_bi	=1	 and 	alcoholic_consumption_bi	=0	 then 	suicideattempts1_con	=0	;
run;


data year_all; set year_all;
if	aaa=1	 and 				alcoholic_try_bi	=1	 then 	at	=1	; else if	 aaa=1	 and alcoholic_try_bi	=0	 then 	at	=0	;
if	aaa=1	 and 	sex_bi	=0	 and 	alcoholic_try_bi	=1	 then 	sex0_try	=1	; else if	 aaa=1	 and 	sex_bi	=0	 and 	alcoholic_try_bi	=0	 then 	sex0_try	=0	;
if	aaa=1	 and 	sex_bi	=1	 and 	alcoholic_try_bi	=1	 then 	sex1_try	=1	; else if	 aaa=1	 and 	sex_bi	=1	 and 	alcoholic_try_bi	=0	 then 	sex1_try	=0	;
if	aaa=1	 and 	age_bi	=0	 and 	alcoholic_try_bi	=1	 then 	age0_try	=1	; else if	 aaa=1	 and 	age_bi	=0	 and 	alcoholic_try_bi	=0	 then 	age0_try	=0	;
if	aaa=1	 and 	age_bi	=1	 and 	alcoholic_try_bi	=1	 then 	age1_try	=1	; else if	 aaa=1	 and 	age_bi	=1	 and 	alcoholic_try_bi	=0	 then 	age1_try	=0	;
if	aaa=1	 and 	bmi_2_bi	=0	 and 	alcoholic_try_bi	=1	 then 	bmi_20_try	=1	; else if	 aaa=1	 and 	bmi_2_bi	=0	 and 	alcoholic_try_bi	=0	 then 	bmi_20_try	=0	;
if	aaa=1	 and 	bmi_2_bi	=1	 and 	alcoholic_try_bi	=1	 then 	bmi_21_try	=1	; else if	 aaa=1	 and 	bmi_2_bi	=1	 and 	alcoholic_try_bi	=0	 then 	bmi_21_try	=0	;
if	aaa=1	 and 	economic_bi	=0	 and 	alcoholic_try_bi	=1	 then 	economic0_try	=1	; else if	 aaa=1	 and 	economic_bi	=0	 and 	alcoholic_try_bi	=0	 then 	economic0_try	=0	;
if	aaa=1	 and 	economic_bi	=1	 and 	alcoholic_try_bi	=1	 then 	economic1_try	=1	; else if	 aaa=1	 and 	economic_bi	=1	 and 	alcoholic_try_bi	=0	 then 	economic1_try	=0	;
if	aaa=1	 and 	study_bi	=0	 and 	alcoholic_try_bi	=1	 then 	study0_try	=1	; else if	 aaa=1	 and 	study_bi	=0	 and 	alcoholic_try_bi	=0	 then 	study0_try	=0	;
if	aaa=1	 and 	study_bi	=1	 and 	alcoholic_try_bi	=1	 then 	study1_try	=1	; else if	 aaa=1	 and 	study_bi	=1	 and 	alcoholic_try_bi	=0	 then 	study1_try	=0	;
if	aaa=1	 and 	edp_bi	=0	 and 	alcoholic_try_bi	=1	 then 	edp0_try	=1	; else if	 aaa=1	 and 	edp_bi	=0	 and 	alcoholic_try_bi	=0	 then 	edp0_try	=0	;
if	aaa=1	 and 	edp_bi	=1	 and 	alcoholic_try_bi	=1	 then 	edp1_try	=1	; else if	 aaa=1	 and 	edp_bi	=1	 and 	alcoholic_try_bi	=0	 then 	edp1_try	=0	;
if	aaa=1	 and 	stress_bi	=0	 and 	alcoholic_try_bi	=1	 then 	stress0_try	=1	; else if	 aaa=1	 and 	stress_bi	=0	 and 	alcoholic_try_bi	=0	 then 	stress0_try	=0	;
if	aaa=1	 and 	stress_bi	=1	 and 	alcoholic_try_bi	=1	 then 	stress1_try	=1	; else if	 aaa=1	 and 	stress_bi	=1	 and 	alcoholic_try_bi	=0	 then 	stress1_try	=0	;
if	aaa=1	 and 	smoking_bi	=0	 and 	alcoholic_try_bi	=1	 then 	smoking0_try	=1	; else if	 aaa=1	 and 	smoking_bi	=0	 and 	alcoholic_try_bi	=0	 then 	smoking0_try	=0	;
if	aaa=1	 and 	smoking_bi	=1	 and 	alcoholic_try_bi	=1	 then 	smoking1_try	=1	; else if	 aaa=1	 and 	smoking_bi	=1	 and 	alcoholic_try_bi	=0	 then 	smoking1_try	=0	;
if	aaa=1	 and 	depression_bi	=0	 and 	alcoholic_try_bi	=1	 then 	depression0_try	=1	; else if	 aaa=1	 and 	depression_bi	=0	 and 	alcoholic_try_bi	=0	 then 	depression0_try	=0	;
if	aaa=1	 and 	depression_bi	=1	 and 	alcoholic_try_bi	=1	 then 	depression1_try	=1	; else if	 aaa=1	 and 	depression_bi	=1	 and 	alcoholic_try_bi	=0	 then 	depression1_try	=0	;
if	aaa=1	 and 	suicidalthinking_bi	=0	 and 	alcoholic_try_bi	=1	 then 	suicidalthinking0_try	=1	; else if	 aaa=1	 and 	suicidalthinking_bi	=0	 and 	alcoholic_try_bi	=0	 then 	suicidalthinking0_try	=0	;
if	aaa=1	 and 	suicidalthinking_bi	=1	 and 	alcoholic_try_bi	=1	 then 	suicidalthinking1_try	=1	; else if	 aaa=1	 and 	suicidalthinking_bi	=1	 and 	alcoholic_try_bi	=0	 then 	suicidalthinking1_try	=0	;
if	aaa=1	 and 	suicideattempts_bi	=0	 and 	alcoholic_try_bi	=1	 then 	suicideattempts0_try	=1	; else if	 aaa=1	 and 	suicideattempts_bi	=0	 and 	alcoholic_try_bi	=0	 then 	suicideattempts0_try	=0	;
if	aaa=1	 and 	suicideattempts_bi	=1	 and 	alcoholic_try_bi	=1	 then 	suicideattempts1_try	=1	; else if	 aaa=1	 and 	suicideattempts_bi	=1	 and 	alcoholic_try_bi	=0	 then 	suicideattempts1_try	=0	;
run;



/*??? ??(??)*/
data year_all;
set year_all;
/*year_2=1*/
if year=2005 then wt_indi=(1/4)*w;
if year=2006 then wt_indi=(1/4)*w;
if year=2007 then wt_indi=(1/4)*w;
if year=2008 then wt_indi=(1/4)*w;
/*year_2=2*/
if year=2009 then wt_indi=(1/4)*w;
if year=2010 then wt_indi=(1/4)*w;
if year=2011 then wt_indi=(1/4)*w;
if year=2012 then wt_indi=(1/4)*w;
/*year_2=3*/
if year=2013 then wt_indi=(1/4)*w;
if year=2014 then wt_indi=(1/4)*w;
if year=2015 then wt_indi=(1/4)*w;
if year=2016 then wt_indi=(1/4)*w;
/*year_2=4*/
if year=2017 then wt_indi=(1/3)*w;
if year=2018 then wt_indi=(1/3)*w;
if year=2019 then wt_indi=(1/3)*w;
/*year_2=5*/
if year=2020 then wt_indi=1*w;
/*year_2=6*/
if year=2021 then wt_indi=1*w;
/*year_2=7*/
if year=2022 then wt_indi=1*w;
run;

/*??? ??(??)*/
data year_all;
set year_all;
/*year_2=1*/
if year=2005 then wt_all=(1/4)*w;
if year=2006 then wt_all=(1/4)*w;
if year=2007 then wt_all=(1/4)*w;
if year=2008 then wt_all=(1/4)*w;
/*year_2=2*/
if year=2009 then wt_all=(1/4)*w;
if year=2010 then wt_all=(1/4)*w;
if year=2011 then wt_all=(1/4)*w;
if year=2012 then wt_all=(1/4)*w;
/*year_2=3*/
if year=2013 then wt_all=(1/4)*w;
if year=2014 then wt_all=(1/4)*w;
if year=2015 then wt_all=(1/4)*w;
if year=2016 then wt_all=(1/4)*w;
/*year_2=4*/
if year=2017 then wt_all=(1/3)*w;
if year=2018 then wt_all=(1/3)*w;
if year=2019 then wt_all=(1/3)*w;
/*year_2=5*/
if year=2020 then wt_all=1*w;
/*year_2=6*/
if year=2021 then wt_all=1*w;
/*year_2=7*/
if year=2022 then wt_all=1*w;
run;


/*Step1. Table1*/
/*Crude ?, Total*/
proc surveyfreq data=year_all
nomcar;
table 
year_2
SEX
age
bmi_2
economic
study
edp
stress
smoking
depression
suicidalthinking
suicideattempts /cl row column;
run;

/*Crude ?, year_2? ???? period??*/
proc surveyfreq data=year_all
nomcar;
table
year_2*SEX
year_2*age
year_2*bmi_2
year_2*economic
year_2*study
year_2*edp
year_2*stress
year_2*smoking
year_2*depression
year_2*suicidalthinking
year_2*suicideattempts /cl row column;
run;

/*Weighted ?, Total*/
proc surveyfreq data=year_all
nomcar;
strata strata;
cluster cluster;
weight wt_all;
table 
year*city_num /cl row column;
run;

PROC SQL;
    CREATE TABLE weighted_year_all AS
    SELECT regional_group, 
           year, 
		   region,
           SUM(w) AS weighted_sum
    FROM year_all
    GROUP BY regional_group, region, year;
QUIT;

proc surveyfreq data=weighted_year_all;
table 
city_num*year*weighted_sum /cl row column;
run;

/*Weighted ?, year_2? ???? period??*/
proc surveyfreq data=year_all
nomcar;
strata strata;
cluster cluster;
weight wt_all;
table
year_2*SEX
year_2*age
year_2*bmi_2
year_2*economic
year_2*study
year_2*edp
year_2*stress
year_2*smoking
year_2*depression
year_2*suicidalthinking
year_2*suicideattempts /cl row column;
run;

/*Step2. Table2*/
/*Overall (consumption)*/
data year_all_1;
set year_all;
run;

proc surveyfreq data=year_all_1 nomcar;
strata strata;
cluster year cluster;
weight wt_all;
by region;
table
year_2*alcoholic_consumption_bi /cl row column; where region=1;
run;

/*table2*/
/*con*/
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*ac/cl row column; where region=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*sex0_con/cl row column; where region=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*sex1_con/cl row column; where region=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*age0_con/cl row column; where region=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*age1_con/cl row column; where region=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*bmi_20_con/cl row column; where region=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*bmi_21_con/cl row column; where region=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*economic0_con/cl row column; where region=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*economic1_con/cl row column; where region=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*study0_con/cl row column; where region=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*study1_con/cl row column; where region=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*edp0_con/cl row column; where region=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*edp1_con/cl row column; where region=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*stress0_con/cl row column; where region=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*stress1_con/cl row column; where region=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*smoking0_con/cl row column; where region=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*smoking1_con/cl row column; where region=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*depression0_con/cl row column; where region=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*depression1_con/cl row column; where region=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*suicidalthinking0_con/cl row column; where region=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*suicidalthinking1_con/cl row column; where region=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*suicideattempts0_con/cl row column; where region=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*suicideattempts1_con/cl row column; where region=1; run;

proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*ac/cl row column; where region=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*sex0_con/cl row column; where region=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*sex1_con/cl row column; where region=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*age0_con/cl row column; where region=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*age1_con/cl row column; where region=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*bmi_20_con/cl row column; where region=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*bmi_21_con/cl row column; where region=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*economic0_con/cl row column; where region=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*economic1_con/cl row column; where region=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*study0_con/cl row column; where region=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*study1_con/cl row column; where region=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*edp0_con/cl row column; where region=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*edp1_con/cl row column; where region=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*stress0_con/cl row column; where region=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*stress1_con/cl row column; where region=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*smoking0_con/cl row column; where region=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*smoking1_con/cl row column; where region=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*depression0_con/cl row column; where region=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*depression1_con/cl row column; where region=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*suicidalthinking0_con/cl row column; where region=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*suicidalthinking1_con/cl row column; where region=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*suicideattempts0_con/cl row column; where region=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*suicideattempts1_con/cl row column; where region=2; run;



/*trial*/
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*at/cl row column; where region=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*sex0_try/cl row column; where region=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*sex1_try/cl row column; where region=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*age0_try/cl row column; where region=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*age1_try/cl row column; where region=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*bmi_20_try/cl row column; where region=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*bmi_21_try/cl row column; where region=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*economic0_try/cl row column; where region=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*economic1_try/cl row column; where region=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*study0_try/cl row column; where region=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*study1_try/cl row column; where region=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*edp0_try/cl row column; where region=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*edp1_try/cl row column; where region=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*stress0_try/cl row column; where region=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*stress1_try/cl row column; where region=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*smoking0_try/cl row column; where region=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*smoking1_try/cl row column; where region=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*depression0_try/cl row column; where region=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*depression1_try/cl row column; where region=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*suicidalthinking0_try/cl row column; where region=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*suicidalthinking1_try/cl row column; where region=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*suicideattempts0_try/cl row column; where region=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*suicideattempts1_try/cl row column; where region=1; run;

proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*at/cl row column; where region=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*sex0_try/cl row column; where region=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*sex1_try/cl row column; where region=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*age0_try/cl row column; where region=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*age1_try/cl row column; where region=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*bmi_20_try/cl row column; where region=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*bmi_21_try/cl row column; where region=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*economic0_try/cl row column; where region=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*economic1_try/cl row column; where region=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*study0_try/cl row column; where region=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*study1_try/cl row column; where region=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*edp0_try/cl row column; where region=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*edp1_try/cl row column; where region=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*stress0_try/cl row column; where region=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*stress1_try/cl row column; where region=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*smoking0_try/cl row column; where region=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*smoking1_try/cl row column; where region=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*depression0_try/cl row column; where region=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*depression1_try/cl row column; where region=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*suicidalthinking0_try/cl row column; where region=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*suicidalthinking1_try/cl row column; where region=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*suicideattempts0_try/cl row column; where region=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all; table  year_2*suicideattempts1_try/cl row column; where region=2; run;










proc surveyfreq data=year_all_1 nomcar;
strata strata;
cluster year cluster;
weight wt_all;
by year_2;
table 
region*alcoholic_try_bi /cl row column;
run;

data =y.year_all; set year_all; run;


/*pre-pandemic, pandemic period beta (urban)*/
data before_pan19 while_pan19;
set year_all;
if year_2 in (1 2 3 4) then output before_pan19;
if year_2 in (4 5 6 7) then output while_pan19;
run;

/*05~19 consumption beta (urban)*/
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL ac=year_2 / stb clparm ; where region=1; RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL sex0_con=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL sex1_con=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL age0_con=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL age1_con=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL bmi_20_con=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL bmi_21_con=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL economic0_con=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL economic1_con=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL study0_con=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL study1_con=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL edp0_con=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL edp1_con=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL stress0_con=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL stress1_con=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL smoking0_con=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL smoking1_con=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL depression0_con=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL depression1_con=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicidalthinking0_con=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicidalthinking1_con=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicideattempts0_con=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicideattempts1_con=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;

/*19~22 consumption beta (urban)*/
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL ac=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL sex0_con=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL sex1_con=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL age0_con=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL age1_con=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL bmi_20_con=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL bmi_21_con=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL economic0_con=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL economic1_con=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL study0_con=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL study1_con=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL edp0_con=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL edp1_con=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL stress0_con=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL stress1_con=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL smoking0_con=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL smoking1_con=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL depression0_con=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL depression1_con=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicidalthinking0_con=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicidalthinking1_con=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicideattempts0_con=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicideattempts1_con=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;

/*05~19 try beta (urban)*/
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL at=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL sex0_try=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL sex1_try=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL age0_try=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL age1_try=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL bmi_20_try=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL bmi_21_try=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL economic0_try=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL economic1_try=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL study0_try=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL study1_try=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL edp0_try=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL edp1_try=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL stress0_try=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL stress1_try=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL smoking0_try=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL smoking1_try=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL depression0_try=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL depression1_try=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicidalthinking0_try=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicidalthinking1_try=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicideattempts0_try=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicideattempts1_try=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;

/*19~22 try beta (urban)*/
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL at=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL sex0_try=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL sex1_try=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL age0_try=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL age1_try=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL bmi_20_try=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL bmi_21_try=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL economic0_try=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL economic1_try=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL study0_try=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL study1_try=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL edp0_try=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL edp1_try=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL stress0_try=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL stress1_try=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL smoking0_try=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL smoking1_try=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL depression0_try=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL depression1_try=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicidalthinking0_try=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicidalthinking1_try=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicideattempts0_try=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicideattempts1_try=year_2 / stb clparm ; where region=1;  RUN; ods graphics off;

/*05~19 consumption beta (rural)*/
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL ac=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL sex0_con=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL sex1_con=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL age0_con=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL age1_con=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL bmi_20_con=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL bmi_21_con=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL economic0_con=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL economic1_con=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL study0_con=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL study1_con=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL edp0_con=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL edp1_con=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL stress0_con=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL stress1_con=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL smoking0_con=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL smoking1_con=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL depression0_con=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL depression1_con=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicidalthinking0_con=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicidalthinking1_con=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicideattempts0_con=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicideattempts1_con=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;

/*19~22 consumption beta (rural)*/
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL ac=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL sex0_con=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL sex1_con=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL age0_con=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL age1_con=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL bmi_20_con=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL bmi_21_con=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL economic0_con=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL economic1_con=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL study0_con=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL study1_con=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL edp0_con=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL edp1_con=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL stress0_con=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL stress1_con=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL smoking0_con=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL smoking1_con=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL depression0_con=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL depression1_con=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicidalthinking0_con=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicidalthinking1_con=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicideattempts0_con=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicideattempts1_con=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;

/*05~19 try beta (rural)*/
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL at=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL sex0_try=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL sex1_try=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL age0_try=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL age1_try=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL bmi_20_try=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL bmi_21_try=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL economic0_try=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL economic1_try=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL study0_try=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL study1_try=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL edp0_try=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL edp1_try=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL stress0_try=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL stress1_try=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL smoking0_try=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL smoking1_try=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL depression0_try=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL depression1_try=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicidalthinking0_try=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicidalthinking1_try=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicideattempts0_try=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicideattempts1_try=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;

/*19~22 try beta (rural)*/
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL at=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL sex0_try=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL sex1_try=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL age0_try=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL age1_try=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL bmi_20_try=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL bmi_21_try=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL economic0_try=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL economic1_try=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL study0_try=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL study1_try=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL edp0_try=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL edp1_try=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL stress0_try=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL stress1_try=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL smoking0_try=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL smoking1_try=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL depression0_try=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL depression1_try=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicidalthinking0_try=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicidalthinking1_try=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicideattempts0_try=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicideattempts1_try=year_2 / stb clparm ; where region=2;  RUN; ods graphics off;






/*early, mid, late pandemic period OR (urban)*/
data early_pan mid_pan late_pan;
set year_all;
if year_2 in (4 5) then output early_pan;
if year_2 in (5 6) then output mid_pan;
if year_2 in (6 7) then output late_pan;
run;

/*calculating OR of consumption (urban)*/
PROC SURVEYLOGISTIC DATA=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class year_2 (ref='4') / param=ref; model ac = year_2;  where region=1; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='0') / param=ref; model ac (event='1')=sex_bi; where region=1; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='1') / param=ref; model ac (event='1')=sex_bi; where region=1; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='0') / param=ref; model ac (event='1')=age_bi; where region=1; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='1') / param=ref; model ac (event='1')=age_bi; where region=1; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='0') / param=ref; model ac (event='1')=bmi_2_bi; where region=1; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='1') / param=ref; model ac (event='1')=bmi_2_bi; where region=1; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='0') / param=ref; model ac (event='1')=economic_bi; where region=1; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='1') / param=ref; model ac (event='1')=economic_bi; where region=1; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='0') / param=ref; model ac (event='1')=study_bi; where region=1; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='1') / param=ref; model ac (event='1')=study_bi; where region=1; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='0') / param=ref; model ac (event='1')=edp_bi; where region=1; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='1') / param=ref; model ac (event='1')=edp_bi; where region=1; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='0') / param=ref; model ac (event='1')=stress_bi; where region=1; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='1') / param=ref; model ac (event='1')=stress_bi; where region=1; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='0') / param=ref; model ac (event='1')=smoking_bi; where region=1; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='1') / param=ref; model ac (event='1')=smoking_bi; where region=1; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='0') / param=ref; model ac (event='1')=depression_bi; where region=1; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='1') / param=ref; model ac (event='1')=depression_bi; where region=1; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='0') / param=ref; model ac (event='1')=suicidalthinking_bi; where region=1; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='1') / param=ref; model ac (event='1')=suicidalthinking_bi; where region=1; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='0') / param=ref; model ac (event='1')=suicideattempts_bi; where region=1; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='1') / param=ref; model ac (event='1')=suicideattempts_bi; where region=1; RUN;

PROC SURVEYLOGISTIC DATA=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class year_2 (ref='5') / param=ref; model ac = year_2;  where region=1; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='0') / param=ref; model ac (event='1')=sex_bi; where region=1; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='1') / param=ref; model ac (event='1')=sex_bi; where region=1; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='0') / param=ref; model ac (event='1')=age_bi; where region=1; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='1') / param=ref; model ac (event='1')=age_bi; where region=1; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='0') / param=ref; model ac (event='1')=bmi_2_bi; where region=1; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='1') / param=ref; model ac (event='1')=bmi_2_bi; where region=1; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='0') / param=ref; model ac (event='1')=economic_bi; where region=1; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='1') / param=ref; model ac (event='1')=economic_bi; where region=1; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='0') / param=ref; model ac (event='1')=study_bi; where region=1; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='1') / param=ref; model ac (event='1')=study_bi; where region=1; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='0') / param=ref; model ac (event='1')=edp_bi; where region=1; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='1') / param=ref; model ac (event='1')=edp_bi; where region=1; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='0') / param=ref; model ac (event='1')=stress_bi; where region=1; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='1') / param=ref; model ac (event='1')=stress_bi; where region=1; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='0') / param=ref; model ac (event='1')=smoking_bi; where region=1; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='1') / param=ref; model ac (event='1')=smoking_bi; where region=1; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='0') / param=ref; model ac (event='1')=depression_bi; where region=1; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='1') / param=ref; model ac (event='1')=depression_bi; where region=1; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='0') / param=ref; model ac (event='1')=suicidalthinking_bi; where region=1; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='1') / param=ref; model ac (event='1')=suicidalthinking_bi; where region=1; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='0') / param=ref; model ac (event='1')=suicideattempts_bi; where region=1; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='1') / param=ref; model ac (event='1')=suicideattempts_bi; where region=1; RUN;

PROC SURVEYLOGISTIC DATA=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class year_2 (ref='6') / param=ref; model ac = year_2;  where region=1; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='0') / param=ref; model ac (event='1')=sex_bi; where region=1; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='1') / param=ref; model ac (event='1')=sex_bi; where region=1; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='0') / param=ref; model ac (event='1')=age_bi; where region=1; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='1') / param=ref; model ac (event='1')=age_bi; where region=1; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='0') / param=ref; model ac (event='1')=bmi_2_bi; where region=1; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='1') / param=ref; model ac (event='1')=bmi_2_bi; where region=1; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='0') / param=ref; model ac (event='1')=economic_bi; where region=1; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='1') / param=ref; model ac (event='1')=economic_bi; where region=1; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='0') / param=ref; model ac (event='1')=study_bi; where region=1; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='1') / param=ref; model ac (event='1')=study_bi; where region=1; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='0') / param=ref; model ac (event='1')=edp_bi; where region=1; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='1') / param=ref; model ac (event='1')=edp_bi; where region=1; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='0') / param=ref; model ac (event='1')=stress_bi; where region=1; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='1') / param=ref; model ac (event='1')=stress_bi; where region=1; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='0') / param=ref; model ac (event='1')=smoking_bi; where region=1; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='1') / param=ref; model ac (event='1')=smoking_bi; where region=1; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='0') / param=ref; model ac (event='1')=depression_bi; where region=1; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='1') / param=ref; model ac (event='1')=depression_bi; where region=1; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='0') / param=ref; model ac (event='1')=suicidalthinking_bi; where region=1; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='1') / param=ref; model ac (event='1')=suicidalthinking_bi; where region=1; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='0') / param=ref; model ac (event='1')=suicideattempts_bi; where region=1; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='1') / param=ref; model ac (event='1')=suicideattempts_bi; where region=1; RUN;

/*calculating OR of try (urban)*/
PROC SURVEYLOGISTIC DATA=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class year_2 (ref='4') / param=ref; model at = year_2;  where region=1; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='0') / param=ref; model at (event='1')=sex_bi; where region=1; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='1') / param=ref; model at (event='1')=sex_bi; where region=1; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='0') / param=ref; model at (event='1')=age_bi; where region=1; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='1') / param=ref; model at (event='1')=age_bi; where region=1; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='0') / param=ref; model at (event='1')=bmi_2_bi; where region=1; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='1') / param=ref; model at (event='1')=bmi_2_bi; where region=1; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='0') / param=ref; model at (event='1')=economic_bi; where region=1; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='1') / param=ref; model at (event='1')=economic_bi; where region=1; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='0') / param=ref; model at (event='1')=study_bi; where region=1; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='1') / param=ref; model at (event='1')=study_bi; where region=1; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='0') / param=ref; model at (event='1')=edp_bi; where region=1; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='1') / param=ref; model at (event='1')=edp_bi; where region=1; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='0') / param=ref; model at (event='1')=stress_bi; where region=1; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='1') / param=ref; model at (event='1')=stress_bi; where region=1; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='0') / param=ref; model at (event='1')=smoking_bi; where region=1; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='1') / param=ref; model at (event='1')=smoking_bi; where region=1; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='0') / param=ref; model at (event='1')=depression_bi; where region=1; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='1') / param=ref; model at (event='1')=depression_bi; where region=1; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='0') / param=ref; model at (event='1')=suicidalthinking_bi; where region=1; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='1') / param=ref; model at (event='1')=suicidalthinking_bi; where region=1; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='0') / param=ref; model at (event='1')=suicideattempts_bi; where region=1; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='1') / param=ref; model at (event='1')=suicideattempts_bi; where region=1; RUN;

PROC SURVEYLOGISTIC DATA=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class year_2 (ref='5') / param=ref; model at = year_2;  where region=1; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='0') / param=ref; model at (event='1')=sex_bi; where region=1; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='1') / param=ref; model at (event='1')=sex_bi; where region=1; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='0') / param=ref; model at (event='1')=age_bi; where region=1; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='1') / param=ref; model at (event='1')=age_bi; where region=1; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='0') / param=ref; model at (event='1')=bmi_2_bi; where region=1; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='1') / param=ref; model at (event='1')=bmi_2_bi; where region=1; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='0') / param=ref; model at (event='1')=economic_bi; where region=1; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='1') / param=ref; model at (event='1')=economic_bi; where region=1; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='0') / param=ref; model at (event='1')=study_bi; where region=1; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='1') / param=ref; model at (event='1')=study_bi; where region=1; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='0') / param=ref; model at (event='1')=edp_bi; where region=1; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='1') / param=ref; model at (event='1')=edp_bi; where region=1; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='0') / param=ref; model at (event='1')=stress_bi; where region=1; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='1') / param=ref; model at (event='1')=stress_bi; where region=1; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='0') / param=ref; model at (event='1')=smoking_bi; where region=1; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='1') / param=ref; model at (event='1')=smoking_bi; where region=1; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='0') / param=ref; model at (event='1')=depression_bi; where region=1; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='1') / param=ref; model at (event='1')=depression_bi; where region=1; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='0') / param=ref; model at (event='1')=suicidalthinking_bi; where region=1; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='1') / param=ref; model at (event='1')=suicidalthinking_bi; where region=1; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='0') / param=ref; model at (event='1')=suicideattempts_bi; where region=1; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='1') / param=ref; model at (event='1')=suicideattempts_bi; where region=1; RUN;

PROC SURVEYLOGISTIC DATA=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class year_2 (ref='6') / param=ref; model at = year_2;  where region=1; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='0') / param=ref; model at (event='1')=sex_bi; where region=1; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='1') / param=ref; model at (event='1')=sex_bi; where region=1; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='0') / param=ref; model at (event='1')=age_bi; where region=1; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='1') / param=ref; model at (event='1')=age_bi; where region=1; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='0') / param=ref; model at (event='1')=bmi_2_bi; where region=1; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='1') / param=ref; model at (event='1')=bmi_2_bi; where region=1; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='0') / param=ref; model at (event='1')=economic_bi; where region=1; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='1') / param=ref; model at (event='1')=economic_bi; where region=1; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='0') / param=ref; model at (event='1')=study_bi; where region=1; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='1') / param=ref; model at (event='1')=study_bi; where region=1; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='0') / param=ref; model at (event='1')=edp_bi; where region=1; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='1') / param=ref; model at (event='1')=edp_bi; where region=1; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='0') / param=ref; model at (event='1')=stress_bi; where region=1; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='1') / param=ref; model at (event='1')=stress_bi; where region=1; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='0') / param=ref; model at (event='1')=smoking_bi; where region=1; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='1') / param=ref; model at (event='1')=smoking_bi; where region=1; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='0') / param=ref; model at (event='1')=depression_bi; where region=1; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='1') / param=ref; model at (event='1')=depression_bi; where region=1; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='0') / param=ref; model at (event='1')=suicidalthinking_bi; where region=1; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='1') / param=ref; model at (event='1')=suicidalthinking_bi; where region=1; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='0') / param=ref; model at (event='1')=suicideattempts_bi; where region=1; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='1') / param=ref; model at (event='1')=suicideattempts_bi; where region=1; RUN;

/*calculating OR of consumption (rural)*/
PROC SURVEYLOGISTIC DATA=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class year_2 (ref='4') / param=ref; model ac = year_2;  where region=2; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='0') / param=ref; model ac (event='1')=sex_bi; where region=2; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='1') / param=ref; model ac (event='1')=sex_bi; where region=2; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='0') / param=ref; model ac (event='1')=age_bi; where region=2; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='1') / param=ref; model ac (event='1')=age_bi; where region=2; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='0') / param=ref; model ac (event='1')=bmi_2_bi; where region=2; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='1') / param=ref; model ac (event='1')=bmi_2_bi; where region=2; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='0') / param=ref; model ac (event='1')=economic_bi; where region=2; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='1') / param=ref; model ac (event='1')=economic_bi; where region=2; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='0') / param=ref; model ac (event='1')=study_bi; where region=2; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='1') / param=ref; model ac (event='1')=study_bi; where region=2; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='0') / param=ref; model ac (event='1')=edp_bi; where region=2; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='1') / param=ref; model ac (event='1')=edp_bi; where region=2; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='0') / param=ref; model ac (event='1')=stress_bi; where region=2; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='1') / param=ref; model ac (event='1')=stress_bi; where region=2; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='0') / param=ref; model ac (event='1')=smoking_bi; where region=2; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='1') / param=ref; model ac (event='1')=smoking_bi; where region=2; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='0') / param=ref; model ac (event='1')=depression_bi; where region=2; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='1') / param=ref; model ac (event='1')=depression_bi; where region=2; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='0') / param=ref; model ac (event='1')=suicidalthinking_bi; where region=2; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='1') / param=ref; model ac (event='1')=suicidalthinking_bi; where region=2; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='0') / param=ref; model ac (event='1')=suicideattempts_bi; where region=2; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='1') / param=ref; model ac (event='1')=suicideattempts_bi; where region=2; RUN;

PROC SURVEYLOGISTIC DATA=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class year_2 (ref='5') / param=ref; model ac = year_2;  where region=2; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='0') / param=ref; model ac (event='1')=sex_bi; where region=2; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='1') / param=ref; model ac (event='1')=sex_bi; where region=2; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='0') / param=ref; model ac (event='1')=age_bi; where region=2; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='1') / param=ref; model ac (event='1')=age_bi; where region=2; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='0') / param=ref; model ac (event='1')=bmi_2_bi; where region=2; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='1') / param=ref; model ac (event='1')=bmi_2_bi; where region=2; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='0') / param=ref; model ac (event='1')=economic_bi; where region=2; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='1') / param=ref; model ac (event='1')=economic_bi; where region=2; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='0') / param=ref; model ac (event='1')=study_bi; where region=2; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='1') / param=ref; model ac (event='1')=study_bi; where region=2; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='0') / param=ref; model ac (event='1')=edp_bi; where region=2; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='1') / param=ref; model ac (event='1')=edp_bi; where region=2; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='0') / param=ref; model ac (event='1')=stress_bi; where region=2; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='1') / param=ref; model ac (event='1')=stress_bi; where region=2; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='0') / param=ref; model ac (event='1')=smoking_bi; where region=2; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='1') / param=ref; model ac (event='1')=smoking_bi; where region=2; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='0') / param=ref; model ac (event='1')=depression_bi; where region=2; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='1') / param=ref; model ac (event='1')=depression_bi; where region=2; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='0') / param=ref; model ac (event='1')=suicidalthinking_bi; where region=2; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='1') / param=ref; model ac (event='1')=suicidalthinking_bi; where region=2; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='0') / param=ref; model ac (event='1')=suicideattempts_bi; where region=2; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='1') / param=ref; model ac (event='1')=suicideattempts_bi; where region=2; RUN;

PROC SURVEYLOGISTIC DATA=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class year_2 (ref='6') / param=ref; model ac = year_2;  where region=2; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='0') / param=ref; model ac (event='1')=sex_bi; where region=2; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='1') / param=ref; model ac (event='1')=sex_bi; where region=2; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='0') / param=ref; model ac (event='1')=age_bi; where region=2; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='1') / param=ref; model ac (event='1')=age_bi; where region=2; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='0') / param=ref; model ac (event='1')=bmi_2_bi; where region=2; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='1') / param=ref; model ac (event='1')=bmi_2_bi; where region=2; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='0') / param=ref; model ac (event='1')=economic_bi; where region=2; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='1') / param=ref; model ac (event='1')=economic_bi; where region=2; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='0') / param=ref; model ac (event='1')=study_bi; where region=2; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='1') / param=ref; model ac (event='1')=study_bi; where region=2; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='0') / param=ref; model ac (event='1')=edp_bi; where region=2; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='1') / param=ref; model ac (event='1')=edp_bi; where region=2; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='0') / param=ref; model ac (event='1')=stress_bi; where region=2; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='1') / param=ref; model ac (event='1')=stress_bi; where region=2; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='0') / param=ref; model ac (event='1')=smoking_bi; where region=2; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='1') / param=ref; model ac (event='1')=smoking_bi; where region=2; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='0') / param=ref; model ac (event='1')=depression_bi; where region=2; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='1') / param=ref; model ac (event='1')=depression_bi; where region=2; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='0') / param=ref; model ac (event='1')=suicidalthinking_bi; where region=2; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='1') / param=ref; model ac (event='1')=suicidalthinking_bi; where region=2; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='0') / param=ref; model ac (event='1')=suicideattempts_bi; where region=2; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='1') / param=ref; model ac (event='1')=suicideattempts_bi; where region=2; RUN;

/*calculating OR of try (rural)*/
PROC SURVEYLOGISTIC DATA=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class year_2 (ref='4') / param=ref; model at = year_2;  where region=2; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='0') / param=ref; model at (event='1')=sex_bi; where region=2; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='1') / param=ref; model at (event='1')=sex_bi; where region=2; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='0') / param=ref; model at (event='1')=age_bi; where region=2; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='1') / param=ref; model at (event='1')=age_bi; where region=2; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='0') / param=ref; model at (event='1')=bmi_2_bi; where region=2; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='1') / param=ref; model at (event='1')=bmi_2_bi; where region=2; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='0') / param=ref; model at (event='1')=economic_bi; where region=2; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='1') / param=ref; model at (event='1')=economic_bi; where region=2; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='0') / param=ref; model at (event='1')=study_bi; where region=2; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='1') / param=ref; model at (event='1')=study_bi; where region=2; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='0') / param=ref; model at (event='1')=edp_bi; where region=2; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='1') / param=ref; model at (event='1')=edp_bi; where region=2; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='0') / param=ref; model at (event='1')=stress_bi; where region=2; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='1') / param=ref; model at (event='1')=stress_bi; where region=2; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='0') / param=ref; model at (event='1')=smoking_bi; where region=2; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='1') / param=ref; model at (event='1')=smoking_bi; where region=2; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='0') / param=ref; model at (event='1')=depression_bi; where region=2; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='1') / param=ref; model at (event='1')=depression_bi; where region=2; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='0') / param=ref; model at (event='1')=suicidalthinking_bi; where region=2; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='1') / param=ref; model at (event='1')=suicidalthinking_bi; where region=2; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='0') / param=ref; model at (event='1')=suicideattempts_bi; where region=2; RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='1') / param=ref; model at (event='1')=suicideattempts_bi; where region=2; RUN;

PROC SURVEYLOGISTIC DATA=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class year_2 (ref='5') / param=ref; model at = year_2;  where region=2; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='0') / param=ref; model at (event='1')=sex_bi; where region=2; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='1') / param=ref; model at (event='1')=sex_bi; where region=2; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='0') / param=ref; model at (event='1')=age_bi; where region=2; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='1') / param=ref; model at (event='1')=age_bi; where region=2; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='0') / param=ref; model at (event='1')=bmi_2_bi; where region=2; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='1') / param=ref; model at (event='1')=bmi_2_bi; where region=2; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='0') / param=ref; model at (event='1')=economic_bi; where region=2; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='1') / param=ref; model at (event='1')=economic_bi; where region=2; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='0') / param=ref; model at (event='1')=study_bi; where region=2; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='1') / param=ref; model at (event='1')=study_bi; where region=2; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='0') / param=ref; model at (event='1')=edp_bi; where region=2; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='1') / param=ref; model at (event='1')=edp_bi; where region=2; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='0') / param=ref; model at (event='1')=stress_bi; where region=2; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='1') / param=ref; model at (event='1')=stress_bi; where region=2; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='0') / param=ref; model at (event='1')=smoking_bi; where region=2; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='1') / param=ref; model at (event='1')=smoking_bi; where region=2; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='0') / param=ref; model at (event='1')=depression_bi; where region=2; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='1') / param=ref; model at (event='1')=depression_bi; where region=2; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='0') / param=ref; model at (event='1')=suicidalthinking_bi; where region=2; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='1') / param=ref; model at (event='1')=suicidalthinking_bi; where region=2; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='0') / param=ref; model at (event='1')=suicideattempts_bi; where region=2; RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='1') / param=ref; model at (event='1')=suicideattempts_bi; where region=2; RUN;

PROC SURVEYLOGISTIC DATA=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class year_2 (ref='6') / param=ref; model at = year_2;  where region=2; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='0') / param=ref; model at (event='1')=sex_bi; where region=2; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='1') / param=ref; model at (event='1')=sex_bi; where region=2; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='0') / param=ref; model at (event='1')=age_bi; where region=2; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='1') / param=ref; model at (event='1')=age_bi; where region=2; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='0') / param=ref; model at (event='1')=bmi_2_bi; where region=2; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='1') / param=ref; model at (event='1')=bmi_2_bi; where region=2; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='0') / param=ref; model at (event='1')=economic_bi; where region=2; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='1') / param=ref; model at (event='1')=economic_bi; where region=2; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='0') / param=ref; model at (event='1')=study_bi; where region=2; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='1') / param=ref; model at (event='1')=study_bi; where region=2; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='0') / param=ref; model at (event='1')=edp_bi; where region=2; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='1') / param=ref; model at (event='1')=edp_bi; where region=2; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='0') / param=ref; model at (event='1')=stress_bi; where region=2; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='1') / param=ref; model at (event='1')=stress_bi; where region=2; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='0') / param=ref; model at (event='1')=smoking_bi; where region=2; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='1') / param=ref; model at (event='1')=smoking_bi; where region=2; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='0') / param=ref; model at (event='1')=depression_bi; where region=2; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='1') / param=ref; model at (event='1')=depression_bi; where region=2; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='0') / param=ref; model at (event='1')=suicidalthinking_bi; where region=2; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='1') / param=ref; model at (event='1')=suicidalthinking_bi; where region=2; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='0') / param=ref; model at (event='1')=suicideattempts_bi; where region=2; RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='1') / param=ref; model at (event='1')=suicideattempts_bi; where region=2; RUN;


/*table4 risk factor, consumption*/
data overall before_pan19 while_pan19;
set year_all;
if year_2 in (1 2 3 4 5 6 7) then output overall;
if year_2 in (1 2 3 4) then output before_pan19;
if year_2 in (5 6 7) then output while_pan19;
run;

/*urban*/
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='0') / param=ref; model ac (event='1')=sex_bi; where region=1; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='1') / param=ref; model ac (event='1')=sex_bi; where region=1; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='0') / param=ref; model ac (event='1')=age_bi; where region=1; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='1') / param=ref; model ac (event='1')=age_bi; where region=1; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='0') / param=ref; model ac (event='1')=bmi_2_bi; where region=1; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='1') / param=ref; model ac (event='1')=bmi_2_bi; where region=1; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='0') / param=ref; model ac (event='1')=economic_bi; where region=1; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='1') / param=ref; model ac (event='1')=economic_bi; where region=1; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='0') / param=ref; model ac (event='1')=study_bi; where region=1; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='1') / param=ref; model ac (event='1')=study_bi; where region=1; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='0') / param=ref; model ac (event='1')=edp_bi; where region=1; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='1') / param=ref; model ac (event='1')=edp_bi; where region=1; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='0') / param=ref; model ac (event='1')=stress_bi; where region=1; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='1') / param=ref; model ac (event='1')=stress_bi; where region=1; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='0') / param=ref; model ac (event='1')=smoking_bi; where region=1; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='1') / param=ref; model ac (event='1')=smoking_bi; where region=1; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='0') / param=ref; model ac (event='1')=depression_bi; where region=1; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='1') / param=ref; model ac (event='1')=depression_bi; where region=1; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='0') / param=ref; model ac (event='1')=suicidalthinking_bi; where region=1; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='1') / param=ref; model ac (event='1')=suicidalthinking_bi; where region=1; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='0') / param=ref; model ac (event='1')=suicideattempts_bi; where region=1; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='1') / param=ref; model ac (event='1')=suicideattempts_bi; where region=1; run;

PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='0') / param=ref; model ac (event='1')=sex_bi; where region=1; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='1') / param=ref; model ac (event='1')=sex_bi; where region=1; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='0') / param=ref; model ac (event='1')=age_bi; where region=1; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='1') / param=ref; model ac (event='1')=age_bi; where region=1; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='0') / param=ref; model ac (event='1')=bmi_2_bi; where region=1; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='1') / param=ref; model ac (event='1')=bmi_2_bi; where region=1; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='0') / param=ref; model ac (event='1')=economic_bi; where region=1; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='1') / param=ref; model ac (event='1')=economic_bi; where region=1; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='0') / param=ref; model ac (event='1')=study_bi; where region=1; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='1') / param=ref; model ac (event='1')=study_bi; where region=1; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='0') / param=ref; model ac (event='1')=edp_bi; where region=1; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='1') / param=ref; model ac (event='1')=edp_bi; where region=1; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='0') / param=ref; model ac (event='1')=stress_bi; where region=1; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='1') / param=ref; model ac (event='1')=stress_bi; where region=1; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='0') / param=ref; model ac (event='1')=smoking_bi; where region=1; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='1') / param=ref; model ac (event='1')=smoking_bi; where region=1; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='0') / param=ref; model ac (event='1')=depression_bi; where region=1; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='1') / param=ref; model ac (event='1')=depression_bi; where region=1; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='0') / param=ref; model ac (event='1')=suicidalthinking_bi; where region=1; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='1') / param=ref; model ac (event='1')=suicidalthinking_bi; where region=1; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='0') / param=ref; model ac (event='1')=suicideattempts_bi; where region=1; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='1') / param=ref; model ac (event='1')=suicideattempts_bi; where region=1; run;

PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='0') / param=ref; model ac (event='1')=sex_bi; where region=1; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='1') / param=ref; model ac (event='1')=sex_bi; where region=1; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='0') / param=ref; model ac (event='1')=age_bi; where region=1; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='1') / param=ref; model ac (event='1')=age_bi; where region=1; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='0') / param=ref; model ac (event='1')=bmi_2_bi; where region=1; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='1') / param=ref; model ac (event='1')=bmi_2_bi; where region=1; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='0') / param=ref; model ac (event='1')=economic_bi; where region=1; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='1') / param=ref; model ac (event='1')=economic_bi; where region=1; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='0') / param=ref; model ac (event='1')=study_bi; where region=1; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='1') / param=ref; model ac (event='1')=study_bi; where region=1; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='0') / param=ref; model ac (event='1')=edp_bi; where region=1; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='1') / param=ref; model ac (event='1')=edp_bi; where region=1; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='0') / param=ref; model ac (event='1')=stress_bi; where region=1; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='1') / param=ref; model ac (event='1')=stress_bi; where region=1; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='0') / param=ref; model ac (event='1')=smoking_bi; where region=1; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='1') / param=ref; model ac (event='1')=smoking_bi; where region=1; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='0') / param=ref; model ac (event='1')=depression_bi; where region=1; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='1') / param=ref; model ac (event='1')=depression_bi; where region=1; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='0') / param=ref; model ac (event='1')=suicidalthinking_bi; where region=1; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='1') / param=ref; model ac (event='1')=suicidalthinking_bi; where region=1; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='0') / param=ref; model ac (event='1')=suicideattempts_bi; where region=1; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='1') / param=ref; model ac (event='1')=suicideattempts_bi; where region=1; run;

/*rural*/
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='0') / param=ref; model ac (event='1')=sex_bi; where region=2; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='1') / param=ref; model ac (event='1')=sex_bi; where region=2; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='0') / param=ref; model ac (event='1')=age_bi; where region=2; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='1') / param=ref; model ac (event='1')=age_bi; where region=2; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='0') / param=ref; model ac (event='1')=bmi_2_bi; where region=2; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='1') / param=ref; model ac (event='1')=bmi_2_bi; where region=2; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='0') / param=ref; model ac (event='1')=economic_bi; where region=2; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='1') / param=ref; model ac (event='1')=economic_bi; where region=2; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='0') / param=ref; model ac (event='1')=study_bi; where region=2; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='1') / param=ref; model ac (event='1')=study_bi; where region=2; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='0') / param=ref; model ac (event='1')=edp_bi; where region=2; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='1') / param=ref; model ac (event='1')=edp_bi; where region=2; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='0') / param=ref; model ac (event='1')=stress_bi; where region=2; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='1') / param=ref; model ac (event='1')=stress_bi; where region=2; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='0') / param=ref; model ac (event='1')=smoking_bi; where region=2; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='1') / param=ref; model ac (event='1')=smoking_bi; where region=2; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='0') / param=ref; model ac (event='1')=depression_bi; where region=2; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='1') / param=ref; model ac (event='1')=depression_bi; where region=2; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='0') / param=ref; model ac (event='1')=suicidalthinking_bi; where region=2; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='1') / param=ref; model ac (event='1')=suicidalthinking_bi; where region=2; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='0') / param=ref; model ac (event='1')=suicideattempts_bi; where region=2; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='1') / param=ref; model ac (event='1')=suicideattempts_bi; where region=2; run;

PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='0') / param=ref; model ac (event='1')=sex_bi; where region=2; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='1') / param=ref; model ac (event='1')=sex_bi; where region=2; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='0') / param=ref; model ac (event='1')=age_bi; where region=2; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='1') / param=ref; model ac (event='1')=age_bi; where region=2; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='0') / param=ref; model ac (event='1')=bmi_2_bi; where region=2; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='1') / param=ref; model ac (event='1')=bmi_2_bi; where region=2; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='0') / param=ref; model ac (event='1')=economic_bi; where region=2; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='1') / param=ref; model ac (event='1')=economic_bi; where region=2; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='0') / param=ref; model ac (event='1')=study_bi; where region=2; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='1') / param=ref; model ac (event='1')=study_bi; where region=2; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='0') / param=ref; model ac (event='1')=edp_bi; where region=2; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='1') / param=ref; model ac (event='1')=edp_bi; where region=2; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='0') / param=ref; model ac (event='1')=stress_bi; where region=2; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='1') / param=ref; model ac (event='1')=stress_bi; where region=2; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='0') / param=ref; model ac (event='1')=smoking_bi; where region=2; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='1') / param=ref; model ac (event='1')=smoking_bi; where region=2; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='0') / param=ref; model ac (event='1')=depression_bi; where region=2; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='1') / param=ref; model ac (event='1')=depression_bi; where region=2; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='0') / param=ref; model ac (event='1')=suicidalthinking_bi; where region=2; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='1') / param=ref; model ac (event='1')=suicidalthinking_bi; where region=2; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='0') / param=ref; model ac (event='1')=suicideattempts_bi; where region=2; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='1') / param=ref; model ac (event='1')=suicideattempts_bi; where region=2; run;

PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='0') / param=ref; model ac (event='1')=sex_bi; where region=2; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='1') / param=ref; model ac (event='1')=sex_bi; where region=2; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='0') / param=ref; model ac (event='1')=age_bi; where region=2; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='1') / param=ref; model ac (event='1')=age_bi; where region=2; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='0') / param=ref; model ac (event='1')=bmi_2_bi; where region=2; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='1') / param=ref; model ac (event='1')=bmi_2_bi; where region=2; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='0') / param=ref; model ac (event='1')=economic_bi; where region=2; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='1') / param=ref; model ac (event='1')=economic_bi; where region=2; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='0') / param=ref; model ac (event='1')=study_bi; where region=2; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='1') / param=ref; model ac (event='1')=study_bi; where region=2; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='0') / param=ref; model ac (event='1')=edp_bi; where region=2; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='1') / param=ref; model ac (event='1')=edp_bi; where region=2; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='0') / param=ref; model ac (event='1')=stress_bi; where region=2; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='1') / param=ref; model ac (event='1')=stress_bi; where region=2; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='0') / param=ref; model ac (event='1')=smoking_bi; where region=2; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='1') / param=ref; model ac (event='1')=smoking_bi; where region=2; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='0') / param=ref; model ac (event='1')=depression_bi; where region=2; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='1') / param=ref; model ac (event='1')=depression_bi; where region=2; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='0') / param=ref; model ac (event='1')=suicidalthinking_bi; where region=2; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='1') / param=ref; model ac (event='1')=suicidalthinking_bi; where region=2; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='0') / param=ref; model ac (event='1')=suicideattempts_bi; where region=2; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='1') / param=ref; model ac (event='1')=suicideattempts_bi; where region=2; run;













































/*regional analysis (8/12)*/

/*prevalence of consumption*/
/*Gyeonggi*/
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*ac/cl row column; where regional_group=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*sex0_con/cl row column; where regional_group=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*sex1_con/cl row column; where regional_group=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*age0_con/cl row column; where regional_group=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*age1_con/cl row column; where regional_group=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*bmi_20_con/cl row column; where regional_group=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*bmi_21_con/cl row column; where regional_group=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*economic0_con/cl row column; where regional_group=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*economic1_con/cl row column; where regional_group=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*study0_con/cl row column; where regional_group=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*study1_con/cl row column; where regional_group=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*edp0_con/cl row column; where regional_group=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*edp1_con/cl row column; where regional_group=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*stress0_con/cl row column; where regional_group=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*stress1_con/cl row column; where regional_group=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*smoking0_con/cl row column; where regional_group=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*smoking1_con/cl row column; where regional_group=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*depression0_con/cl row column; where regional_group=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*depression1_con/cl row column; where regional_group=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*suicidalthinking0_con/cl row column; where regional_group=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*suicidalthinking1_con/cl row column; where regional_group=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*suicideattempts0_con/cl row column; where regional_group=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*suicideattempts1_con/cl row column; where regional_group=1; run;

/*Gangwon*/
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*ac/cl row column; where regional_group=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*sex0_con/cl row column; where regional_group=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*sex1_con/cl row column; where regional_group=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*age0_con/cl row column; where regional_group=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*age1_con/cl row column; where regional_group=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*bmi_20_con/cl row column; where regional_group=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*bmi_21_con/cl row column; where regional_group=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*economic0_con/cl row column; where regional_group=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*economic1_con/cl row column; where regional_group=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*study0_con/cl row column; where regional_group=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*study1_con/cl row column; where regional_group=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*edp0_con/cl row column; where regional_group=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*edp1_con/cl row column; where regional_group=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*stress0_con/cl row column; where regional_group=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*stress1_con/cl row column; where regional_group=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*smoking0_con/cl row column; where regional_group=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*smoking1_con/cl row column; where regional_group=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*depression0_con/cl row column; where regional_group=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*depression1_con/cl row column; where regional_group=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*suicidalthinking0_con/cl row column; where regional_group=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*suicidalthinking1_con/cl row column; where regional_group=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*suicideattempts0_con/cl row column; where regional_group=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*suicideattempts1_con/cl row column; where regional_group=2; run;

/*Chungcheong*/
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*ac/cl row column; where regional_group=3; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*sex0_con/cl row column; where regional_group=3; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*sex1_con/cl row column; where regional_group=3; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*age0_con/cl row column; where regional_group=3; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*age1_con/cl row column; where regional_group=3; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*bmi_20_con/cl row column; where regional_group=3; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*bmi_21_con/cl row column; where regional_group=3; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*economic0_con/cl row column; where regional_group=3; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*economic1_con/cl row column; where regional_group=3; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*study0_con/cl row column; where regional_group=3; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*study1_con/cl row column; where regional_group=3; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*edp0_con/cl row column; where regional_group=3; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*edp1_con/cl row column; where regional_group=3; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*stress0_con/cl row column; where regional_group=3; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*stress1_con/cl row column; where regional_group=3; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*smoking0_con/cl row column; where regional_group=3; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*smoking1_con/cl row column; where regional_group=3; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*depression0_con/cl row column; where regional_group=3; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*depression1_con/cl row column; where regional_group=3; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*suicidalthinking0_con/cl row column; where regional_group=3; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*suicidalthinking1_con/cl row column; where regional_group=3; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*suicideattempts0_con/cl row column; where regional_group=3; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*suicideattempts1_con/cl row column; where regional_group=3; run;

/*Jeolla*/
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*ac/cl row column; where regional_group=4; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*sex0_con/cl row column; where regional_group=4; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*sex1_con/cl row column; where regional_group=4; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*age0_con/cl row column; where regional_group=4; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*age1_con/cl row column; where regional_group=4; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*bmi_20_con/cl row column; where regional_group=4; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*bmi_21_con/cl row column; where regional_group=4; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*economic0_con/cl row column; where regional_group=4; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*economic1_con/cl row column; where regional_group=4; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*study0_con/cl row column; where regional_group=4; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*study1_con/cl row column; where regional_group=4; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*edp0_con/cl row column; where regional_group=4; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*edp1_con/cl row column; where regional_group=4; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*stress0_con/cl row column; where regional_group=4; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*stress1_con/cl row column; where regional_group=4; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*smoking0_con/cl row column; where regional_group=4; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*smoking1_con/cl row column; where regional_group=4; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*depression0_con/cl row column; where regional_group=4; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*depression1_con/cl row column; where regional_group=4; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*suicidalthinking0_con/cl row column; where regional_group=4; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*suicidalthinking1_con/cl row column; where regional_group=4; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*suicideattempts0_con/cl row column; where regional_group=4; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*suicideattempts1_con/cl row column; where regional_group=4; run;

/*Gyeongsang*/
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*ac/cl row column; where regional_group=5; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*sex0_con/cl row column; where regional_group=5; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*sex1_con/cl row column; where regional_group=5; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*age0_con/cl row column; where regional_group=5; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*age1_con/cl row column; where regional_group=5; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*bmi_20_con/cl row column; where regional_group=5; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*bmi_21_con/cl row column; where regional_group=5; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*economic0_con/cl row column; where regional_group=5; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*economic1_con/cl row column; where regional_group=5; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*study0_con/cl row column; where regional_group=5; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*study1_con/cl row column; where regional_group=5; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*edp0_con/cl row column; where regional_group=5; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*edp1_con/cl row column; where regional_group=5; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*stress0_con/cl row column; where regional_group=5; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*stress1_con/cl row column; where regional_group=5; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*smoking0_con/cl row column; where regional_group=5; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*smoking1_con/cl row column; where regional_group=5; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*depression0_con/cl row column; where regional_group=5; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*depression1_con/cl row column; where regional_group=5; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*suicidalthinking0_con/cl row column; where regional_group=5; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*suicidalthinking1_con/cl row column; where regional_group=5; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*suicideattempts0_con/cl row column; where regional_group=5; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*suicideattempts1_con/cl row column; where regional_group=5; run;

/*prevalence of try*/
/*Gyeonggi*/
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*at/cl row column; where regional_group=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*sex0_try/cl row column; where regional_group=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*sex1_try/cl row column; where regional_group=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*age0_try/cl row column; where regional_group=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*age1_try/cl row column; where regional_group=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*bmi_20_try/cl row column; where regional_group=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*bmi_21_try/cl row column; where regional_group=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*economic0_try/cl row column; where regional_group=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*economic1_try/cl row column; where regional_group=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*study0_try/cl row column; where regional_group=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*study1_try/cl row column; where regional_group=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*edp0_try/cl row column; where regional_group=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*edp1_try/cl row column; where regional_group=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*stress0_try/cl row column; where regional_group=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*stress1_try/cl row column; where regional_group=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*smoking0_try/cl row column; where regional_group=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*smoking1_try/cl row column; where regional_group=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*depression0_try/cl row column; where regional_group=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*depression1_try/cl row column; where regional_group=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*suicidalthinking0_try/cl row column; where regional_group=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*suicidalthinking1_try/cl row column; where regional_group=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*suicideattempts0_try/cl row column; where regional_group=1; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*suicideattempts1_try/cl row column; where regional_group=1; run;

/*Gangwon*/
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*at/cl row column; where regional_group=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*sex0_try/cl row column; where regional_group=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*sex1_try/cl row column; where regional_group=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*age0_try/cl row column; where regional_group=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*age1_try/cl row column; where regional_group=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*bmi_20_try/cl row column; where regional_group=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*bmi_21_try/cl row column; where regional_group=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*economic0_try/cl row column; where regional_group=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*economic1_try/cl row column; where regional_group=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*study0_try/cl row column; where regional_group=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*study1_try/cl row column; where regional_group=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*edp0_try/cl row column; where regional_group=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*edp1_try/cl row column; where regional_group=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*stress0_try/cl row column; where regional_group=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*stress1_try/cl row column; where regional_group=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*smoking0_try/cl row column; where regional_group=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*smoking1_try/cl row column; where regional_group=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*depression0_try/cl row column; where regional_group=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*depression1_try/cl row column; where regional_group=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*suicidalthinking0_try/cl row column; where regional_group=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*suicidalthinking1_try/cl row column; where regional_group=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*suicideattempts0_try/cl row column; where regional_group=2; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*suicideattempts1_try/cl row column; where regional_group=2; run;

/*Chungcheong*/
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*at/cl row column; where regional_group=3; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*sex0_try/cl row column; where regional_group=3; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*sex1_try/cl row column; where regional_group=3; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*age0_try/cl row column; where regional_group=3; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*age1_try/cl row column; where regional_group=3; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*bmi_20_try/cl row column; where regional_group=3; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*bmi_21_try/cl row column; where regional_group=3; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*economic0_try/cl row column; where regional_group=3; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*economic1_try/cl row column; where regional_group=3; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*study0_try/cl row column; where regional_group=3; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*study1_try/cl row column; where regional_group=3; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*edp0_try/cl row column; where regional_group=3; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*edp1_try/cl row column; where regional_group=3; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*stress0_try/cl row column; where regional_group=3; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*stress1_try/cl row column; where regional_group=3; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*smoking0_try/cl row column; where regional_group=3; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*smoking1_try/cl row column; where regional_group=3; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*depression0_try/cl row column; where regional_group=3; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*depression1_try/cl row column; where regional_group=3; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*suicidalthinking0_try/cl row column; where regional_group=3; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*suicidalthinking1_try/cl row column; where regional_group=3; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*suicideattempts0_try/cl row column; where regional_group=3; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*suicideattempts1_try/cl row column; where regional_group=3; run;

/*Jeolla*/
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*at/cl row column; where regional_group=4; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*sex0_try/cl row column; where regional_group=4; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*sex1_try/cl row column; where regional_group=4; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*age0_try/cl row column; where regional_group=4; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*age1_try/cl row column; where regional_group=4; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*bmi_20_try/cl row column; where regional_group=4; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*bmi_21_try/cl row column; where regional_group=4; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*economic0_try/cl row column; where regional_group=4; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*economic1_try/cl row column; where regional_group=4; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*study0_try/cl row column; where regional_group=4; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*study1_try/cl row column; where regional_group=4; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*edp0_try/cl row column; where regional_group=4; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*edp1_try/cl row column; where regional_group=4; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*stress0_try/cl row column; where regional_group=4; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*stress1_try/cl row column; where regional_group=4; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*smoking0_try/cl row column; where regional_group=4; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*smoking1_try/cl row column; where regional_group=4; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*depression0_try/cl row column; where regional_group=4; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*depression1_try/cl row column; where regional_group=4; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*suicidalthinking0_try/cl row column; where regional_group=4; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*suicidalthinking1_try/cl row column; where regional_group=4; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*suicideattempts0_try/cl row column; where regional_group=4; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*suicideattempts1_try/cl row column; where regional_group=4; run;

/*Gyeongsang*/
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*at/cl row column; where regional_group=5; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*sex0_try/cl row column; where regional_group=5; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*sex1_try/cl row column; where regional_group=5; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*age0_try/cl row column; where regional_group=5; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*age1_try/cl row column; where regional_group=5; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*bmi_20_try/cl row column; where regional_group=5; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*bmi_21_try/cl row column; where regional_group=5; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*economic0_try/cl row column; where regional_group=5; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*economic1_try/cl row column; where regional_group=5; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*study0_try/cl row column; where regional_group=5; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*study1_try/cl row column; where regional_group=5; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*edp0_try/cl row column; where regional_group=5; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*edp1_try/cl row column; where regional_group=5; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*stress0_try/cl row column; where regional_group=5; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*stress1_try/cl row column; where regional_group=5; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*smoking0_try/cl row column; where regional_group=5; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*smoking1_try/cl row column; where regional_group=5; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*depression0_try/cl row column; where regional_group=5; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*depression1_try/cl row column; where regional_group=5; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*suicidalthinking0_try/cl row column; where regional_group=5; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*suicidalthinking1_try/cl row column; where regional_group=5; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*suicideattempts0_try/cl row column; where regional_group=5; run;
proc surveyfreq data=year_all nomcar; strata strata; cluster year cluster; weight wt_all;  table  year_2*suicideattempts1_try/cl row column; where regional_group=5; run;

























/*beta*/

data before_pan19 while_pan19;
set year_all;
if year_2 in (1 2 3 4) then output before_pan19;
if year_2 in (4 5 6 7) then output while_pan19;
run;

/*05~19 consumption beta (Gyeonggi)*/
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL ac=year_2 / stb clparm ; where regional_group=1; RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL sex0_con=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL sex1_con=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL age0_con=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL age1_con=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL bmi_20_con=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL bmi_21_con=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL economic0_con=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL economic1_con=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL study0_con=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL study1_con=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL edp0_con=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL edp1_con=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL stress0_con=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL stress1_con=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL smoking0_con=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL smoking1_con=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL depression0_con=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL depression1_con=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicidalthinking0_con=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicidalthinking1_con=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicideattempts0_con=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicideattempts1_con=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;

/*19~22 consumption beta (Gyeonggi)*/
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL ac=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL sex0_con=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL sex1_con=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL age0_con=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL age1_con=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL bmi_20_con=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL bmi_21_con=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL economic0_con=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL economic1_con=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL study0_con=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL study1_con=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL edp0_con=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL edp1_con=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL stress0_con=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL stress1_con=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL smoking0_con=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL smoking1_con=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL depression0_con=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL depression1_con=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicidalthinking0_con=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicidalthinking1_con=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicideattempts0_con=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicideattempts1_con=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;

/*05~19 try beta (Gyeonggi)*/
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL at=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL sex0_try=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL sex1_try=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL age0_try=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL age1_try=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL bmi_20_try=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL bmi_21_try=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL economic0_try=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL economic1_try=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL study0_try=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL study1_try=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL edp0_try=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL edp1_try=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL stress0_try=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL stress1_try=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL smoking0_try=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL smoking1_try=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL depression0_try=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL depression1_try=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicidalthinking0_try=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicidalthinking1_try=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicideattempts0_try=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicideattempts1_try=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;

/*19~22 try beta (Gyeonggi)*/
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL at=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL sex0_try=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL sex1_try=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL age0_try=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL age1_try=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL bmi_20_try=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL bmi_21_try=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL economic0_try=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL economic1_try=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL study0_try=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL study1_try=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL edp0_try=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL edp1_try=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL stress0_try=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL stress1_try=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL smoking0_try=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL smoking1_try=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL depression0_try=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL depression1_try=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicidalthinking0_try=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicidalthinking1_try=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicideattempts0_try=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicideattempts1_try=year_2 / stb clparm ; where regional_group=1;  RUN; ods graphics off;

/*05~19 consumption beta (Gangwon)*/
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL ac=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL sex0_con=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL sex1_con=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL age0_con=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL age1_con=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL bmi_20_con=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL bmi_21_con=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL economic0_con=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL economic1_con=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL study0_con=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL study1_con=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL edp0_con=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL edp1_con=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL stress0_con=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL stress1_con=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL smoking0_con=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL smoking1_con=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL depression0_con=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL depression1_con=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicidalthinking0_con=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicidalthinking1_con=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicideattempts0_con=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicideattempts1_con=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;

/*19~22 consumption beta (Gangwon)*/
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL ac=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL sex0_con=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL sex1_con=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL age0_con=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL age1_con=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL bmi_20_con=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL bmi_21_con=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL economic0_con=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL economic1_con=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL study0_con=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL study1_con=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL edp0_con=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL edp1_con=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL stress0_con=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL stress1_con=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL smoking0_con=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL smoking1_con=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL depression0_con=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL depression1_con=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicidalthinking0_con=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicidalthinking1_con=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicideattempts0_con=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicideattempts1_con=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;

/*05~19 try beta (Gangwon)*/
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL at=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL sex0_try=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL sex1_try=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL age0_try=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL age1_try=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL bmi_20_try=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL bmi_21_try=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL economic0_try=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL economic1_try=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL study0_try=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL study1_try=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL edp0_try=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL edp1_try=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL stress0_try=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL stress1_try=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL smoking0_try=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL smoking1_try=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL depression0_try=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL depression1_try=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicidalthinking0_try=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicidalthinking1_try=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicideattempts0_try=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicideattempts1_try=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;

/*19~22 try beta (Gangwon)*/
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL at=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL sex0_try=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL sex1_try=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL age0_try=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL age1_try=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL bmi_20_try=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL bmi_21_try=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL economic0_try=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL economic1_try=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL study0_try=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL study1_try=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL edp0_try=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL edp1_try=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL stress0_try=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL stress1_try=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL smoking0_try=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL smoking1_try=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL depression0_try=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL depression1_try=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicidalthinking0_try=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicidalthinking1_try=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicideattempts0_try=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicideattempts1_try=year_2 / stb clparm ; where regional_group=2;  RUN; ods graphics off;

/*05~19 consumption beta (Chungcheong)*/
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL ac=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL sex0_con=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL sex1_con=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL age0_con=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL age1_con=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL bmi_20_con=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL bmi_21_con=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL economic0_con=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL economic1_con=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL study0_con=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL study1_con=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL edp0_con=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL edp1_con=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL stress0_con=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL stress1_con=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL smoking0_con=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL smoking1_con=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL depression0_con=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL depression1_con=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicidalthinking0_con=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicidalthinking1_con=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicideattempts0_con=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicideattempts1_con=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;

/*19~22 consumption beta (Chungcheong)*/
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL ac=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL sex0_con=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL sex1_con=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL age0_con=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL age1_con=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL bmi_20_con=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL bmi_21_con=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL economic0_con=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL economic1_con=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL study0_con=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL study1_con=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL edp0_con=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL edp1_con=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL stress0_con=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL stress1_con=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL smoking0_con=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL smoking1_con=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL depression0_con=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL depression1_con=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicidalthinking0_con=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicidalthinking1_con=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicideattempts0_con=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicideattempts1_con=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;

/*05~19 try beta (Chungcheong)*/
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL at=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL sex0_try=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL sex1_try=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL age0_try=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL age1_try=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL bmi_20_try=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL bmi_21_try=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL economic0_try=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL economic1_try=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL study0_try=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL study1_try=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL edp0_try=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL edp1_try=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL stress0_try=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL stress1_try=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL smoking0_try=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL smoking1_try=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL depression0_try=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL depression1_try=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicidalthinking0_try=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicidalthinking1_try=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicideattempts0_try=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicideattempts1_try=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;

/*19~22 try beta (Chungcheong)*/
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL at=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL sex0_try=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL sex1_try=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL age0_try=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL age1_try=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL bmi_20_try=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL bmi_21_try=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL economic0_try=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL economic1_try=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL study0_try=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL study1_try=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL edp0_try=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL edp1_try=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL stress0_try=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL stress1_try=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL smoking0_try=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL smoking1_try=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL depression0_try=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL depression1_try=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicidalthinking0_try=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicidalthinking1_try=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicideattempts0_try=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicideattempts1_try=year_2 / stb clparm ; where regional_group=3;  RUN; ods graphics off;

/*05~19 consumption beta (Jeolla)*/
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL ac=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL sex0_con=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL sex1_con=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL age0_con=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL age1_con=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL bmi_20_con=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL bmi_21_con=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL economic0_con=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL economic1_con=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL study0_con=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL study1_con=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL edp0_con=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL edp1_con=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL stress0_con=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL stress1_con=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL smoking0_con=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL smoking1_con=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL depression0_con=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL depression1_con=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicidalthinking0_con=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicidalthinking1_con=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicideattempts0_con=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicideattempts1_con=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;

/*19~22 consumption beta (Jeolla)*/
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL ac=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL sex0_con=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL sex1_con=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL age0_con=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL age1_con=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL bmi_20_con=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL bmi_21_con=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL economic0_con=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL economic1_con=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL study0_con=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL study1_con=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL edp0_con=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL edp1_con=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL stress0_con=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL stress1_con=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL smoking0_con=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL smoking1_con=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL depression0_con=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL depression1_con=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicidalthinking0_con=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicidalthinking1_con=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicideattempts0_con=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicideattempts1_con=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;

/*05~19 try beta (Jeolla)*/
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL at=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL sex0_try=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL sex1_try=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL age0_try=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL age1_try=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL bmi_20_try=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL bmi_21_try=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL economic0_try=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL economic1_try=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL study0_try=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL study1_try=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL edp0_try=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL edp1_try=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL stress0_try=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL stress1_try=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL smoking0_try=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL smoking1_try=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL depression0_try=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL depression1_try=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicidalthinking0_try=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicidalthinking1_try=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicideattempts0_try=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicideattempts1_try=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;

/*19~22 try beta (Jeolla)*/
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL at=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL sex0_try=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL sex1_try=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL age0_try=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL age1_try=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL bmi_20_try=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL bmi_21_try=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL economic0_try=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL economic1_try=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL study0_try=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL study1_try=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL edp0_try=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL edp1_try=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL stress0_try=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL stress1_try=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL smoking0_try=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL smoking1_try=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL depression0_try=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL depression1_try=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicidalthinking0_try=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicidalthinking1_try=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicideattempts0_try=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicideattempts1_try=year_2 / stb clparm ; where regional_group=4;  RUN; ods graphics off;

/*05~19 consumption beta (Gyeongsang)*/
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL ac=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL sex0_con=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL sex1_con=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL age0_con=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL age1_con=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL bmi_20_con=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL bmi_21_con=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL economic0_con=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL economic1_con=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL study0_con=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL study1_con=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL edp0_con=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL edp1_con=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL stress0_con=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL stress1_con=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL smoking0_con=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL smoking1_con=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL depression0_con=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL depression1_con=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicidalthinking0_con=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicidalthinking1_con=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicideattempts0_con=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicideattempts1_con=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;

/*19~22 consumption beta (Gyeongsang)*/
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL ac=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL sex0_con=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL sex1_con=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL age0_con=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL age1_con=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL bmi_20_con=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL bmi_21_con=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL economic0_con=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL economic1_con=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL study0_con=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL study1_con=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL edp0_con=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL edp1_con=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL stress0_con=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL stress1_con=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL smoking0_con=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL smoking1_con=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL depression0_con=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL depression1_con=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicidalthinking0_con=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicidalthinking1_con=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicideattempts0_con=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicideattempts1_con=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;

/*05~19 try beta (Gyeongsang)*/
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL at=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL sex0_try=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL sex1_try=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL age0_try=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL age1_try=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL bmi_20_try=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL bmi_21_try=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL economic0_try=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL economic1_try=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL study0_try=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL study1_try=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL edp0_try=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL edp1_try=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL stress0_try=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL stress1_try=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL smoking0_try=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL smoking1_try=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL depression0_try=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL depression1_try=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicidalthinking0_try=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicidalthinking1_try=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicideattempts0_try=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicideattempts1_try=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;

/*19~22 try beta (Gyeongsang)*/
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL at=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL sex0_try=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL sex1_try=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL age0_try=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL age1_try=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL bmi_20_try=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL bmi_21_try=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL economic0_try=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL economic1_try=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL study0_try=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL study1_try=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL edp0_try=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL edp1_try=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL stress0_try=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL stress1_try=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL smoking0_try=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL smoking1_try=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL depression0_try=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL depression1_try=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicidalthinking0_try=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicidalthinking1_try=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicideattempts0_try=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicideattempts1_try=year_2 / stb clparm ; where regional_group=5;  RUN; ods graphics off;
























/*table4 risk factor, consumption*/
data overall before_pan19 while_pan19;
set year_all;
if year_2 in (1 2 3 4 5 6 7) then output overall;
if year_2 in (1 2 3 4) then output before_pan19;
if year_2 in (5 6 7) then output while_pan19;
run;
/*Gyeonggi consumption rOR*/
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='0') / param=ref; model ac (event='1')=sex_bi; where regional_group=1; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='1') / param=ref; model ac (event='1')=sex_bi; where regional_group=1; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='0') / param=ref; model ac (event='1')=age_bi; where regional_group=1; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='1') / param=ref; model ac (event='1')=age_bi; where regional_group=1; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='0') / param=ref; model ac (event='1')=bmi_2_bi; where regional_group=1; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='1') / param=ref; model ac (event='1')=bmi_2_bi; where regional_group=1; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='0') / param=ref; model ac (event='1')=economic_bi; where regional_group=1; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='1') / param=ref; model ac (event='1')=economic_bi; where regional_group=1; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='0') / param=ref; model ac (event='1')=study_bi; where regional_group=1; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='1') / param=ref; model ac (event='1')=study_bi; where regional_group=1; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='0') / param=ref; model ac (event='1')=edp_bi; where regional_group=1; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='1') / param=ref; model ac (event='1')=edp_bi; where regional_group=1; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='0') / param=ref; model ac (event='1')=stress_bi; where regional_group=1; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='1') / param=ref; model ac (event='1')=stress_bi; where regional_group=1; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='0') / param=ref; model ac (event='1')=smoking_bi; where regional_group=1; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='1') / param=ref; model ac (event='1')=smoking_bi; where regional_group=1; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='0') / param=ref; model ac (event='1')=depression_bi; where regional_group=1; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='1') / param=ref; model ac (event='1')=depression_bi; where regional_group=1; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='0') / param=ref; model ac (event='1')=suicidalthinking_bi; where regional_group=1; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='1') / param=ref; model ac (event='1')=suicidalthinking_bi; where regional_group=1; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='0') / param=ref; model ac (event='1')=suicideattempts_bi; where regional_group=1; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='1') / param=ref; model ac (event='1')=suicideattempts_bi; where regional_group=1; run;

PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='0') / param=ref; model ac (event='1')=sex_bi; where regional_group=1; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='1') / param=ref; model ac (event='1')=sex_bi; where regional_group=1; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='0') / param=ref; model ac (event='1')=age_bi; where regional_group=1; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='1') / param=ref; model ac (event='1')=age_bi; where regional_group=1; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='0') / param=ref; model ac (event='1')=bmi_2_bi; where regional_group=1; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='1') / param=ref; model ac (event='1')=bmi_2_bi; where regional_group=1; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='0') / param=ref; model ac (event='1')=economic_bi; where regional_group=1; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='1') / param=ref; model ac (event='1')=economic_bi; where regional_group=1; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='0') / param=ref; model ac (event='1')=study_bi; where regional_group=1; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='1') / param=ref; model ac (event='1')=study_bi; where regional_group=1; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='0') / param=ref; model ac (event='1')=edp_bi; where regional_group=1; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='1') / param=ref; model ac (event='1')=edp_bi; where regional_group=1; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='0') / param=ref; model ac (event='1')=stress_bi; where regional_group=1; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='1') / param=ref; model ac (event='1')=stress_bi; where regional_group=1; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='0') / param=ref; model ac (event='1')=smoking_bi; where regional_group=1; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='1') / param=ref; model ac (event='1')=smoking_bi; where regional_group=1; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='0') / param=ref; model ac (event='1')=depression_bi; where regional_group=1; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='1') / param=ref; model ac (event='1')=depression_bi; where regional_group=1; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='0') / param=ref; model ac (event='1')=suicidalthinking_bi; where regional_group=1; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='1') / param=ref; model ac (event='1')=suicidalthinking_bi; where regional_group=1; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='0') / param=ref; model ac (event='1')=suicideattempts_bi; where regional_group=1; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='1') / param=ref; model ac (event='1')=suicideattempts_bi; where regional_group=1; run;

PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='0') / param=ref; model ac (event='1')=sex_bi; where regional_group=1; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='1') / param=ref; model ac (event='1')=sex_bi; where regional_group=1; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='0') / param=ref; model ac (event='1')=age_bi; where regional_group=1; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='1') / param=ref; model ac (event='1')=age_bi; where regional_group=1; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='0') / param=ref; model ac (event='1')=bmi_2_bi; where regional_group=1; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='1') / param=ref; model ac (event='1')=bmi_2_bi; where regional_group=1; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='0') / param=ref; model ac (event='1')=economic_bi; where regional_group=1; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='1') / param=ref; model ac (event='1')=economic_bi; where regional_group=1; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='0') / param=ref; model ac (event='1')=study_bi; where regional_group=1; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='1') / param=ref; model ac (event='1')=study_bi; where regional_group=1; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='0') / param=ref; model ac (event='1')=edp_bi; where regional_group=1; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='1') / param=ref; model ac (event='1')=edp_bi; where regional_group=1; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='0') / param=ref; model ac (event='1')=stress_bi; where regional_group=1; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='1') / param=ref; model ac (event='1')=stress_bi; where regional_group=1; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='0') / param=ref; model ac (event='1')=smoking_bi; where regional_group=1; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='1') / param=ref; model ac (event='1')=smoking_bi; where regional_group=1; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='0') / param=ref; model ac (event='1')=depression_bi; where regional_group=1; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='1') / param=ref; model ac (event='1')=depression_bi; where regional_group=1; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='0') / param=ref; model ac (event='1')=suicidalthinking_bi; where regional_group=1; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='1') / param=ref; model ac (event='1')=suicidalthinking_bi; where regional_group=1; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='0') / param=ref; model ac (event='1')=suicideattempts_bi; where regional_group=1; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='1') / param=ref; model ac (event='1')=suicideattempts_bi; where regional_group=1; run;


/*Gangwon consumption rOR*/
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='0') / param=ref; model ac (event='1')=sex_bi; where regional_group=2; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='1') / param=ref; model ac (event='1')=sex_bi; where regional_group=2; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='0') / param=ref; model ac (event='1')=age_bi; where regional_group=2; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='1') / param=ref; model ac (event='1')=age_bi; where regional_group=2; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='0') / param=ref; model ac (event='1')=bmi_2_bi; where regional_group=2; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='1') / param=ref; model ac (event='1')=bmi_2_bi; where regional_group=2; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='0') / param=ref; model ac (event='1')=economic_bi; where regional_group=2; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='1') / param=ref; model ac (event='1')=economic_bi; where regional_group=2; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='0') / param=ref; model ac (event='1')=study_bi; where regional_group=2; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='1') / param=ref; model ac (event='1')=study_bi; where regional_group=2; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='0') / param=ref; model ac (event='1')=edp_bi; where regional_group=2; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='1') / param=ref; model ac (event='1')=edp_bi; where regional_group=2; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='0') / param=ref; model ac (event='1')=stress_bi; where regional_group=2; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='1') / param=ref; model ac (event='1')=stress_bi; where regional_group=2; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='0') / param=ref; model ac (event='1')=smoking_bi; where regional_group=2; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='1') / param=ref; model ac (event='1')=smoking_bi; where regional_group=2; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='0') / param=ref; model ac (event='1')=depression_bi; where regional_group=2; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='1') / param=ref; model ac (event='1')=depression_bi; where regional_group=2; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='0') / param=ref; model ac (event='1')=suicidalthinking_bi; where regional_group=2; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='1') / param=ref; model ac (event='1')=suicidalthinking_bi; where regional_group=2; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='0') / param=ref; model ac (event='1')=suicideattempts_bi; where regional_group=2; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='1') / param=ref; model ac (event='1')=suicideattempts_bi; where regional_group=2; run;

PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='0') / param=ref; model ac (event='1')=sex_bi; where regional_group=2; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='1') / param=ref; model ac (event='1')=sex_bi; where regional_group=2; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='0') / param=ref; model ac (event='1')=age_bi; where regional_group=2; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='1') / param=ref; model ac (event='1')=age_bi; where regional_group=2; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='0') / param=ref; model ac (event='1')=bmi_2_bi; where regional_group=2; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='1') / param=ref; model ac (event='1')=bmi_2_bi; where regional_group=2; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='0') / param=ref; model ac (event='1')=economic_bi; where regional_group=2; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='1') / param=ref; model ac (event='1')=economic_bi; where regional_group=2; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='0') / param=ref; model ac (event='1')=study_bi; where regional_group=2; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='1') / param=ref; model ac (event='1')=study_bi; where regional_group=2; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='0') / param=ref; model ac (event='1')=edp_bi; where regional_group=2; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='1') / param=ref; model ac (event='1')=edp_bi; where regional_group=2; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='0') / param=ref; model ac (event='1')=stress_bi; where regional_group=2; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='1') / param=ref; model ac (event='1')=stress_bi; where regional_group=2; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='0') / param=ref; model ac (event='1')=smoking_bi; where regional_group=2; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='1') / param=ref; model ac (event='1')=smoking_bi; where regional_group=2; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='0') / param=ref; model ac (event='1')=depression_bi; where regional_group=2; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='1') / param=ref; model ac (event='1')=depression_bi; where regional_group=2; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='0') / param=ref; model ac (event='1')=suicidalthinking_bi; where regional_group=2; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='1') / param=ref; model ac (event='1')=suicidalthinking_bi; where regional_group=2; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='0') / param=ref; model ac (event='1')=suicideattempts_bi; where regional_group=2; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='1') / param=ref; model ac (event='1')=suicideattempts_bi; where regional_group=2; run;

PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='0') / param=ref; model ac (event='1')=sex_bi; where regional_group=2; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='1') / param=ref; model ac (event='1')=sex_bi; where regional_group=2; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='0') / param=ref; model ac (event='1')=age_bi; where regional_group=2; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='1') / param=ref; model ac (event='1')=age_bi; where regional_group=2; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='0') / param=ref; model ac (event='1')=bmi_2_bi; where regional_group=2; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='1') / param=ref; model ac (event='1')=bmi_2_bi; where regional_group=2; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='0') / param=ref; model ac (event='1')=economic_bi; where regional_group=2; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='1') / param=ref; model ac (event='1')=economic_bi; where regional_group=2; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='0') / param=ref; model ac (event='1')=study_bi; where regional_group=2; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='1') / param=ref; model ac (event='1')=study_bi; where regional_group=2; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='0') / param=ref; model ac (event='1')=edp_bi; where regional_group=2; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='1') / param=ref; model ac (event='1')=edp_bi; where regional_group=2; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='0') / param=ref; model ac (event='1')=stress_bi; where regional_group=2; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='1') / param=ref; model ac (event='1')=stress_bi; where regional_group=2; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='0') / param=ref; model ac (event='1')=smoking_bi; where regional_group=2; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='1') / param=ref; model ac (event='1')=smoking_bi; where regional_group=2; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='0') / param=ref; model ac (event='1')=depression_bi; where regional_group=2; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='1') / param=ref; model ac (event='1')=depression_bi; where regional_group=2; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='0') / param=ref; model ac (event='1')=suicidalthinking_bi; where regional_group=2; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='1') / param=ref; model ac (event='1')=suicidalthinking_bi; where regional_group=2; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='0') / param=ref; model ac (event='1')=suicideattempts_bi; where regional_group=2; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='1') / param=ref; model ac (event='1')=suicideattempts_bi; where regional_group=2; run;

/*Chuncheong consumption rOR*/
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='0') / param=ref; model ac (event='1')=sex_bi; where regional_group=3; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='1') / param=ref; model ac (event='1')=sex_bi; where regional_group=3; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='0') / param=ref; model ac (event='1')=age_bi; where regional_group=3; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='1') / param=ref; model ac (event='1')=age_bi; where regional_group=3; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='0') / param=ref; model ac (event='1')=bmi_2_bi; where regional_group=3; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='1') / param=ref; model ac (event='1')=bmi_2_bi; where regional_group=3; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='0') / param=ref; model ac (event='1')=economic_bi; where regional_group=3; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='1') / param=ref; model ac (event='1')=economic_bi; where regional_group=3; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='0') / param=ref; model ac (event='1')=study_bi; where regional_group=3; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='1') / param=ref; model ac (event='1')=study_bi; where regional_group=3; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='0') / param=ref; model ac (event='1')=edp_bi; where regional_group=3; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='1') / param=ref; model ac (event='1')=edp_bi; where regional_group=3; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='0') / param=ref; model ac (event='1')=stress_bi; where regional_group=3; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='1') / param=ref; model ac (event='1')=stress_bi; where regional_group=3; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='0') / param=ref; model ac (event='1')=smoking_bi; where regional_group=3; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='1') / param=ref; model ac (event='1')=smoking_bi; where regional_group=3; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='0') / param=ref; model ac (event='1')=depression_bi; where regional_group=3; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='1') / param=ref; model ac (event='1')=depression_bi; where regional_group=3; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='0') / param=ref; model ac (event='1')=suicidalthinking_bi; where regional_group=3; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='1') / param=ref; model ac (event='1')=suicidalthinking_bi; where regional_group=3; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='0') / param=ref; model ac (event='1')=suicideattempts_bi; where regional_group=3; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='1') / param=ref; model ac (event='1')=suicideattempts_bi; where regional_group=3; run;

PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='0') / param=ref; model ac (event='1')=sex_bi; where regional_group=3; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='1') / param=ref; model ac (event='1')=sex_bi; where regional_group=3; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='0') / param=ref; model ac (event='1')=age_bi; where regional_group=3; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='1') / param=ref; model ac (event='1')=age_bi; where regional_group=3; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='0') / param=ref; model ac (event='1')=bmi_2_bi; where regional_group=3; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='1') / param=ref; model ac (event='1')=bmi_2_bi; where regional_group=3; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='0') / param=ref; model ac (event='1')=economic_bi; where regional_group=3; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='1') / param=ref; model ac (event='1')=economic_bi; where regional_group=3; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='0') / param=ref; model ac (event='1')=study_bi; where regional_group=3; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='1') / param=ref; model ac (event='1')=study_bi; where regional_group=3; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='0') / param=ref; model ac (event='1')=edp_bi; where regional_group=3; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='1') / param=ref; model ac (event='1')=edp_bi; where regional_group=3; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='0') / param=ref; model ac (event='1')=stress_bi; where regional_group=3; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='1') / param=ref; model ac (event='1')=stress_bi; where regional_group=3; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='0') / param=ref; model ac (event='1')=smoking_bi; where regional_group=3; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='1') / param=ref; model ac (event='1')=smoking_bi; where regional_group=3; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='0') / param=ref; model ac (event='1')=depression_bi; where regional_group=3; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='1') / param=ref; model ac (event='1')=depression_bi; where regional_group=3; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='0') / param=ref; model ac (event='1')=suicidalthinking_bi; where regional_group=3; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='1') / param=ref; model ac (event='1')=suicidalthinking_bi; where regional_group=3; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='0') / param=ref; model ac (event='1')=suicideattempts_bi; where regional_group=3; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='1') / param=ref; model ac (event='1')=suicideattempts_bi; where regional_group=3; run;

PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='0') / param=ref; model ac (event='1')=sex_bi; where regional_group=3; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='1') / param=ref; model ac (event='1')=sex_bi; where regional_group=3; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='0') / param=ref; model ac (event='1')=age_bi; where regional_group=3; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='1') / param=ref; model ac (event='1')=age_bi; where regional_group=3; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='0') / param=ref; model ac (event='1')=bmi_2_bi; where regional_group=3; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='1') / param=ref; model ac (event='1')=bmi_2_bi; where regional_group=3; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='0') / param=ref; model ac (event='1')=economic_bi; where regional_group=3; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='1') / param=ref; model ac (event='1')=economic_bi; where regional_group=3; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='0') / param=ref; model ac (event='1')=study_bi; where regional_group=3; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='1') / param=ref; model ac (event='1')=study_bi; where regional_group=3; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='0') / param=ref; model ac (event='1')=edp_bi; where regional_group=3; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='1') / param=ref; model ac (event='1')=edp_bi; where regional_group=3; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='0') / param=ref; model ac (event='1')=stress_bi; where regional_group=3; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='1') / param=ref; model ac (event='1')=stress_bi; where regional_group=3; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='0') / param=ref; model ac (event='1')=smoking_bi; where regional_group=3; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='1') / param=ref; model ac (event='1')=smoking_bi; where regional_group=3; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='0') / param=ref; model ac (event='1')=depression_bi; where regional_group=3; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='1') / param=ref; model ac (event='1')=depression_bi; where regional_group=3; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='0') / param=ref; model ac (event='1')=suicidalthinking_bi; where regional_group=3; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='1') / param=ref; model ac (event='1')=suicidalthinking_bi; where regional_group=3; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='0') / param=ref; model ac (event='1')=suicideattempts_bi; where regional_group=3; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='1') / param=ref; model ac (event='1')=suicideattempts_bi; where regional_group=3; run;

/*Jeolla consumption rOR*/
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='0') / param=ref; model ac (event='1')=sex_bi; where regional_group=4; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='1') / param=ref; model ac (event='1')=sex_bi; where regional_group=4; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='0') / param=ref; model ac (event='1')=age_bi; where regional_group=4; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='1') / param=ref; model ac (event='1')=age_bi; where regional_group=4; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='0') / param=ref; model ac (event='1')=bmi_2_bi; where regional_group=4; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='1') / param=ref; model ac (event='1')=bmi_2_bi; where regional_group=4; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='0') / param=ref; model ac (event='1')=economic_bi; where regional_group=4; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='1') / param=ref; model ac (event='1')=economic_bi; where regional_group=4; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='0') / param=ref; model ac (event='1')=study_bi; where regional_group=4; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='1') / param=ref; model ac (event='1')=study_bi; where regional_group=4; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='0') / param=ref; model ac (event='1')=edp_bi; where regional_group=4; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='1') / param=ref; model ac (event='1')=edp_bi; where regional_group=4; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='0') / param=ref; model ac (event='1')=stress_bi; where regional_group=4; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='1') / param=ref; model ac (event='1')=stress_bi; where regional_group=4; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='0') / param=ref; model ac (event='1')=smoking_bi; where regional_group=4; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='1') / param=ref; model ac (event='1')=smoking_bi; where regional_group=4; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='0') / param=ref; model ac (event='1')=depression_bi; where regional_group=4; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='1') / param=ref; model ac (event='1')=depression_bi; where regional_group=4; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='0') / param=ref; model ac (event='1')=suicidalthinking_bi; where regional_group=4; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='1') / param=ref; model ac (event='1')=suicidalthinking_bi; where regional_group=4; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='0') / param=ref; model ac (event='1')=suicideattempts_bi; where regional_group=4; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='1') / param=ref; model ac (event='1')=suicideattempts_bi; where regional_group=4; run;

PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='0') / param=ref; model ac (event='1')=sex_bi; where regional_group=4; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='1') / param=ref; model ac (event='1')=sex_bi; where regional_group=4; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='0') / param=ref; model ac (event='1')=age_bi; where regional_group=4; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='1') / param=ref; model ac (event='1')=age_bi; where regional_group=4; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='0') / param=ref; model ac (event='1')=bmi_2_bi; where regional_group=4; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='1') / param=ref; model ac (event='1')=bmi_2_bi; where regional_group=4; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='0') / param=ref; model ac (event='1')=economic_bi; where regional_group=4; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='1') / param=ref; model ac (event='1')=economic_bi; where regional_group=4; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='0') / param=ref; model ac (event='1')=study_bi; where regional_group=4; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='1') / param=ref; model ac (event='1')=study_bi; where regional_group=4; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='0') / param=ref; model ac (event='1')=edp_bi; where regional_group=4; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='1') / param=ref; model ac (event='1')=edp_bi; where regional_group=4; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='0') / param=ref; model ac (event='1')=stress_bi; where regional_group=4; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='1') / param=ref; model ac (event='1')=stress_bi; where regional_group=4; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='0') / param=ref; model ac (event='1')=smoking_bi; where regional_group=4; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='1') / param=ref; model ac (event='1')=smoking_bi; where regional_group=4; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='0') / param=ref; model ac (event='1')=depression_bi; where regional_group=4; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='1') / param=ref; model ac (event='1')=depression_bi; where regional_group=4; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='0') / param=ref; model ac (event='1')=suicidalthinking_bi; where regional_group=4; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='1') / param=ref; model ac (event='1')=suicidalthinking_bi; where regional_group=4; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='0') / param=ref; model ac (event='1')=suicideattempts_bi; where regional_group=4; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='1') / param=ref; model ac (event='1')=suicideattempts_bi; where regional_group=4; run;

PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='0') / param=ref; model ac (event='1')=sex_bi; where regional_group=4; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='1') / param=ref; model ac (event='1')=sex_bi; where regional_group=4; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='0') / param=ref; model ac (event='1')=age_bi; where regional_group=4; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='1') / param=ref; model ac (event='1')=age_bi; where regional_group=4; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='0') / param=ref; model ac (event='1')=bmi_2_bi; where regional_group=4; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='1') / param=ref; model ac (event='1')=bmi_2_bi; where regional_group=4; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='0') / param=ref; model ac (event='1')=economic_bi; where regional_group=4; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='1') / param=ref; model ac (event='1')=economic_bi; where regional_group=4; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='0') / param=ref; model ac (event='1')=study_bi; where regional_group=4; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='1') / param=ref; model ac (event='1')=study_bi; where regional_group=4; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='0') / param=ref; model ac (event='1')=edp_bi; where regional_group=4; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='1') / param=ref; model ac (event='1')=edp_bi; where regional_group=4; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='0') / param=ref; model ac (event='1')=stress_bi; where regional_group=4; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='1') / param=ref; model ac (event='1')=stress_bi; where regional_group=4; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='0') / param=ref; model ac (event='1')=smoking_bi; where regional_group=4; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='1') / param=ref; model ac (event='1')=smoking_bi; where regional_group=4; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='0') / param=ref; model ac (event='1')=depression_bi; where regional_group=4; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='1') / param=ref; model ac (event='1')=depression_bi; where regional_group=4; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='0') / param=ref; model ac (event='1')=suicidalthinking_bi; where regional_group=4; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='1') / param=ref; model ac (event='1')=suicidalthinking_bi; where regional_group=4; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='0') / param=ref; model ac (event='1')=suicideattempts_bi; where regional_group=4; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='1') / param=ref; model ac (event='1')=suicideattempts_bi; where regional_group=4; run;

/*Gyeongsang consumption rOR*/
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='0') / param=ref; model ac (event='1')=sex_bi; where regional_group=5; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='1') / param=ref; model ac (event='1')=sex_bi; where regional_group=5; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='0') / param=ref; model ac (event='1')=age_bi; where regional_group=5; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='1') / param=ref; model ac (event='1')=age_bi; where regional_group=5; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='0') / param=ref; model ac (event='1')=bmi_2_bi; where regional_group=5; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='1') / param=ref; model ac (event='1')=bmi_2_bi; where regional_group=5; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='0') / param=ref; model ac (event='1')=economic_bi; where regional_group=5; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='1') / param=ref; model ac (event='1')=economic_bi; where regional_group=5; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='0') / param=ref; model ac (event='1')=study_bi; where regional_group=5; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='1') / param=ref; model ac (event='1')=study_bi; where regional_group=5; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='0') / param=ref; model ac (event='1')=edp_bi; where regional_group=5; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='1') / param=ref; model ac (event='1')=edp_bi; where regional_group=5; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='0') / param=ref; model ac (event='1')=stress_bi; where regional_group=5; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='1') / param=ref; model ac (event='1')=stress_bi; where regional_group=5; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='0') / param=ref; model ac (event='1')=smoking_bi; where regional_group=5; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='1') / param=ref; model ac (event='1')=smoking_bi; where regional_group=5; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='0') / param=ref; model ac (event='1')=depression_bi; where regional_group=5; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='1') / param=ref; model ac (event='1')=depression_bi; where regional_group=5; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='0') / param=ref; model ac (event='1')=suicidalthinking_bi; where regional_group=5; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='1') / param=ref; model ac (event='1')=suicidalthinking_bi; where regional_group=5; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='0') / param=ref; model ac (event='1')=suicideattempts_bi; where regional_group=5; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='1') / param=ref; model ac (event='1')=suicideattempts_bi; where regional_group=5; run;

PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='0') / param=ref; model ac (event='1')=sex_bi; where regional_group=5; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='1') / param=ref; model ac (event='1')=sex_bi; where regional_group=5; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='0') / param=ref; model ac (event='1')=age_bi; where regional_group=5; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='1') / param=ref; model ac (event='1')=age_bi; where regional_group=5; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='0') / param=ref; model ac (event='1')=bmi_2_bi; where regional_group=5; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='1') / param=ref; model ac (event='1')=bmi_2_bi; where regional_group=5; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='0') / param=ref; model ac (event='1')=economic_bi; where regional_group=5; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='1') / param=ref; model ac (event='1')=economic_bi; where regional_group=5; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='0') / param=ref; model ac (event='1')=study_bi; where regional_group=5; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='1') / param=ref; model ac (event='1')=study_bi; where regional_group=5; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='0') / param=ref; model ac (event='1')=edp_bi; where regional_group=5; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='1') / param=ref; model ac (event='1')=edp_bi; where regional_group=5; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='0') / param=ref; model ac (event='1')=stress_bi; where regional_group=5; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='1') / param=ref; model ac (event='1')=stress_bi; where regional_group=5; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='0') / param=ref; model ac (event='1')=smoking_bi; where regional_group=5; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='1') / param=ref; model ac (event='1')=smoking_bi; where regional_group=5; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='0') / param=ref; model ac (event='1')=depression_bi; where regional_group=5; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='1') / param=ref; model ac (event='1')=depression_bi; where regional_group=5; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='0') / param=ref; model ac (event='1')=suicidalthinking_bi; where regional_group=5; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='1') / param=ref; model ac (event='1')=suicidalthinking_bi; where regional_group=5; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='0') / param=ref; model ac (event='1')=suicideattempts_bi; where regional_group=5; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='1') / param=ref; model ac (event='1')=suicideattempts_bi; where regional_group=5; run;

PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='0') / param=ref; model ac (event='1')=sex_bi; where regional_group=5; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='1') / param=ref; model ac (event='1')=sex_bi; where regional_group=5; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='0') / param=ref; model ac (event='1')=age_bi; where regional_group=5; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='1') / param=ref; model ac (event='1')=age_bi; where regional_group=5; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='0') / param=ref; model ac (event='1')=bmi_2_bi; where regional_group=5; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='1') / param=ref; model ac (event='1')=bmi_2_bi; where regional_group=5; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='0') / param=ref; model ac (event='1')=economic_bi; where regional_group=5; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='1') / param=ref; model ac (event='1')=economic_bi; where regional_group=5; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='0') / param=ref; model ac (event='1')=study_bi; where regional_group=5; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='1') / param=ref; model ac (event='1')=study_bi; where regional_group=5; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='0') / param=ref; model ac (event='1')=edp_bi; where regional_group=5; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='1') / param=ref; model ac (event='1')=edp_bi; where regional_group=5; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='0') / param=ref; model ac (event='1')=stress_bi; where regional_group=5; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='1') / param=ref; model ac (event='1')=stress_bi; where regional_group=5; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='0') / param=ref; model ac (event='1')=smoking_bi; where regional_group=5; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='1') / param=ref; model ac (event='1')=smoking_bi; where regional_group=5; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='0') / param=ref; model ac (event='1')=depression_bi; where regional_group=5; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='1') / param=ref; model ac (event='1')=depression_bi; where regional_group=5; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='0') / param=ref; model ac (event='1')=suicidalthinking_bi; where regional_group=5; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='1') / param=ref; model ac (event='1')=suicidalthinking_bi; where regional_group=5; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='0') / param=ref; model ac (event='1')=suicideattempts_bi; where regional_group=5; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='1') / param=ref; model ac (event='1')=suicideattempts_bi; where regional_group=5; run;
