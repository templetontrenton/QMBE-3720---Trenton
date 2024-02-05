data <- read.csv("~/Downloads/assignment_0.csv")

dim(data) #figure out how big the data set is
#Shape: there are 20,000 entries and there are 21 columns. Some models that we
#can run are descriptive analysis (mean, median, etc), correlation analysis,
#and regression analysis.

names(data) #column names
[1] "tot_balance"                     "avg_bal_cards"                  
[3] "credit_age"                      "credit_age_good_account"        
[5] "credit_card_age"                 "num_acc_30d_past_due_12_months" 
[7] "num_acc_30d_past_due_6_months"   "num_mortgage_currently_past_due"
[9] "tot_amount_currently_past_due"   "num_inq_12_month"               
[11] "num_card_inq_24_month"           "num_card_12_month"              
[13] "num_auto_.36_month"              "uti_open_card"                  
[15] "pct_over_50_uti"                 "uti_max_credit_line"            
[17] "pct_card_over_50_uti"            "ind_XYZ"                        
[19] "rep_income"                      "rep_education"                  
[21] "Def_ind"    

str(data)
'data.frame':	20000 obs. of  21 variables:
  $ tot_balance                    : num  102956 132759 124659 133969 143602 ...
$ avg_bal_cards                  : num  14819 18952 15348 14051 14859 ...
$ credit_age                     : int  238 384 277 375 374 250 249 252 263 328 ...
$ credit_age_good_account        : int  104 197 110 224 155 178 132 139 102 169 ...
$ credit_card_age                : int  264 371 288 343 278 255 251 269 269 328 ...
$ num_acc_30d_past_due_12_months : int  0 0 0 0 0 1 0 0 0 0 ...
$ num_acc_30d_past_due_6_months  : int  0 0 0 0 0 0 0 0 0 0 ...
$ num_mortgage_currently_past_due: int  0 0 0 0 0 0 0 0 0 0 ...
$ tot_amount_currently_past_due  : num  0 0 0 0 0 0 0 0 0 0 ...
$ num_inq_12_month               : int  0 0 0 2 0 0 0 0 0 0 ...
$ num_card_inq_24_month          : int  0 0 0 2 0 1 0 0 0 0 ...
$ num_card_12_month              : int  1 0 0 1 0 0 0 0 0 0 ...
$ num_auto_.36_month             : int  0 0 0 0 0 0 0 0 1 0 ...
$ uti_open_card                  : num  0.367 0.491 0.359 0.7 0.647 ...
$ pct_over_50_uti                : num  0.342 0.541 0.339 0.684 0.511 ...
$ uti_max_credit_line            : num  0.514 0.418 0.342 0.543 0.633 ...
$ pct_card_over_50_uti           : num  0.551 NA 0.451 0.608 0.574 ...
$ ind_XYZ                        : int  0 0 0 0 0 0 0 1 0 1 ...
$ rep_income                     : num  118266 89365 201365 191794 161465 ...
$ rep_education                  : chr  "college" "college" "college" "college" ...
$ Def_ind                        : int  0 0 0 0 0 0 0 0 0 0 ...

#modules: dplyr, ggplot2, caret, randomForest
#techniques: decriptive stats, inferential stats, regression analysis
#storage: .csv file, stored in GitHub and local on Mac

sapply(data, function(x) mean(is.na(x)) * 100) #percentage of missing data in each column
tot_balance                   avg_bal_cards 
0.000                           0.000 
credit_age         credit_age_good_account 
0.000                           0.000 
credit_card_age  num_acc_30d_past_due_12_months 
0.000                           0.000 
num_acc_30d_past_due_6_months num_mortgage_currently_past_due 
0.000                           0.000 
tot_amount_currently_past_due                num_inq_12_month 
0.000                           0.000 
num_card_inq_24_month               num_card_12_month 
0.000                           0.000 
num_auto_.36_month                   uti_open_card 
0.000                           0.000 
pct_over_50_uti             uti_max_credit_line 
0.000                           0.000 
pct_card_over_50_uti                         ind_XYZ 
9.790                           0.000 
rep_income                   rep_education 
7.795                           0.000 
Def_ind 
0.000 
# there is missing data from "pct_card_over_50_uti" and "rep_income"
# in my opinion we can ignore the missing values from "pct_card_over_50_uti"
# however we cannot ignore the missing reported income

# for visualization we can use histograms, density plots, boxplots, and cumulative freq. plot

summary(data[c("tot_balance", "avg_bal_cards")]) #summary statistics
tot_balance     avg_bal_cards  
Min.   :     0   Min.   :    0  
1st Qu.: 92213   1st Qu.:10151  
Median :107711   Median :12239  
Mean   :107439   Mean   :12231  
3rd Qu.:122751   3rd Qu.:14286  
Max.   :200000   Max.   :25000  

