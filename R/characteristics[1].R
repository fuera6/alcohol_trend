before_pan <- read.csv("before_pan19(05~19).csv")
while_pan <- read.csv("while_pan19(20~22).csv")

library(dplyr)
library(ggplot2)

df_total <- rbind(before_pan, while_pan)


#duration별 나누기
df_05to08 <- df_total %>% filter(YEAR >= 2005 & YEAR <= 2008)
df_09to12 <- df_total %>% filter(YEAR >= 2009 & YEAR <= 2012)
df_13to16 <- df_total %>% filter(YEAR >= 2013 & YEAR <= 2016)
df_17to19 <- df_total %>% filter(YEAR >= 2017 & YEAR <= 2019)
df_20 <- df_total %>% filter(YEAR == 2020)
df_21 <- df_total %>% filter(YEAR == 2021)
df_22 <- df_total %>% filter(YEAR == 2022)


#SEX
df_total %>% 
  group_by(SEX) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_total))
df_05to08 %>% 
  group_by(SEX) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_05to08))
df_09to12 %>% 
  group_by(SEX) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_09to12))
df_13to16 %>% 
  group_by(SEX) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_13to16))
df_17to19 %>% 
  group_by(SEX) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_17to19))
df_20 %>% 
  group_by(SEX) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_20))
df_21 %>% 
  group_by(SEX) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_21))
df_22 %>% 
  group_by(SEX) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_22))

#age
df_total %>% 
  group_by(age) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_total))
df_05to08 %>% 
  group_by(age) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_05to08))
df_09to12 %>% 
  group_by(age) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_09to12))
df_13to16 %>% 
  group_by(age) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_13to16))
df_17to19 %>% 
  group_by(age) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_17to19))
df_20 %>% 
  group_by(age) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_20))
df_21 %>% 
  group_by(age) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_21))
df_22 %>% 
  group_by(age) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_22))

#region
df_total %>% 
  group_by(region) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_total))
df_05to08 %>% 
  group_by(region) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_05to08))
df_09to12 %>% 
  group_by(region) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_09to12))
df_13to16 %>% 
  group_by(region) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_13to16))
df_17to19 %>% 
  group_by(region) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_17to19))
df_20 %>% 
  group_by(region) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_20))
df_21 %>% 
  group_by(region) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_21))
df_22 %>% 
  group_by(region) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_22))

#BMI
df_total %>% 
  group_by(bmi_2) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_total))
df_05to08 %>% 
  group_by(bmi_2) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_05to08))
df_09to12 %>% 
  group_by(bmi_2) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_09to12))
df_13to16 %>% 
  group_by(bmi_2) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_13to16))
df_17to19 %>% 
  group_by(bmi_2) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_17to19))
df_20 %>% 
  group_by(bmi_2) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_20))
df_21 %>% 
  group_by(bmi_2) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_21))
df_22 %>% 
  group_by(bmi_2) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_22))

#economic
df_total %>% 
  group_by(economic) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_total))
df_05to08 %>% 
  group_by(economic) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_05to08))
df_09to12 %>% 
  group_by(economic) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_09to12))
df_13to16 %>% 
  group_by(economic) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_13to16))
df_17to19 %>% 
  group_by(economic) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_17to19))
df_20 %>% 
  group_by(economic) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_20))
df_21 %>% 
  group_by(economic) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_21))
df_22 %>% 
  group_by(economic) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_22))

#study
df_total %>% 
  group_by(study) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_total))
df_05to08 %>% 
  group_by(study) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_05to08))
df_09to12 %>% 
  group_by(study) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_09to12))
df_13to16 %>% 
  group_by(study) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_13to16))
df_17to19 %>% 
  group_by(study) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_17to19))
df_20 %>% 
  group_by(study) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_20))
df_21 %>% 
  group_by(study) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_21))
df_22 %>% 
  group_by(study) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_22))

#parent’s level of education
df_total %>% 
  group_by(edp) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_total))
df_05to08 %>% 
  group_by(edp) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_05to08))
df_09to12 %>% 
  group_by(edp) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_09to12))
df_13to16 %>% 
  group_by(edp) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_13to16))
df_17to19 %>% 
  group_by(edp) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_17to19))
df_20 %>% 
  group_by(edp) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_20))
df_21 %>% 
  group_by(edp) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_21))
df_22 %>% 
  group_by(edp) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_22))

#stress
df_total %>% 
  group_by(stress) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_total))
df_05to08 %>% 
  group_by(stress) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_05to08))
df_09to12 %>% 
  group_by(stress) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_09to12))
df_13to16 %>% 
  group_by(stress) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_13to16))
df_17to19 %>% 
  group_by(stress) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_17to19))
df_20 %>% 
  group_by(stress) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_20))
df_21 %>% 
  group_by(stress) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_21))
df_22 %>% 
  group_by(stress) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_22))

#smoking
df_total %>% 
  group_by(smoking) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_total))
df_05to08 %>% 
  group_by(smoking) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_05to08))
df_09to12 %>% 
  group_by(smoking) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_09to12))
df_13to16 %>% 
  group_by(smoking) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_13to16))
df_17to19 %>% 
  group_by(smoking) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_17to19))
df_20 %>% 
  group_by(smoking) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_20))
df_21 %>% 
  group_by(smoking) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_21))
df_22 %>% 
  group_by(smoking) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_22))

#depression
df_total %>% 
  group_by(depression) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_total))
df_05to08 %>% 
  group_by(depression) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_05to08))
df_09to12 %>% 
  group_by(depression) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_09to12))
df_13to16 %>% 
  group_by(depression) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_13to16))
df_17to19 %>% 
  group_by(depression) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_17to19))
df_20 %>% 
  group_by(depression) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_20))
df_21 %>% 
  group_by(depression) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_21))
df_22 %>% 
  group_by(depression) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_22))

#suicidal thinking
df_total %>% 
  group_by(suicidalthinking) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_total))
df_05to08 %>% 
  group_by(suicidalthinking) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_05to08))
df_09to12 %>% 
  group_by(suicidalthinking) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_09to12))
df_13to16 %>% 
  group_by(suicidalthinking) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_13to16))
df_17to19 %>% 
  group_by(suicidalthinking) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_17to19))
df_20 %>% 
  group_by(suicidalthinking) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_20))
df_21 %>% 
  group_by(suicidalthinking) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_21))
df_22 %>% 
  group_by(suicidalthinking) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_22))

#suicide attempt
df_total %>% 
  group_by(suicideattempts) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_total))
df_05to08 %>% 
  group_by(suicideattempts) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_05to08))
df_09to12 %>% 
  group_by(suicideattempts) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_09to12))
df_13to16 %>% 
  group_by(suicideattempts) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_13to16))
df_17to19 %>% 
  group_by(suicideattempts) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_17to19))
df_20 %>% 
  group_by(suicideattempts) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_20))
df_21 %>% 
  group_by(suicideattempts) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_21))
df_22 %>% 
  group_by(suicideattempts) %>% 
  summarise(n = n(), per = 100 * n()/nrow(df_22))
