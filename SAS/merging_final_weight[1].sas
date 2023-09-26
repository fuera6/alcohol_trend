/*libname Y "C:\Users\user\Documents\My SAS Files";*/
libname Y "C:\Users\user\Documents\My SAS Files";
run;

data Y.year_all;
set Y.before_pan19 Y.while_pan19; 
run;

data year_all;
set Y.year_all;
run;

data pop_all;
set Y.pop_all;
run;

/*grade를 학력으로  명목화 시켜주기 중1,2,3,은1로 하고 고1,2,3은 2로해주기
data new_all_2;
set new_all_2;
if grade in (1 2 3) then ed=1;
else if grade in (4 5 6) then ed=2;
run; */


*2005-2008 2009-2012 2013-2016 2017-2019, 2020, 2021 2022;
data year_all; set year_all;
if  2005<= year <2009 then year_2=1;
else if 2009<= year <2013 then year_2=2;
else if 2013<= year <2017 then year_2=3;
else if 2017<= year <2020 then year_2=4;
else if year=2020 then year_2=5;
else if year=2021 then year_2=6;
else if year=2022 then year_2=7;
run;

/*region groups (Gyeonggi=1, Gangwon=2, Chungcheong=3, Jeonla=4, Gyeongsang=5)*/
data year_all; set year_all;
if  city_num in (1 4 9) then regional_group=1;
else if city_num in (10) then regional_group=2;
else if city_num in (6 8 11 12) then regional_group=3;
else if city_num in (5 13 14) then regional_group=4;
else if city_num in (2 3 7 15 16) then regional_group=5;
run;

/*alcoholic_consumption bin (no within 1 month=0, yes within 1 month=1)*/
data year_all; set year_all; 
if alcoholic_consumption in (0) then alcoholic_consumption_bi=0;
else if alcoholic_consumption in (1 2 3 4) then alcoholic_consumption_bi=1;
run;

/*alcohol_try bin (no within 1 month=0, yes within 1 month=1)*/
data year_all; set year_all; 
if alcohol_try in (1) then alcohol_try_bi=0;
else if alcohol_try in (2 3 4 5) then alcohol_try_bi=1;
run;

/*SEX bin (male=0, female=1)*/
data year_all; set year_all; 
if SEX in (1) then sex_bi=0;
else if SEX in (2) then sex_bi=1;
run;

/*SEX bin (male=0, female=1)*/
data year_all; set year_all; 
if SEX in (1) then sex_bi=0;
else if SEX in (2) then sex_bi=1;
run;

/*age bin (middle school=0, high school=1)*/
data year_all; set year_all; 
if age in (13 14 15) then age_bi=0;
else if age in (16 17 18) then age_bi=1;
run;

/*bmi_2 bin (healthy or under=0, over weight or upper=1)*/
data year_all; set year_all; 
if bmi_2 in (1 2) then bmi_2_bi =0;
else if bmi_2 in (3 4) then bmi_2_bi=1;
run;

/*economic bin (Q1~Q2=0, Q3~Q4=1)*/
data year_all; set year_all; 
if economic in (1 2) then economic_bi =0;
else if economic in (3 4) then economic_bi=1;
run;

/*study bin (intermediate or under=0, upper-intermediate or upper=1)*/
data year_all; set year_all; 
if study in (1 2 3) then study_bi=0;
else if study in (4 5) then study_bi=1;
run;

/*edp bin (middle school graduated or under=0, high school graduated or upper=1)*/
data year_all; set year_all; 
if edp in (2) then edp_bi=0;
else if study in (3 4) then edp_bi=1;
run;

/*stress bin (a little or under=0, much or upper=1)*/
data year_all; set year_all; 
if stress in (1 2 3) then stress_bi=0;
else if stress in (4 5) then stress_bi=1;
run;

/*smoking bin (never-smoked=0, smoked=1)*/
data year_all; set year_all; 
if smoking in (0) then smoking_bi=0;
else if smoking in (1) then smoking_bi=1;
run;

/*depression bin (no=0, yes=1)*/
data year_all; set year_all; 
if depression in (0) then depression_bi=0;
else if depression in (1) then depression_bi=1;
run;

/*suicidalthinking bin (no=0, yes=1)*/
data year_all; set year_all; 
if suicidalthinking in (0) then suicidalthinking_bi=0;
else if suicidalthinking in (1) then suicidalthinking_bi=1;
run;

/*suicideattempts bin (no=0, yes=1)*/
data year_all; set year_all; 
if suicideattempts in (0) then suicideattempts_bi=0;
else if suicideattempts in (1) then suicideattempts_bi=1;
run;

/*
data allergy_test; set allergy_test;
w_all = w/18;
run; 
*/
/*분석 여부 변수 생성*/
data year_all;
set year_all;
if SEX^=. or age^=. or city_num^=. or bmi_2^=. or economic^=. or study^=. or edp^=. or stress^=. or smoking^=. or depression=^. or suicidalthinking^=. or suicideattempts=^. then aaa=1;
else aaa=0;
run;

/*table 2랑 table 3를 위한 변수 생성*/
/*관찰 항목과 derma랑 일치*/;
data year_all; set year_all; if aaa=1 and alcoholic_consumption_bi=1 then ac=1; else if aaa=1 and alcoholic_consumption_bi=0 then ac=0; run;
data year_all; set year_all; if aaa=1 and sex_bi=0 and alcoholic_consumption_bi=1 then sex0_con=1; else if aaa=1 and sex_bi=0 and alcoholic_consumption_bi=0 then sex0_con=0; run;
data year_all; set year_all; if aaa=1 and sex_bi=1 and alcoholic_consumption_bi=1 then sex1_con=1; else if aaa=1 and sex_bi=1 and alcoholic_consumption_bi=0 then sex1_con=0; run;
data year_all; set year_all; if aaa=1 and age_bi=0 and alcoholic_consumption_bi=1 then age0_con=1; else if aaa=1 and age_bi=0 and alcoholic_consumption_bi=0 then age0_con=0; run;
data year_all; set year_all; if aaa=1 and age_bi=1 and alcoholic_consumption_bi=1 then age1_con=1; else if aaa=1 and age_bi=1 and alcoholic_consumption_bi=0 then age1_con=0; run;
data year_all; set year_all; if aaa=1 and bmi_2_bi=0 and alcoholic_consumption_bi=1 then bmi_20_con=1; else if aaa=1 and bmi_2_bi=0 and alcoholic_consumption_bi=0 then bmi_20_con=0; run;
data year_all; set year_all; if aaa=1 and bmi_2_bi=1 and alcoholic_consumption_bi=1 then bmi_21_con=1; else if aaa=1 and bmi_2_bi=1 and alcoholic_consumption_bi=0 then bmi_21_con=0; run;
data year_all; set year_all; if aaa=1 and economic_bi=0 and alcoholic_consumption_bi=1 then economic0_con=1; else if aaa=1 and economic_bi=0 and alcoholic_consumption_bi=0 then economic0_con=0; run;
data year_all; set year_all; if aaa=1 and economic_bi=1 and alcoholic_consumption_bi=1 then economic1_con=1; else if aaa=1 and economic_bi=1 and alcoholic_consumption_bi=0 then economic1_con=0; run;
data year_all; set year_all; if aaa=1 and study_bi=0 and alcoholic_consumption_bi=1 then study0_con=1; else if aaa=1 and study_bi=0 and alcoholic_consumption_bi=0 then study0_con=0; run;
data year_all; set year_all; if aaa=1 and study_bi=1 and alcoholic_consumption_bi=1 then study1_con=1; else if aaa=1 and study_bi=1 and alcoholic_consumption_bi=0 then study1_con=0; run;
data year_all; set year_all; if aaa=1 and edp_bi=0 and alcoholic_consumption_bi=1 then edp0_con=1; else if aaa=1 and edp_bi=0 and alcoholic_consumption_bi=0 then edp0_con=0; run;
data year_all; set year_all; if aaa=1 and edp_bi=1 and alcoholic_consumption_bi=1 then edp1_con=1; else if aaa=1 and edp_bi=1 and alcoholic_consumption_bi=0 then edp1_con=0; run;
data year_all; set year_all; if aaa=1 and stress_bi=0 and alcoholic_consumption_bi=1 then stress0_con=1; else if aaa=1 and stress_bi=0 and alcoholic_consumption_bi=0 then stress0_con=0; run;
data year_all; set year_all; if aaa=1 and stress_bi=1 and alcoholic_consumption_bi=1 then stress1_con=1; else if aaa=1 and stress_bi=1 and alcoholic_consumption_bi=0 then stress1_con=0; run;
data year_all; set year_all; if aaa=1 and smoking_bi=0 and alcoholic_consumption_bi=1 then smoking0_con=1; else if aaa=1 and smoking_bi=0 and alcoholic_consumption_bi=0 then smoking0_con=0; run;
data year_all; set year_all; if aaa=1 and smoking_bi=1 and alcoholic_consumption_bi=1 then smoking1_con=1; else if aaa=1 and smoking_bi=1 and alcoholic_consumption_bi=0 then smoking1_con=0; run;
data year_all; set year_all; if aaa=1 and depression_bi=0 and alcoholic_consumption_bi=1 then depression0_con=1; else if aaa=1 and depression_bi=0 and alcoholic_consumption_bi=0 then depression0_con=0; run;
data year_all; set year_all; if aaa=1 and depression_bi=1 and alcoholic_consumption_bi=1 then depression1_con=1; else if aaa=1 and depression_bi=1 and alcoholic_consumption_bi=0 then depression1_con=0; run;
data year_all; set year_all; if aaa=1 and suicidalthinking_bi=0 and alcoholic_consumption_bi=1 then suicidalthinking0_con=1; else if aaa=1 and suicidalthinking_bi=0 and alcoholic_consumption_bi=0 then suicidalthinking0_con=0; run;
data year_all; set year_all; if aaa=1 and suicidalthinking_bi=1 and alcoholic_consumption_bi=1 then suicidalthinking1_con=1; else if aaa=1 and suicidalthinking_bi=1 and alcoholic_consumption_bi=0 then suicidalthinking1_con=0; run;
data year_all; set year_all; if aaa=1 and suicideattempts_bi=0 and alcoholic_consumption_bi=1 then suicideattempts0_con=1; else if aaa=1 and suicideattempts_bi=0 and alcoholic_consumption_bi=0 then suicideattempts0_con=0; run;
data year_all; set year_all; if aaa=1 and suicideattempts_bi=1 and alcoholic_consumption_bi=1 then suicideattempts1_con=1; else if aaa=1 and suicideattempts_bi=1 and alcoholic_consumption_bi=0 then suicideattempts1_con=0; run;

data year_all; set year_all; if aaa=1 and alcohol_try_bi=1 then at=1; else if aaa=1 and alcohol_try_bi=0 then at=0; run;
data year_all; set year_all; if aaa=1 and sex_bi=0 and alcohol_try_bi=1 then sex0_try=1; else if aaa=1 and sex_bi=0 and alcohol_try_bi=0 then sex0_try=0; run;
data year_all; set year_all; if aaa=1 and sex_bi=1 and alcohol_try_bi=1 then sex1_try=1; else if aaa=1 and sex_bi=1 and alcohol_try_bi=0 then sex1_try=0; run;
data year_all; set year_all; if aaa=1 and age_bi=0 and alcohol_try_bi=1 then age0_try=1; else if aaa=1 and age_bi=0 and alcohol_try_bi=0 then age0_try=0; run;
data year_all; set year_all; if aaa=1 and age_bi=1 and alcohol_try_bi=1 then age1_try=1; else if aaa=1 and age_bi=1 and alcohol_try_bi=0 then age1_try=0; run;
data year_all; set year_all; if aaa=1 and bmi_2_bi=0 and alcohol_try_bi=1 then bmi_20_try=1; else if aaa=1 and bmi_2_bi=0 and alcohol_try_bi=0 then bmi_20_try=0; run;
data year_all; set year_all; if aaa=1 and bmi_2_bi=1 and alcohol_try_bi=1 then bmi_21_try=1; else if aaa=1 and bmi_2_bi=1 and alcohol_try_bi=0 then bmi_21_try=0; run;
data year_all; set year_all; if aaa=1 and economic_bi=0 and alcohol_try_bi=1 then economic0_try=1; else if aaa=1 and economic_bi=0 and alcohol_try_bi=0 then economic0_try=0; run;
data year_all; set year_all; if aaa=1 and economic_bi=1 and alcohol_try_bi=1 then economic1_try=1; else if aaa=1 and economic_bi=1 and alcohol_try_bi=0 then economic1_try=0; run;
data year_all; set year_all; if aaa=1 and study_bi=0 and alcohol_try_bi=1 then study0_try=1; else if aaa=1 and study_bi=0 and alcohol_try_bi=0 then study0_try=0; run;
data year_all; set year_all; if aaa=1 and study_bi=1 and alcohol_try_bi=1 then study1_try=1; else if aaa=1 and study_bi=1 and alcohol_try_bi=0 then study1_try=0; run;
data year_all; set year_all; if aaa=1 and edp_bi=0 and alcohol_try_bi=1 then edp0_try=1; else if aaa=1 and edp_bi=0 and alcohol_try_bi=0 then edp0_try=0; run;
data year_all; set year_all; if aaa=1 and edp_bi=1 and alcohol_try_bi=1 then edp1_try=1; else if aaa=1 and edp_bi=1 and alcohol_try_bi=0 then edp1_try=0; run;
data year_all; set year_all; if aaa=1 and stress_bi=0 and alcohol_try_bi=1 then stress0_try=1; else if aaa=1 and stress_bi=0 and alcohol_try_bi=0 then stress0_try=0; run;
data year_all; set year_all; if aaa=1 and stress_bi=1 and alcohol_try_bi=1 then stress1_try=1; else if aaa=1 and stress_bi=1 and alcohol_try_bi=0 then stress1_try=0; run;
data year_all; set year_all; if aaa=1 and smoking_bi=0 and alcohol_try_bi=1 then smoking0_try=1; else if aaa=1 and smoking_bi=0 and alcohol_try_bi=0 then smoking0_try=0; run;
data year_all; set year_all; if aaa=1 and smoking_bi=1 and alcohol_try_bi=1 then smoking1_try=1; else if aaa=1 and smoking_bi=1 and alcohol_try_bi=0 then smoking1_try=0; run;
data year_all; set year_all; if aaa=1 and depression_bi=0 and alcohol_try_bi=1 then depression0_try=1; else if aaa=1 and depression_bi=0 and alcohol_try_bi=0 then depression0_try=0; run;
data year_all; set year_all; if aaa=1 and depression_bi=1 and alcohol_try_bi=1 then depression1_try=1; else if aaa=1 and depression_bi=1 and alcohol_try_bi=0 then depression1_try=0; run;
data year_all; set year_all; if aaa=1 and suicidalthinking_bi=0 and alcohol_try_bi=1 then suicidalthinking0_try=1; else if aaa=1 and suicidalthinking_bi=0 and alcohol_try_bi=0 then suicidalthinking0_try=0; run;
data year_all; set year_all; if aaa=1 and suicidalthinking_bi=1 and alcohol_try_bi=1 then suicidalthinking1_try=1; else if aaa=1 and suicidalthinking_bi=1 and alcohol_try_bi=0 then suicidalthinking1_try=0; run;
data year_all; set year_all; if aaa=1 and suicideattempts_bi=0 and alcohol_try_bi=1 then suicideattempts0_try=1; else if aaa=1 and suicideattempts_bi=0 and alcohol_try_bi=0 then suicideattempts0_try=0; run;
data year_all; set year_all; if aaa=1 and suicideattempts_bi=1 and alcohol_try_bi=1 then suicideattempts1_try=1; else if aaa=1 and suicideattempts_bi=1 and alcohol_try_bi=0 then suicideattempts1_try=0; run;

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

/*전체년도  통합가중치*/
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


/*Crude Table1 total*/
proc surveyfreq data=year_all
nomcar;
table 
SEX
age
regional_group
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

/*Crude Table1 detail (year group)*/
proc surveyfreq data=year_all
nomcar;
table 
year_2
year_2*SEX
year_2*age
year_2*regional_group
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


/*Weighted Table1 total*/
/*weighted & crude 의 차이는 strata~weight까지의 문장 유무 차이*/
proc surveyfreq data=year_all
nomcar;
strata strata;
cluster cluster;
weight wt_all;
table 
SEX
age
regional_group
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

/*Weighted Table1 detail (year group)*/
proc surveyfreq data=year_all
nomcar;
strata strata;
cluster cluster;
weight wt_all;
table
year_2*SEX
year_2*age
year_2*regional_group
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

data year_all_1;
set year_all;
if suicideattempts_bi=1;
run;

proc surveyfreq data=year_all_1 nomcar;
strata strata;
cluster year cluster;
weight wt_all;
by year_2;
table 
regional_group*alcohol_try_bi /cl row column;
run;

data before_pan19 while_pan19 early_pan mid_pan late_pan;
set year_all;
if year_2 in (1 2 3 4) AND regional_group=5 then output before_pan19;
if year_2 in (4 5 6 7) AND regional_group=5 then output while_pan19;
if year_2 in (4 5) AND regional_group=5 then output early_pan;
if year_2 in (5 6) AND regional_group=5 then output mid_pan;
if year_2 in (6 7) AND regional_group=5 then output late_pan;
run;

/*05~19 consumption beta*/
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL ac=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL sex0_con=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL sex1_con=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL age0_con=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL age1_con=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL bmi_20_con=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL bmi_21_con=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL economic0_con=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL economic1_con=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL study0_con=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL study1_con=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL edp0_con=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL edp1_con=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL stress0_con=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL stress1_con=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL smoking0_con=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL smoking1_con=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL depression0_con=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL depression1_con=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicidalthinking0_con=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicidalthinking1_con=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicideattempts0_con=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicideattempts1_con=year_2 / stb clparm ;  RUN; ods graphics off;

/*19~22 consumption beta*/
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL ac=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL sex0_con=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL sex1_con=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL age0_con=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL age1_con=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL bmi_20_con=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL bmi_21_con=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL economic0_con=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL economic1_con=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL study0_con=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL study1_con=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL edp0_con=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL edp1_con=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL stress0_con=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL stress1_con=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL smoking0_con=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL smoking1_con=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL depression0_con=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL depression1_con=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicidalthinking0_con=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicidalthinking1_con=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicideattempts0_con=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicideattempts1_con=year_2 / stb clparm ;  RUN; ods graphics off;

/*05~19 try beta*/
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL at=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL sex0_try=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL sex1_try=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL age0_try=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL age1_try=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL bmi_20_try=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL bmi_21_try=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL economic0_try=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL economic1_try=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL study0_try=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL study1_try=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL edp0_try=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL edp1_try=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL stress0_try=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL stress1_try=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL smoking0_try=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL smoking1_try=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL depression0_try=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL depression1_try=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicidalthinking0_try=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicidalthinking1_try=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicideattempts0_try=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=before_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicideattempts1_try=year_2 / stb clparm ;  RUN; ods graphics off;

/*19~22 try beta*/
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL at=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL sex0_try=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL sex1_try=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL age0_try=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL age1_try=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL bmi_20_try=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL bmi_21_try=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL economic0_try=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL economic1_try=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL study0_try=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL study1_try=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL edp0_try=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL edp1_try=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL stress0_try=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL stress1_try=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL smoking0_try=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL smoking1_try=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL depression0_try=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL depression1_try=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicidalthinking0_try=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicidalthinking1_try=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicideattempts0_try=year_2 / stb clparm ;  RUN; ods graphics off;
PROC SURVEYreg DATA=while_pan19 NOMCAR total=pop_all; STRATA strata;   CLUSTER cluster;   WEIGHT wt_indi;   MODEL suicideattempts1_try=year_2 / stb clparm ;  RUN; ods graphics off;



/*calculating OR of consumption*/
PROC SURVEYLOGISTIC DATA=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class year_2 (ref='4') / param=ref; model ac = year_2;  RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='0') / param=ref; model ac (event='1')=sex_bi; run;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='1') / param=ref; model ac (event='1')=sex_bi; run;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='0') / param=ref; model ac (event='1')=age_bi; run;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='1') / param=ref; model ac (event='1')=age_bi; run;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='0') / param=ref; model ac (event='1')=bmi_2_bi; run;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='1') / param=ref; model ac (event='1')=bmi_2_bi; run;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='0') / param=ref; model ac (event='1')=economic_bi; run;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='1') / param=ref; model ac (event='1')=economic_bi; run;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='0') / param=ref; model ac (event='1')=study_bi; run;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='1') / param=ref; model ac (event='1')=study_bi; run;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='0') / param=ref; model ac (event='1')=edp_bi; run;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='1') / param=ref; model ac (event='1')=edp_bi; run;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='0') / param=ref; model ac (event='1')=stress_bi; run;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='1') / param=ref; model ac (event='1')=stress_bi; run;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='0') / param=ref; model ac (event='1')=smoking_bi; run;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='1') / param=ref; model ac (event='1')=smoking_bi; run;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='0') / param=ref; model ac (event='1')=depression_bi; run;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='1') / param=ref; model ac (event='1')=depression_bi; run;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='0') / param=ref; model ac (event='1')=suicidalthinking_bi; run;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='1') / param=ref; model ac (event='1')=suicidalthinking_bi; run;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='0') / param=ref; model ac (event='1')=suicideattempts_bi; run;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='1') / param=ref; model ac (event='1')=suicideattempts_bi; run;

PROC SURVEYLOGISTIC DATA=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class year_2 (ref='5') / param=ref; model ac = year_2;  RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='0') / param=ref; model ac (event='1')=sex_bi; run;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='1') / param=ref; model ac (event='1')=sex_bi; run;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='0') / param=ref; model ac (event='1')=age_bi; run;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='1') / param=ref; model ac (event='1')=age_bi; run;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='0') / param=ref; model ac (event='1')=bmi_2_bi; run;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='1') / param=ref; model ac (event='1')=bmi_2_bi; run;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='0') / param=ref; model ac (event='1')=economic_bi; run;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='1') / param=ref; model ac (event='1')=economic_bi; run;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='0') / param=ref; model ac (event='1')=study_bi; run;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='1') / param=ref; model ac (event='1')=study_bi; run;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='0') / param=ref; model ac (event='1')=edp_bi; run;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='1') / param=ref; model ac (event='1')=edp_bi; run;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='0') / param=ref; model ac (event='1')=stress_bi; run;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='1') / param=ref; model ac (event='1')=stress_bi; run;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='0') / param=ref; model ac (event='1')=smoking_bi; run;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='1') / param=ref; model ac (event='1')=smoking_bi; run;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='0') / param=ref; model ac (event='1')=depression_bi; run;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='1') / param=ref; model ac (event='1')=depression_bi; run;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='0') / param=ref; model ac (event='1')=suicidalthinking_bi; run;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='1') / param=ref; model ac (event='1')=suicidalthinking_bi; run;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='0') / param=ref; model ac (event='1')=suicideattempts_bi; run;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='1') / param=ref; model ac (event='1')=suicideattempts_bi; run;

PROC SURVEYLOGISTIC DATA=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class year_2 (ref='6') / param=ref; model ac = year_2;  RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='0') / param=ref; model ac (event='1')=sex_bi; run;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='1') / param=ref; model ac (event='1')=sex_bi; run;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='0') / param=ref; model ac (event='1')=age_bi; run;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='1') / param=ref; model ac (event='1')=age_bi; run;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='0') / param=ref; model ac (event='1')=bmi_2_bi; run;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='1') / param=ref; model ac (event='1')=bmi_2_bi; run;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='0') / param=ref; model ac (event='1')=economic_bi; run;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='1') / param=ref; model ac (event='1')=economic_bi; run;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='0') / param=ref; model ac (event='1')=study_bi; run;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='1') / param=ref; model ac (event='1')=study_bi; run;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='0') / param=ref; model ac (event='1')=edp_bi; run;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='1') / param=ref; model ac (event='1')=edp_bi; run;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='0') / param=ref; model ac (event='1')=stress_bi; run;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='1') / param=ref; model ac (event='1')=stress_bi; run;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='0') / param=ref; model ac (event='1')=smoking_bi; run;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='1') / param=ref; model ac (event='1')=smoking_bi; run;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='0') / param=ref; model ac (event='1')=depression_bi; run;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='1') / param=ref; model ac (event='1')=depression_bi; run;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='0') / param=ref; model ac (event='1')=suicidalthinking_bi; run;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='1') / param=ref; model ac (event='1')=suicidalthinking_bi; run;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='0') / param=ref; model ac (event='1')=suicideattempts_bi; run;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='1') / param=ref; model ac (event='1')=suicideattempts_bi; run;

/*calculating OR of try*/
PROC SURVEYLOGISTIC DATA=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class year_2 (ref='4') / param=ref; model at = year_2;  RUN;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='0') / param=ref; model at (event='1')=sex_bi; run;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='1') / param=ref; model at (event='1')=sex_bi; run;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='0') / param=ref; model at (event='1')=age_bi; run;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='1') / param=ref; model at (event='1')=age_bi; run;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='0') / param=ref; model at (event='1')=bmi_2_bi; run;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='1') / param=ref; model at (event='1')=bmi_2_bi; run;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='0') / param=ref; model at (event='1')=economic_bi; run;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='1') / param=ref; model at (event='1')=economic_bi; run;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='0') / param=ref; model at (event='1')=study_bi; run;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='1') / param=ref; model at (event='1')=study_bi; run;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='0') / param=ref; model at (event='1')=edp_bi; run;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='1') / param=ref; model at (event='1')=edp_bi; run;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='0') / param=ref; model at (event='1')=stress_bi; run;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='1') / param=ref; model at (event='1')=stress_bi; run;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='0') / param=ref; model at (event='1')=smoking_bi; run;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='1') / param=ref; model at (event='1')=smoking_bi; run;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='0') / param=ref; model at (event='1')=depression_bi; run;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='1') / param=ref; model at (event='1')=depression_bi; run;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='0') / param=ref; model at (event='1')=suicidalthinking_bi; run;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='1') / param=ref; model at (event='1')=suicidalthinking_bi; run;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='0') / param=ref; model at (event='1')=suicideattempts_bi; run;
PROC SURVEYLogistic data=early_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='1') / param=ref; model at (event='1')=suicideattempts_bi; run;

PROC SURVEYLOGISTIC DATA=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class year_2 (ref='5') / param=ref; model at = year_2;  RUN;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='0') / param=ref; model at (event='1')=sex_bi; run;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='1') / param=ref; model at (event='1')=sex_bi; run;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='0') / param=ref; model at (event='1')=age_bi; run;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='1') / param=ref; model at (event='1')=age_bi; run;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='0') / param=ref; model at (event='1')=bmi_2_bi; run;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='1') / param=ref; model at (event='1')=bmi_2_bi; run;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='0') / param=ref; model at (event='1')=economic_bi; run;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='1') / param=ref; model at (event='1')=economic_bi; run;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='0') / param=ref; model at (event='1')=study_bi; run;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='1') / param=ref; model at (event='1')=study_bi; run;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='0') / param=ref; model at (event='1')=edp_bi; run;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='1') / param=ref; model at (event='1')=edp_bi; run;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='0') / param=ref; model at (event='1')=stress_bi; run;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='1') / param=ref; model at (event='1')=stress_bi; run;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='0') / param=ref; model at (event='1')=smoking_bi; run;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='1') / param=ref; model at (event='1')=smoking_bi; run;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='0') / param=ref; model at (event='1')=depression_bi; run;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='1') / param=ref; model at (event='1')=depression_bi; run;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='0') / param=ref; model at (event='1')=suicidalthinking_bi; run;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='1') / param=ref; model at (event='1')=suicidalthinking_bi; run;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='0') / param=ref; model at (event='1')=suicideattempts_bi; run;
PROC SURVEYLogistic data=mid_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='1') / param=ref; model at (event='1')=suicideattempts_bi; run;

PROC SURVEYLOGISTIC DATA=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class year_2 (ref='6') / param=ref; model at = year_2;  RUN;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='0') / param=ref; model at (event='1')=sex_bi; run;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='1') / param=ref; model at (event='1')=sex_bi; run;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='0') / param=ref; model at (event='1')=age_bi; run;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='1') / param=ref; model at (event='1')=age_bi; run;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='0') / param=ref; model at (event='1')=bmi_2_bi; run;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='1') / param=ref; model at (event='1')=bmi_2_bi; run;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='0') / param=ref; model at (event='1')=economic_bi; run;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='1') / param=ref; model at (event='1')=economic_bi; run;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='0') / param=ref; model at (event='1')=study_bi; run;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='1') / param=ref; model at (event='1')=study_bi; run;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='0') / param=ref; model at (event='1')=edp_bi; run;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='1') / param=ref; model at (event='1')=edp_bi; run;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='0') / param=ref; model at (event='1')=stress_bi; run;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='1') / param=ref; model at (event='1')=stress_bi; run;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='0') / param=ref; model at (event='1')=smoking_bi; run;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='1') / param=ref; model at (event='1')=smoking_bi; run;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='0') / param=ref; model at (event='1')=depression_bi; run;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='1') / param=ref; model at (event='1')=depression_bi; run;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='0') / param=ref; model at (event='1')=suicidalthinking_bi; run;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='1') / param=ref; model at (event='1')=suicidalthinking_bi; run;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='0') / param=ref; model at (event='1')=suicideattempts_bi; run;
PROC SURVEYLogistic data=late_pan NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='1') / param=ref; model at (event='1')=suicideattempts_bi; run;



/*table4 risk factor*/
data overall before_pan19 while_pan19;
set year_all;
if year_2 in (1 2 3 4 5 6 7) AND regional_group=5 then output overall;
if year_2 in (1 2 3 4) AND regional_group=5 then output before_pan19;
if year_2 in (5 6 7) AND regional_group=5 then output while_pan19;
run;

PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='0') / param=ref; model ac (event='1')=sex_bi; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='1') / param=ref; model ac (event='1')=sex_bi; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='0') / param=ref; model ac (event='1')=age_bi; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='1') / param=ref; model ac (event='1')=age_bi; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='0') / param=ref; model ac (event='1')=bmi_2_bi; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='1') / param=ref; model ac (event='1')=bmi_2_bi; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='0') / param=ref; model ac (event='1')=economic_bi; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='1') / param=ref; model ac (event='1')=economic_bi; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='0') / param=ref; model ac (event='1')=study_bi; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='1') / param=ref; model ac (event='1')=study_bi; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='0') / param=ref; model ac (event='1')=edp_bi; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='1') / param=ref; model ac (event='1')=edp_bi; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='0') / param=ref; model ac (event='1')=stress_bi; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='1') / param=ref; model ac (event='1')=stress_bi; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='0') / param=ref; model ac (event='1')=smoking_bi; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='1') / param=ref; model ac (event='1')=smoking_bi; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='0') / param=ref; model ac (event='1')=depression_bi; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='1') / param=ref; model ac (event='1')=depression_bi; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='0') / param=ref; model ac (event='1')=suicidalthinking_bi; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='1') / param=ref; model ac (event='1')=suicidalthinking_bi; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='0') / param=ref; model ac (event='1')=suicideattempts_bi; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='1') / param=ref; model ac (event='1')=suicideattempts_bi; run;

PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='0') / param=ref; model ac (event='1')=sex_bi; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='1') / param=ref; model ac (event='1')=sex_bi; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='0') / param=ref; model ac (event='1')=age_bi; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='1') / param=ref; model ac (event='1')=age_bi; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='0') / param=ref; model ac (event='1')=bmi_2_bi; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='1') / param=ref; model ac (event='1')=bmi_2_bi; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='0') / param=ref; model ac (event='1')=economic_bi; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='1') / param=ref; model ac (event='1')=economic_bi; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='0') / param=ref; model ac (event='1')=study_bi; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='1') / param=ref; model ac (event='1')=study_bi; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='0') / param=ref; model ac (event='1')=edp_bi; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='1') / param=ref; model ac (event='1')=edp_bi; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='0') / param=ref; model ac (event='1')=stress_bi; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='1') / param=ref; model ac (event='1')=stress_bi; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='0') / param=ref; model ac (event='1')=smoking_bi; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='1') / param=ref; model ac (event='1')=smoking_bi; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='0') / param=ref; model ac (event='1')=depression_bi; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='1') / param=ref; model ac (event='1')=depression_bi; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='0') / param=ref; model ac (event='1')=suicidalthinking_bi; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='1') / param=ref; model ac (event='1')=suicidalthinking_bi; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='0') / param=ref; model ac (event='1')=suicideattempts_bi; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='1') / param=ref; model ac (event='1')=suicideattempts_bi; run;

PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='0') / param=ref; model ac (event='1')=sex_bi; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='1') / param=ref; model ac (event='1')=sex_bi; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='0') / param=ref; model ac (event='1')=age_bi; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='1') / param=ref; model ac (event='1')=age_bi; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='0') / param=ref; model ac (event='1')=bmi_2_bi; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='1') / param=ref; model ac (event='1')=bmi_2_bi; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='0') / param=ref; model ac (event='1')=economic_bi; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='1') / param=ref; model ac (event='1')=economic_bi; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='0') / param=ref; model ac (event='1')=study_bi; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='1') / param=ref; model ac (event='1')=study_bi; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='0') / param=ref; model ac (event='1')=edp_bi; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='1') / param=ref; model ac (event='1')=edp_bi; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='0') / param=ref; model ac (event='1')=stress_bi; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='1') / param=ref; model ac (event='1')=stress_bi; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='0') / param=ref; model ac (event='1')=smoking_bi; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='1') / param=ref; model ac (event='1')=smoking_bi; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='0') / param=ref; model ac (event='1')=depression_bi; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='1') / param=ref; model ac (event='1')=depression_bi; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='0') / param=ref; model ac (event='1')=suicidalthinking_bi; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='1') / param=ref; model ac (event='1')=suicidalthinking_bi; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='0') / param=ref; model ac (event='1')=suicideattempts_bi; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='1') / param=ref; model ac (event='1')=suicideattempts_bi; run;


PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='0') / param=ref; model at (event='1')=sex_bi; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='1') / param=ref; model at (event='1')=sex_bi; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='0') / param=ref; model at (event='1')=age_bi; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='1') / param=ref; model at (event='1')=age_bi; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='0') / param=ref; model at (event='1')=bmi_2_bi; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='1') / param=ref; model at (event='1')=bmi_2_bi; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='0') / param=ref; model at (event='1')=economic_bi; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='1') / param=ref; model at (event='1')=economic_bi; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='0') / param=ref; model at (event='1')=study_bi; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='1') / param=ref; model at (event='1')=study_bi; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='0') / param=ref; model at (event='1')=edp_bi; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='1') / param=ref; model at (event='1')=edp_bi; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='0') / param=ref; model at (event='1')=stress_bi; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='1') / param=ref; model at (event='1')=stress_bi; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='0') / param=ref; model at (event='1')=smoking_bi; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='1') / param=ref; model at (event='1')=smoking_bi; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='0') / param=ref; model at (event='1')=depression_bi; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='1') / param=ref; model at (event='1')=depression_bi; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='0') / param=ref; model at (event='1')=suicidalthinking_bi; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='1') / param=ref; model at (event='1')=suicidalthinking_bi; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='0') / param=ref; model at (event='1')=suicideattempts_bi; run;
PROC SURVEYLogistic data=overall NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='1') / param=ref; model at (event='1')=suicideattempts_bi; run;

PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='0') / param=ref; model at (event='1')=sex_bi; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='1') / param=ref; model at (event='1')=sex_bi; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='0') / param=ref; model at (event='1')=age_bi; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='1') / param=ref; model at (event='1')=age_bi; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='0') / param=ref; model at (event='1')=bmi_2_bi; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='1') / param=ref; model at (event='1')=bmi_2_bi; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='0') / param=ref; model at (event='1')=economic_bi; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='1') / param=ref; model at (event='1')=economic_bi; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='0') / param=ref; model at (event='1')=study_bi; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='1') / param=ref; model at (event='1')=study_bi; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='0') / param=ref; model at (event='1')=edp_bi; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='1') / param=ref; model at (event='1')=edp_bi; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='0') / param=ref; model at (event='1')=stress_bi; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='1') / param=ref; model at (event='1')=stress_bi; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='0') / param=ref; model at (event='1')=smoking_bi; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='1') / param=ref; model at (event='1')=smoking_bi; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='0') / param=ref; model at (event='1')=depression_bi; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='1') / param=ref; model at (event='1')=depression_bi; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='0') / param=ref; model at (event='1')=suicidalthinking_bi; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='1') / param=ref; model at (event='1')=suicidalthinking_bi; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='0') / param=ref; model at (event='1')=suicideattempts_bi; run;
PROC SURVEYLogistic data=before_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='1') / param=ref; model at (event='1')=suicideattempts_bi; run;

PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='0') / param=ref; model at (event='1')=sex_bi; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class sex_bi (ref='1') / param=ref; model at (event='1')=sex_bi; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='0') / param=ref; model at (event='1')=age_bi; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class age_bi (ref='1') / param=ref; model at (event='1')=age_bi; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='0') / param=ref; model at (event='1')=bmi_2_bi; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class bmi_2_bi (ref='1') / param=ref; model at (event='1')=bmi_2_bi; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='0') / param=ref; model at (event='1')=economic_bi; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class economic_bi (ref='1') / param=ref; model at (event='1')=economic_bi; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='0') / param=ref; model at (event='1')=study_bi; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class study_bi (ref='1') / param=ref; model at (event='1')=study_bi; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='0') / param=ref; model at (event='1')=edp_bi; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class edp_bi (ref='1') / param=ref; model at (event='1')=edp_bi; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='0') / param=ref; model at (event='1')=stress_bi; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class stress_bi (ref='1') / param=ref; model at (event='1')=stress_bi; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='0') / param=ref; model at (event='1')=smoking_bi; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class smoking_bi (ref='1') / param=ref; model at (event='1')=smoking_bi; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='0') / param=ref; model at (event='1')=depression_bi; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class depression_bi (ref='1') / param=ref; model at (event='1')=depression_bi; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='0') / param=ref; model at (event='1')=suicidalthinking_bi; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicidalthinking_bi (ref='1') / param=ref; model at (event='1')=suicidalthinking_bi; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='0') / param=ref; model at (event='1')=suicideattempts_bi; run;
PROC SURVEYLogistic data=while_pan19 NOMCAR total=pop_all; STRATA strata; CLUSTER cluster; weight wt_all; class suicideattempts_bi (ref='1') / param=ref; model at (event='1')=suicideattempts_bi; run;
